## Lab 4a - Sticky form with template and functions

Revisit your form from lab 3, making the following changes:

* --Combine your form display and handling scripts into a single script (i.e., submit the form back to the same script). This means you no longer need a third script with your arrays.
* --Modularize with functions. Create functions for data validation!
* --If the form input is valid, redirect to a second script that simply says Thank you.
* --If the form is invalid, display a summary of errors, followed by the form. Optional: display the previously entered data
* --Create a new header template file (header.html.php) that will be included in both display scripts. The header should have the title set through php (i.e., `<title> <?php $title ?> </title>`. Include it in your form when you are ready to start output.
* --BONUS: Add javascript validation!!!

## Lab 4b - Web scraping

### Part 1

Write a php script that will be invoked from the console (i.e., run from command line with command php script.php ) that will GET a web page ([https://www.dawsoncollege.qc.ca](https://www.dawsoncollege.qc.ca/)), retrieve its contents and store in a string, then print the string. This means you must:

1. Initialise a cURL handle
2. Set the URL to GET. Make sure that the content is not printed to the console here.
3. Execute the handle
4. Close Curl
5. Echo the string

Remember: cURL is a library of **functions**!

NB: if you notice that your string is actually a **301 Moved Permanently** response, you used the wrong URL: make sure it is `https`!

!!!note
    To invoke the php scrip from command line, you must vagrant ssh into your VM, and cd through the Code folder (mapped to PHPCode) to your file.

### Part 2

Now take the string of the web page html, and programmatically look for the Dawson College twitter link (in an <a> tag with a class dc_twitter – find the href). Don't use a regex – it is not the best tool for parsing an HTML (or XML-type) document; a DOM parser is a better tool. Within PHP, the DOM manipulation is supported by a number [of DOM classes](http://php.net/manual/en/book.dom.php). We are interested in the [DOMDocument](http://php.net/manual/en/class.domdocument.php); you can subsequently use the [DOMNodeList](http://php.net/manual/en/class.domnodelist.php) and [DOMNodes](http://php.net/manual/en/class.domnode.php) to traverse through the tree, or use [DOMXPath](http://php.net/manual/en/class.domxpath.php) to query to get a specific DOMNode in a DOMNodeList.

==Remember: DOM is a collection of **classes**!==

#### Steps:

1. Load the HTML string into the DOMDocument using the loadHTML method.

!!!note
    If the string you are loading has errors (e.g., imperfect markup), you may have a long stream of warning messages when you use the loadHTML method. These warnings will not prevent you from scraping the site. So we usually use the **error control operator** **@** : this operator is prefixed before an expression that may cause many warnings (@ operator is affectionately known as the stfu operator  ). Usage: `@$domdocument->loadHTML($page);`

![img](data:image/*;base64,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)

How do you know if the website you want to scrape will cause many warnings? Run it through validator.w3.org. (so many errors from the Dawson home page, oh the shame…)

##### Option 1: traversing the DOM tree

1. query the DOMDocument to find the appropriate node. Some examples :

```php
<?php
// example 1: to echo the value of all div tags (all tags are stripped)
$elements = $domdocument->getElementsByTagName('div');
foreach ($elements as $item)
echo $item->nodeValue;

// example 2: find the element with given id
$element = $domdocument->getElementById('IdToSearch');

// example 3: to echo the value of all href attributes of a tags
$elements = $domdocument->getElementsByTagName('a');
foreach ($elements as $item)
echo $item->getAttribute('href');
?>
```

There are many more methods available to help you traverse the DOM! Look through the documentation or give me a shout!

##### Option 2: using Xpath to query

1. use XPath selectors (a little bit like JQuery selectors) to find the appropriate DOMNodeList. Some DOMXPath examples (from PHP documentation)(sorry, not my forte!):

```php
<?php
$xpath = new DOMXpath($domdocument);

// example 1: for everything with an id
$elements = $xpath->query("//*[@id]");

// example 2: for node data in a selected id
$elements = $xpath->query("/html/body/div[@id='IdToSearch']");

// example 3: for node data in a selected class with wildcard
$elements = $xpath->query("*/div[@class='ClassToSearch']");
?>
```

An easy way to experiment and learn about XPath is by using Google Chrome Developer tools. Open the tools, browse to a page, look at the Elements -> right-click on an element of interest and select Copy – Copy XPath. Paste somewhere and examine!

## Notes

* --DOMNodes/DOMElements are objects. You may be interested in their nodeValue (the string between the `<tag> </tag>`) or in their specific attribute values (using `getAttribute('attributeName')` )
* --Web scraping is hard-coded to the html document: if the scraped page changes, your scraper won't work. For that reason it is ok to do things like looking for the 1 # st `<td>` in a `<table>` with a given id: the number 1, the html tags and the id are all hard-coded.

BTW, this query will look like this with DOM traversal (could by put in a single line of code)

```php
<?php
//find the table

$table = $domdocument->getElementById('jaya');

//get the first td

$td = $table->getElementsByTagName('td')->item(0)->nodeValue;

Same query with Xpath:

$td = $xpath->query('//table[@id="jaya"]/tr/td')->item(0)->nodeValue;
?>
```