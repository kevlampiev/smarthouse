<?php
require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/functions.php";
require_once __DIR__ . "/../engine/auth.php";


session_start();

$input = json_decode(file_get_contents("php://input"), true);
$action = $input['action'];
$fieldName=$input['fieldName'];
$newValue=$input['value'];

// echo json_encode(["error"=>"it's not a error. I'm just in a module"]);

if ($action=="editUserInfo") {
    switch ($fieldName) {
        case "password": 
            $res= ["status"=>"success"];
            break;
        default:
            $res=editUserField($fieldName, $newValue);
    }
    echo json_encode($res);
}