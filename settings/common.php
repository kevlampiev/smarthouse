<?php

$root = $_SERVER['DOCUMENT_ROOT'];
// $tpl_path = "/templates";
// $engine_path = "/engine/";
// $document = "e-shop";
// str_replace("/public_html", "/engine/", $root);

$dbConnection = mysqli_connect("127.0.0.1", "guest", "I_am_a guest_1", "smarthouse");

$solt = "783ac65";
$pepper = "3b48qf";
global $dbConnection, $solt, $pepper;
