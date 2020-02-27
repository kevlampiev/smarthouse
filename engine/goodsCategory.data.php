<?php

require_once __DIR__ . '/../settings/dbconnection.php';

function goodsOfCategory(int $categoryId, int $limit = 12, int $offset = 0): ?array
{
    global $dbase;

    $sql = "SELECT id,name,price,currency,img FROM v_available_goods WHERE category_id=? LIMIT ?,?";

    try {
        $stmt = $dbase->prepare($sql);
        $stmt->execute([$categoryId, $offset, $limit]);

        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        $rows = null;
    }

    return $rows;


    // if (isset($_GET["id"])) {
    //     $category = (int) $_GET["id"];
    //     $sql = "SELECT id,name,price,currency,img FROM v_available_goods WHERE category_id=? LIMIT ?,?";

    //     $stmt = $dbase->prepare($sql);
    //     $stmt->execute([$category, $offset, $limit]);

    //     $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
    // } else {
    //     $rows = null;
    // }
    // return $rows;
}


function currentCategoryInfo(int $categoryId): array
{
    global $dbase;

    $sql = "SELECT name, goods_count from v_categories_statistics WHERE id=?";
    $stmt = $dbase->prepare($sql);
    $stmt->execute([$categoryId]);

    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    $row['categoryId'] = $categoryId;

    return $row;
}


// require_once __DIR__ . "/../settings/common.php";
// require_once __DIR__ . "/../engine/dbhelpers.php";

// function goodsOfCategory(int $limit = 10, int $offset = 0): ?array
// {
//     if (isset($_GET["id"])) {
//         $category = (int) $_GET["id"];
//         $sql = "SELECT id,name,price,currency,img FROM v_available_goods WHERE category_id=? LIMIT ?,?";
//         $rows = selectRows($sql, [$category, $offset, $limit]);
//     } else {
//         $rows = null;
//     }
//     return $rows;
// }

// function currentCategory(): string
// {
//     global $dbConnection;
//     if (isset($_GET["id"])) {
//         $sql = "SELECT name from good_categories WHERE id=" . $_GET["id"];

//         $query = mysqli_query($dbConnection, $sql);

//         if (!$query) {
//             $result = "undefined";
//         } else {
//             $row = mysqli_fetch_assoc($query);
//             $result = $row['name'];
//         };
//     } else {
//         $result = "undefined";
//     }
//     return $result;
// }
