The second phase consists of using the backend you have created for the PHP project.  Jaya gave you an [API specification](https://github.com/dawsonCS-524PHP/FriendFinderStartDocs/tree/master/apis) for the PHP project.   You will use an AsyncTask and the HTTP* classes to consume data via this RESTful API as follows:

For the new “buttons” you can add a button at the bottom of the UI or add it to the menu

**What you click on “button”  -> Code response, action**

## New

### Find Friends
`FindFriends` -> `AdapterView` showing all friends, data retrieved via the API

- [ ] `onItemClick` find where the friend is at this time (or “Unknown Whereabouts”)  retrieve data via the API 
- [ ] Display all information returned by the API
- [ ] This can be two separate Activities / Fragments  or all in one, design is up to you 

### Whos Free
`WhosFree` -> find friends on a break 

- [ ] Display input fields for
- [ ] Day (Monday to Friday)  Radio, spinner or …
- [ ] Start time 
- [ ] End time
- [ ] A find button should invoke the appropriate API
- [ ] Display all friends available in an `AdapterView` or pop up a dialog saying “no one available”   
- [ ] The onItemClick will invoke an email intent `subject: <appname>`  
- [ ] This can be two separate Activities / Fragments  or all in one, design is up to you 


## Mods to Phase 1 spec changes in bold

Note this is not the full info, see Phase 1 for the rest of the spec 

### Class Cancelation
Class Cancelation-> CanceledActivity using the RSS feed from https://www.dawsoncollege.qc.ca/registrar/online-services/class-cancellations/

* CanceledActivity is an Activity/Fragment to display the canceled classes from the feed.
    * AdapterView onItemClick remains as specified
    * **Add onItemLongClick it will invoke a search for friends in this course  using the data from the API**
    * **Display all friends in this course in an `AdapterView` or pop up a dialog saying “no one available”   The `onItemClick` will invoke an email intent `subject: <appname>`**