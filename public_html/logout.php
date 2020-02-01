<?php
require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/functions.php";
require_once __DIR__ . "/../engine/auth.php";

session_start();

logOutUser($_SESSION['login']);
header("Location: /index.php");
