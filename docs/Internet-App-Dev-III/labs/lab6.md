# Lab 6 - Object-oriented PHP
(partially inspired from a [Java assignment](https://matrix.senecac.on.ca:8443/wiki/btp400/index.php/Assignment_1_(Winter_2014)) from Seneca College and converted to PHP)

In this assignment, we will build an Object-Oriented payroll system. We will have an Employee class and a Payroll class, along with a DAO interface and concrete class, and application scripts! Read through the entire lab first, then get ready to code!

## Part 1  Create tables
Create tables in your Postgres database on homestead, preferably through a PHP script so that you can recreate the next time you are in the lab. Here is a link to the PostGres [datatypes](https://www.postgresql.org/docs/9.5/static/datatype.html) as well as the syntax for primary and foreign key [constraints](https://www.postgresql.org/docs/9.5/static/ddl-constraints.html#DDL-CONSTRAINTS-PRIMARY-KEYS).

Create payroll and employee tables with the following columns and obvious data types:

Payroll table
```
id (SERIAL primary key)
name
```
Create a default payroll record with name "Not being paid". It should have id 1 since it is the first in the sequence.

Employee table:
```
id (SERIAL primary key)
firstname
email
salary
payrollId (default value 1, foreign key to payroll)
```
## Part 2 – The transfer objects
We will write two classes to represent the rows in the two tables.

Write a PHP class called Payroll. The constructor takes the payroll’s name (e.g., "Tutors") and id (default value of 0). It provides the public methods `getName` and `getId`.

Write a PHP class called Employee. When an Employee object is created, it is provided a name, an email address, a Payroll object, and base monthly salary. The constructor’s default values are empty strings, null and 0. 

Public methods: 
* `setFirstName`, `setEmail`, `setPayroll`, `setSalary`, 
* `getFirstName`, `getEmail`, `getSalary`, `getPayroll`, 
* `__toString`. 

## Notes 
Validate input passed to the constructor. If a null reference is passed into a constructor, or a negative salary throw an InvalidArgumentException.

The exception is Payroll, which can remain null.
in each setter, validate the data. 

!!!note
    Write a separate private method used by both the constructor and the setter that performs data validation

The salary should only have two decimal digits. Use the PHP function [round](php.net/manual/en/function.round.php) to 2 decimal digit precision with `PHP_ROUND_HALF_EVEN` mode.


## Part 3 - Write the Data Access layer (DAO interface and concrete class)
Write a DAO interface and a concrete class which implements the interface with all the CRUD-type methods that will be required by the business objects (read about their functionality in Part 4 below). 

Notice that Delete methods are optional, since they are not required by the business class. We use an interface in order to have our business class coded to interfaces, not implementation (i.e., concrete classes). 

Some of the methods defined in the interface (return type indicated for your information only)

* `addEmployee(Employee e) //e’s id will be changed to reflect the id in the database`
* `bool updateEmployee(Employee e) //true if successful (i.e., existing Employee)`
* `Employee getEmployee(int id)`
* `Employee[] getEmployees(Payroll p) //concrete class give default value of null: if null, an array with all employees is returned`
* `int countEmployees(Payroll p) //concrete class give default value of null: if null, all employees are returned`
* `addPayroll(Payroll p) //p’s id will be changed to reflect the id in the database`
* `Payroll getPayroll(int id)`
* `Payroll[] getPayrolls()`

## Part 4 – PayrollSystem class
Write a PayrollSystem class that functions as the business object. It has a constructor which gets a handle to an object that implements the DAO interface. We pass it a DAO instance in the constructor, instead of the constructor creating its own: dependency injection makes unit testing much easier, since you can use a stub/mock instead of the real concrete class.

You must implement the following methods: 
* `int size(payrollid)`, 
* `Employee addEmployee(firstname, email, salary, payrollid)`, 
* `bool removeEmployee(Employee emp)`, 
* `Payroll addPayroll(name)`,
* `Employee[] getEmployees(payrollid)`. 

The size method returns the total number of employees on that payroll. 

The `addEmployee()` method returns false if the employee is already on the given payroll. If not, it adds an employee to the database and returns the Employee. The method makes sure that an employee may occur at most once on the given payroll. 

The `addPayroll` method works in a similar fashion.
`removeEmployee()` will change the employee’s payroll id back to 0 (i.e., the "not being paid" Payroll object, it doesn’t delete the Employee from the table).

`getEmployees` returns an array of `Employees` with the given payrollid.

## Part 6 – Application UI Requirements 
Write a PHP script that give the administrator the option of:
* creating a new Payroll
* creating a new Employee (ask for payroll id in the form)
* displaying all Employees in a given Payroll

If the user chooses the first option, display the Payroll information is successful, else redisplay the form.

If the user chooses the second option, use the payroll id to get the Payroll object to create and save the Employee.

In the last option, display a summary for all the employees in that payroll. The information of an employee will be displayed in two lines with name and salary. Here is an example for the payroll summary of four employees: 
```
name: John Doe
total: $5235.99
name: Mark Sloan
total: $5678.00
name: Joyce Hughs
total: $7876.99
name: Josh Gosling
total: $2000.00
```
