<?php
require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/functions.php";
require_once __DIR__ . "/../engine/auth.php";
require_once __DIR__ . "/../engine/adminPanel.data.php";

session_start();
if (!isset($_SESSION['admin_login'])) {
    header("Location: admin.php");
}

if (!isset($_GET['id'])) {
    echo render("notFound.tpl", [
        'document' => $document,
        'categories' => categories()
    ]);
};

$sql="SELECT * FROM v_goods WHERE id=?";
$rows=selectRows($sql,[$_GET['id']]);
if ($rows==[]) {
    echo render("notFound.tpl", [
        'document' => $document,
        'categories' => categories()
    ]);
}

echo render('adminEditGood.tpl',['docTitle'=>"Smarthouse AdminPanel",
                                'good'=>$rows[0],
                                'categories'=>getCategories()]);