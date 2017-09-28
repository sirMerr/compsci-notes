<?php
$userInfo = array();

$name = validate($_POST["name"] || "hello");
$gender = validate($_POST["gender"]);
$poker = validate($_POST["poker"]);
$biking = validate($_POST["biking"]);
$dancing = validate($_POST["dancing"]);
$programming = validate($_POST["programming"]);
$coup = validate($_POST["coup"]);
$nothing = validate($_POST["nothing"]);
$sleep = validate($_POST["sleep"]);
$country = validate($_POST["countrylist"]);

array_push($userInfo, $name, $gender, $poker, $biking, $dancing,
    $programming, $coup, $nothing, $sleep, $country);

/**
 * Validates and formats data.
 * @param $data
 * @return string
 */
function validate($data) {
    echo "Validating: ".$data."<br>";
    if (!empty($data)) {
        return 'No data';
    }
    // Remove HTML tags (strip_tags) and convert characters
    // to HTML entities
    $data = strip_tags(htmlentities($data));
    // Trim unnecessary characters (extra space, tab, newline)
    $data = trim($data);
    // Strip of backlashes
    $data = stripslashes($data);
    return $data;
}

foreach ($userInfo as $value) {
    echo $value."<br>";
}