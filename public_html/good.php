<?php
require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/functions.php";
require_once __DIR__ . "/../engine/good.data.php";
require_once __DIR__ . "/../engine/categories.data.php";
require_once __DIR__ . "/../engine/auth.php";


$pageData = singleGoodData();

if (!$pageData) {
    echo render("notFound.tpl", [
        'document' => $document,
        'categories' => categories()
    ]);
} else {
    echo render("good.tpl", [
        'document' => $document,
        'categories' => categories(),
        'good' => singleGoodData()
    ]);
}
autoLogin();
