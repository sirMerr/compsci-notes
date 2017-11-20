# Dawson Student Friend Finder #
---
420-524-DW Project 3 <br/>
Fall 2017 <br/>

---

In this project, your team of 3 or 4 will build a Laravel website hosted
on Heroku that functions as a friend finder based on common breaks.

**Functionality**

-   All functionality is only available to authenticated users

-   The home (index) page shows the users which courses they have
    chosen, and their confirmed friends (paginated). Indicate if there
    are pending received friend requests.

-   In addition, there are links to pages:

    -   that manage friends: page(s) that show all the user’s friends
        with a status (confirmed friends, friend request sent, friend
        request received). It allows searching for new friends and
        allows the user to send a friend request, accept or reject
        received friend requests, and to unfriend friends.

    -   that manage courses: these page(s) allow searching for courses
        and allow the user to register for a new course / drop an
        existing course

    -   that find confirmed friends with matching free break times
        between 10 am and 5 pm

-   When a new user registers, they must provide basic information such
    as first name, last name, email address (used as the key), password,
    program (e.g., Social Science - Commerce profile) and anything else
    you feel is necessary/helpful.

-   The friends’ management page(s) allow logged in users to search for
    new friends based on keyword search within the users’ name. Display
    the matching users in paginated pages. Show only the users’ first
    and last name and program.

-   The friends’ management page(s) show all the friends, with their
    status (confirmed, request sent, request received). If the user
    accepts a received friend request, change the status to confirmed.
    If the user deletes any friend (regardless of status), delete the
    entry from the database. NOTE: the “rejected” friend is not
    necessarily notified. You can add a “notification” feature if time
    permits, but it is optional.

-   The course management page(s) allow logged in users to see the
    courses for which they have registered. The user can delete a course
    (i.e., drop a course). They can also search for other courses (based
    on keywords found in the course number, title or teacher. They can
    register for a new course (not the ones for which they are already
    registered)

-   The free break page allows the user to find confirmed friends with
    breaks at the same time as the selected entry (day, start and end
    time).

-   JSON web API: the web API responds to http queries from the Android
    application with JSON messages, detailed at [GitHub
    site](https://github.com/dawsonCS-524PHP/FriendFinderStartDocs).

Your final project must be pushed onto Heroku. I will mark the master
branch of your team’s GitHub repository. If anyone commits late, I will
treat the project as late, so be careful!

**Grading**

Part of your grade will reflect how you are able to organize your work
and advance during the time that has been allocated. To that end, I have
created teams and private repositories on GitHub, and large portion of
your individual grade will be based on your commits and commit messages.
Procrastinators will be penalized, regardless of the final result.
Please be prepared to attend your scheduled lab session for spot checks.

There will be combined demonstrations on the last Monday of the semester
(during the common lab period with the Android course). These demos are
scheduled before the final project due date. This means that:

-   you may still be missing some functionality (but not a lot) which is
    “hardcoded”.

-   you may not be styled yet.

-   you must be prepared to explain what is remaining

**Details**

For local testing the labs’ etc/hosts file and your Homestead.yaml file
are set up for the URL dawson.app going to a Laravel project dawson in
your Code directory.

The course list is available at FakeTeachersListW2017.csv at
[GitHub](https://github.com/dawsonCS-524PHP/FriendFinderStartDocs). The
teachers’ names have been replaced by [random
names](http://listofrandomnames.com/). You will write a seeder that
reads the csv file and populates a table with all the possible courses.
Create a folder called csv in your database folder and place the csv
file there. Within your seed class, uses the
[helper](https://laravel.com/docs/5.5/helpers) method database\_path to
refer to the file. You may find other helper methods that you find
useful Notice that the file has a header row which you should ignore.
The course and section together indicate a class, and there may be
multiple records per class based on the number of times/week that it
meets. Day is encoded 1 to 5 (Monday to Friday).

The file contains over 3500 lines. When students are registering their
classes, you cannot show a select menu with so many options. So think
about your user interface.

Read through the
[Eloquent](https://laravel.com/docs/5.5/eloquent-relationships)
documentation when building the relationships in the model, in
particular the One-to-Many and One-to-Many (inverse). You may need to
use the two or three parameter method overloads depending on how you
have named the primary and foreign keys.

For example, to know who is free Monday from 1130 to 1400, you have to
iterate through all the friends, checking if they are free. To determine
if someone is free between a given start and end time, you need to look
at their courses for that day, ordered by start time. If the start time
of their first course is strictly greater than the start time of your
break then they are free. If the end time of a course is strictly less
that the start time of the friend’s next course and strictly less than
the end time of the break and greater than or equal to the start time of
a break, then they are free. It doesn’t matter if the overlap is only 30
minutes.

Recall that you can pass any associative array as data for your [view to
display](https://laravel.com/docs/5.5/views#passing-data-to-views).
Consider what you need to show with every action, how you can query to
get the results, and how you can show the data. I very strongly
recommend that you use Bootstrap correctly such that you have a
responsive web site.

The Web API used by your Android program is detailed in the [GitHub
site](https://github.com/dawsonCS-524PHP/FriendFinderStartDocs). It must
support the following requests.

-   read request (GET) to get friends on break at given day time
    start/end

-   read request (GET) to retrieve where a friend is at given day time
    (course name and section, or free)

-   read request (GET) to retrieve friends in a given class

-   read request (GET) to retrieve all friends

**OVER-ACHIEVERS!! Add extra features to your web site!**

Do you want to rant about how much you hate this project? Why don’t you
implement a rate-my-teacher feature, where users can rate the teachers
of the courses for which they are registered. (hahaha, I had to change
all the teachers names though, so you won’t find me)

Want to be the next Zuckerberg? (Tricia and I will be the Winklevoss
twins): add a post and comment feature, such that you can see the posts
of your friends and comment on them.