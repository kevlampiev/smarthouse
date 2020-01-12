<?php
require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/functions.php";
require_once __DIR__ . "/../engine/auth.php";
require_once __DIR__ . "/../engine/auth.php";

session_start();

$input = json_decode(file_get_contents("php://input"), true);
$log = strip_tags((string) $input["login"]);
$pass = strip_tags((string) $input["password"]);
$rememberMe = strip_tags((string) $input["rememberMe"]);


$response = logInUser($log, $pass, $rememberMe);
echo json_encode($response);
