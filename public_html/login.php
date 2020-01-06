<?php
require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/functions.php";
require_once __DIR__ . "/../engine/auth.php";


$input = json_decode(file_get_contents("php://input"), true);
$log = strip_tags((string) $input["login"]);
$pass = strip_tags((string) $input["password"]);

$response = logInUser($log, $pass);
echo $response;
