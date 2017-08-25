We will have three projects. One a web scraping one, one a speed reading (heavy js) and a combined android/php web app for students.

## History
* 1996 - PHP first release
    * Perl, C
* Larabel -> really popular
* 2017 - PHP 7.1
~ 00 - Java

## Client side
* Web browser
* HTML
* CSS
* JS
## Server side
* Database (ex: Oracle)
* MySQL
* Postgres (using this one)

## Web Server
* IIS (ASP.NET)
* Apache
* NGING (using this one)

NGinx will tell the PHP interpreter to interpret the file, and the interpreter will create an html based on the request.

## Development Environment
* Virtual Machine
* Linux Ubuntu
* NGINX
* postgres

### Lab and Home setup
* Vagrant
    * Preprovision VM so that each vagrant box is exactly the same
* Homestead
    * Vagrant box preprovisioned with recommended "Stack" for `php-laravel`, which has above
* Docker
    * Lighter than the Vagrant engine
    * However, only available on Windows 10 and we have systems in Windows 7 😢

This will all be completely headless (no GUI).

## Hello PHP

#### example 1 - <small>HTML & PHP embedded index.php </small>
```php
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <p> Plain HTML </p>
        <p>
            <?php echo "Hello World"; ?>
        </p>
    </body>
```

#### example 2 - <small>Only PHP</small>
```php
<?php 
    echo "<!DOCTYPE html>";
    echo "<html>";
?>
```

## Variables
* Weakly typed => **No decorations**

| Datatypes |
| interger |
| floatingpoint |
| string |
| boolean |
| array |

### Variable Naming
- Start with $
- next char must be letter or _
- only alphanumeric and _
- case sensitive (**except functions**)

#### example 3 - <small>Using Variables</small>
```php
<?php 
    $quantity = 50;
    $price = 119.50;
    $tax = 0.01;
    $total = ($quantity * $price) * (1 + $tax);
    $total = number_format($total,2);
    echo "<p>The total is ".$total."</p>"
?>
```

## Operators
- `*` `/` `%`
- `++` `--`
- `+` `-`
- `**` (power)
- `=`
- `+=`
- `.=` (concatenation)
- `&&`
- `|`
- `xor` (exclusive or)
- `==` equals (value)
- `===` identity (value and type)
- `!=` 
- `!==`
- `><` 
- `>= <=` 
- `<==>` like compareto, negative 0 positive
- `??` null 

> Lesson 2 [August 25]

* Display --> write to http response message

1. `echo $num1, $num2`
    * language construct
    * no return -> slightly more efficient than
2. `print $num;`
    * language construct
    * 1 param only
    * always returns 1
3. `var_dump($value)` --> detailed dump of the variable (type, contents)

## Type Juggling
- scalar type
    - `numerics`
    - `boolean`
    - `string`

### `numeric` --> `string`:

#### example 4: substr()
```php
$num = 12345 * 100;
echo substr($num,3,1)
```

`substr(var,startIndex,lengthWanted)`

* Can go from number to string
* Going to a string to a number is also done automatically, but less straightforward.

### `String` --> `Numeric`
- If `string` starts with value numeric data, that part will be converted
- Else --> converts to `0`

Valid numeric data
- no . or E and fits in `PHP_INT_MAX` => converts to `int`
- otherwise `float`

#### example 5: number + string
```php
// + is arithmetic operator
// "10.5" converted
$num = 1 + "10.5";      // = 11.5
$num = 1 + "1.3e3";     // = 1301 float
$num = 1 + "bob 3";     // = 1
$num = 1 + "10pigs";    // = 11
$num = 1 + "10pigs10";  // = 11
```

String conersion when treating a variable as a string
```php
echo $num, // string parameter
```
numeric to string
* boolean to string
    - true TRUE is converted to "1"
    - false is converted to ""
* array to string
    - "Array"
* object to string
    - __toString invoked if exists, else "Object"

### String literals and Variables
1. `'hello'` --> single quote
    - preserves content
    - only 2 escape sequences `\\` `\`
    - most performant
1. `"hello"` --> doublequotes
    - many escape sequences `\n` `\t` `\$`
    - variable interpolation
        - expanded to its value
    - less performant

#### example 6: single vs double quotes
```php
$user = 'Jaya';
echo 'Hi $user'; // Hi $user
echo "Hi $user"; // Hi Jaya
echo 'Hi', $user;
```

### Variable rules
- never declared
- do not have to be initialized
    - default value depending on the context

#### example 7: uninitialialized variable behaviour
```php
if ($test); // $test not initialied then FALSE

$num = 1 + $test // numeric is 0

echo $test // ""

$test[0] // array is empty array
```

#### example 8: initialized variable behaviour
```php
$juice = 'apple';
$beverage = 'juice';
echo "I drank $juice juice"; // I drank apple juice

// $juices is not an initialized variable => ""
echo "I drank juice made of $juices";

// Variable, no spaces
echo "I drank ... {$juice}s";

// You can have $ outside the brackets and
// have a more complex expression inside them.
// You could have it evaluate to string 
// => name of variable
echo "I drank ... ${juice}s"

echo "I drank ${$beverage}s" // I drank apples
echo "I drank $$beverage" // I drank apple
```

### DOC
- single quote
- double quote
- HEREDOC --> long double quoted string
- NOWDOC --> long single quoted string

#### example 9: DOC
```php
$str = <<< DOC // name the string
    --------\t // string content after
    --------\n // name of the string
    --stuff-
DOC; // has to be separate line alone
// end with name of Heredoc
```

#### example 10: DOC with single quotes
```php
$str = <<<'DOC' // NOWDOC has single quotes
    ----
    ----
DOC;
```
### Manipulating string
- 0 indexed
- access like a numerically indexed array
- `$str[10]` returns string with 11th charater read
- `$str[100000]` warning string offset
    - write is padded with space until reach character

### String functions
- `strcmp ($str1, $str2)` -- dictionary order
- `trim`
- `strlen`
- `strtolower`
- `substr`
- `ucwords`

## Compare String with numeric
* `==`, `!=`, `<>` --> type juggling
* `>`, `>=`, `<`, `<=` --> type juggling
* `===`, `!==` --> identical

#### example 11
```php
'A54321' > '5670X' // TRUE
// both have non-numeric
// compare with dictionary order

'54321' > '5678' // TRUE (both are numeric)

'6 cards' > '55 cards' // TRUE
// both haven non-numeric
// compare with dictionary order

'6cards' > 55 // type juggling => FALSE
```