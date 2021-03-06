!!! warning
    🚧 Under Construction

Contents
========

[1 Introduction 1](#_Toc490142353)

[1.1 System Overview 1](#_Toc490142354)

[1.2 Design Map 1](#design-map)

[1.3 Definitions and Acronyms 1](#_Toc490142356)

[1.4 Gmail Requirements 1](#gmail-requirements)

[2 Considerations 2](#considerations)

[2.1 Assumptions 2](#_Toc490142359)

[2.2 Constraints 2](#_Toc490142360)

[2.3 System Environment 2](#system-environment)

[2.4 Repository and Naming 2](#repository-and-naming)

[2.4.1 GitLab Account Name 2](#gitlab-account-name)

[2.4.2 Java Project Name 3](#java-project-name)

[2.4.3 GitLab Repository Name 3](#gitlab-repository-name)

[3 High Level Design 4](#_Toc490142366)

[3.1 Configuration Module 4](#configuration-module)

[3.2 Database Module 4](#database-module)

[3.3 Appointment Module 4](#appointment-module)

[3.4 Reminder Module 4](#reminder-module)

[3.5 Help Module 4](#help-module)

[3.6 Master GUI Module 4](#master-gui-module)

[4 Low Level Design 5](#low-level-design)

[4.1 Configuration Module 5](#configuration-module-1)

[4.1.1 Database 5](#database)

[4.1.2 Email 5](#email)

[4.1.3 Appointment Group 5](#appointment-group)

[4.2 Database Module 5](#database-module-1)

[4.2.1 Email 5](#email-1)

[4.2.2 Appointment Group 6](#appointment-group-1)

[4.2.3 Appointments 6](#appointments)

[4.3 Appointment Module 6](#appointment-module-1)

[4.3.1 Monthly View 6](#monthly-view)

[4.3.2 Weekly View 6](#weekly-view)

[4.3.3 Daily View 6](#daily-view)

[4.3.4 Appointment Dialog 6](#appointment-dialog)

[4.3.5 Search Dialog 6](#search-dialog)

[4.4 Reminder Module 7](#reminder-module-1)

[4.4.1 Timers 7](#timers)

[4.5 Help Module 7](#help-module-1)

[4.6 Master GUI Module 7](#master-gui-module-1)

[4.6.1 Menu 7](#menu)

[File 7](#file)

[View 7](#view)

[Help 7](#help)

[4.6.2 Toolbar 8](#toolbar)

[5 Data Structures 9](#data-structures)

[5.1 DBMS Settings 9](#dbms-settings)

[5.2 SMTP Settings 9](#smtp-settings)

[5.3 Appointment Group Record 9](#appointment-group-record)

[5.4 Appointment Record 10](#appointment-record)

[5.5 Help Records 10](#help-records)

## <span id="_Toc517668538" class="anchor"><span id="_Toc490142353" class="anchor"></span></span>Introduction

The purpose of this project is to develop your individual skills as a
Java application developer. The application described in this document
is designed to have you apply what you have already learned in the
Computer Science Technology Program and what you are continuing to learn
this semester. This is an individual student project in which you will
work alone.

## <span id="_Toc517668539" class="anchor"><span id="_Toc490142354" class="anchor"></span></span>System Overview
-------------------------------------------------------------------------------------------------------------

<span id="_Toc517251108" class="anchor"></span>The program that is
described in this document is called the Java Agenda Manager or JAM for
short. Its use case is to provide an interactive application in which
appointments can be stored and reviewed along with reminders of upcoming
events. It will be written in the Java language and it is meant to be
portable across all platforms that support Java

Design Map
----------

Within this document you will find the features, specifications, and
design of the JAM. The final product that you develop is required
respect this document. While you may add additional features, you are
expected to deliver the feature set described here. The following
sections of this document will describe the features, organization and
GUI design of the system.

## <span id="_Toc517251109" class="anchor"><span id="_Toc517668543" class="anchor"><span id="_Toc490142356" class="anchor"></span></span></span>Definitions and Acronyms
---------------------------------------------------------------------------------------------------------------------------------------------------------------------

<span id="_Toc517668545" class="anchor"></span>**Appointment**

> An event that the user of the program wishes to record and then be
> reminded of prior to its scheduled time.

**Monthly Calendar**

> The presentation of all the days in each month with an ordered list of
> any appointments presented for the specific day.

**Weekly Calendar**

> The presentation of the days in each week that shows the time
> intervals for the day and displays appointments at their specific day
> and time.

**Daily Calendar**

> The presentation of a single day that shows the time intervals for the
> day and displays appointments at their specific time.

**Reminder**

> A visual and audible alarm generated by the program to remind the user
> of an upcoming appointment. In addition, an email is sent to the user
> as a further reminder.

<span id="_Toc459373803" class="anchor"></span>**Appointment Group**

> Appointments can be grouped. A group displays a background color in
> the display.

Gmail Requirements
------------------

You will need to create one Gmail account. This is the account thru
which you will be sending reminders.

1.  Considerations
    ==============

    1.  <span id="_Toc517668546" class="anchor"><span id="_Toc490142359" class="anchor"></span></span>Assumptions
        ---------------------------------------------------------------------------------------------------------

The program will be written using the standard features of the Java
language. Only third party open source libraries approved by your
instructor may be used. JUnit testing must be employed for all JDBC code
you write.

<span id="_Toc517668547" class="anchor"><span id="_Toc490142360" class="anchor"></span></span>Constraints
---------------------------------------------------------------------------------------------------------

<span id="_Toc517668550" class="anchor"></span>The primary constraint is
that the system must be completed by the end of week eight. You must
look for simplicity rather than complexity. Features not explicitly in
this document and not mentioned in class should be avoided unless they
are recognized as critical to the operation of the program. Such changes
must be submitted to your instructor for approval.

System Environment
------------------

<span id="_Toc517668552" class="anchor"><span id="_Toc517668549"
class="anchor"></span></span>The programming language will be Java
version 1.8 and the GUI will be JavaFX. You may use NetBeans or Eclipse
for your IDE. NetBeans is preferred.

The JAM will depend on an external DBMS for its appointment and contact
store. The DBMS will be MySQL.

The JAM is not dependent on any specific operating system. It should be
able to run on any computer that supports Java. To be able to use the
Waldo2 database server the computer must be connected to the Internet.

Repository and Naming
---------------------

Projects must be stored in a Git repository. You are required to use a
private repository on GitLab (gitlab.com). GitLab provides any developer
with a private repository. When you create your repository you must
grant the GitLab user “omniprof” developer status. You may not use any
other repository in this course. The naming rules are mandatory.

### GitLab Account Name

Your GitLab account must be named **JAM\_Student Name**. Use your name
as it appears on college records. For example, if your name is Betty
Smith then you must create an account named:

**JAM\_BettySmith**

You may leave out any middle names.

### Java Project Name

When you create your project in the IDE it must be named **JAM\_Student
ID\_Version**. For example:

**JAM\_9999999\_1**

If you must create a new project, for whatever reason, then use the same
name with a different version number:

**JAM\_9999999\_2**

### GitLab Repository Name

The repository that you create for your projects must have the same name
as your Java project in the IDE. This means that when I need to retrieve
your code from GitLab the URL will look like:

**https://gitlab.com/JAM\_BettySmith/JAM\_9999999\_1**

## <span id="_Toc517668560" class="anchor"><span id="_Toc490142366" class="anchor"></span></span>High Level Design
===============================================================================================================

The overall design of the program will consist of modules that manage
the different features and functions of the program.

Configuration Module
--------------------

This module is responsible for recording and storing information that
affects the operation of the program. There will be GUI components in
this module.

Database Module
---------------

This module is responsible for interacting with the DBMS on behalf of
all other modules. It will provide specific services to meet the needs
of other modules. There will not be any GUI components in this module.

Unit testing of this module is required.

Appointment Module
------------------

This module is responsible for the user interface for managing and
displaying appointments. There will be GUI components in this module.

Reminder Module
---------------

This module is responsible for generating alarms prior to an
appointment. There will not be any GUI components in this module.

Help Module
-----------

This module is responsible for displaying help screens. There will be
GUI components in this module.

Master GUI Module
-----------------

This module is responsible for the main application window, menus, and
toolbars. There will be GUI components in this module.

1.  Low Level Design
    ================

    1.  Configuration Module
        --------------------

This module will handle the data that configures the program. There are
three categories of configuration data. These are database, email and
appointment group. Each category will require a GUI interface for input
and editing.

When the program is run for the very first time this module executes
automatically. This module can be accessed by the user at any time to
make changes to the configuration.

### Database

The program must have a MySQL database account ready to use. You can
create a local account on your computer or use an account on a
department server. This information will be stored in a properties file
using the Properties API in Java. Properties files are plain text files.
See section 5.1 for the data that must be stored. You will need a popup
dialog to enter or edit this data.

### Email

The program, when running, will send an email to the program’s user at a
preset interval before an appointment. You will require an email account
on Gmail for this purpose. The necessary information will be stored in a
table in the database. You will need a popup dialog to enter or edit
this data.

### Appointment Group

An appointment group supports the concept of grouping appointments such
as work appointments and personal appointments. The group determines the
background colour of an appointment in the display. You must have five
default groups with colors already assigned to them. You will need a
popup dialog to enter or edit this data.

Database Module
---------------

This module will manage the records for all modules. There should be a
class for each data table. It will create the required tables for the
database the first time the program is run. Then it will add or retrieve
records based on requests from the other modules. Each of these modules
must have unit tests that demonstrate that the code functions as
required.

### Email 

This module will be responsible for retrieving, inserting, updating or
deleting records for the Email configuration.

### Appointment Group

This module will be responsible for retrieving, inserting, updating or
deleting records for the Appointment Group configuration.

### Appointments

This module will be responsible for retrieving, inserting, updating or
deleting appointment records. There will need to be several retrieval
routines to match the various views. In addition, several search
routines will be required based on various criteria.

Appointment Module
------------------

This module will be responsible for the user interface for inputting
appointments and displaying appointments. It will consist of the
following:

### Monthly View

This will display a full month in a grid 6 rows by 7 columns. Titles of
appointment will appear as a list in the day. In this display you will
be able to change months. Double clicking on a given day in a month will
bring up the Daily View.

### Weekly View

This will display a full week. It should consist of 7 daily views.
Double clicking on a given day in a week will bring up the Daily View.

### Daily View

The daily view consists of a grid 2 x 48. The first column is the time
and the second column will hold the appointment. There are 48 rows to
represent every half hour in a day. Double clicking on anywhere in this
view will bring up the Appointment Dialog. If the double click is on an
existing appointment then this is what will appear in the dialog.
Otherwise a dialog without an appointment will appear.

### Appointment Dialog

This is a popup dialog that supports adding, editing or deleting an
appointment. It will contain fields from the appointment data structure.
There needs to be a button to save an appointment and a button to delete
an appointment. If the dialog contains an existing appointment, then
save will update the record otherwise a new record will be created.

### Search Dialog

This is a popup dialog that supports searching for appointments by their
title or description. The results of this search will be a list of
matching appointments. Double clicking on an appointment on this list
will display the Appointment Dialog with the selected appointment.

Reminder Module
---------------

This module will use timer events to generate alarms and reminders.
Whenever the program is executed it will retrieve all future events and
start timer processes. When a timer process comes due the module will
generate a visual and audible alarm.

### Timers

When the program is loaded, this module will retrieve all the current
day’s appointments and create a timer event or thread for it. The
thread, when its time is reached, will generate an audible and visual
reminder as well as sending an email. Appointment records contain the
interval between an appointment and when a reminder must be issued.

A special event is created to go off at midnight. If the program remains
running continuously then at midnight it will retrieve the next day’s
appointments.

Help Module
-----------

This module will present the user with a list of the different tasks
that the program performs. Selecting a task will lead to a description
of what this task is and how it is used. These descriptions will be
formatted using HTML and stored in individual files in the project.

Master GUI Module
-----------------

This module will act as the application manager. It will present all the
various views of the program and receive user commands. The commands may
come either from a menu or a toolbar. The menus and toolbars will be
dynamic. This means that the choices presented to the user may change
depending on the current view.

### Menu

The program main menu must contain the following:

#### File

> Configuration
>
> New Appointment
>
> Exit

#### View

> Monthly
>
> Weekly
>
> Daily

#### Help

> Help Contents
>
> About

Additional menu items may be added as needed.

### Toolbar

The toolbar must consist of the following items.

-   ######### Configuration

-   ######### New Appointment

-   ######### Monthly

-   ######### Weekly

-   ######### Daily

-   ######### Help Contents

Images must be used in the toolbar.

1.  Data Structures
    ===============

    1.  DBMS Settings
        -------------

Stored in a properties file

-   The URL of the MySQL database

-   The database name

-   The port of the MySQL database (default 3306)

-   The user name for the MySQL database

-   The password for the MySQL database

    1.  SMTP Settings
        -------------

Stored in the DBMS

-   The user’s name

-   The user’s email address which is also the log in name for Gmail

-   The user’s Gmail password

-   The URL of the SMTP server

-   The SMTP port number (default 465)

    1.  Appointment Group Record
        ------------------------

Stored in the DBMS

-   Group Number – int

-   Group Name – String

-   Colour - RGB color specified with an HTML or CSS attribute String

    1.  Appointment Record
        ------------------

Stored in the DBMS

-   Title - String

-   Location - String

-   Start Time - Temporal

-   End Time - Temporal

-   Details - String

-   Whole Day – boolean

-   Appointment Group – int

-   Reminder Interval - int

-   Alarm Reminder Requested – Boolean

    1.  Help Records
        ------------

Help information is text formatted with HTML. Each topic in the help
list is matched to a specific HTML file.