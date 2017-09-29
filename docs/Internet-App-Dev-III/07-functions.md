---
date: week 7
---
# Functions

## Syntax
```js
function function_name( [argument_list …] )
{
	[statements;]
	[return return_values;]
}
```

## Optional: Type declaration
Type declarations allow functions to require that parameters are of a certain type at call time
valid types:
* array
* callable (i.e., a function)
* bool
* float
* int
* string
* class/interface
* self (i.e., parameter is an instanceof the same class as where the method is)
* callback functions -> a lot like delegates – first class function (function is assigned to a variable)
php 7 -> exception thrown if type is not as expected

## Scope of functions

All functions in PHP have the global scope
they can be called from anywhere once they exist
functions do not need to be defined before they are referenced **EXCEPT** when
they are defined in a conditional block
or they are defined within another a function
in this case, available only after program execution has reached them

## Functions within functions
Any valid PHP code may appear inside a function, even other functions and class definitions
```js
function buyBeer() {  
	function drinkBeer() {
		echo "I don't exist until buyBeer() is called.\n";  
	}
}
/* We can't call drinkBeer() yet since it doesn't exist. */
buyBeer();

/* Now we can call drinkBeer(), buyBeer()'s processing has  made it accessible. */
drinkBeer();
```

Why useful? `drinkBeer` function is only available after `buyBeer` function is called to initialize everything!

Conditionally defined functions
function definition within a another construct, which may not yet be interpreted
```js
$adult = true;
/* We can't call drinkbeer() from here  since it doesn't exist yet, but we can call buybeer() */

buybeer(); //visible since it is in global scope

if ($adult) {  
	function drinkbeer(){
		//this is defining drinkbeer ONLY if $adult was true when these lines were executed    
		echo "I don't exist until program execution, NOT compilation, reaches me.";  
	}
}
/* Now we can safely call drinkbeer()   since $adult was true */
$adult = false; 

//no impact since $adult was true when the code above was executeddrinkbeer();
function buybeer() {  
	echo "I exist immediately upon program start since compiler found me.\n";
}
```

## Function overloading
PHP does not support function overloading
function name only is used to determine signature
cannot redefine previously-declared functions
to work around lack of overloading -> variable number of arguments and default arguments

## Default argument values
default values for scalar arguments
```js
function makecoffee($type = "cappuccino"){    
	return "Making a cup of $type.\n";
}
echo makecoffee();  
// Making a cup of cappuccino.echo makecoffee(null); 
// Making a cup of .echo makecoffee("espresso"); 
// Making a cup of espresso. 
```
- default value must be a constant expression
- defaults after non-default arguments, otherwise warning 

### Example
```php
<?php
function makeyogurt($type = "greek", $flavour){    
	return "Making a bowl of $type $flavour.\n";
} 
echo makeyogurt("raspberry");  
//Warning: Missing argument 2 in call to makeyogurt() in /usr/local/etc/httpd/htdocs/phptest/functest.html on line 41 Making a bowl of raspberry . 
?> 
```
## Default values – non-scalar (arrays)
```php
<?php
function makecoffee($types = ["cappuccino"], $coffeeMaker =NULL){    $device = is_null($coffeeMaker) ? "hands" : $coffeeMaker;    return "Making a cup of ".implode(", ", $types)." with $device.\n";}echo makecoffee();echo makecoffee(["cappuccino", "lavazza"], "teapot");
?>
```
## Variable length arg list
… since PHP 5.6 

`function sum(…$numbers)   //will be passed in as an array`

## Passing by reference
* Default = pass by value, even for arrays (arrays are treated like scalars)

* To pass by reference: & prefix on the argument name in function definition
```php
<?php
function add_some_extra(&$string){    $string .= 'and something extra.';}$str = 'This is a string, ';add_some_extra($str);echo $str;    // outputs This is a string, and something extra.
?>
```
## Return values
Optional return statement

* If no return, `NULL` is returned
* To return a reference from a function: reference operator & in both the function header and when assigning the return value

```php
<?php
// You have to force pass by reference and return by reference on scalarsfunction &incx($x)
{
	$y = $x++;
	return $y;
}
$x1 = 1;
$x2 = &incx($x1);
echo $x1, $x2; // both are 1
Variable function names
$func= 'test’;

$func(); // invokes test()
?>
```

## Using variable function names for textbox validation
```php
<?php
/** 
* This function can be used to check the sanity 
* of variables    
* @param string $name The input name you would like to check    
* @param string $type The type expected (numeric, int, float, string    
* @param int $maxlength The maximum length of the variable    
* @return bool if invalid, null if error, else the value    
*/
function validateTextbox($name, $type, $maxlength) {
	if (!isset($_POST[$name]))
		return FALSE;
	$value = trim($_POST[$name]);
	if (empty($value))
		return FALSE;
	$datatype = 'is_’.$type; //variable function name
       //make sure it is indeed a function
	if (is_callable($datatype))	{
		//can now invoke $datatype
		if(!$datatype($value))
			return FALSE;
		switch ($type) {
			case 'string': $value = htmlentities($_POST[$name]);
						if (strlen($value) > $maxlength)
							return FALSE;
						return $value;
			case 'int':
			case 'numeric':
			case 'float':	if ($value > $maxlength)
								return FALSE;
							return $value;
		}
		return FALSE;	   
	}
} //will return NULL if $datatype was not callable
?>
```

### Using it
```php
<?php
$fname = validateTextbox('fname', 'string', 20);
if ($fname === NULL)
	exit; //program error
if ($fname === FALSE)
	echo '<p class="error">You forgot to enter your first name!</p>';
?>
```
## Variable scope - Page
If you define a variable, the rest of the page can access it

Included files act as if they were part of the original (including) script, variables defined before an include( ) line are available to the included file
```php
<?php
$a = 1;
include 'b.inc'; 
//$a is available inside b.inc script
?>
```
Variables defined within the included file are available to the parent (including) script after the `include()` line.

A php script is all the code sent to the PHP interpreter, irregardless of php blocks within the script

```php
<?php 
$page_title = 'Welcome to this Site!';
include 'includes/header.html.inc';
?>
```

In `header.html.inc`:
```html
<h1>Lorem Ipsum <?php echo $page_title; ?> </h1>
thus variables defined in an included file are available throughout the script
```

## Variable scope - function
User-defined functions have their own scope: 
* Variables defined within a function are not available outside of it
* Variables defined outside of a function are not available within it.

```php
<?php
$a = 1; 
/* page scope */ 
function test(){     
	echo $a; /* reference to local scope variable */   
	//$a will initialized to "” since it is used in an echo statement 
} 
test();
?>
```

## global keyword
To alter the variable scope within a function, you can use the global statement.
```php
<?php
function function_name() {
	global $var;
	echo $var;
	$var++;
}
$var = 20;
function_name(); // Function call.
echo $var;
?>
```
In this example, `$var` inside of the function is now the same as `$var` outside of it. 
if `$var` changes inside of the function, the external `$var`’s value will also change.

!!!note "Same as passing by reference"
	```php
	<?php
	$a= 1;
	$b= 2;
	function myFunction(){
		global $a, $b;
		$a= $a+ $b;
	}
	myFunction();
	$a= 1;
	$b = 2;
	function myFunction(&$var1, &$var2){
		$var1 = $var1 + $var2;
	}
	myFunction($a, $b);
	?>
	```

## Another option for globals:
`$GLOBALS` array references all variables available in global scope

The `$GLOBALS` array is an associative array with the name of the global variable name being the key and the contents of that variable being the value of the array element.

`$GLOBALS` is a superglobal. It exists in any scope (page and function)
```php
<?php
$a = 1;
$b = 2;
function myFunction(){    
	$GLOBALS['a'] = $GLOBALS['a'] + $GLOBALS['b'];
} 
sum();
?>
```
## Summary – Variable scope
* Superglobal – arrays that are available anywhere

* Global or Page - variables defined at the page level (ie, not within a function) – accessible throughout page after they are set
	* Includes any included files
* Local - Function have their own scope
	* Variables here are locally scoped
	* To access the globally scoped variables, need the global keyword
		* `global $var;`
	* Or pass as a reference argument to function
	* Or access the `$GLOBALS` super global array
		* Keys are all variables at global scope

## Static variables within functions
A static variable exists only in a local function scope, but it does not lose its value when program execution leaves this scope
```php
<?php
function test(){    
	static $a = 0;  
	//only runs on first function invocation
	//cannot initially assign to an expression – must be resolved at compile-time    
	echo $a;    
	$a++;
}
?>
```
- very useful for recursion

!!!note "PHP makes two passes over a script"
	Pass 1: Compile – parsing of the script

	* done only once when the script is loaded into memory (through use of an opcode cache)

	Pass 2: Interpret / execute

## Constants
* Once you have defined a constant, its value is set for the remainder of the program and cannot be altered.
* Constant must NOT be prefaced with a $ sign (as with regular variables)
* Can only be defined using the define function 
* Case sensitive
* Convention: Use only uppercase for constant variable names (convention)
* Superglobal scope
```php
<?php
define ('NAME', value);

define ('USERNAME', 'jaya');
define ('PI', 3.14);

echo "Hello, USERNAME"; // no expansion of constants!
echo 'Hello, ' . USERNAME;
?>
```

