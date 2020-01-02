<?php
require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/functions.php";

echo render(
    "signUp.tpl",
    [
        'document' => $document
    ]
);
