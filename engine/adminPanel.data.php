<?php 

require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/functions.php";
require_once __DIR__ . "/../engine/dbhelpers.php";
require_once __DIR__ . "/../engine/auth.php";

function getGoodsList(): array 
{
    $sql="SELECT * from v_goods";
    return selectRows($sql,[]);
};

function getCategories() {
    $sql="SELECT * FROM good_categories";
    return selectRows($sql,[]);
};
