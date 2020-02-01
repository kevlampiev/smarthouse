<?php

require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/dbhelpers.php";

function goodsOfCategory(): ?array
{
    if (isset($_GET["id"])) {
        $category = (int) $_GET["id"];
        $sql = "SELECT id,name,price,currency,img FROM v_available_goods WHERE category_id=?";
        $rows = selectRows($sql, [$category]);
    } else {
        $rows = null;
    }
    return $rows;
}

function currentCategory(): string
{
    global $dbConnection;
    if (isset($_GET["id"])) {
        $sql = "SELECT name from good_categories WHERE id=" . $_GET["id"];

        $query = mysqli_query($dbConnection, $sql);

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
