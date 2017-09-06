## Conditionals

```php
<?php
if (condition) {
    // Do this!
}
if (condition) {
    // Do this!
} else {
    // Do that!
}
if (condition1) {
    // Do this!
}
elseif(condition2) {
        // Do that!
    } else {
        // Do whatever!
    } 
?>
```
<?php>
## What is true?

ALL expressions are either true or false

True =

* `$var`, if `var` has a value **other** than 0 (numeric or string), an

empty string, empty array, `FALSE`, or `NULL`

* `isset($var)`, if `$var` has any value other than `NULL`, including 0,

`FALSE`, or an empty string

* `TRUE`, `true`, `True`, etc.

## Dangerous behaviour

```php
<?php
if ($msgs = 10) //evaluates to 10, which is true!!

    echo“ you have ten messages”;

if (strpos('abcdefg', 'xyz')) { //evaluates to false  
    echo 'found it!';
} else {
    echo 'didn\'t find it.';
}
?>
```

**BUT!!!**

`if (strpos('abcdefg','abc')){ //evaluates to position 0 which is false`

In PHP -&gt; use `===` to distinguish between 0 and false

```php
<?php
if (strpos('abcdefg','abc') !=== false){ //evaluates false only if not
found, so 0 and false are not same since not same type  
echo "found it!";  
}else{  
echo "didn't find it..";  
}
?>
```

## Loops

```php
<?php
while (condition) {
	// Do something.
}

for ($i = 1; $i &lt;= 10; $i++) {
	echo $i;
}
?>
```

## Break and continue

`break 2; //2` indicates number of enclosing structures to break out of

-   cannot pass in a variable as an argument to break

-   cannot break 0 or less

-   same for continue; - can tell it how many enclosing structures to
    skip to the end

    -   breaks out of the inner structures, continues the outer-most

Examples

```php
<?php
for ($i=0; $i&lt;10; $i++) {
  echo "at i $i"."</br>";
  for ($j = 0; $j &lt; 10; $j++){
    if ($j == 7)
      break 2;
    echo "at j $j ";
  }
}
at i 0  
at j 0 at j 1 at j 2 at j 3 at j 4 at j 5 at j 6
  
for ($i=0; $i&lt;10; $i++) {
  echo "at i $i"."</br>";
  for ($j = 0; $j &lt; 10; $j++){
    if ($j == 7)
      continue 2;
    echo "at j $j ";
  }
}

at i 0  
at j 0 at j 1 at j 2 at j 3 at j 4 at j 5 at j 6 at i 1  
at j 0 at j 1 at j 2 at j 3 at j 4 at j 5 at j 6 at i 2  
at j 0 at j 1 at j 2 at j 3 at j 4 at j 5 at j 6 at i 3  
at j 0 at j 1 at j 2 at j 3 at j 4 at j 5 at j 6 at i 4  
at j 0 at j 1 at j 2 at j 3 at j 4 at j 5 at j 6 at i 5  
at j 0 at j 1 at j 2 at j 3 at j 4 at j 5 at j 6 at i 6  
at j 0 at j 1 at j 2 at j 3 at j 4 at j 5 at j 6 at i 7  
at j 0 at j 1 at j 2 at j 3 at j 4 at j 5 at j 6 at i 8  
at j 0 at j 1 at j 2 at j 3 at j 4 at j 5 at j 6 at i 9  
at j 0 at j 1 at j 2 at j 3 at j 4 at j 5 at j 6
?>
```

## switch statement

-   comparison is loose (i.e., ==, not strict with ===)

-   when a case statement match is found, executes statements until end
    of switch block or break/continue statement -&gt; fallthrough

-   continue is similar to break – takes you out of switch

    -   use it if you need continue 2; to get out of outside loop too

-   can be more efficient that nested if

    -   condition expression is evaluated once only, compared using ==

    -   nested if – condition expression may be evaluated multiple times
        (depending on how you code it)

-   case expression must evaluate to integer/floating point/string

    -   can be an expression

Be careful – switch statement uses ==

```php
<?php
$mixed = 0;
switch ($mixed) {
    case NULL: //true here
        echo "NULL";
        break;
    case 0:
        echo "zero";
        break;
    default:
        echo "other";
}

//SOLUTION:

$mixed = 0;
switch (TRUE) {
    case ($mixed === NULL):
        echo "NULL";
        break;
    case ($mixed === 0):
        echo "zero";
        break;
    default:
        echo "other";
}
?>
```

Example – range check
```php
<?php
$randomizer = rand(1, 50); //random integer between 1 and 50 inclusive
switch (true) 
// it will match on the case that is true  
{
    case ($randomizer & lt; = 20):
        $font\ _size = "11";
        break;

    case ($randomizer & lt; = 30):
        $font\ _size = "16";
        break;

    case ($randomizer & lt; = 40):
        $font\ _size = "18";
        break;

    case ($randomizer & lt; = 50):
        $font\ _size = "20";
        break;
}
?>
```

## Ternary operator - Beware

-   Left-to-right associativity (instead of right –to-left)

```php
<?php
echo (true ? & 'true' : false ? 'f' : 't'); //prints f not true
//equivalent to:
echo ((true ? 'true' : false) ? 'f'; : 't';);
//in other words, the result of first ternary is used in the next expression evaluation
// the first expression is evaluated to true, which
// is a non-empty) string, so it is true
?>
```

### Example

```php
<?php
$arg = 'T';

$vehicle = ( $arg == 'B' ) ? 'bus' : ( $arg == 'A')
	? 'airplane' : ( $arg == 'T' )
	? 'train' : ( $arg == 'C' ) ? 'car' : ( $arg == 'H' )
	? 'horse' : 'feet' );

echo $vehicle; //horse
?>
```