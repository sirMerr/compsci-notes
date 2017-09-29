---
date: September 1st 2017
---
## references
PHP has a garbage collector
- every variable in container
    - type
    - value
    - count to the number of references
- `unset($var)`
    - or `$var=NULL`
    - decrease the reference count
- count reaches 0
    - garbage collector run
- recommendation
    - unset or set to null if variable no longer required

```php
<?php
$name = 'Bob';
$other = $name; //copy of the container
$otherref = & $name; // & = by reference
$name = 'Jaya';

echo $other // Bob
echo $otherref // Jaya
?>
```

```php
<?php
$vals = [
    $key1 => $value1,
    $key2 => value2
],

$valNumeric = [
    $value1,
    $value2
];

$valMix = [
    $value1, // 0
    $value2, // 1
    0 => $value3, // 6
    $value4 // 7
]

$array = [
    1,
    2, // 1
    0=>5, // 0
    8 // 3
]

$array["jaya"] // accessor - warning undefined
// modify --> add to array at end
isset($array[$key])
?>
```

## forEach loop (with references)

1. don't need to know key

```php
foreach ($array as $value) {}
```
- `$array` = collection
- `$value` = iterator
- `{}` = on every iteration internal pointer
2. Know key and value
```
foreach ($array as $key=>$value) {}
```

Iterator pattern --> changing `$value(iterator)`
- either syntax error doesn't change (PHP)
- holds a copy of the array element
```php
<?php
$arr = [1,2,3,4];

//reference every same memory array element
foreach ($arr as &$value) {
    $value = $value * 2
}

// $arr = 2 4 6 8
echo $value; // 8
// NO BLOCK SCOPE
?>
```

`$value` will continue to refer to last element in $arr

Safety, so that elsewhere can reuse variable name

```php
// breaks the reference
unset ($value)
```