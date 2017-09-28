<?php
/**
 * Created by PhpStorm.
 * User: sirMerr
 * Date: 2017-09-18
 * Time: 2:05 PM
 *
 * Create a registration form for a random website, and a php script where
 * it is submitted (2 separate scripts). You will probably also want a third
 * script that contains the common arrays to be included by both the form and
 * the submit script.
 *
 */
// Default variables
$name = "";
$male = true;
$interests = [];
$countries = [];
$country = "";

// Get countries
// Open file
$handle = fopen ( 'countries.txt' , 'r' );

// Select the first line (a country)
$countries = array();

while (!feof($handle)) {
    // Assign next line
    $newTask = fgets($handle, 4096);

    // Add to array
    array_push($countries, substr($newTask, 0, count($newTask) - 2));
}

// Display
echo "<form id='userform' action='form.php' method='post'>"."</br>";
echo "Your name:<br>";
echo "<input type='text' name='name'>"."<br><br>";

echo "<input type='radio' name='gender' value='male' checked> Male<br>";
echo "<input type='radio' name='gender' value='female'> Female<br><br>";

echo "<input type=\"checkbox\" name=\"poker\" value=\"Poker\">Poker<br>";
echo "<input type=\"checkbox\" name=\"biking\" value=\"Biking\">Biking<br>";
echo "<input type=\"checkbox\" name=\"dancing\" value=\"Dancing\">Dancing<br>";
echo "<input type=\"checkbox\" name=\"programming\" value=\"Programming\">Programming<br>";
echo "<input type=\"checkbox\" name=\"coup\" value=\"Coup\">Coup<br>";
echo "<input type=\"checkbox\" name=\"nothing\" value=\"Nothing\">Nothing<br>";
echo "<input type=\"checkbox\" name=\"sleep\" value=\"Sleep\">Sleep<br><br>";

echo "<select name='countrylist' form='userform'>"."<br>";
foreach ($countries as &$value) {
    echo "<option value=$value>$value</option>";
}
echo "<option value=\"volvo\">Volvo</option><br>";
echo "<option value=\"volvo\">Volvo</option><br>";
echo "</select>"."<br>";
echo "<input type='submit' value='Submit'>"."<br>";

echo "</form>"."</br>";
