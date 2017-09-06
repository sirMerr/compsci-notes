# Arrays

-   **all** arrays in PHP are ordered maps (or hash
    tables, dictionaries) – key-value pairs
    -   ordering based on **when** added to array, **not** on the key’s
        value

    -   to order based on keys – ksort function
-   Indexed arrays (numeric arrays) use numbers for keys

    -   keys begin at 0 by default
-   Associative arrays use strings and/or numbers as keys -&gt; in fact
    all arrays in PHP are associative
-   values can be any type, including arrays (multi-dimensional)

## Creating an array

syntax as of php 5.4: \[\]

```
$vals = \[  
    “key1" => “value1",  
    “key2" => “value2"  
\];
```

or

`$vals = \[“value1”, “value2”\]; //numeric key`

pre php 5.4 : `array()` is a language construct (not a function)

General syntax: 
```
$vals = array(  
    “key1" => “value1",  
    “key2" => “value2"  
);  
```
- comma separated list of key => values

- if the key is numeric, supply a comma-separated list of elements
```
$vals = array(“value1”, “value2”);
```
Numeric arrays are associative

-   keys are either strings or integers

-   can have a mix of key types in same array -&gt; PHP does not
    distinguish between indexed (numeric) and associative arrays

-   behavior of numeric array is the same as an associative array

-   indexed arrays don’t have to start at index 0 and increase

-   if the key is a string which is a valid integer, it will be
    converted to an integer

-   if try to use a key which is a float, Boolean, or null -&gt; they
    will be converted to integers

-   warning if use array or object as key

Examples
```
$array = \[  
    1    => "a",  
    "1"  => "b",  
    1.5  => "c", //truncated  
    true => "d",  
\];  
var\_dump($array);

array(1) {

\[1\]=>

string(1) "d"

}

//only sees one key value since they are all cast/converted to integer,
so the value is overwritten each time

isset($array\[‘jaya’\]) -&gt; false
```
Examples
```
$array = \[  
    "foo" => "bar",  
    "bar" => "foo",  
    100   => -100,  
    -100  => 100,  
\];  
var\_dump($array);

array(4) {

\["foo"\]=>

string(3) "bar“

\["bar"\]=>

string(3) "foo“

\[100\]=> int(-100)

\[-100\]=> int(100)

}
```
## Indexed arrays

-   optional to specify the key, in which case 0 indexed and
    incrementing index
```
$array = \["foo", "bar", "hello", "world“\];  
var\_dump($array);

array(4) {

\[0\]=> string(3) "foo"

\[1\]=> string(3) "bar"

\[2\]=> string(5) "hello"

\[3\]=> string(5) "world"

}
```

## Review - Arrays

### Initialize an array
```
$vals = \[  
    “key1" => “value1",  
    “key2" => “value2"  
\];

$vals = \[“value1", “value2“\]; => starts at 0

$vals = \[  
         "a",  
         "b",  
    6 => "c",  
         "d"  
\]; => 0,1,6,7 as the keys

$array = \[1, 2, 0 => 5, 8\];

var\_dump($array);

1 => 2

0 => 5

2 => 8
```
### Accessing elements

`$array\[“key”\]`

-   if the key has not been defined, get the same **warning** a
    accessing any **other undefined variable** (e-notice error), and the
    **result will be null**
```
var\_dump($array\[“jaya"\]); //result is null if key “jaya” doesn’t exist

if (isset($array\[“key”\]) => true only if the key is in use
```
### Modifying arrays

`$arr\[“key”\] = value;`

If `$array` doesn't exist yet, it will be created, so this is also an
alternative way to create an *array*.

BUT WARNING if `$array` is already a string then the `\[num\]` may
actually be interpreted as a *string access operator*.

`$str\[5\] -&gt;` returns the character at 5
```
$arr\[\] = value2; //adds a last element, with next numeric index, 0 if first numeric index
```

-   To remove a key/value pair, call the `unset()` function on it.
```
unset($arr\[“key”\]); //element is removed from array, but keys are NOT recalculated, there will be a gap

unset($arr); //deletes the whole array
```
## Loops and arrays
```
count($array) – returns the length of the array
```
-   but beware using in a for loop:
```
$cars=array("Volvo","BMW","Toyota");

unset($cars\[0\]);//removes the key-value pair  
$length=count($cars);  

for($x=0;$x&lt;$length;$x++) {  
  echo $cars\[$x\]; //undefined offset warning, null  
  echo "&lt;br&gt;";  
}
```
## Arrays and Strings
```php
$array = explode (separator, $string); //explode converts between string
to array

$string = implode (glue, $array); //implode glues array elements into
string

$s1 = 'Mon-Tue-Wed-Thu-Fri';

$days\_array = explode ('-', $s1);

// $days\_array now a five-element array, with Mon indexed at 0.

$s2 = implode (', ', $days\_array);

// $s2 now a comma-separated list of days: Mon, Tue, Wed, Thu, Fri.
```
## foreach loop

-   don’t rely on the key / index value to iterate through an array
    -&gt; use a foreach loop

-   two ways -&gt; needing to know the key and not
```php
foreach ($array as $value)

echo $value;

//on each iteration, the current value is assigned to $value and the
internal array pointer advances by 1

foreach ($array as $key => $value)

echo $key.$value; //current element key and value are assigned
```

## PHP memory management

-   PHP has a garbage collector, like Java

-   Internal mechanism:

    -   every variable is stored in a container (called zval)

    -   the container has the variable type, value, count of the number
        of references to it

    -   each time you unset or make a variable = NULL the refcount will
        decrease

    -   when refcount is 0, garbage collection will happen

-   Garbage collection only if idle CPU cycles, or running out of memory

-   Choices:

    -   memory will be released at end of script – short running web
        page

    -   unset():

        -   language construct that removes the variable name from the
            table, and removes a reference

    -   make variable = null – variable still exists

## Variables

-   assign by value

    -   value of variable/expression is copied

-   assign by reference

    -   new variable becomes an alias / refers to the original variable

    -   only possible for named variables (not expressions)
```php
foo = 'Bob';     // Assign the value 'Bob' to $foo  
$bar = &$foo;   // Reference $foo via $bar.  
$bar = "My name is $bar";  // Alter $bar...  
echo $bar;  
echo $foo;      // $foo is altered too.
```
Change `$value` in a foreach loop

-   to directly modify array elements within the loop use `$value` so
    the value is assigned by
    [reference](http://php.net/manual/en/language.references.php) on
    each iteration
```php
$arr = \[1, 2, 3, 4\];  
foreach ($arr as &$value) {  
    $value = $value \* 2;  
}
```
!!!note
    `$value` is available outside the construct (we’ll cover scope when we do functions)
-   if you change $value, you can change the last element of the array
    since it is a reference, even if you think you are redefining $value
    (i.e., using it in another foreach loop)

**solution**: unset($value); // breaks the reference of $value, so no
longer an alias

Example
```php
$array = \[1, 2, 3\];

foreach ($array as &$value) {} // by reference

var\_dump($array);

foreach ($array as $value) {} // by value (i.e., copy)

var\_dump($array);
```
**Results:**
```php
array (size=3)

0 => int 1

1 => int 2

2 => &int 3

array (size=3)

0 => int 1

1 => int 2

2 => &int 2
```
**Why?**

After going through the first foreach loop, $array remains unchanged but
$value is left as a **dangling reference** to the last element in $array
(since that foreach loop accessed $value by reference).

when we go through the second foreach loop, since $value is now being
accessed **by value** (i.e., by copy), **foreach copies each sequential
$array element into $value** in each step of the loop.

As a result, here’s what happens during each step of the second foreach
loop:

Pass 1: Copies $array\[0\] (i.e., “1”) into $value (which is a reference
to $array\[2\]), so $array\[2\] now equals 1. So $array now contains
**\[1, 2, 1\].**

Pass 2: Copies $array\[1\] (i.e., “2”) into $value (which is a reference
to $array\[2\]), so $array\[2\] now equals 2. So $array now contains
**\[1, 2, 2\].**

Pass 3: Copies $array\[2\] (which now equals “2”) into $value (which is
a reference to $array\[2\]), so $array\[2\] still equals 2. So $array
now contains **\[1, 2, 2\].**

## Sorting Arrays

-   sort(), by value, dropping the keys

-   asort(), by value, maintaining the keys

-   ksort(), by key, maintaining the values

-   rsort(), sort() in reverse order

-   arsort(), asort() in reverse order

-   krsort(), ksort() in reverse order

## Useful array tricks

-   range() function to fill an array with numeric sequence

    -   e.g., $month = range (1,12);

-   $tv\[\] = ‘Seinfeld’; //adds ‘Seinfeld to end of array, or creates a
    new one if it doesn’t exist yet

-   to be safe: first to unset($tv);

### Indices and reindexing

-   when you unset, the element is removed, but the key is “remembered”

-   when you add a new element, it will be at the maximal index + 1
    where the maximal index existed at some point

-   the array\_values() function will reindex with numeric

-   to reindex: array\_values() method OR unset the entire array!!

Example

// Create a simple array.  
$array = \[1, 2, 3, 4, 5\];  
var\_dump($array); //5 values  

// Now delete every item, but leave the array itself intact:  
foreach ($array as $i => $value) {  
    unset($array\[$i\]);  
}  
var\_dump($array); //empty  

// Append an item (note that the new key is 5, instead of 0).  
$array\[\] = 6;  
var\_dump($array); //key 5 to value 6  

// Re-index:  
$array = array\_values($array);  
$array\[\] = 7;  
var\_dump($array); //\[0\]=>6 \[1\]=>7