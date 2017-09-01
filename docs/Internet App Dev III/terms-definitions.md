---
date: 'Week 2 / August 30, 2017'
date2: `September 1st, 2017 (since switch)`
---
- case sensitive
    - `$this`
    - don't start with `$__` "magical"
- default values if not initialized. If not potential security issue
- `var_dump($var);` --> NULL


## if/elseif/else
```php
if (condition) {
} elseif (condition2) {
    // more performant
} else {

}
```

### TRUE
`TRUE`

* other than 0 (numeric, string `0`)
* not ""
*  not emptyy array
* not NULL
* case insensitive => TRUE, true, TrUe
```php
$msg= 5;

if ($msg = 10){ // assignment
    echo "You have 10 messages";
}

if (strpos('abcdef','abc')) {
    echo "found it";
} else {
    echo "not there";
}
```

#### strpos
Returns index where found of FALSE
```php
mixed strpos ( string $haystack , mixed $needle [, int $offset = 0 ] )
```

http://php.net/manual/en/function.strpos.php

## Arrays
* Hashtable dictionary
* key-value pairs
    * key: numeric (int) strings
    * value: any data type
* order: based when we did key-value purge added
### Numeric array
Uses numbers for keys

### Associative array
Uses numbers and strings
```php
$array = [
    "key1"=> "value1",
    17 => "value2",
    "1" => "value3"
] 
           //^converted to numeric
```
* Mix of key types in same array
* Mix of value types in same array
    * if a string key is valid integer
        * converted to integer
    * if key float, boolean, null
    * converted to int
    * ##warning if you try to use array, object as key##
    * `is_set($array["jaya"])`
        * Good way to find out if a key is used


#### Example arrays and behaviour
```php
$array = [
    1 => 'a',
    '1' => 'b',
    1.6 => 'c',
    true => 'd',
    1 => 'd'
]
```

```php
$array1 = [
    'foo' => 'bar',
    "bar" => 'foo',
    100 => -100,
    -100 => 100
]

$array2 = [
    'bar',
    'foo',
    -100,
    100
]

echo $array2[0]; // bar
echo $array1[0]; // ""
```

==If you don't define keys, the array acts like "normal" as seen above==

```php
// Key is based on highest previous numeric
$array3 = [
    'bar', // key: 0
    6 => 'foo', // key: 6
    -100, // key: 7
    100 // key: 8
]
```

#### isset
```php
bool isset ( mixed $var [, mixed $... ] )
```

#### unset
Description:
```php
void unset ( mixed $var [, mixed $... ] )
```

```php
$cars = ['Volvo', 'BMW', 'Toyota'];
```
```php
unset($cars[0]); // removing the key-value

$length = count($cars);
```

#### for loop
```php
for($i = 0; $1 < $length, $i++) {
    echo $cars[$i]; 
    // undefined offset warning null -> ""
}
```
#### foreach
Description:
```php
foreach($array as $iterator)
```
Example:
```php
foreach($cars as $value) {
    echo $value;
}

echo $car.''.$value;
```

### Arrays and Strings
```php
$array = explode($separator, $string);
$s1 = 'Mon-Tue-Wed';
$days = explode('-', $s1),
/*
    0 --> 'Mon'
    1 --> 'Two'
    2 --> 'Wed'
*/
```

#### explode
Split a string by string
```php
array explode ( string $delimiter , string $string [, int $limit = PHP_INT_MAX ] )
```

Returns an array of strings, each of which is a substring of string formed by splitting it on boundaries formed by the string delimiter.

http://php.net/manual/en/function.explode.php


## switch statement
- comparison is loose `==`
    - not `===`
- supports fallthrough
- case expression must evaluate to `int`/`float`/`string`/`boolean`

```php
<?php
$mixed = 0;
switch($mixed) {
    case NULL: 
        echo 'NULL';
        break;
    case 0:
        echo '0';
        break;
    default echo 'other';
}
?>
```

You could match on conditions, replacing if/else/ifelse like this:
```php
<?php
// this is terrible code dont do it
switch(TRUE) {
    case ($mixed === NULL): 
        echo 'NULL';
        break;
    case ($mixed === 0):
        echo '0';
        break;
    default echo 'other';
}
?>
```

## Ternary operators

!!! warning
    Don't nest them plox 🙏

left to right associativity not right to left

```php
echo (true ? 'true': false ? 'f': 't');
// f
```

The first one feeds into the second one

```php
<?php
$arg = 'T'

$vehicle = 
    ($arg == 'B')?'bus':
    ($arg == 'T')?'train':
    ($arg == 'S')?'kpop':
    'feet'
?>
// kpop
```

## Including multiple files
- Break up long scripts
- Separate reusable
    - <html> template code
    - functions/class
    - common variables

4 functions

* `include ('filename.php')`
    * Looks for file if doesnt find, no errors
* `include_once`
    * Ensures the file wasn't already included
* `require`
    * like include except error
* `require_once`
    * copy paste file contents in that place
