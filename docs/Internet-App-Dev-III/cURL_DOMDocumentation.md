## Using classes

* You can directly call a constructor:

```php
<?php
$object = new SomeClass(…); //allocates and initializes

$object->method(); //-> is the member access operator, not .

$object->attribute; //NOT $object->$attribute

SomeClass::staticFunction(); //:: is the scope resolution operator

unset($object); //same as $object = null, optional if you want to tag for garbage collection
?>
```
## cURL methods

* cURL library and cURL command line tools facilitate programmatically transferring data using different protocols
* supports protocols like http, https, ftp, …
* uses a URL to indicate the source
* Functions, not classes

# Typical cURL usage

* **curl_init** Initializes the session and returns a cURL handle which can be passed to other cURL functions.
* **curl_setopt** This is the main work horse of cURL library. This function can be called multiple times and specifies all the options in the cURL session i.e., sets up the request as we need it.
* **curl_exec** – Executes a cURL request.
* **curl_close** – Closes the current cURL session.

# Example
```php
<?php
$url = 'full url to scrape';

//GET is the default

//add your query string to your URL

e.g., $queryString = "?year=1937&top=500&country=US&order=0&page=10";

$ch = curl_init($url); //curl handle

//or $ch = curl_init();

//curl_setopt($ch, CURLOPT_URL, $url);

curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); //not to display on the console

curl_setopt($ch, CURLOPT_POST, true); // for POST request only

$page = curl_exec($ch); //execute the request

curl_close($ch); //close this curl session, deletes the $ch
?>
```
# Document Object Model

* standardized (by W3C) convention for representing HTML and XML documents
* Nodes are organized into a tree structure
  * parent / child / sibling / ancestor / descendant nodes
  * nodes – elements
  * they can have attributes
  * they can have values (between the <> and </> tags)
* Standardized – used by browsers to parse a document to render it
* Used by JavaScript – DOM also includes the event model and modification of the document

# PHP DOMDocument classes
DOMDocument – root of the tree
```php
<?php
$html = new DOMDocument();

$html->loadHTML($page); //-> member access operator, not .
?>
```
Once it is loaded, traverse through looking for the data
```php
<?php
$rows = $html->getElementsByTagName('tr');

//returns a DOMNodeList that you can iterate through or get length

//iterate through the DOMNodeList, looking for attributes of each DOMNode

foreach($rows as $row)

if ($row->getAttribute('class') == 'error')

//Or get the first DOMNode if you know you need the first row:

$first = $rows->item(0);

// With each DOMNode, get the value between tags:

echo $row->nodeValue; //NOTE: attribute, not a method call

//OR get an attribute

echo $row->getAttribute('class');
?>
```
# Errors

* you may find badly formed HTML pages when you scrape
* to suppress DOM errors from flooding your screen, use the `@` symbol in front of the variable to assign
* Check source at validator.w3.org\
```php
@$html ->loadHTML($page);
```
*`@` = error control operator (fondly known as the stfu operator)*

*Prefix it to an expression so that any error messages that might have been generated are ignored*

* Example:
```php
$file = @file_get_contents('fileToRead'); //no errors if file not found
```
# DOMXPath

* XPath (XML Path Language) is a query language for selecting nodes from an XML document.
* XPath was defined by W3C
* DOMXPath query method takes an XPath expression; the expression is evaluated with respect to a context node
* Examples:
```php
<?php
$xpath = new DOMXPath($html);

$xpath->query("//tr") returns DOMNodeList with all tr, relative to root

$xpath->query(".//tr", $DOMNodeOfATable) 
// returns DOMNodeList with all tr, relative to the $DOMNodeOfATable -> so only those within that table
?>
```
XPath reference material: <http://archive.oreilly.com/pub/a/perl/excerpts/system-admin-with-perl/ten-minute-xpath-utorial.html>