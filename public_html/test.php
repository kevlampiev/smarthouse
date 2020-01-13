
<?php
require_once __DIR__ . "/../engine/dbhelpers.php";
require_once __DIR__ . "/../engine/auth.php";

// $sql = "INSERT INTO user_tokens(login,token_seria,token_number) VALUES (?,?,?)";
// $a = "test5";
// $b = "test-5-token-seria";
// $c = "test-5-token-number";

// $arg = [$a, $b, $c];

// echo insDelUpdRows($sql, $arg);


$login = "test4";

$tokenSeria = "uVtxIRnBI1+mI2RqfgmzFvydjF6GGG5wlpRsosBdeyg+sqLs7CCWaFEyGa/hI45aKxil/3EuAm4HsJ2gcLOLfg==";
$tokenNumber = "kook";
$sql = "SELECT * FROM users";
$rows = selectRows($sql);
// $rowsAffected = insDelUpdRows($sql, ["RUB"]);

// echo $rowsAffected;



foreach ($rows as $el) {
    print_r($el);
}
