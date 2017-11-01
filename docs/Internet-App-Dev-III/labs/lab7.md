# Large DBs, Pagination, AJAX

In academia, we often create a database schema and populate the tables with a few dozen fake records. But we should have much more fake data that resembles real data when we are testing our apps. One way of populating our test database is with [Faker.](https://packagist.org/packages/fzaninotto/faker)

[Faker](https://github.com/fzaninotto/Faker) is an open-source php library that lets us specify the different data that we require for many different scenarios. It is available through [Composer](https://getcomposer.org/); Composer is the open source defacto dependency manager used in PHP. Composer allows you to install packages that you require; Composer uses a json file to list all your project dependencies, and it will find and install them. [Packagist](https://packagist.org/) is the package repository used by Composer.

Once we have seeded the database, we will create an application that displays the results using pagination.

## Part 0 – OPTIONAL: Solving intermittent 502 Bad Gateway problems

Do this part only if you find that you have intermittent 502 Bad Gateway responses from nginx:

Go to ``/etc/php/7.1/fpm/pool.d/ , edit www.conf (use sudo nano) and edit the line listen = /run/php/php7.1-fpm.sock to  /var/run/php/php7.1-fpm.sock ``

Exit and save the file, then run sudo service php7.1-fpm restart

## Part 1 – Install Faker using Composer

Composer is already installed in the Homestead Vagrant box.

Create a new lab7 folder for this project in H:/PHPCode/labs
ssh into n Vagrant and:

- cd to the lab7 folder
- write the following command:
  - `composer require fzaninotto/faker`

This will install the latest stable release of Faker in a vendor folder. It will also update a composer.json file so that Composer can track this project dependency.

## Part 2- Create a table in Postgres

Create a `customer` table with the following columns and obvious data types in Vagrant:

```
id (serial)
firstname
lastname
email
salary
civicnumber
street
city
```

state
postcode (note: this follows the American standard, so leave about 12 char in your db)

## Part 3 – Populate the database

Create a class to represent a customer, and a DAO class.

Write a command-line application that uses Faker to seed the database. Faker documentation can be found at https://packagist.org/packages/fzaninotto/faker or https://github.com/fzaninotto/Faker

In order to use Faker, you need to specify the required files, instantiate a Faker instance through the factory method, and generate data by accessing properties. Code to get an instance:

```php
<?php
require "vendor/autoload.php";  //assumes your code is lab7 folder
//your other requires or autoload function for Customer and DAO
$faker = Faker\Factory::create();  //factory method to get an instance
```

Note the backslash syntax: this is a qualified class name (Factory) with its namespace (Faker). 

Once you have an instance, you generate data by accessing Faker “properties” and methods. These properties are called “formatters” and are generated random results. Some of the formatters available:

```
firstName //generates a randomly chosen gender American name
firstName($gender) //generates an American name, $gender can be ‘male’ or ’female’
lastName
email
numberBetween($min, $max)  //random int generator
randomFloat($nbMaxDecimals, $min, $max) //random float generator with decimal digits
dateTimeBetween(‘-65 years’, ‘now’) //DateTime between
buildingNumber
streetName
city
stateAbbr
postcode 
```

### Using Faker:

* `$faker`->firstName will return a randomly generated American first name, like ‘Maynard’.
* `$faker`->streetName will return a random street name like ‘Keegan Trail’

!!!note

​	The random numbers created by Faker are not any different from random numbers you would create using PHP functions. You’ll notice that the salaries don’t really reflect reality: you would ideally like a function to return a random salary that fit a normal distribution. This post has a nice function to create normalized random numbers. If you use it, be sure to give credit to the author ☺

​	When working with datetime Faker formatters, the result is returned as a DateTime php object. You cannot use a DateTime object directly in an SQL commend (SQL parameters can be strings, int, or null). So you will have to convert the DateTime object into string representation with the date function. The syntax:

`$stringDate = $datetime->format('Y-m-d H:i:s');`


In a loop, generate 10000 Customer objects and save them to the Vagrant database.

!!!note

​	It may take a few seconds to write the 10000 records into your database. Make sure you write that as a command-line application (not a web application), since we don’t want to have a maximum execution time limit. 

## Part 4: Web application

Create a php script index.php that gives the user a form where they can choose to find customers and display their full names based on:
- living within a certain state or postcode (allow incomplete postcode entry and use LIKE syntax)
- salary range

Your results page should use pagination (20 results / page) and display the entire customer record, sorted alphabetically by name.

## Part 5: Ajax application (if it has been covered in class, otherwise do it next week!)

Now create an html file name.html. Within name.html (or a linked js file), write a Javascript script that makes an AJAX GET request to ajax.php on every key up event in the text box, and display the records that are returned. In other words, when the user enters the first letters in a lastname, the PHP response provides all employees whose lastname starts with the given letters. 

**![img](https://lh6.googleusercontent.com/ojiDZFv1GzDxJUlDcFxBvE3cm4JFzfRy9myZwafOlKAzWK2vgW6cbNvC76XhVrFqB7Jw1rcc_o_DR0r342d019DXZIc1wVwrDhwCP755jT18qgEHRjzLbxp5uGw31LGBM5Wvj9LV6Oy8SMZzHQ)**

**![img](https://lh4.googleusercontent.com/H44C-f-xsJMFOgoWb-04kL16_osnwilNsBpYl46jy5v4ZnYCRlC1s-kUIhPd6fIJrA5k7FVtcYg4Aq0RcfwITJp2hN0b6JjEymOD0RbLuyjVf4BAhBscaq6jy87ATIUucyG0RG4eCit73njSyQ)**

Make sure that your form is not submitting - simply don’t use a FORM tag just a text input field. 

Your ajax.php script should send back an array of Customers using JSON encoding. Here are some (untested) pseudo-code snippets:

```php
<?php
//build the array of objects in a DAO class
$response=null;  //to initialize

//create a prepared statement

//Add the following line so the fetch mode is into a Customer object
$stmt->setFetchMode(PDO::FETCH_CLASS|PDO::FETCH_PROPS_LATE, ‘Customer’);

//execute the statement
$response = $stmt->fetchAll();
```

!!!tip

​	You will be able to fetch into an object only if the class’s properties have the same names as the columns. If not, use aliases in your SQL query or fetch as an associated array

!!!tip

​	You can only json encode public attributes. In order not to lose all encapsulation, make the Customer class implement JsonSerializable, and add a jsonSerialize() function that returns an associative array with the attributes that you want to serialize. 

For example, if I just want the firstname and lastname attributes:

	function jsonSerialize() {
		return [
		    'firstname' => $this->firstname,
		    'lastname' => $this->lastname
		];
	}

The SQL LIKE query with wildcards is tricky in a prepared statement because of the wildcard needing to be appended. You must use bindValue if you are not passing by reference (e.g., passing a calculated value or a literal, nor a direct variable):

```php
<?php
$stmt = $dbh->prepare("SELECT * FROM `customer` WHERE `lastname` LIKE :lastname");
$stmt->bindValue(':lastname', $lastname . '%');
```

Finally, since ajax.php is sending back json, not html as the HTTP response message body, you need to first set the content type, before echoing the json:

```php
<?php
header('Content-Type: application/json');
//echo the json 
echo json_encode($response);
```

In JS, you will need to iterate through the json data. 
//first convert resultText into a JSON object jsonArr

```js
//if the jsonArr is not null
for(var i = 0; i < jsonArr.length; i++) {

//do something with jsonArr[i] object
}
```

Once you get the resultText in JS, you will have to display the data in a table. In pure JS, you would use something like innerHTML. With JQuery, you would use` .html(htmlString) `function to set the HTML contents in your div/table. Note that you’ll have an easier time clearing and rebuilding the table if you use a `<tbody>` tag.

!!!warning

​	Debugging php when it is sending JSON or XML is tricky since any error message gets written into the JSON/XML and is not shown on the browser. The browser developer tools are your best friends :heart: ! Learn how to put breakpoint in your JS code (this is very helpful in debugging JS, much better than alerts!)  and how to look at the http messages going back and forth.

