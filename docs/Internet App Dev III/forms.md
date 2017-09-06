## Http Methods

* `GET` - `url?name=value&name2=value2`
* query string
* only use for READ operations
  * search query
  * bookmark
* POST - puts the name=value&name2=value2 in http message body
* use for WRITE operation => server side state change


```html
<form action='script.php' method='post'>
  <label> Enter name:
    <input type='text'
           name='firstname'
           value='default'
    />
  </label>
  <input type='radio'
         name='age'
         value='20'
  />
  <input type='checkbox'
         name='haircolour[]'
         value='blonde'
  />
  <textarea row='5' col='20' name='comment'>
  </textarea>
</form>
```

```php
<?php
  if (!empty($.POST['firstname']))
    $firstname = $_POST['firstname'];
else {
  echo "<p class='error'>You must provide a name</p>";
  $firstname = NULL;
} // validate presence of all input
if ($firstname && $email && $numPushups !== NULL)
  echo "<p>Hello $firstname at $email</p>"
?>
```

## Sanitizing user input

Never trust user input

### htmlentities()

Turns all special characters into HTML entity format

- `htmlentities($values)`

### browserdisplays()

The characters don't interpret as HTML tags

- `scripttags($value)`
- remove all HTML tags
- fits your code:
- `$firstname = htmlentities($_POST["firstname"])`