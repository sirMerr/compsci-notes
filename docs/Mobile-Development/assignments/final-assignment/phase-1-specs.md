# Final Project UI

[UI Layout here](https://docs.google.com/document/d/1798zfzO8b8HyDU8W9JhCWh0hHxdPdlgatL-ZMEKgjoo/edit)

## For all UIs
Some of the UIs in the assignments were not visually appealing:  too small fonts with respect to the other views,  not spanning the page properly, ugly interfaces.  Not everyone has an eye for design but be sure to spend some time on design and images. Be sure to test on at least 1 small screen (phone AVD) and 1 large screen (your tablet.)  ==UIs created without any effort at UX design will cost you marks.==

## What you click on -> Code response, action

```
Menu -> About,  Dawson, Settings 
About -> Launches About Activity
Dawson -> Launches Dawson Computer Science web page
Settings -> Launches Settings Activity 
```

## About Activity show the App Credits
- [ ] Paragraph describing the app, format the text in a non black colour and with a largish font “Dawson College”  Course Id, 
- [ ] Authors names, mages of each or all of you together. 
- [ ] onclick Course Id -> Launches Dawson Computer Science web page
- [ ] onclick Your name or image -> a Dialogue with a blurb about you.  Grad Dawson CS 2017 etc

## Settings Activity show any settings saved for the app
- [ ] First and last name, 
- [ ] email address, 
- [ ] password and 
- [ ] date stamp (when created or 
modified) and any others you deem necessary. 
- [ ] If changes are made update the date 
stamp.
- [ ] Implement a save button, if back is pressed launch a dialogue to confirm 
discard.

## Dawson Image Click
- [ ] Launches Dawson Computer Science web page  

## Logo Image Click
- [ ] Launches `About Activity`

## Class Cancelation
`CanceledActivity` using the RSS feed from https://www.dawsoncollege.qc.ca/registrar/online-services/class-cancellations/

* `CanceledActivity` is an `Activity`/`Fragment` to display the canceled classes from the feed.
    - [ ] widgets as needed, use an `AdapterView` to show the course+section number.
    - [ ] `AdapterView` `onItemClick` show all of the information for this course> `ShowCancelActivity`
* `ShowCancelActivity` is an `Activity`/`Fragment` to display the full information from the RSS feed for the item selected.
    - [ ] Implement a button or click on the teacher name  to display Teacher Contact info (same fragment `asTeacherContactActivity`)

## Find Teachers
`FindTeacherActivity` (use `Fragments`)
(you are given a [phone json file](https://drive.google.com/file/d/1uZLChYxp3YN2u3QlTXtogjC52lMtAR_v/view?usp=sharing), you must import it into firebase to create a database and use it here)

- [ ] `FindTeacherActivty` an `Activity`/`Fragment` lookup the teacher in the phone directory.   ==(use first and last name)==
    - [ ] Widgets as needed for search fields of first name and last name.
    - [ ] Validate that at least one is set for the search. 
    - [ ] search button to launch the search
    - [ ] a radio button for like/exact search (use appropriate searches)
    - [ ] Results only show after the search 
    - [ ] `>1` result `ChooseTeacherActivity` `Activity`/`Fragment`
    - [ ] `==1` result `TeacherContactActivity` `Activity`/`Fragment`
- [ ] `ChooseTeacherActivity` Display list of teacher’s retrieved in the search previous
    - [ ] `ListView` (or other `AdapterView`) to show the teacher first & last names
    - [ ] `onItemClick` > `TeacherContactActivity`
- [ ] `TeacherContactActivity`  display all information from the firebase database for this teacher
    - [ ] The fragment will be used in two places 
    - [ ] Widgets as needed for all fields
    - [ ] onClick for email address launches an implicit intent for email `subject:  "from <yourappname>"`
    - [ ] `onClick` for local launches an implicit intent to make a phonecall `tel://number,local`
	See https://developer.android.com/guide/components/intents-common.html

## School Notes
### NotesActivity 
Show existing or add new notes from the sqlite db `Activity`/`Fragment`.  

- [ ] widgets for new notes input and a button to add a note
- [ ] Use an AdapterView to show the first few chars of the notes in the db.
- [ ] onItemClick will launch ItemNoteActivity to display the whole note

### ItemNoteActivity  
Display a single note from the notes db

- [ ] Widget with large text to display the notes (you may need a ScrollView)
- [ ] You may want to do this tutorial and incorporate some of the code 

https://www.sitepoint.com/starting-android-development-creating-todo-app/

## Add To Calendar
### CalendarActivity
Activity/Fragment add an event to the calendar

- [ ] widgets as needed for date, start time, end time & event
- [ ] Add the event to the default calendar 

https://developer.android.com/guide/topics/providers/calendar-provider.html

- [ ] (optional: create a Dawson calendar)

## Academic Calendar
Load the url for the academic calendar in a `WebView`.

- [ ] By default load the current term (fall 2017) have 
- [ ] widgets to allow for entering the year and a  radio button for fall/winter and a Button.  
- [ ] Change the widget in the `WebView`  when the button is hit.

## Current Temperature
(text, not clickable)  display the current temperature.

- [ ] You will use the Location Manager to obtain the device’s current latitude and longitude. (and a LocationListener to keep it up to date) This is a pretty good tutorial  http://www.androidhive.info/2012/07/android-gps-location-manager-tutorial/
- [ ] Google is pushing towards using Google Play services to obtain this information but getting the information directly from GPS is preferrable to having everything tracked by
- [ ] Google and required for this assignment.
- [ ] You will need to make sure & check that GPS is on at least for your app `Settings” > “Location Access” > “Access my location”`
- [ ] Use the openweather api + lat/long to get the current temperature in centigrade.  
- [ ] Format it in a large text & display the temperature in centigrade.

https://openweathermap.org/current

## Choose either Weather or Messaging

### Weather
Weather Activity

- [ ] Have a widget to input the city & use a spinner for the ISO 3166  country codes 
    - [ ] Default to Montreal,CA
- [ ] Have a button to display the UV index and the 5 day forecast 
    - [ ] This can be in the same Activity/Fragment or launch a new one

https://openweathermap.org/forecast5
https://openweathermap.org/api/uvi

### Messages
!!!warning 
    This option is much more advanced and time consuming than the weather option.  It is an extra challenge.  Consult with me before taking it on.
- [ ] You will implement Firebase Cloud Messaging
    - [ ] In the app to recieve notifications
    
        https://firebase.google.com/docs/cloud-messaging/android/client

    - [ ] On the firebase console to send notifications

https://firebase.google.com/docs/cloud-messaging/	

https://github.com/firebase/quickstart-android/tree/master/messaging
