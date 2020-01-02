<?php
require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/functions.php";
require_once __DIR__ . "/../engine/goodsCategory.data.php";
require_once __DIR__ . "/../engine/categories.data.php";

$goodsOfCategory = goodsOfCategory();
$category = $goodsOfCategory[0]['category'];

if (!$goodsOfCategory) {
    echo render("notFound.tpl", [
        'document' => $document,
        'categories' => categories()
    ]);
} else {
    echo render("goodsCategory.tpl", [
        'document' => $document,
        'categories' => categories(),
        'goodsOfCategory' => $goodsOfCategory,
        'categoryName' => currentCategory()
    ]);
}
