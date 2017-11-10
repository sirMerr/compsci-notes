# Android Content Providers using built in

## REST
* REpresentational State Transfer (REST)
* Typing a URL and getting a web page
* Changing the state of a web server by filling a form and submitting it
* Consists of clients and servers
* Clients initiate requests
* Servers process requests and return appropriate responses
* Requests and responses are built around the transfer of representations of resources

## REST principles
Clients are separated from servers by a uniform interface

* **Clients need not worry about how data is stored on servers**

    * portable client code

* **Servers need not worry about the user interface** 
    * improves server scalability and makes servers simpler
* **Stateless**
* **Layered system**
    * A client cannot ordinarily tell whether it is connected directly to the end server, or to an intermediary along the way
    * Hence allows for load balancing and shared caches

* **Uniform Interface**
    - Simplifies and decouples the architecture
    - Enables the client and the server sides to evolve independently

## Android Processes
Each of the .db's are sandboxed in their own application. These dbs can NOT be accessed outside their application context. 

<img src="https://lh6.googleusercontent.com/dG_qzpbXrB7Hu3meJIgmQP8r1a_W8da4JpcFpR6WKWYRKQDBHj353ZnQ3vEUWod3MuDZxH9dR4AuLerjSBlM=w1462-h1472-rw">

To access or to expose the data in the db, you must use a Content Provider

<img src="https://lh6.googleusercontent.com/4jaT9Zyqo0O8OusINgMWEBuoEsrubAQQZArWm2suIagpXR8UbNJ-0D41sTmJHFhQ75ErTBkNq3HzajfG7Ha8=w1462-h1472">

## Android Content Providers

* A way of sharing data across apps
  Abstracting data into service
* This idea of content providers makes data sources look like REST-enabled data providers such as web sites
* A content provider is a wrapper around data
* Content providers supply CRUD methods as needed via URIs
* A SQLite database on an Android device is an example of a data source that you can encapsulate into a content provider
* Android also has several built-in content providers that encapsulate databases
* Content providers play a significant role in sharing data between applications
* The content providers’ responsibility is to provide an encapsulation mechanism not a data-access mechanism
* You’ll need an actual data access mechanism such as SQLite to get to the underlying data sources

## Android's Built-in Providers
The top-level items are SQLite databases encapsulated as providers
* Contacts
* Mediastore
* Calendar
* etc.

These SQLite databases typically have an extension of `.db`

### Content Providers
<img src="https://lh6.googleusercontent.com/8XRi07rGwcF92EnmvLAPARxR2MOZBC1j6ZmhEZzrdnfYXv4Zxi46ntM01AIh49l1XbSjrkPgjMReSBSSlwrN=w1462-h1472-rw" style="max-height:300px">

* A system to access shared data
* Similar to a REST web service
* To each Content Provider, one or more URIs are assigned in the form:

```java
content://<authority>/path
```

* Contacts <img src="https://lh6.googleusercontent.com/tvv1ggb6la6whFAb7Yd3r_hXJokwYVeoEHBM_BuX3ORv5_6JHv323KFpb5-mRw0JjWXtiQH60zGoCFdvcgEs=w1462-h1472" style="max-height:300px; float:right">
    * People
    * Phones
    * Photos
      <br>

http://developer.android.com/guide/topics/providers/contacts-provider.html
<br><br>


### Contacts Content Provider Permissions

Required to use the Contacts content provider. In the manifest

#### Read

```xml
<uses-permission android:name="android.permission.READ_CONTACTS">
```

####Write

```xml
<uses-permission android:name="android.permission.WRITE_CONTACTS">
```

* Calendars <img src="https://lh5.googleusercontent.com/0L9CZZ3a0_G_zFDKpeiBV9JgFSMwUpVdsfdeUALaSKiYH8DIq3t7VWPWP_2ANYGm9JBUyMm5287ZOw9f7N2X=w1425-h1472" style="max-height:300px; float:right">
* Event
* Attendees
* Reminders

https://developer.android.com/guide/topics/providers/calendar-provider.html

<br><br>

### Calendar Content Provider Permissions

Required to use the Calendar content provider. In the manifest


#### Read 

`<uses-permission android:name="android.permission.READ_CALENDAR">`

#### Write 

`<uses-permission android:name="android.permission.WRITE_CALENDAR">`

### MediaStore
* Audio
    * Albums
    * Artists
    * Genres
    * Playlists
* Images
    * Thumbnails
* Video

New in API 19 Storage Access Framework 

http://developer.android.com/guide/topics/providers/document-provider.html

## To build your own Content Provider

* Define the DB
* Create a class that extends android.content.`ContentProvider`
* Implement `query()`, `insert()`, `update()`, `delete()`
* Register the `ContentProvider` authority in the manifest
* Expose the URIs and schema
* We will not do this, see the slide deck: diy

## To use a Content Provider (built-in or provided by others)

* Discover the exposed data (schema, URIs)
* Set the appropriate permission(s) in the manifest, for built content providers in see [here](http://developer.android.com/reference/android/Manifest.permission.html)
* Get the URI(s)
  * Usually these are declared as a public constant  inside the content provider class 
* Make a query(or other CRUD), maybe adding some where clauses
  * The query returns a Cursor 
* Navigate the Cursor

## Example: use Contacts, built-in Content Provider

* Discover the exposed [data](https://developer.android.com/reference/android/provider/ContactsContract.Contacts.html)
* Request  permission via the manifest
* Query the contacts content provider  using the URI
* Contacts information is in the Cursor

#### Contacts: manifest

Request permission:

```xml
<uses-permission android:name="android.permission.READ_CONTACTS">
```



#### Contacts: Code

```java
public void onCreate(Bundle savedInstanceState) {
  super.onCreate(savedInstanceState);
  setContentView(R.layout.main);
  // get a cursor all contacts  
  Cursor cursor = getContentResolver()
     .query(ContactsContract.Contacts.CONTENT_URI, 
              null, null, null, null); 
  // we could use the cursor with an AdapterView & adapter
  // but here we're logging only the Display Name 
  while (cursor.moveToNext()) {	
      String contactName = cursor.getString(
        cursor.getColumnIndex(
          ContactsContract.Contacts.DISPLAY_NAME
        )
      );
      Log.d(TAG, contactName);
  }   // while cursor not at end
  cursor.close();
} // onCreate()

```



## Content Providers CRUD methods

See the pdf on moodle for the query method

[Some details](https://developer.android.com/reference/android/provider/ContactsContract.Contacts.html) here see operations

[an example app in android training](https://developer.android.com/guide/topics/providers/contacts-provider.html)

## References

### General Content Providers

http://developer.android.com/guide/topics/providers/content-providers.html

### Contacts Content Provider

https://developer.android.com/guide/topics/providers/contacts-provider.html
https://developer.android.com/reference/android/provider/ContactsContract.Contacts.html

http://www.ibm.com/developerworks/webservices/library/ws-RESTservices/
