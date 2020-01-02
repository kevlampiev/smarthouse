<?php

require_once __DIR__ . "/../settings/common.php";


function hotOffData(): array
{
    global $dbConnection;

    $result = mysqli_query($dbConnection, "SELECT * FROM v_hot_offer");
    $hotOffer = array();
    while ($row = mysqli_fetch_assoc($result)) {
        $hotOffer[] = $row;
    }
    return $hotOffer;
}
