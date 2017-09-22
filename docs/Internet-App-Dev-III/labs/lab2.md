## Arrays, php.net manual, Files

*Note*: File commands that will be helpful in the lab:

* `$file` = fopen($filename, $mode) -> mode can be 'r', 'r+', 'w', etc…
* `$line` = fgets($file) -> return a line, moves the cursor
* `$array` = fgetcsv($file) -> returns a line broken up into an array based on comma (default delimiter, you can change)
* `while (!feof($file))` -> true or false if reached EOF
* `fclose($file)` -> returns a boolean indicating success

Create an event calendar, where a php script reads in a file that contains days and events for a month, stores the contents in an associative array, and displays a calendar. Since we haven't covered user-defined functions and classes yet, you can code everything in a single php script.

I have provided you an events file. If you open it, you'll notice that the first line indicates the year and month. The subsequent lines indicate the day and the event (comma-separated).

```
// event.txt
2017-09
4, Labour day
19, Drop deadline
8, Assignment due
29, Assignment due
```



Open the file using [fopen](http://php.net/manual/en/function.fopen.php) with mode 'r' (read-only).

The first line is guaranteed - this line contains the year and month as `yyyy-mm`. Read this line using [fgets](http://php.net/manual/en/function.fgets.php) - this function returns a string representing a single line at a time. Use this string to create a Unix timestamp (using [strtotime](http://ca2.php.net/manual/en/function.strtotime.php)) and use the timestamp to determine the name of the month, first day of week of the first day on the month, and the number of days in the month using the [date](http://php.net/manual/en/function.date.php) function. 

**Hint**: `date('F Y', strtotime($line))` returns the month and year formatted, `date('N', strtotime($line))` returns 1 for Monday up to 7 for Sunday. `date('t', strtotime($line))` returns the number of days in the month.

You may have 0 or more event lines after the first date line. Each line will have the day of the month followed by a comma, then the event description. Within a while loop, as long as you are not at the end-of-file (not [feof](http://php.net/manual/en/function.feof.php) ), read through the remaining lines and populate an array with the day of month as key and event description as the value. You may prefer to use [fgetcsv](http://php.net/manual/en/function.fgetcsv.php)instead of fgets as you read each line to more easily split the key from the value.

Close the file with [fclose](http://php.net/manual/en/function.fclose.php) when you are finished reading the lines.

Once the array of events is populated, display the monthly calendar. To determine if there is an event on a given day, check if the events array with the given day as key has a value; i.e., if `(isset($events[$day])` is true, then there is a value. For the data that you have been provided, your output will resemble the following, using this styling. Of course, feel free to style it better.

**![img](https://lh5.googleusercontent.com/RXh4LiMu5LPZAOGUq5cvylgiZ-o2xImzH6nSLqIpT7ISPGKmxSEVe6EVwISINFOq4tLr9ApaxTAYLRZwjdzYv6sDv-PX7Lm-EcVLyBYD8nHcijIwZQmUkQnlomiox6CtSYLntOcWWQeyNMXLlA)**

Remember to save the php script in your `H:/PHPCode/labs/lab2` folder as `index,php` and to boot up vagrant from Homestead folder.!