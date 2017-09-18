# Form with arrays, checkboxes, select menu

Create a registration form for a random website, and a php script where it is submitted (2 separate scripts). You will probably also want a third script that contains the common arrays to be **included** by both the form and the submit script.

The registration form must have the following functionality (feel free to change):

* asks the user for their name in **textboxes**
* asks for the gender with **radio** buttons
* asks for interests with **checkboxes** and 8 or so random interests (you can choose any interests. No inspiration? Here are some:

```php
<?php
$interests = [
    'poker',
    'chess',
    'checkers',
    'dominoes',
    'solitaire',
    'rummy',
    'risk',
    'settlers of catan'
];
?>
```

* asks for location with **select** menus for country. I provided a text file of 196 countries (I hope they all still exist ) in Countries.txt;

The second PHP script is where the form is submitted. Validate all the data entered; if valid, welcome the user by echoing their information along with a count of their selected interests, and display the selections in alphabetical order (see last note below).

If the entries are invalid, indicate which field is incorrect (perhaps with different styling?).

### Note

* use the `$_GET` or `$_POST` superglobal arrays
* pen the text file like we did last lab. Note that this file has 196 countries on separate lines. So open the file like last lab, loop through and put each line as the next element in the array using the `[]` syntax. Note that you will have to [trim](http://php.net/manual/en/function.trim.php) each line you read from the file to remove the additional white space characters at the end of each line.
* remember to check to make sure that the checkbox array is a subset of all the potential interests with the [array_diff](http://ca2.php.net/manual/en/function.array-diff.php)function.
* To make sure the location is within the array of countries, use [in_array](http://php.net/manual/en/function.in-array.php) function. Recall that in_array looks for values in an array; we would use [isset](http://php.net/manual/en/function.isset.php) to check if a key existed in an array.
* Make sure you look at the [sort](http://ca1.php.net/manual/en/function.sort.php) function syntax when displaying the interest selections in alphabetical order!!

Save the form, the handling script and the common array file to include within `PHPCode\labs\lab3`, all within the same project if you use an IDE. The form will be `index.php`.

## countries.txt
Use the following:
```
Afghanistan
Albania
Algeria
Andorra
Angola
Antigua & Deps
Argentina
Armenia
Australia
Austria
Azerbaijan
Bahamas
Bahrain
Bangladesh
Barbados
Belarus
Belgium
Belize
Benin
Bhutan
Bolivia
Bosnia & Herzegovina
Botswana
Brazil
Brunei
Bulgaria
Burkina
Burundi
Cambodia
Cameroon
Canada
Cape Verde
Central African Rep
Chad
Chile
China
Colombia
Comoros
Congo
Congo {Democratic Rep}
Costa Rica
Croatia
Cuba
Cyprus
Czech Republic
Denmark
Djibouti
Dominica
Dominican Republic
East Timor
Ecuador
Egypt
El Salvador
Equatorial Guinea
Eritrea
Estonia
Ethiopia
Fiji
Finland
France
Gabon
Gambia
Georgia
Germany
Ghana
Greece
Grenada
Guatemala
Guinea
Guinea-Bissau
Guyana
Haiti
Honduras
Hungary
Iceland
India
Indonesia
Iran
Iraq
Ireland {Republic}
Israel
Italy
Ivory Coast
Jamaica
Japan
Jordan
Kazakhstan
Kenya
Kiribati
Korea North
Korea South
Kosovo
Kuwait
Kyrgyzstan
Laos
Latvia
Lebanon
Lesotho
Liberia
Libya
Liechtenstein
Lithuania
Luxembourg
Macedonia
Madagascar
Malawi
Malaysia
Maldives
Mali
Malta
Marshall Islands
Mauritania
Mauritius
Mexico
Micronesia
Moldova
Monaco
Mongolia
Montenegro
Morocco
Mozambique
Myanmar (Burma)
Namibia
Nauru
Nepal
Netherlands
New Zealand
Nicaragua
Niger
Nigeria
Norway
Oman
Pakistan
Palau
Panama
Papua New Guinea
Paraguay
Peru
Philippines
Poland
Portugal
Qatar
Romania
Russian Federation
Rwanda
St Kitts & Nevis
St Lucia
Saint Vincent & the Grenadines
Samoa
San Marino
Sao Tome & Principe
Saudi Arabia
Senegal
Serbia
Seychelles
Sierra Leone
Singapore
Slovakia
Slovenia
Solomon Islands
Somalia
South Africa
South Sudan
Spain
Sri Lanka
Sudan
Suriname
Swaziland
Sweden
Switzerland
Syria
Taiwan
Tajikistan
Tanzania
Thailand
Togo
Tonga
Trinidad & Tobago
Tunisia
Turkey
Turkmenistan
Tuvalu
Uganda
Ukraine
United Arab Emirates
United Kingdom
United States
Uruguay
Uzbekistan
Vanuatu
Vatican City
Venezuela
Vietnam
Yemen
Zambia
Zimbabwe
```