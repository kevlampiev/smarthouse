<?php
require("../settings/common.php");
require("../engine/functions.php");
require("../engine/index.data.php");

//$data = compact($document, $sliderInfo); //Не работает

$data = ['document' => $document, 'sliderInfo' => $sliderInfo, 'hotOffer' => $hotOffer];

//echo tplProcede($data, "tpl-index"); //Вообще не работает 
echo cheatRenderer($data, "index.tpl"); //Работает, но непонятно для чего
