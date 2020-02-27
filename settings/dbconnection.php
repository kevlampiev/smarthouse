<?php

define('DB_DRIVER', 'mysql');
define('DB_HOST', '195.133.1.84');
define('DB_NAME', 'smarthouse');
define('DB_USER', 'smarthouse_guest');
define('DB_PASS', 'I_am_a_guest_no_1');


define('GOODS_LIM', 12);

try {
    // соединяемся с базой данных
    $connect_str = DB_DRIVER . ':host=' . DB_HOST . ';dbname=' . DB_NAME;
    $dbase = new PDO($connect_str, DB_USER, DB_PASS);
    $dbase->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
} catch (PDOException $e) {
    die('ERROR: ' . $e->getMessage());
}
