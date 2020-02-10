<?php
require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/functions.php";
require_once __DIR__ . "/../engine/auth.php";

session_start();

if (!isset($_POST['name'])) {
    echo "name is not set";
}


?>