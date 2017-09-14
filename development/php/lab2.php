<?php
/**
 * Created by PhpStorm.
 * User: sirMerr
 * Date: 2017-09-11
 * Time: 1:55 PM
 */

date_default_timezone_set('UTC');
// Open and get file contents
$handle = fopen ( 'events.txt' , 'r' );

// Select the year-month first line
$dateEvent = fgets($handle, 4096); // omg magic

// Make timestamp with strtotime()
$timestamp = strtotime($dateEvent);
//echo $timestamp, "\n";

// Get the name of the month, first day of week of the first day on the month,
// and the number of days in the month using the date function.
$timestampDate = date("l, F, t",$timestamp);
//echo $timestampDate." days"."<br>";

class AgendaEvent {
    function AgendaEvent($eventDate, $activity) {
        $this->eventDate = $eventDate;
        $this->activity = $activity;
    }
}
$activities = array();
while (!feof($handle)) {
    // Assign next line
    $newTask = fgetcsv($handle, 4096, ",");

    // Assign day and task
    $dayCounter = $newTask[0];
    $taskTitle = $newTask[1];

    // Removes tabs from date
    $counterDate = preg_replace("/\s+/","",$dateEvent."-".$dayCounter);
    array_push($activities,new AgendaEvent($counterDate,$taskTitle));
}

fclose($handle);

// Display agenda
$title = date("F Y",$timestamp);

echo "<div>$title</div>";
for($i = 0; i < 6; $i++) {
    echo "<div></div>";
}