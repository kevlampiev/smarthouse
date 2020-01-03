<?php

require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/functions.php";


class User //Данные о пользователе
{
    public $login;
    public $pass;
    public $pass2;
    public $name;
    public $phone;
    public $email;
    public $adress;
    public $description;
}

function registerNewUser(User $usr): bool
{

    global $dbConnection, $solt, $pepper;
    $sql = "INSERT INTO users (login, password,  name, phone, email, address, description) 
            VALUES ('%s','%s','%s','%s','%s','%s','%s')";
    $password = $solt . md5($usr->pass) . $pepper;
    $sql = sprintf($sql, $usr->login, $password, $usr->name, $usr->phone, $usr->email, $usr->address, $usr->description);

    $res = mysqli_query($dbConnection, $sql);
    if ($res) {
        setcookie('login', $usr->login, time() + 7 * 24 * 3600);
        setcookie('password', $usr->pass, time() + 7 * 24 * 3600);
        setcookie('username', $usr->name, time() + 7 * 24 * 3600);
    };

    return ($res == true);
}

function getPostUsrInfo(): User
{
    $usr = new User;

    $usr->login = gPostStr('login');
    $usr->pass = gPostStr('password');
    $usr->pass2 = gPostStr('repass');
    $usr->name = gPostStr('name');
    $usr->phone = gPostStr('phone');
    $usr->email = gPostStr('email');
    $usr->address = gPostStr('address');
    $usr->description = gPostStr('comment');
    return $usr;
}

function dataUserErrors(User $usr): string
{
    $result = "";
    if ($usr->login == "") $result = "- user login must be set <br>";
    if (($usr->pass) != ($usr->pass2)) $result .= "- the entered passwords do not match <br>";
    if (($usr->name) == "") $result .= "- field \"name\" must be filled out <br>";
    if (($usr->email) == "") $result .= "- field \"email\" must be filled out <br>";

    return $result;
}
