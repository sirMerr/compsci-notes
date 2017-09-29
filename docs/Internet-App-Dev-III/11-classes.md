# Classes and objects

- one class per file by convention
```
/** Documentation block in PHPDocumentor standard
*/
```
```php
<?php
//convention uppercase Camel (Pascal), **not** case sensitive!!
class ClassName extends NameAbstract implements NameInterface {
    private $var1;
    private $var2;  //initialize only to constant, no default visibility

    /**
    * Documentation block 
    */
    //lowercase Camel but not case sensitive, default visibility is public
    public function blah() {
        //stuff
        return $this -> var; //$this required to access any instance members
    }
}
?>
```
## PHP documentation standards
```js
/**
* Short description for class
*
* @copyright
* @version
* @since
* @deprecated
*/

/**
* Short description of method
* @param
* @return
* @throws
*/
```
# Example
```php
<?php
class Rectangle {
    // Declare the attributes
    // must have a visibility modifier: public, protected, private
    //initialize to constant value only
    private $width = 0;
    private $height = 0;

    //methods and constructor are public by default
    // can specify public, protected, private
    // Constructor
    function __construct($w = 0, $h = 0) {
        $this->width = $w;
        $this->height = $h;
    }
    // No overloads so use default values:
    function setSize($w = 0, $h = 0) {
        $this->width = $w;
        $this->height = $h;
      }

    function getArea() {
        return ($this->width \* $this->height);
    }

    function getPerimeter() {
        return ( ($this->width + $this->height) \* 2 );
    }

    function isSquare() {
        if ($this->width == $this->height) {
            return true; // Square
        } else {
            return false; // Not a square
        }
    }
} // End of Rectangle class.

//NOTE: no closing php tag needed. Why? This class will be included in another script, so it is not necessary

```
## Notes

- Class names and method names (like **any** other PHP function) ==are **not** case sensitive (??!!)==
- Visibility **must** be declared for **properties**
  - **oo**: **public **,** private **, or** protected**
- Any initialization of attribute outside the constructor has to be to a **literal or constant**
- Method visibility: default is public
- Class can contain constants ( **const** keyword), properties, methods

## Using a class
```php
<?php
$object = new ClassName();

$object->methodName(); // -> is the object member operator
$object->propertyName; // NOT $object->$propertyName;
unset($object); //when done, if required (alternatively = null)
```
- object names (like any other PHP variable) are case sensitive

## Attributes (also called properties in PHP/Java)

- defined as `public`, `protected`, or `private` followed by a normal variable declaration
- This declaration may include an initialization, but this initialization must be a constant value
- within same class methods and non-static properties **must** be accessed by using
    - `$this_->_ property;`

- Outside, if visible:
    - `$obj->property;`

## Constructors

- Constructor is always called `function __construct()` (2 underscores)
- **Magic** function – it is automatically called when an object is instantiated, no return
- Can take arguments – but since php has no overloading, use default values
- You can directly call a constructor (although you will rarely need to):

`$o = new SomeClass();`  allocates and initializes

`$o->_ _construct();`   initializes only, use it to reinitialize properties?

# More on constructors

- Parent constructors are **not** called implicitly **if** the child class defines a constructor
  - **oo** In order to run a parent constructor, call **parent::__construct()** within the child constructor
- If the child does not define a constructor then it may be **inherited** from the parent class just like a normal class method
  - **oo** i.e., if it doesn't define `__construct`, the parent's one is used

# Destructors

- the destructor is called when the object is destroyed. This happens when there are no more references to the object, or when a script finishes
- Destructor is a place to release any resources (long living)
- No arguments to `__destruct()`
```php
<?php
class ClassName {
    // Attributes and methods.
    function _ _destruct() {
        // destroy your resources
        parent::__destruct(); //must explicitly call parent's destruct
    }
}
```
# Recall: Database result set in objects

The returned records be turned into specific types of objects:
```php
<?php
class User {

    private $id;
    private $name;

    function __construct($id=0, $name='') {
        $this->id = $id;
        $this->name = $name;
    }

    function getName() {
        return $this->name;
    }
}
```
Fetch database records into new User objects:
```php
<?php
$stmt = $pdo->prepare("SELECT id, name FROM users");

$stmt->setFetchMode(PDO:: FETCH_CLASS|PDO::FETCH_PROPS_LATE, 'User');
$stmt->execute();

while ($row =$stmt->fetch())) {

 echo $row->getUsername();

}
```

`$row` will be a `User` object, and it can invoke the `User` methods.

## Notes

- PHP directly maps the returned column names to matching object attributes even if they are private
- If no comparable class attribute exists, PHP will create the column name as a new public attribute!!!
- DANGER: the constructor is called **after** the attributes are set ?!! So either don't code a constructor in your data transfer class, or use
```
$q->setFetchMode(PDO::FETCH_CLASS|PDO::FETCH_PROPS_LATE, 'User'));
```
-> constructor is executed before PDO assigns the object attributes

## Recall: Column name to Attribute name mapping

- sql aliases are used to map the sql query result to the appropriate object attribute
- you can force column names (and aliases) to a specific case pattern
  - **--** default will be **all lower case**
```
$pdo->setAttribute(PDO::ATTR_CASE, PDO::CASE_NATURAL );
```
`PDO::ATTR_CASE` – forces columns to a case pattern

`PDO::CASE_NATURAL` leaves them as they are returned

### Example
```php
<?php
class Category {
  public $id;
  public $fkId;
  public $shortName;
  public $longName;
}
$pdo->setAttribute(PDO::ATTR_CASE, PDO::CASE_NATURAL );
$stmt = $pdo->prepare('SELECT 
    id, fk_id AS `fkId`,
    short_name AS `shortName`,
    long_name As `longName`      
    FROM `Category`'
);

$stmt-> setFetchMode(PDO::FETCH_CLASS|PDO::FETCH_PROPS_LATE, 'User'));

$stmt -> execute();
```
- since we use an alias, the alias is used as is

## Class constants

- Class constants are like public static properties whose value can never change.
- Class constants are created using the **const** keyword, followed by the name of the constant (without a dollar sign), followed by the assignment operator and the constant's value:
```php
<?php
class SomeClass {
    const PI = 3.14;
}
```
- only accessible through `ClassName::CONSTANT` or `self::CONSTANT` (within the class)

## :: Scope Resolution operator

- allows access to **static** , **constant** , and **overridden** properties or methods of a class (can't use ->)
```php
<?php
class MyClass {
    const CONSTANT = 42;
}

echo MyClass::CONSTANT;
```
## self, parent, static

- Three special keywords `self` , `parent` and `static` are used to access properties or methods from inside a class definition.
```php
<?php
class MyClass
{
    protected function myFunc() {
        echo "MyClass";
    }
}

class OtherClass extends MyClass
{
    // Override parent's definition
    public function myFunc()
    {
        // call the parent function
        parent::myFunc();
        echo "OtherClass";
    }
}
```
## Static members

- a static variable is shared across all instances of that class
- To declare a static attribute, use the static keyword after the visibility indicator
```
public static $count;
```
- within same class, are accessed by using
```
self::$count
```
- Outside, if visible:
```
ClassName :: $count
```
## Inheritance

- only 1 base class (no multiple inheritance)
- The inherited methods and properties can be overridden by redeclaring them with the same name defined in the parent class.
- PHP signature looks only at name, not parameters or return
- if the parent class has defined a method as final, that method may not be overridden
- if the class is declared as final, it cannot be extended
- access the overridden methods or static properties by referencing them with `parent::`  (instead of super)

## instanceof keyword (not a function)

`if ($obj instanceof SomeClass) {…`

## Polymorphism

- When related classes have overridden methods, the method called depends on the type of the object calling it.
- Since PHP is weakly typed, it is ALWAYS the runtime type that is used
```php
<?php
class E{
 function scream() {
    echo 'eee';
 }
}

class A extends  E {
 function scream() {
    echo 'aaa';
  }
}

$obj1 = new A();
$obj1->scream();  //aaa

$obj2 = new E();
$obj2->scream();  //eee
```
## $this vs self::

Usually:

- Use `$this` to refer to the current object: `$this->member` for non-static members
- Use self to refer to the current class: `self::$member` for static members.

**BUT…**

- `->` is an object operator, but can access static **methods** (not static attributes)
- `::` is a scope resolution operator – it can access static, constants and accessible overridden member in parent
- `self::` can refer to both static and non-static members
  - `--` non-static member will be based on the current class where the method is ∴ not polymorphic!
  - `--` references to the current class  `self::`  are resolved using the class in which the function was defined
- accessing parent member parent::
```php
<?php
class A {
    function screamloudly(){
        $this->scream();
        self::scream();
    }
    function scream(){
        echo "eee";
    }
}

class B extends A {
    function scream(){
        echo "aaa";
    }
}

$obj = new B();
$obj->screamloudly();   //output: aaaeee
```
## Late static binding

- late binding on static methods invoked with **static::**
```php
<?php
class A {
    public static function findwho() {
        self::who(); // PHP binds this to A::who() right away
        **static::** who();  // PHP waits to resolve this (hence, late)!
    }

    public static function who() {
        echo __CLASS__."\n";
    }
}

class B extends A {
    public static function test() {
       self::findwho();
    }

    public static function who() {
        echo __CLASS__."\n";
    }

}

B::test();   //A  B
```
## Type hinting

- "types" in a method and function parameter list
- works for class names, interfaces, callable (which is a callback - function name string - delegate) and array only
  - `--` callback functions -> a lot like delegates – first class function (function is assigned to a variable)
- no types allowed for scalars such as `string` / `int` / `float`/ etc...

## Objects – type hinting
```php
<?php
class MyClass {
    public function test(OtherClass $otherclass) {
        echo $otherclass->getVar();
    }
    public function test_array(array $input_array) {
        print_r($input_array);
    }
    public function test_interface(Countable $count) {
        echo get_class($count);
    }
    public function test_callable(callable $callback, $data) {
        $callback($data);
    }
}
```
- removes needs for constant type checking for objects
- throws a catchable exception
- won't give you overloaded functions
```php
<?php
// An instance of each class
$myclass = new MyClass();  //() optional is no params
$otherclass = new OtherClass();

// Fatal Error: Argument 1 must be an object of class OtherClass
$myclass->test('hello');

// Fatal Error: Argument 1 must be an instance of OtherClass
$foo = new stdClass;
$myclass->test($foo);

// Fatal Error: Argument 1  must be an instance of OtherClass
$myclass->test(null);

// Works
$myclass->test($otherclass);

// Fatal Error: Argument 1 must be an array
$myclass->test_array('a string');

// Works: Prints the array
$myclass->test_array( ['a', 'b', 'c'] );

// Works: Prints ArrayObject
$myclass->test_interface(new ArrayObject( [1,2,3] ));

// Works: Prints int(1)
$myclass->test_callable('var_dump', 1);
```
## Type hinting – not compatible with null
```php
<?php
class Type {
}

function foo(Type $t) {
}

foo(null);
```
- Results in fatal error
- Why? `Null` is **not** an object, interface, array or callable
- Can't use type hinting for anything else (i.e., not for strings, numeric, or null)!
- Solution: allow null as the default value
```php
<?php
function foo(Type $t=null) {
}
```