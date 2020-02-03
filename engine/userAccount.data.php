<?php

require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/dbhelpers.php";

function getUserInfo(): array
{
    $sql = 'SELECT * from users WHERE login=?';
    if (!isset($_SESSION['login'])) {
        return ['login' => 'trash'];
    };
    return selectRows($sql, [$_SESSION['login']])[0];
}
