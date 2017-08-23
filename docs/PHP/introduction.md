## Introduction
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

#### Example 1 - <small>HTML & PHP embedded index.php </small>
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

#### Example 2 - <small>Only PHP</small>
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

#### Example 3 - <small>Using Variables</small>
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