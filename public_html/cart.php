<?php
require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/functions.php";
require_once __DIR__ . "/../engine/auth.php";

$input = json_encode(file_get_contents("/php://input"), true);
$action = strip_tags((string) $input['action']);

switch ($action) {
    case 'getCart':
        break;
    case 'saveCart':
        break;
    case 'mergeCarts':
        break;
    case 'addToCart':
        break;
    case 'editCartItem':
        break;
    default:
        echo json_encode(['error' => "Operation '$action' is not defined ... "]);
}
