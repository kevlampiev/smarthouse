<?php

require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/functions.php";

function typeLetter($arg): string
{
    switch (gettype($arg)) {
        case "string":
            return "s";
        case "boolean":
            return "i";
        case "integer":
            return "i";
        case "double":
            return "d";
        case "array":
            return "b";
        case "oblect":
            return "b";
        case "resource":
            return "b";
        case "NULL":
            return "s";
    }

    return "s";
}

function strParams(array $params): string
{
    $res = "";
    foreach ($params as $el) {
        $res .= typeLetter($el);
    }
    return $res;
}

function insDelUpdRows(string $sql, array $params): int
{
    global $dbConnection;
    $statement = mysqli_prepare($dbConnection, $sql);

    //echo $sql;
    print_r($statement);

    $tmpParams = [$statement, strParams($params)];
    for ($i = 0; $i < count($params); $i++) {
        $tmpParams[] = &$params[$i];
    }

    call_user_func_array("mysqli_stmt_bind_param", $tmpParams);

    mysqli_stmt_execute($statement);
    $affectedRows = mysqli_stmt_affected_rows($statement);
    mysqli_stmt_close($statement);

    return $affectedRows;
}


function selectRows(string $sql, array $params): array
{
    global $dbConnection;
    $statement = mysqli_prepare($dbConnection, $sql);

    $tmpParams = [$statement, strParams($params)];

    for ($i = 0; $i < count($params); $i++) {
        $tmpParams[] = &$params[$i];
    }
    call_user_func_array("mysqli_stmt_bind_param", $tmpParams);


    mysqli_stmt_execute($statement);
    $result = mysqli_stmt_get_result($statement);

    $rows = array();
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }

    mysqli_stmt_close($statement);

    return $rows;
}
