<?php
require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/functions.php";
require_once __DIR__ . "/../engine/hotOffer.data.php";
require_once __DIR__ . "/../engine/slider.data.php";
require_once __DIR__ . "/../engine/categories.data.php";
require_once __DIR__ . "/../engine/auth.php";

autoLogin();

echo render("userAccount.tpl", [
    'document' => $document,
    'categories' => categories()
]); 
