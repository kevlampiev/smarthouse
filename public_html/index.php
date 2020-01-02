<?php
require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/functions.php";
require_once __DIR__ . "/../engine/hotOffer.data.php";
require_once __DIR__ . "/../engine/slider.data.php";

//$data = compact($document, $sliderInfo); //Не работает

//$data = ['document' => $document, 'sliderInfo' => $sliderInfo, 'hotOffer' => $hotOffer,  'mostPopular' => $hotOffer];

//echo tplProcede($data, "tpl-index"); //Вообще не работает 
echo render("index.tpl", ['document' => $document, 'sliderInfo' => sliderData(), 'hotOffer' => hotOffData(),  'mostPopular' => hotOffData()]); //Работает, но непонятно для чего
