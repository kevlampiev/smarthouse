<?php

require_once __DIR__ . "/../settings/common.php";

//Данные для слайдера
function objForSlider(array $item): array
{
    $file = $item['img'];
    $data = [
        "imgFile" => $file,
        "currentClass" => "slider-item hidden-slide",
        "fileComment" => "The slide number 1",
        "slideText" => $item['description']
    ];

    return $data;
};

function sliderData(): array
{
    global $dbConnection;
    $sliderInfoArr = [];
    $result = mysqli_query($dbConnection, "SELECT * FROM slider_info");
    while ($row = mysqli_fetch_array($result)) {
        $sliderInfoArr[] = objForSlider($row);
    };
    return $sliderInfoArr;
}
