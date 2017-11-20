## Important
These notes are powerpoint with many images, making it difficult to transfer into markdown, so updates will be less frequent here. Assignments should be up to date though!

## Overview
Welcome to the Software Development Project. In this first week we will discuss the course in general, the project and the development tools that we will use. You should have all reviewed the project specification I sent out last week.

In the lab you will create the DDL statements for the database. As MySQL is slightly different from Oracle in its syntax I have a file in this week's  download with a set of DDL statements for a different problem. We will discuss how all of this works in the lab.

For homework, you will code a common dice game played in casinos in Java. The instructions for the assignment are in another file in this week's download.

## Technologies required
You can use what you see fit in terms of IDE/tools

* Java 1.8
* JavaFX 2.2
* MySQL 5.7
* JDBC
* JUnit 4
* JavaMail / Jodd
* Maven
* Git
* Gitlab    

!!! danger
    Ken won't let us use GitHub :c

## Steps to a project
1. Read the Specs
2. Create the Database and Tables
3. Write the Java JDBC CRUD code while writing unit tests after every method is coded
    1. Create
    2. Read
    3. Update
    4. Delete

## Week One Lab
Write the SQL cripts to create the necessaru tables in MySQL and then email the scripts to kfogel@dawsoncollege.qc.ca by the end of the lab period

## Setting Up MySQL

* Install MySQL Community edition

```bash
$ mysql -h
```

## Email Requirements for JAM

1. Search for all appointments that start at the interval from the present time
2. If any are found, prepare an email for each appointment
3. Send the email