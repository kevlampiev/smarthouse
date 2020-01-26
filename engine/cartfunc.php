<?php
require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/functions.php";
require_once __DIR__ . "/../engine/dbhelpers.php";
require_once __DIR__ . "/../engine/auth.php";

function getCart(): array
{
    if (!isset($_SESSION['login'])) {
        return [];
    }

    $sql = "SELECT good_id as id,
                name,
                img,
                price,
                currency,
                amount
            FROM v_cart
            WHERE user=?
            ORDER BY name";
    return selectRows($sql, [$_SESSION['login']]);
}

function addToCart(array $item): array
{

    if (!isset($_SESSION['login'])) {
        return ['error' => 'user is not defined'];
    }

    //проверка а есть ли такой товар
    $sql = "SELECT * FROM goods WHERE id=?";
    $res = selectRows($sql, [$item['id']]);
    if (count($res) === 0) {
        return ['error' => "A good with id={$item['id']} doesn't exist"];
    }
    $sql = 'CALL add_to_cart(?,?,?)';
    insDelUpdRows(
        $sql,
        [$_SESSION['login'], $item['id'], $item['amount']]
    );
    return ['status' => 'All went fine ... probably...'];
}

function editCartItem(array $item): array
{

    if (!isset($_SESSION['login'])) {
        return ['error' => 'user is not defined'];
    }

    //проверка а есть ли такой товар
    $sql = "SELECT * FROM goods WHERE id=?";
    $res = selectRows($sql, [$item['id']]);
    if (count($res) === 0) {
        return ['error' => "A good with id={$item['id']} doesn't exist"];
    }
    $sql = 'CALL edit_cart_item(?,?,?)';
    insDelUpdRows(
        $sql,
        [$_SESSION['login'], $item['id'], $item['amount']]
    );
    return ['status' => 'All went fine ... probably...'];
}

function mergeCarts(array $localCart): array
{
    foreach ($localCart as $item) {
        addToCart($item);
    }
    return getCart();
}
