!!! warning
    🚧 Under Construction

# COURSE OUTLINE <small>Java III</small>

### Number: 420-517-DW

* Ponderation: 3-3-3
* Credits:  3

## Prerequisites:  
Successful completion of all Year 2 420.A0 courses

## Co-requisites: 
* 420-518-DW Mobile Software Development:  Android

* 420-524-DW Internet Application Development III:  PHP

* 420-544-DW Data Communications and Networking

## Domain:        
Programming, Data Structures and Algorithms

!!! note:        
    You must pass this course as well as the three co-requisite courses in order to progress to the sixth semester of the Computer Science Technology Program.

### Description

In this course you will learn to design, code and test a desktop application. The application will employ a JavaFX graphical user interface. The data for the application will be stored in and retrieved from a relational database using the Java Database Connectivity library. All components of the application will be tested using the JUnit framework. You will learn the purpose of, the application of and how to code common data structures. You will also review the data structures provided in the Java Collections Framework. These data structures will be applied to the development of code that implements algorithms. You will learn to use a build system to manage your code a repository to store your code.

## STATEMENTS OF COMPETENCE

- Use an object oriented development approach (016T)
- Produce algorithms (016W)
- Develop user interfaces. (016X)
- Organize and use data (0170)
- Correct programs (0171)
- Make functional improvements to an application (0176)
- Assure the quality of an application (0177)
- Design and develop applications in a graphics environment (017C)

## Contacting Teachers

Ken Fogel 3F.18                       479901,02

_Teacher&#39;s schedule will be posted outside the office by the end of the first week of classes._

## Course Objectives:

Upon completion of this course the student will be able to:

1) Develop Java applications that use JavaFX framework (016X)

2) Connect a Java application to a database by utilizing Java Data Base Connectivity (JDBC) libraries (0170)

3) Explain the concepts for and apply practically in an application data structures such as stacks, lists, queues, linked lists and binary trees (016W)

4) Code stacks, lists, queues and linked lists (016W)

4) Use the Java Collections Framework to employ data structures in an application (0170)

5) Issue SQL commands to a database and display the result set in an appropriate GUI component such as an Update Table (0170)

6) Manage application development using a build system

7) Test and validate your code using the unit testing framework (0171, 0177)

8) Write a desktop application from a given specification (016T, 017C, 0177, 016W)

## Course Methodology

The course consists of two 1½-hour lectures and one 3-hour lab session per week.  Concepts and techniques will be presented in lectures and practical exercises that apply to the concepts and techniques will be carried out in lab sessions.

## Readings
More readings will be announced in class

JavaFX

http://docs.oracle.com/javase/8/javase-clienttechnologies.htm

Collections

http://docs.oracle.com/javase/tutorial/collections/index.html

Generics

http://docs.oracle.com/javase/tutorial/extra/generics/index.html

JDBC Database Access

http://docs.oracle.com/javase/tutorial/jdbc/basics/index.html

Internationalization

http://docs.oracle.com/javase/tutorial/i18n/index.html

JODD Email

http://jodd.org/doc/email.html

JUnit 4

        http://www.vogella.com/tutorials/JUnit/article.html

Git

        Pro Git Book [http://git-scm.com/book Chapters 1-3](http://git-scm.com/book%20Chapters%201-3)



## Required

1. One 32 Gig USB 3.0 (not 2.0) flash drive.
2. An account on GitLab.com (not Github or any other service).
3. Four Gmail accounts for testing of the email application.



## Assessment of student performance

* Midterm Examination
    * Duration: 1 1/2 hours       
    *  20%  (Week 7)

* Final Examination
    * Duration: 3 hours        
    * 35% (Exam period)

* Quizzes
    * Weeks 2, 5, 8, &amp; 12
    * 10%

* Assignments
    * 10%
    * Project 25%



## Course Topics &amp; Labs

| **Lectures** | **Topic** | **Lab Work** |
| --- | --- | --- |
| **1** | **Presentation of the course project** | **The Daily Planner Project** |
| **2** | **Software Versioning and Code Revision Systems** | **Software Build System** |
|  | Discuss how programmers manage code for themselves and as part of a team.|   |
|   | Learn to use the open source Git system.| Connect to a Git repository, download code and upload code. |
| | Learn to use Maven to manage the building of Java application.| Create projects that use Maven |
| **4** | **JDBC** | |
|   | Setup and configure the MySQL RDBMS|   |
|   |- Examine the principles of interacting with a DBMS from within a program.|   |
|   |- Examine the JDBC interface and classes that support database access.|   |
|   |Implement the tasks necessary to: Connect to a database Issue an SQL statement Process the result| Implement a database for storing appointments and a contact list |
| **2** | **JUnit Testing** | |
| | **Examine how the Junit Framework supports unit testing**| |
| | **Learn to develop test cases and test suites**| **Develop a test plan and implement it** |
| **2** | **Mail** | |
|   |Review the principles of SMTP, POP, and IMAP systems.|   |
|   |Learn to use the JODD Email API to connects to SMTP and IMAP mail systems to send and retrieve emails| Implement the email portion of the project |
| **6** | **JavaFX** | |
| --- | --- | --- |
|   |
- Examine the architecture of JavaFX
  - Scene Graph
  - Java Public APIs for JavaFX Features
  - Graphics System
  - Media and Images
  - Web Component
  - CSS
  - UI Controls
  - Layout
 | Create form based user interfacesDesign the daily planner project&#39;s user interface |
|   |
- Working with the Scene Builder tool use FXML to code user interfaces and implement MVC
  - View created with FXML
  - Model implemented as a Properties Bean
  - Controller implemented in Java objects that defines the behavior of the GUI
 |   |
|   |Apply data validation to user input.| .  |
| **2** | **Internationalization and Properties** | |
|   |
- Discuss how software is designed to work in multiple languages and locales.
 |   |
|   |
- Examine the approach Java takes to support software that can dynamically change in different locales.
 | Implement internationalization in the daily planner so that it can work in both English and French |
|   |
- Examine how programs can maintain configuration information
 |   |
|   |
- Examine the Java Properties class to store and retrieve configuration data
 | Implement the daily planner configuration in a Properties file. |
| **5** | **Sequential Data Structures** | **The following lab work will make up the assignments portion of the grading scheme** |
|   |
- Review the workings of and interface for static arrays and dynamic arrays.
 | Code a dynamic array that implements a supplied interface |
|   |
- Examine the interface of a stack data structure and how it is implemented using a sequence data structure
 | Code a stack that implements a supplied interface such that it could use the dynamic array or linked list created in the previous labs |
|   |
- Examine the interface of a queue and deque data structures and how they are implemented using a sequence data structure
 | Code a deque that implements a supplied interface such that it could use the dynamic array or linked list created in the previous labs |
|   |
- Examine the workings of and interface for a linked list data structure
 | Code a linked list that implements a supplied interface |
|   |
- Examine the Java Collections classes and interfaces for sequential data structures.
 |   |
| **3** | **Non-sequential data structures** | |
|   |
- Examine the Java Collections classes and interfaces for non-sequential or unordered data structures such as sets and maps.
 |   |
|   |
- Compare the performance of the various collections classes to determine the best choice for an algorithm.
 |   |


## Lab Activities

### Project

#### During the first 9 weeks of the term you will work individually on a project that will demonstrate your achievement of the appropriate objectives in this course. The project will be broken into four phases.

#### For Fall 2017 the project will be an Daily Planner program. The four phases of this project will be:

#### 1)        Design, implement, and unit test the database business and data classes

####         Due on September 18 10:00 AM

#### 2)        Design and implement the email business and data classes.

####         Due on September 25 10:00 AM

#### 3)        Design and implement a graphical user interface

####         Due on October 16 10:00 AM

#### 4)        Deliver the finished application.

####         Due on October 30 10:00 AM

#### Phases 1 must include unit tests. These tests will remain a part of the project till the end.

#### The project will be completed by October 10, 2017 or sooner. **There will be no extension.** Each phase is worth 25% of the total project mark. If one of the first three phases fails to meet the project requirements it may be resubmitted and a new grade not exceeding 80% of that phase&#39;s grade may be assigned. Failure to successfully complete any phase by October 30, 2017 will result in a maximum final project grade of 7/25 and a failure in the course.

#### **Individual Labs**

#### During the last 6 weeks of the course you will complete a series of assignments on the topic of data structures that will demonstrate your achievement of the appropriate objectives.

## Program rules and regulations

## For 420 career program courses, students must receive at least 50% on the assignment component and at least 60% on the examination component in order to obtain a passing grade for the course. Failure to do so will result in a maximum grade of 50 (the lower of 50 or the grade earned). For the purpose of this rule, quizzes are considered exams.**

Assignments are due at the due date specified by the instructor. Assignments received after this time are late. Assignments will not be accepted after due date set by instructor. In exceptional circumstances, such as illness, etc. labs submitted late will be graded provided that the student has received an extension from the instructor in advance.

Each student must submit their own individual answers to assignments, and shared solutions are not acceptable. Students must protect their work from being easily copied by others by introducing uniqueness into their work in the choice of images used, the display styles used in the presentation of documents, the originality of the written descriptive passages, and by placing digital signatures on their original images.

Students are reminded that they are responsible for all material presented in the lecture and during the lab, and are expected to obtain material they have missed.

Students must follow exactly the instructions in the lab exercises about how and where to store all computer files in order for their work to be accepted and properly evaluated.

_&quot;This course outline has been prepared in conformity with the_ **Institutional Student Evaluation Policy (I.S.E.P.)**_. The &quot;policy is designed to promote equitable and effective evaluation of student learning&quot; and is_ **therefore a crucial policy for you to read and understand** _. The policy describes the rights and obligations of students, faculty, departments, programs, and the College administration with regard to evaluation in all your courses._ **I.S.E.P.** _is published in the College Calendar and reference copies are available in the Library and in the offices of program chairs and the Dean of Social Science &amp; Business Technologies&quot;._

## DAWSON COLLEGE**

## COMPUTER SCIENCE DEPARTMENT**

## POLICIES**



## 1.        ACADEMIC INTEGRITY**

The Computer Science Department adheres to the Dawson College Academic Conduct policy. Students have an obligation to inform themselves of all aspects of this policy. According to ISEP, the teacher is required to report to the Sector Dean all cases of cheating and plagiarism affecting a student&#39;s grade. (ISEP Section IV-C) Students may appeal any decision of the teacher regarding cheating and plagiarism according to the methods established by the College. The penalty for cheating or plagiarism may range from a zero on the work to a failure in the course.

## 2.        ATTENDANCE AND LATENESS**

Students are responsible for all material covered in classes and labs, whether or not they are present. Students have an obligation to arrive on time and to remain for the duration of scheduled classes, labs and activities. Students who disregard this obligation may be asked to leave the class, lab or activity. Students should refer to the Institutional Student Evaluation Policy (ISEP Section III-C) regarding attendance.

## 3.        RELIGIOUS HOLIDAY OBSERVANCE**

Class period(s) may be cancelled in order that the teacher can observe religious holidays. Any material missed as a result, will be made up during labs, class periods and alternate tutorial sessions.

Students, who intend to observe religious holidays, must inform their teachers in writing as prescribed in the ISEP Policy on Religious Observances (ISEP Section III-D) Students absent from classes because of observance of religious holidays will not be penalized. It must be emphasized, however, that this College policy should not be interpreted to mean that a student can receive credit for work not performed. It is the student&#39;s responsibility to fulfill the requirements of the alternative arrangement.

## 4.        SOFTWARE**

The Computer Science Department forbids the use of the computer labs it uses to make any copies of any software without the explicit authorization of the Department. Apart from any legal action that might arise from such unauthorized copying, the Computer Science Department reserves the right to discipline any student involved in such activity.

Students who borrow software from the College and fail to return it will be placed on the defaulter list and be subject to the appropriate penalties.

Viruses are programs that attach themselves to a computer system without the permission of those to whom the system belongs. They are deliberately written to be, at worst, harmful (e.g. destroying the contents of disks) and, at best, bothersome (e.g. disturbing the image shown on the screen). They can cause serious losses of time and effort for students, staff and faculty. Any student involved in the deliberate spreading of viruses is subject to the most severe penalties prescribed by College regulations, apart from any legal action that might arise from such acts.

## 5.        LITERACY**

The Computer Science Department recognizes that literacy in all its forms (read, written, spoken) is essential to our students in their careers.

Teachers may choose to incorporate a literacy component into the marking scheme for any piece of work. Teachers may use their discretion to insist that any piece of work submitted for credit is revised by the student if it is unsatisfactory with regard to literacy.

Teachers will inform all students in their courses of this policy at the beginning of each semester either by including it in the course description or otherwise.

## 6.        CELL PHONES**

The use of cell phones in all Computer Science lectures, labs and exams is prohibited.

## 7.        PORTABLE COMPUTERS**

The use of portable computers in all Computer Science lectures for purposes other than note-taking is prohibited.

## 8.        STUDENT CONDUCT**

Everyone has the right to a safe and non-violent environment. Students are obliged to conduct themselves as stated in the Student Code of Conduct and in the ISEP section on the roles and responsibilities of students. (ISEP section II-D)

## 9.        INTENSIVE COURSE CONFLICTS**

If a student is attending an intensive course, the student must inform the teacher, within the first two weeks of class, of the specific dates of any anticipated absences.

## 10.        ISEP**

The Institutional Student Evaluation Policy (ISEP) is designed to promote equitable and effective evaluation of student learning and is therefore a crucial policy to read and understand. The policy describes the rights and obligations of students, faculty, departments, programs, and the College administration with regard to evaluation in all your courses, including grade reviews and resolution of academic grievance. The ISEP is available on the Dawson website.