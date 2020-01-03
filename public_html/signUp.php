<?php
require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/functions.php";
require_once __DIR__ . "/../engine/newUser.php";

if (isset($_POST['login'])) {
    //Значит, хотим занести информацию о пользователе
    $usr = getPostUsrInfo();
    $errors = dataUserErrors($usr);
    if ($errors == "") {
        registerNewUser($usr);
        header("Location: index.php");
    } else {
        echo render(
            "signUp.tpl",
            [
                'document' => $document,
                'errors' => $errors
            ]
        );
    }
} else {
    echo render(
        "signUp.tpl",
        [
            'document' => $document,
            'errors' => ""
        ]
    );
}
