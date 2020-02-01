<?php
require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/functions.php";
require_once __DIR__ . "/../engine/goodsCategory.data.php";
require_once __DIR__ . "/../engine/categories.data.php";
require_once __DIR__ . "/../engine/auth.php";


$goodsOfCategory = goodsOfCategory();


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

autoLogin();
