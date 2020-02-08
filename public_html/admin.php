<?php
require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/functions.php";
require_once __DIR__ . "/../engine/auth.php";

session_start();

if (!isset($_POST['login'])) {
//Это первый раз зашли на страницу. Просто прорисовываем ее
  echo render('admin.tpl',['docTitle'=>'Smarthouse Admin','errorCode'=>0]);
} else {
// отжали кнопку "войти"
  $checkPass=logInAdmin($_POST['login'],$_POST['password']);
  if ($checkPass===0) {
    $_SESSION['admin_login']=$_POST['login'];
    header("Location: adminPanel.php");
  } else {
    echo render('admin.tpl',['docTitle'=>'Smarthouse Admin','errorCode'=>$checkPass]);
  }
}
