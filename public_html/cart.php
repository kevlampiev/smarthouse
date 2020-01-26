<?php
require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/functions.php";
require_once __DIR__ . "/../engine/cartfunc.php";
require_once __DIR__ . "/../engine/auth.php";

session_start();

$input = json_decode(file_get_contents("php://input"), true);
$action = $input['action'];
$item = $input['item'];

switch ($action) {
    case 'getCart':
        $result = getCart();
        echo json_encode($result);
        break;
    case 'saveCart':
        $result = [];
        echo json_encode($result);
        break;
    case 'mergeCarts':
        $result = mergeCarts($item);
        echo json_encode($result);
        break;
    case 'addToCart':
        $result = addToCart($item);
        echo json_encode($result);
        break;
    case 'editCartItem':
        $result = editCartItem($item);
        echo json_encode($result);
        break;
    default:
        echo json_encode(['error' => "Operation '$action' is not defined ... "]);
}
