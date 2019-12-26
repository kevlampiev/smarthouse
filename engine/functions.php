<?php
require("../settings/common.php");

function tplProcede($data, $template)
{
    $pathToTmpl = "../templates/$template.php";

    ob_start();
    // echo "<!-- PHP -->";
    extract($data);
    // echo "<!-- html and CSS -->";

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

        $str = str_replace("<component>", "", $buf);
        $str = str_replace("</component>", "", $str);
        echo $str;
    } else {
        echo "template $pathToTmpl does't exist...";
    }

    ob_end_clean();
    return $str;
}
