<?php
require("../settings/common.php");
require("../engine/functions.php");

$data = array("document" => "Hello");
echo tplProcede($data, "tpl-index");
