## Variable typing
PHP is a weakly typed language.
### Type juggling

Automatic conversion from a number to a string
```php
<?php
$number = 12345 * 1000;
echo substr($number, 3, 1);
?>
```
Result: 4 ($number contain 12345000, substr started at the 3 rd char 0-indexed,
length 1)

## String conversion to numbers - rules

-   If the string does **not** contain any of the characters '.', 'e',
    or 'E' **and** the numeric value fits into integer type limits (as
    defined by PHP\_INT\_MAX), the string will be evaluated as
    an integer.
-   In all other cases it will be evaluated as a float.
-   The value is given by the **initial** portion of the *string*. If
    the *string* starts with valid numeric data, this will be the value
    used, **otherwise 0**
-   Valid numeric data is an optional sign, followed by one or more
    digits optionally containing a decimal point, followed by an
    optional exponent ('e' or 'E‘) followed by digits.


-   Examples

```php
<?php
$foo = 1 + "10.5"; // $foo is float (11.5)

$foo = 1 + "-1.3e3"; // $foo is float (-1299)

$foo = 1 + "bob3"; // $foo is integer (1) since bob is 0

$foo = 1 + "10 Small Pigs"; // $foo is integer (11)

$foo = 4 + "10.2 Little Piggies"; // $foo is float (14.2)
?>
```



## Conversions to Strings

-   string conversion is done automatically in scope of the expression
    (e.g., **echo** function takes string arguments)

-   Boolean true is converted to “1”

-   Boolean false is “” (empty string)

-   arrays -&gt; “Array”

-   objects -&gt; \_\_toString method is invoked, otherwise “Object”

## String type

-   series of bytes, each byte represents a character -&gt; NOT Unicode

-   PHP does not have char type or byte type

-   256 char set, but PHP does not dictate the encoding -&gt; encoding
    is based on the encoding of the PHP script

-   maximum length of a string = 2GB

### String literals

### Single Quotes

-   Preserves exact content

-   all characters are literals except escape sequences \\\\ and \\’
    (only 2 escape sequences)

-   More performant

### Double quotes

-   multiple escape sequences, like `\\n`, `\\t`, `\\$`, …

-   variable names will be expanded -&gt; values of variables are
    substituted into the string -&gt; Interpolation

Example

```php
$user = “Bill”;

echo 'Hi $user'; //Hi $user

echo “Hi $user”; //Hi Bill

//you can always use the concatenation operator .
```

## Variable expansion / interpolation

-   strings with double quotes or heredoc have variables parsed
-   Simple syntax: whenever parser sees $, the subsequent characters are
    parsed as much as possible to become a valid variable name

```php
$juice = “apple”;

//works:

echo “He drank some $juice juice.” //output: He drank some apple juice.

//the s is parsed to be in the variable name, which is empty string

//UNINITIALIZED variables have a default value

echo “He drank some juice made of $juices.”;

//output: He drank some juice made of .
```

## Variable expansion – complex syntax (curly braces)

-   put variable within `{}`, no spaces

-   allows for the use of complex expressions within a string

-   any scalar variable, array element or object property with a string
    representation can be included via this syntax

```php
$great = 'fantastic';

// Works, outputs: This is fantastic  
echo "This is {$great}";  
echo "This is ${great}";

$preparation = 'Braise';

$meat = 'Beef';

print "{$preparation}d $meat with Vegetables";
```

## Variable variables

-   variable variables: variable name which can be set and used
    dynamically

```php
$a = 'hello';

$$a = ‘world’; //variable called $hello

echo “$a ${$a}”; // same as $a $hello

{} are optional but resolve ambiguity

e.g.: $$a\[1\] is interpreted an be ${$a\[1\]} but could be read as
${$a}\[1\]
```

## String literals – Heredoc and Nowdoc

-   Heredoc &lt;&lt;&lt; - behaves like a double-quoted string

```php
echo <<< DOC
	string contents
DOC;
```

-   the line with the closing identifier must start after the new
    line (\\n) and contain no other characters, except a semicolon (;)
    -&gt; not even an indent or comment
-   behaves like “” string (but quotes don’t need to be escaped) -&gt;
    more escape sequences, variables are expanded
-   can use reuse heredoc names
-   Nowdoc is same, except behaves like single-quoted string

```php
echo <<< ‘DOC’
string contents
DOC;
```

## Strings

-   0-indexed – can be accessed like a numeric array of characters

-   `$str\[12\]` – accesses or modifies the 13<sup>th</sup> character

-   reading from out-of-range – warning uninitialized string offset

-   writing to out-of-range – pads the string with spaces until reach
    the character

-   PHP 5.4 + offset must be an integer or a integer string (only
    digits); other types will cause a warning

-   PHP 7.1 Negative numeric indices supported

```php
$string = 'string';
echo "The character at index -2 is $string\[-2\]. "
> ‘n’
```

## String and numeric comparisons

-   `==`, `!=`, `<>` check for equality **after** type juggling

-   ==`=`, `!`== check for identical

-   `>`, `>=`, `<`,`<=` all have type juggling

-   Compare string with a numeric (no quotation marks)

    -   string is converted to a numeric, and the comparison is numeric

## String comparison

```php
// These values are compared using dictionary order since at least one has char and both are strings

(‘A 54321’ > "5678 X") - True

// These values are compared using numeric order since entirely numeric
even though they are string

("54321" > "5678") - True

// These values are compared using dictionary order since both have char

('6 pack' < '55 card stud') - False

// These values are compared as strings since using dictionary order
since at least one has char and both are strings

if ('6 pack' < “55”) - False

// These values are compared using numeric order since **one** is a
numeric, not string

if ('6 pack' < 55) - True
```

## Common string functions

-   many general functions, incl Perl-compatible regex functions,
    functions for URL strings, hashing/encryption, ….

-   `strcmp()` always compares with dictionary order

-   `trim()`

-   `strlen()`

-   `==` for value comparison, `===` for type and value

-   `strcasecmp()` – returns 0 if both are same case

-   `strtolower()`, `strtoupper()`

-   `ucwords()` – uppercases the first letter of each word

-   `substr()`

## Useful numeric functions

-   `round()` function rounds a number to a certain number of decimals

-   `number\_format()` adds commas

```php
$n = 3.14;

$n = round ($n); // 3

$n = 3.142857;

$n = round ($n, 3); // 3.143

$n = 20943;

$n = number\_format ($n); // 20,943

$n = 20943;

$n = number\_format ($n, 2); // 20,943.00
```

