---
date: September 20th 2017
---

## Postgres database
PostgreSQL is an open-source object-relational database

used by Instagram, TripAdvisor
installed in Homestead Vagrant box (along with MySQL)
Beware: Postgres SQL is stricter than MySQL!
Documentation: https://www.postgresql.org/docs/9.4/static/index.html

Using psql Client
psql is the PostGres interactive terminal client (similar to mysql client)
`psql -U username -h hostnam_e _databasename`
Hosts: vagrant has a local PostGres database, or you can use Korra or Heroku
Using Vagrant:
```
psql –U homestead -h localhost databasename
```
prompts for password: secret
databasename is optional. 

We have a db called homestead or you can create own
NOTE: your db and tables on Vagrant are NOT persisted!!!
Once connected - ==Useful commands
`\list` (or `\l`)==, lists all databases

We will use the homestead db
`\connect homestead` (or `\c homestead`) instead of use database
| Command| Definition|
|----------|:-------------|
| `\d`| lists all tables in the current db |
| `\d tablename` | describes a table |
| `\?` | list of available commands |
| `\q` | quit |

## Once connected - SQL queries
Within the psql client, every statement (SQL command) needs to be terminated by a semicolon.
```sql
create database dbname;
```

These semicolons are an indication to the client that the query is complete and should be run.
The semicolons are not part of the SQL itself (this is a common point of confusion).

This means you can continue the same SQL statement over several lines within the client, which makes it easier to read and to edit

!!!tip "Recall"
    selecting a db: `\connect databasename`

## Using PHP with Postgres
For years, PHP developers used the standard or improved MySQL functions (called the mysql or mysqli extension) database specific, not object oriented.

We will use PDO (PHP Data Objects) in this class to remain object-oriented
requires PostgresSQL driver to be enabled:

Look in `/etc/php/7.1/fpm/php.ini` for `php_pdo_pgsql.dll` installed by default with Homestead

## Three important PDO classes
### PDO – db connection abstraction
Can use directly for simple statements
### PDOException
Issues with the connection
### PDOStatement
Prepared statement with portions replaced by variables when execute.

!!!tip "Recall: Using classes"
    You can directly call a constructor:
    ```php
    <?php
    $object = new SomeClass(…); //allocates and initializes

    $object->method(); //-> is the member access operator, not .

    $object->attribute; //NOT $object->$attribute

    SomeClass::staticFunction(); //:: is the scope resolution operator

    unset($object); //same as $object = null, optional if you want to tag for garbage collection
    ?>
    ```
## PDO- PHP Data Objects
PDO provides a consistent way to execute queries regardless of the database application in use

Postgres, MySQL, SQLite, Oracle, SQLServer, …
Connect to a database:
```php
$pdo = new PDO('dataSourceName', 'user', 'password');
```

dataSourceName syntax: `driver:name1=value1;name2=value2`

i.e., database application, followed by name-value pairs

example:
```
pgsql:dbname=lab;host=localhost

mysql:dbname=lab;host=localhost
```
On Vagrant – ==make your database first!==

General syntax
```php
<?php
$serverName='localhost';

$user='homestead';

$password='secret';

$dbname='homestead';

try {
    $pdo=new PDO(&quot;pgsql:dbname=$dbname;host=$serverName&quot;,$user,$password);
    
    $pdo-&gt;setAttribute(PDO::ATTR\_ERRMODE,PDO::ERRMODE\_EXCEPTION);  
    //Ensures that exceptions are thrown
    // Execute queries.
} catch (PDOException $e) {
    echo $e-&gt;getMessage().
} finally {
    unset($pdo);
}
?>
```
!!!warning 
    PGSQL is slightly different from MySQL. no `AUTO_INCREMENT` property, instead the column is defined as `SERIAL`.

`SERIAL` indicates integer, not null with values assigned from a sequence generator
Simple statements `$pdo->exec($query)`
general syntax for simple statements that do not return result sets and have no parameters: `CREATE`, some `INSERT`, `UPDATE`, `DELETE`
```php
<?php
$query = 'CREATE TABLE employees (id INT(8), lastname varchar(25) )';

$pdo->exec($query);

$query = 'DELETE FROM employees;'; //no where clause, deletes all

$num = $pdo->exec($query); //exec returns the number of rows affected

$query = "INSERT INTO customers(custName, country) VALUES ('Jaya', 'Canada');";

$num = $pdo->exec($query); //1 row affected

$id = $pdo->lastInsertId(); //returns the auto-incremented primary key value
?>
```
## Issue: SQL Injection
Add a user to the database:
```php
<?php
$q = "INSERT INTO users (name) VALUES ('$name');";
$pdo->exec( $q);
?>
```
if `$name` contains: `Jaya'); Drop Table users --`, the query will be
```sql
INSERT INTO users (name) VALUES ('Jaya'); Drop Table users --');
```
`--` and `# `indicate SQL comment to end of line, so the `');` will be ignored

### SQL Injection – Another example
Authenticate a user:
```php
<?php
$q = "SELECT * FROM userinfo WHERE user= '$user' AND pwd = '$pwd'; ";

$pdo->exec( $q);
?>
```
If `$user` contains: `admin` OR `'1'='1'` and `$pwd` is empty
```sql
SELECT * FROM userinfo WHERE user= 'admin' OR '1'='1' AND pwd = ' ';
```
`AND` has precedence over `OR`; even if the `AND` is false, if the user id is guessed correctly (ie, true), then the `OR` is true

==They can log in as admin without any privileges==

### Why does it happen?
User input is concatenated directly into a SQL statement

Presence of single quote `'` closes SQL string, allows additional SQL operators / statements.

Sanitize data and check data type - not best solution
quote function wraps the strings in quotes so you don't have to in your query:
```php
<?php
$data = $pdo->quote($unsafe_data);

$pdo->exec("INSERT INTO tablename (column1) VALUES ($data)");
?>
```

User can't close the single quotes.

### Best Solution- ALWAYS use prepared statements
the query is sent as one step and the specific data is sent separately. The end result can be much better performance and easier security management.

To use prepared statements, start with the `prepare()` method to get a `PDOStatement`.
the query, with the dynamic data represented by placeholders (e.g., question marks, not in quotes):
`$stmt = $pdo->prepare('SELECT * FROM users WHERE first=? AND last=?;');`

Next, invoke the `execute()` method of the `PDOStatement` object, providing to it an array of actual values (if returns a boolean)

`if ($stmt->execute(array('jaya', 'nila')))` or
`if ($stmt->execute( ['jaya', 'nila']))`

#### Named placeholders
Named placeholders start with a colon, followed by a label:
`$stmt = $pdo->prepare('SELECT * FROM users WHERE first=:first AND last=:last');`

Use the placeholders as keys in the array passed to the `execute()` method:
`$stmt->execute([':first' => 'jaya', ':last' => 'nila']);`

Another example
```php
<?php
$q = 'INSERT INTO tasks (parent_id, task) VALUES (:parent_id, :task)';
$stmt = $pdo->prepare($q);

if ($stmt->execute( [':parent_id' => $parent_id, ':task' => $task])) {
    echo 'The task has been added!';
} else {
    echo 'The task could not be added.';
}
?>
```
The `execute()` method returns a boolean indicating its success

!!!tip "Recall"
    DO NOT insert auto incremented columns

#### Binding parameters to reuse statements
```php
<?php
$stmt = $pdo->prepare ("INSERT INTO REGISTRY (name, value) VALUES (:name, :value)");
$stmt->bindParam(':name', $name); //binds the variable $name to the placeholder
$stmt->bindParam(':value', $value); //binds the variable $value to the placeholder

// insert one row
$name = 'one';
$value = 1;
$stmt->execute();

// insert another row with different values
$name = 'two';
$value = 2;
$stmt->execute();

Example
$query = 'SELECT * FROM users WHERE first=?AND last=?'; //not named placeholder

try {

$pdo = new PDO('pgsql:dbname= test;host=localhost', 'username',

'password');

$pdo->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION); //Ensures exceptions are thrown

$stmt = $pdo->prepare($query);

$stmt->bindParam(1, $first); //BEWARE : 1 indexed!!!
$stmt->bindParam(2, $last);

//in a loop, I could keep changing $first and $last

if ($stmt->execute() ) //returns a Boolean

//yay!

else

// boo!!

} catch (PDOException $e) {

echo $e->getMessage();

} finally {

unset($pdo); //not required, connection is closed when script ends

}
?>
```
##### bindParam vs bindValue
`bindParam` requires the variable to be passed by reference. It must be a variable since it is bound to the placeholder.

* very useful when you prepare your statement outside the loop, and simply change variable values in the loop

`bindValue` is used when you are passing by value
* It can be used for calculated values, method calls, constants or literals, etc
* need to re-bind on every iteration through the loop since it is copied by value

Queries that return results `execute()` method returns a Boolean indicating its success

Fetching data:
```php
<?php
$stmt = $dbh->prepare("SELECT * FROM REGISTRY where name = ?");

$stmt->bindParam(1, $name);
$name='php';

if ($stmt->execute()) {
    while ($row = $stmt->fetch()) { //fetch() returns an associative array by default
    var_dump($row);
    }
}
?>
```
=> the key is the column name and the value is the row value

## Fetch methods and styles
| Methods/Styles | Description|
|--|:--|
|`fetch`|returns one row at a time|
|`fetchAll` | returns an array containing all the result rows in the style specified|
|`setFetchMode(PDO:: FETCH_ASSOC)`|fetch styles that can be specified|
|`PDO::FETCH_ASSOC`| for an associative array -> default, both numeric and associative|
|`PDO::FETCH_NUM`|for a numerically indexed array|
|`PDO::FETCH_OBJ`| for a generic object (anonymous type) with property names being the column names|
|`PDO::FETCH_CLASS`|for a specific type of object, use with `FETCH_PROPS_LATE`, mapping column names to properties|
|`PDO::FETCH_PROPS_LATE`|mapping column names to properties|

### Examples – in an array
```php
<?php
$stmt = $pdo->prepare("SELECT id, name FROM users");
$stmt->execute();

while ($row =$stmt->fetch())) { //Default – associative array
    // Use $row['id'] for the id.
    // Use $row['name'] for the username.
}
?>
```
or

```php
<?php
$results = $stmt->fetchAll();

foreach($results as $row) {
    // Use $row['id'] for the id.
    // Use $row['name'] for the username.
}
?>
```
### Example - object
The returned records be turned into specific types of objects:
```php
<?php
class User {
    private $id;
    private $name;

    public getName() {
        return $this->name;
    }
}
?>
```
Fetch database records into new User objects:
```php
<?php
$q = $pdo->prepare("SELECT id, name FROM users");
$q->execute();

while ($row =$q-> fetch( PDO::FETCH_CLASS| PDO::FETCH_PROPS_LATE, 'User')) {
    echo $row->getUsername();
}
?>
```
`$row` will be a `User` object, and it can invoke the `User` methods.

## Notes
PHP directly maps the returned column names to matching object attributes even if they are private.

If no comparable class attribute exists, PHP will create the column name as a new public attribute!!!

!!!danger
    The constructor is called after the attributes are set ?!! So either no constructor in your data transfer class, or use `$q->fetch(PDO::FETCH_CLASS|PDO::FETCH_PROPS_LATE, 'User'))` -> constructor is executed before PDO assigns the object attributes

## Column name to Attribute name mapping
sql aliases are used to map the sql query result to the appropriate object attribute
you can force column names (and aliases) to a specific case pattern

default will be all lower case
`$pdo->setAttribute(PDO::ATTR_CASE, PDO::CASE_NATURAL );`

`PDO::ATTR_CASE` – forces columns to a case pattern

`PDO::CASE_NATURAL` leaves them as they are returned

since we use an alias, the alias is used as is
```php
<?php
class Category {
    public $id;
    public $fkId;
    public $shortName;
    public $longName;
}

$pdo->setAttribute(PDO::ATTR_CASE, PDO::CASE_NATURAL ); 

//use an SQL alias
$stmt = $pdo->prepare(
    'SELECT
        id,
        fk\_id AS `fkId`,
        short\_name AS `shortName`,
        long\_name As `longName`
    FROM `Category`;'
);
$stmt -> execute();
?>
```
## SQL Review - Inserting records
### Named columns:

Don't insert the auto-increment columns
```sql
INSERT INTO tablename (column1, column2, …) VALUES (?,?,…)
```

### Unnamed columns:

All columns must be given in order of columns in the table

* in that case, value NULL for the auto-incremented column
```sql
INSERT INTO tablename VALUES (NULL, ?, ?...)
```
## Example CRUD - Create
```php
<?php
try {
    $pdo = new PDO('pgsql:host=localhost;dbname=homestead', $username, $password);

    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $stmt = $pdo->prepare('INSERT INTO mytable VALUES(NULL, ?)');

    $stmt->bindParam(1, $name);
    $stmt->execute();

    // Affected Rows?
    echo $stmt->rowCount(); // 1
} catch(PDOException $e) {

echo 'Error: ' . $e->getMessage();
?>
```

## Update and delete records
```sql
UPDATE tablename SET column1=value1, column2=value2 WHERE condition
```
```SQL
DELETE FROM tablename WHERE condition LIMIT num (e.g., only 1 row)
```
All rows:
```sql
TRUNCATE TABLE tablename
```
Entire table:
```sql
DROP TABLE tablename
```
### Example CRUD - Update
```php
<?php
$id = 5;

$name = "Joe";

try {

$pdo = new PDO('pgsql:host=localhost;dbname=homestead', $username, $password);

$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$stmt = $pdo->prepare('UPDATE mytable SET name = :name WHERE id = :id');

$stmt->bindParam(':name', $name, PDO::PARAM_STR); //default

$stmt->bindParam(':id', $id, PDO::PARAM_INT); // PDO::PARAM_INT will have no quotes in the sql query, usually just needed for limit clauses

$stmt->execute();

echo $stmt->rowCount(); // 1

} catch(PDOException $e) {

echo 'Error: ' . $e->getMessage();

}
?>
```
### Example CRUD - Delete
```php
<?php
$id = 5; // From a form or something similar

try {

$pdo = new PDO('pgsql:host=localhost;dbname=someDatabase', $username, $password);

$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$stmt = $pdo->prepare('DELETE FROM mytable WHERE id = :id');

$stmt->bindParam(':id', $id);

$stmt->execute();

echo $stmt->rowCount(); // 1

} catch(PDOException $e) {

echo 'Error: ' . $e->getMessage();

}
?>
```
## Selecting data
```sql
SELECT columns FROM tablename WHERE condition
```
conditions:
- equality (e.g., date = '2012-01-26')
- range (e.g., price BETWEEN 10.0 AND 20.0)
- relative (e.g., quantity > 5)
- wildcard LIKE (name LIKE '%Smith%' )

### Using a wildcard in a prepared statement:
```php
<?php
$stmt = $pdo->prepare('SELECT columns FROM table WHERE column LIKE ? ');

$stmt-> bindValue (1, '%'.$search.'%');
?>
```
## Concatentation operator
Example:
```sql
SELECT last_name || ', ' || first_name

FROM users;

SELECT last_name || ', ' || first_name AS Name FROM users ORDER BY Name;
```
## Functions
```sql
SELECT FUNCTION(column) FROM tablename

SELECT column1, FUNCTION(column2) AS blah, column3 FROM tablename
```
Examples:
```sql
SELECT lower(title), trim(description)
FROM books;
```
## Sorting
```sql
SELECT * FROM tablename ORDER BY column DESC, column2
```
Text sorting depends on collation

* `COLLATION` dictates how values are compared and sorted
* Tied to the character set (language support)
* Takes into account cultural habits
* Case-sensitive or insensitive
* Count accents or not?

## Grouping results
```sql
SELECT name FROM products WHERE condition GROUP BY name
```
* each product name occurs only once
```sql
SELECT name, avg(price) FROM products WHERE condition GROUP BY name
```
Aggregate functions used for anything not grouped
* e.g., `MAX`, `MIN`, `COUNT`, `SUM`

### Distinct
`DISTINCT` – provides unique values
```sql
SELECT COUNT(DISTINCT customer_ID) FROM accounts

SELECT AVG(balance), customer_id FROM accounts GROUP BY customer_id
```
## Joins
Inner join, outer join on one, two, or more tables
self join is possible – use aliases
* normally use primary key and foreign key columns, but not always
```sql
SELECT columns FROM tableA JOIN_TYPE tableB JOIN_CONDITION WHERE conditions
```
columns can be `tablename.column` to prevent ambiguity

* `JOIN_TYPE: INNER JOIN table2 AS t2`
* `JOIN_CLAUSE: ON conditions`

### Types of joins

#### INNER JOIN

exclusive

* Returns all rows when there is at least one match in BOTH tables
* produces a Cartesian product between the specified tables (that is, each and every row in the first table is joined to each and every row in the second table).

#### OUTER JOIN:

inclusive

##### LEFT JOIN

Return all rows from the left table, and the matched rows from the right table (or `NULL` if no matching rows in right table)

* in PostgreSQL: `JOIN` is equivalent to `INNER JOIN`
* `LEFT`, `RIGHT` or `FULL` indicate `OUTER JOIN`

### JOIN ON vs WHERE conditions

The conditional_expr used with `ON` is any conditional expression of the form that can be used in a `WHERE` clause.

Generally, you should use the `ON` clause for conditions that specify how to join tables
and the `WHERE` clause to restrict which rows you want in the result set.

## Limiting results
e.g., only top 25:
```sql
SELECT * FROM tablename WHERE conditions ORDER BY column LIMIT 25
```
One argument = value specifies the number of rows from the beginning of the result set
```sql
SELECT * FROM tablename WHERE conditions ORDER BY column LIMIT num OFFSET skip
```
Two arguments = the first argument specifies the number of rows to return, and the second specifies the number of rows to skip.
```sql
SELECT * FROM tbl LIMIT 5 OFFSET 10; # Retrieve rows 11-16
```
* If you use `LIMIT`, almost always use `ORDER BY`
* Large offsets: performance issues are possible
    * Database still has to calculate the rows skipped by the offset even if they are not returned

## LIMIT
The higher the offset is, the longer the query is even if the number of rows retrieved is the same
```sql
SELECT * from largetable ORDER BY 'id' LIMIT 50 OFFSET 0 is faster than

SELECT * from largetable ORDER BY 'id' LIMIT 50 OFFSET 1000000
```
* Second query is the same as saying – select * from the first 1000050 rows that match the criteria and give the last 50
* You still have to perform all the matches to know that you are at the end
* Even if you use indices, the query can be long since the many rows must be found

### Solution: If the Order By is sorted by unique keys
```sql
SELECT * from largetable WHERE id > lastID ORDER BY 'id' LIMIT 50
```
This assumes you know the lastID that was requested
this assumes no holes in the ids:
e.g. in a Paginated set: `lastID = (pageNumber - 1) * records/page`