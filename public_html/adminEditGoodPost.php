<?php
require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/functions.php";
require_once __DIR__ . "/../engine/auth.php";

session_start();

if (!isset($_POST['goodname'])) {
    echo "name is not set";
} else {
    echo "name is $_POST['goodname']";
};



?>