
<?php
require_once __DIR__ . "/../engine/dbhelpers.php";


$rows = selectRows("SELECT * FROM users where login LIKE ?", array("test%"));

foreach ($rows as $row) {
    echo print_r($row);
}
