<?php

require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/functions.php";
require_once __DIR__ . "/../engine/dbhelpers.php";


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
    public $token;
}


/* ------------------------------------------------------------------------------------------------------------------
--------------------------- ИСТОРИЯ ПРО ОТКРЫТИЕ И ЗАКРЫТИЕ СЕССИИ --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------*/

/**
 * Устанавливает, что юзер может работать в системе как авторизованный. Не важно как именно он авторизовался ДО этого
 */
function grantAccess(string $login): bool
{
    $sql = "SELECT name FROM user WHERE login=?";
    $rows = selectRows($sql, array($login));
    if (count($rows) == 0) {
        return false;
    }
    $row = $rows[0];
    $_SESSION['login'] = $login;
    $_SESSION['name'] = $row['name'];
    return true;
}


/**"
 * Выкидывает юзера из сессии, но не чистит куки и токены. Просто говорит "нет и все"
 */
function denyAccess()
{
    unset($_SESSION['login']);
    $_SESSION['name'] = "guest";
}



/* ------------------------------------------------------------------------------------------------------------------
------------------------------------------- РЕГИСТРАЦИЯ В СИСТЕМЕ ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------*/

/**
 * Регистрация нового пользователя и предоставление ему права работы в системе
 */
function registerNewUser(User $usr): bool
{
    $sql = "INSERT INTO users (login, password,  name, phone, email, address, description, last_login) 
          VALUES (?,?,?,?,?,?,?,?,?)";
    $usr->pass = password_hash($usr->pass, PASSWORD_DEFAULT);
    $params = array(
        $usr->login,
        $usr->pass,
        $usr->name,
        $usr->phone,
        $usr->email,
        $usr->address,
        $usr->description,
        time()
    );

    if (insDelUpdRows($sql, $params) === 1) {

        return grantAccess($usr->login);
    } else {
        return false;
    }
}


function getPostUsrInfo(): User
{
    $usr = new User;

    $usr->login = trim(gPostStr('login'));
    $usr->pass = trim(gPostStr('password'));
    $usr->pass2 = trim(gPostStr('repass'));
    $usr->name = trim(gPostStr('name'));
    $usr->phone = trim(gPostStr('phone'));
    $usr->email = trim(gPostStr('email'));
    $usr->address = trim(gPostStr('address'));
    $usr->description = trim(gPostStr('comment'));
    return $usr;
}

/**
 * Для проверки записи о новом пользователе до его регистрации в системе пользователе до его 
 */
function dataUserErrors(User $usr): string
{
    //Переделать на возврат массива с раскидыванием ошибок по форме
    $result = "";
    if (empty($usr->login)) $result = "- user login must be set <br>";
    if (empty($usr->pass)) $result = "- user login must be set <br>";
    if (($usr->pass) !== ($usr->pass2)) $result .= "- the entered passwords do not match <br>";
    if (empty($usr->name)) $result .= "- field \"name\" must be filled out <br>";
    if (empty($usr->email)) $result .= "- field \"email\" must be filled out <br>";

    return $result;
}


/* ------------------------------------------------------------------------------------------------------------------
------------------------------------------- ВХОД ПО ЛОГИНУ И ПАРОЛЮ И ВЫХОД -----------------------------------------
--------------------------------------------------------------------------------------------------------------------*/

/** 
 * Проверяет имя и пароль пользователя и запускает его в систему. Для ajax
 */
function logInUser(string $login, ?string $password, ?string $rememberMe): array
{
    $sql = "SELECT name, password, cart_count, cart_summ  
                FROM v_usr_cart_stats
                WHERE login=?";
    $rows = selectRows($sql, array($login));
    if (count($rows) == 0) {
        return ["error" => "user with login $login doesn't exist "];
    }

    $row = $rows[0];
    if (!password_verify($password, $row['password'])) {
        //пароль не совпадает
        return ["error" => "password is incorrect "];
    }

    if (
        isset($rememberMe) &&
        !is_null($rememberMe) &&
        ($rememberMe != "")
    ) {
        giveOutToken($login, null);
        grantAccess($login);
    }

    unset($row['password']);
    return $row;
}

/** 
 * Выкидывает user'а из системы и затирает его токен (если есть). Для ajax
 */
function logOutUser(string $login): array
{
    denyAccess();
    //надо бы удалить запись о конкретной сессии и почистить cookies
    $token = getUserToken();
    if (!is_null($token)) {
        $sql = "DELETE FROM user_tokens WHERE login=? AND token_seria=?";
        if (insDelUpdRows($sql, array($login, $token['token_seria'])) == 0) {
            return array("error" => "Can't delete user session ...");
        }
        setcookie(
            "token",
            '',
            time() - 3600
        );
    }
    return array("success" => "user logged out");
}

/* ------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- РАБОТА С ТОКЕНАМИ -----------------------------------------------
--------------------------------------------------------------------------------------------------------------------*/

/**
 * Читает token из cookie
 */
function getUserToken(): ?array
{
    if (isset($_COOKIE['token'])) {
        $tokenStr = base64_decode($_COOKIE['token']);
        $arr = explode(":", $tokenStr);
        return array("token_seria" => $arr[0], "token_number" => $arr[1]);
    }
    return null;
}

/**
 * Возвращает логин юзера по токену или null если нет такого токена в базе
 */
function getTokenOwner(array $token): ?string
{
    if (!isset($token['token_seria']) || !isset($token['token_number'])) {
        return null;
    }
    $sql = "SELECT login FROM user_tokens 
        WHERE token_seria=? AND token_number=?";
    $res = selectRows($sql, array($token['token_seria'], $token['token_number']));
    if (count($res) == 0) {
        return null;
    }
    $row = $res[0];
    return $row['login'];
}

//Вспомогательная функция для giveOutToken
function registerToken(
    string $sql,
    string $tokenNumber,
    string $login,
    string $tokenSeria
): bool {
    if (insDelUpdRows($sql, array($tokenNumber, $login, $tokenSeria)) == 0) {
        return false;
    }
    setcookie(
        "token",
        base64_encode(implode(':', [$tokenSeria, $tokenNumber])),
        time() + 3600 * 24 * 7
    );
    return true;
}

/**
 * Выдает токен юзеру
 */
function giveOutToken(string $login, ?string $tokenSeria): bool
{
    if (is_null($tokenSeria) || $tokenSeria == "") {
        //серия не задана - делаем новую строку
        $tokenSeria = base64_encode(random_bytes(64));
        $tokenNumber = base64_encode(random_bytes(64));
        $sql = "INSERT INTO user_tokens(token_number,login,token_seria) VALUES (?,?,?)";
    } else {
        //серия задана - делаем только новый номер
        $tokenNumber = base64_encode(random_bytes(64));
        $sql = "UPDATE user_tokens SET token_number=?, last_login=SYSDATE()
                    WHERE login=? AND token_seria=?";
    }
    return registerToken($sql, $tokenNumber, $login, $tokenSeria);
}


/**
 * Осуществляет login если есть корректный token, если юзер уже в системе-ничего не далает 
 */
function autoLogin(): bool
{
    if (isset($_SESSION['login'])) {
        //все уже и так хорошо
        return true;
    }
    //пытаемся получить доступ через token
    $token = getUserToken();
    if (is_null($token)) {
        return false;
    }
    //Проверяем токен на "левость"
    $login = getTokenOwner($token);
    if (is_null($login)) {
        return false;
    }

    giveOutToken($login, $token['token_seria']);
    return grantAccess($login);
}
