<?php

require("../settings/common.php");

//Данные для слайдера
function objForSlider($item)
{
    $img = $item['img'];
    $description = $item['description'];

    return "{imgFile: \"img/forSlider/$img\",
        currentClass: 'slider-item hidden-slide',
        fileComment: `The slide number 1`,
        slideText: \"$description\"
        }";
}
$sliderInfoArr = [];
$result = mysqli_query($dbConnection, "SELECT * FROM slider_info");
while ($row = mysqli_fetch_array($result)) {
    $sliderInfoArr[] = objForSlider($row);
};
$sliderInfo = implode(",", $sliderInfoArr);


//Данные для информации по горячему предложению
$result = mysqli_query($dbConnection, "SELECT * FROM v_hot_offer");
$hotOffer = array();
while ($row = mysqli_fetch_assoc($result)) $hotOffer[] = $row;

//print_r($hotOffer);

mysqli_close($dbConnection);
