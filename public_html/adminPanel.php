<?php
require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/functions.php";
require_once __DIR__ . "/../engine/auth.php";
require_once __DIR__ . "/../engine/adminPanel.data.php";

session_start();
if (!isset($_SESSION['admin_login'])) {
    header("Location: admin.php");
}


echo render('adminPanel.tpl',['docTitle'=>"Smarthouse AdminPanel","goods"=>getGoodsList()]);