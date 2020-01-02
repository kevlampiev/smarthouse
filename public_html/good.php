<?php
require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/functions.php";
require_once __DIR__ . "/../engine/good.data.php";

$pageData = singleGoodData();
print_r($pageData);
if (!$pageData) {
    echo render("notFound.tpl", ['document' => $document]);
} else {
    echo render("good.tpl", ['document' => $document, "good" => singleGoodData()]); //Работает, но непонятно для чего
}
