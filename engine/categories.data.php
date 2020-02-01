<?php

require_once __DIR__ . "/../settings/common.php";

function categories()
{
    global $dbConnection;
    $result = mysqli_query($dbConnection, "SELECT * FROM v_active_categories")
        or die("Error: " . mysqli_error($dbConnection));
    $rows = array();
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }
    return $rows;
}
