<?php
require_once __DIR__ . "/../engine/dbhelpers.php";
require_once __DIR__ . "/../engine/auth.php";
require_once __DIR__ . "/../engine/cartfunc.php";

for ($i = 5; $i < 100; $i++) {
    $sql = "INSERT INTO goods(name,category_id,description,img) VALUES (?,?,?,?)";
    insDelUpdRows($sql, ["Fiction good #$i", 1, "Kill me", "9.jpg"]);
}
