##### Lab 5 - PHP and Databases

_(csv file and table specs from_ [_PHP and MySQL practice exercises_](http://faculty.tamuc.edu/tombrown/exr/exr470.html)_)_

In this lab, we will create and populate a database in a command-line application, then perform CRUD operations in a web application.

## Part 1 – Create and populate the database and tables

Use the vagrant localhost server, with the Postgres database homestead, user homestead and password secret. Write a function within a PHP command-line application that will drop if exists and create a table that represents items. The items table definition:

| Table Name | Column Name       | Data Type         | Length      | Comment |
| ---------- | ----------------- | ----------------- | ----------- | ------- |
| items      | id                | int             5 | primary key |
| name       | varchar        15 |
| cost       | decimal         5 | 2 dec. places     |

Write one or more functions that will load the contents of items.csv (in the S: drive) into the item table. Remember to trim each segment as you read it in.

Finally, write the top-level code that will invoke the functions. This application will be invoked from Vagrant command line.

## Part 2 – Web application to provide CRUD operations

Write a script called index.php that asks the user to choose between adding a new item, deleting an existing item, updating a given item, or finding an item. These 4 choices can be buttons or links to the 4 other PHP scripts described below.

In the create script: provide a form that asks for the item id, name and cost. When the form is submitted, validate the data types. If all is well, insert a new row. Be sure to take care of the case where the id supplied is already used in the table. If there are any problems, display the form again with the error message. If the create is successful, redirect back to the index.php page, but providing a querystring: index.php?task=create.

Let's revisit the index.php script: check if the `$_GET` superglobal has a `task` element. If it does, and the value is create, display a message saying "The item was successfully created". If the value is `delete`, display `"The item was successfully deleted"`, and if the value is `update`, display `"The item was successfully updated"`.

In the delete script: 

* provide a form that asks for the item id. 
* When the form is submitted, validate the data type. If all is well, delete the matching row. 
* Be sure to take care of the case where the id supplied is not used in the table. If there are any problems, display the form again with the error message. 
* If the delete is successful, redirect back to the `index.php` page, but providing a querystring: `index.php?task=delete`.

The update script is similar to the create script, except that an existing row is updated based on the provided item id.

Finally, the find script provides a form that asks for the name, searches through the database looking names that are like the provided name, and displaying the top 10 matches.