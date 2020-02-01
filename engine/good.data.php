<?php

require_once __DIR__ . "/../settings/common.php";

function singleGoodData()
{
    global $dbConnection;
    if (isset($_GET["id"])) {
        $id = (int) $_GET["id"];
        $result = mysqli_query($dbConnection, "SELECT * FROM v_available_goods WHERE id=$id");
        if (mysqli_num_rows($result) > 0) {
            $good = mysqli_fetch_assoc($result);
        } else {
            $good = false;
        }
    } else {
        $good = false;
    }
    return $good;
}
