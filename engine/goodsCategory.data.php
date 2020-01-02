<?php

require_once __DIR__ . "/../settings/common.php";

function goodsOfCategory()
{
    global $dbConnection;
    if (isset($_GET["id"])) {
        $category = (int) $_GET["id"];
        $result = mysqli_query($dbConnection, "SELECT * FROM v_available_goods WHERE category_id=$category")
            or die("Error: " . mysqli_error($dbConnection));
        $rows = array();
        while ($row = mysqli_fetch_assoc($result)) {
            $rows[] = $row;
        }
    } else {
        $rows = false;
    }
    return $rows;
}

function currentCategory(): string
{
    global $dbConnection;
    if (isset($_GET["id"])) {
        $query = mysqli_query($dbConnection, "SELECT name from categories WHERE id=" . $_GET["id"]);
        if (!$query) {
            $result = "undefined";
        } else {
            $row = mysqli_fetch_assoc($query);
            $result = $row['name'];
        };
    } else {
        $result = "undefined";
    }
    return $result;
}
