<?php

use function PHPSTORM_META\type;

require_once __DIR__ . "/../settings/common.php";

function tplProcede($data, $template)
{
    $pathToTmpl = "../templates/$template.php";

    ob_start();

    echo ("<?php \n");
    foreach ($data as $key => $value) {
        $newVal = (gettype($value) == "string") ? "\"$value\"" : $value;

        echo "\$$key=$newVal;\n";
    }
    echo (" ?>\n");

    if (file_exists($pathToTmpl)) {
        $buf = file_get_contents($pathToTmpl);

        $buf = preg_replace_callback(
            '|(<component>)(.+)(</component>)|iU',
            function ($matches) {
                $compName = "../templates/components/" . trim($matches[2]) . ".php";
                return file_get_contents($compName);
            },
            $buf
        );


        // $str = $buf;

        $buf = str_replace("<component>", "", $buf);
        $buf = str_replace("</component>", "", $buf);
        echo $buf;
    } else {
        echo "template $pathToTmpl does't exist...";
    }

    $str = ob_get_contents();
    ob_end_clean();
    $fp = fopen('../settings/result.txt', 'w');
    $test = fwrite($fp, $str);
    fclose($fp);
    return $str;
}

//Ти
function render(string $template, array $data): string
{
    ob_start();
    extract($data);

    $pathToTmpl = __DIR__ . "/../templates/$template.php";
    require($pathToTmpl);
    return ob_get_clean();
}
