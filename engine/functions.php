<?php

use function PHPSTORM_META\type;

require_once __DIR__ . "/../settings/common.php";


//Типа шаблонизатор
function render(string $template, array $data): string
{
    ob_start();
    extract($data);

    $pathToTmpl = __DIR__ . "/../templates/$template.php";
    require($pathToTmpl);
    return ob_get_clean();
}
