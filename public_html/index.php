<?php
require("../settings/common.php");
require("../engine/functions.php");

$data = array("document" => "Hello", "hello" => "Привет из Мордыхая");
//echo tplProcede($data, "tpl-index"); //Вообще не работает 
//echo cheatRenderer($data, "tpc-index"); //Работает, но непонятно для чего
require("../engine/commondata.php");
require("../templates/tpc-index.php");
