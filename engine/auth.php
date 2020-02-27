<?php

require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/functions.php";
require_once __DIR__ . "/../engine/dbhelpers.php";
require_once __DIR__ . "/../engine/cartfunc.php";


session_start();

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
    $sql = "SELECT name FROM users WHERE login=?";
    $rows = selectRows($sql, array($login));
    if (count($rows) == 0) {
        return false;
    }
    $row = $rows[0];
    $_SESSION['login'] = $login;
    $_SESSION['name'] = $row['name'];
    setcookie("is_logged_in", "true", time() + 7 * 24 * 3600);
    return true;
}


/**"
 * Выкидывает юзера из сессии, но не чистит куки и токены. Просто говорит "нет и все"
 */
function denyAccess()
{
    unset($_SESSION['login']);
    $_SESSION['name'] = "guest";
    setcookie("is_logged_in", "false", time() - 7 * 24 * 3600);
}



/* ------------------------------------------------------------------------------------------------------------------
------------------------------------------- РЕГИСТРАЦИЯ В СИСТЕМЕ ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------*/

/**
 * Регистрация нового пользователя и предоставление ему права работы в системе
 */
function registerNewUser(User $usr): bool
{
    $sql = "INSERT INTO users (login, password,  name, phone, email, address, description) 
          VALUES (?,?,?,?,?,?,?)";
    $usr->pass = password_hash($usr->pass, PASSWORD_DEFAULT);
    $params = array(
        $usr->login,
        $usr->pass,
        $usr->name,
        $usr->phone,
        $usr->email,
        $usr->address,
        $usr->description
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
    $rows = selectRows($sql, [$login]);
    if (count($rows) == 0) {
        return ["error" => "user with login $login doesn't exist "];
    }

    if (!password_verify($password, $rows[0]['password'])) {
        //пароль не совпадает
        return ["error" => "password is incorrect "];
    }

    if (isset($rememberMe)) {
        giveOutToken($login, null);
        grantAccess($login);
    }

    unset($rows[0]['password']);
    $rows[0]['cart'] = getCart();
    return $rows[0];
}

/**
 * Проверяет имя и пароль для администратора. Серверная история,возвращает 0 - все хорошо, 1- логин неверен, 2 - пароль неверен
 */
function logInAdmin(string $login, string $password): int
{
    $sql = "SELECT * FROM v_user_roles WHERE login=? AND role=?";
    $res = selectRows($sql, [$login, 'admin']);

    if ($res == []) {
        //админа с таким логином нет
        return 1;
    } else {
        $row = $res[0];
        if (!password_verify($password, $row['password'])) {
            //пароль не совпадает
            return 2; //Должно быть return 2
        }
        return 0;
    }
}

/** 
 * Выкидывает user'а из системы и затирает его токен (если есть). LogOut делаем только на сервере
 */
function logOutUser(?string $login)
{
    denyAccess();
    //надо бы удалить запись о конкретной сессии и почистить cookies
    $token = getUserToken();
    if (!is_null($token)) {
        $sql = "DELETE FROM user_tokens WHERE login=? AND token_seria=?";
        if (insDelUpdRows($sql, array($login, $token['token_seria'])) == 0) {
            return ["error" => "Can't delete user session ..."];
        }
        setcookie(
            "token",
            '',
            time() - 3600
        );
    }
    //ничего не возвращаем и вываливаемся на index.php тбо неизвестно, откуда мы вообще вызвали logout
    header("Location: /index.php");
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
        return ["token_seria" => $arr[0], "token_number" => $arr[1]];
    }
    return null;
}


//task. Сделать чтобы возвращал массив с login И name
//Выяснилось, что дешевле оставить "как есть", не везде можно получить имя сразу и код запутывается
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
    // $args = $token;
    // [$token['token_seria'], $token['token_number']];


    $res = selectRows($sql, $token);
    if (count($res) == 0) {
        return null;
    }
    // $row = $res[0];
    return $res[0]['login'];
}

//Вспомогательная функция для giveOutToken
function registerToken(string $tokenSeria,  string $tokenNumber): bool
{
    // if (insDelUpdRows($sql, array($tokenNumber, $login, $tokenSeria)) == 0) {
    //     return false;
    // }
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
    if ($tokenSeria === null) {
        //серия не задана - делаем новую строку
        $tokenSeria = base64_encode(random_bytes(64));
        $tokenNumber = base64_encode(random_bytes(64));


        // $sql = "INSERT INTO user_tokens(login,token_seria,token_number) 
        //             VALUES (?,?,?)";
        // $rowsAffected = insDelUpdRows($sql, [$login, $tokenSeria, $tokenNumber]);
        // if ($rowsAffected === 0) {
        //     return false;
        // }
    } else {
        //серия задана - делаем только новый номер
        $tokenNumber = base64_encode(random_bytes(64));

        // $sql = "UPDATE user_tokens 
        //         SET token_number=?, last_login=SYSDATE()
        //         WHERE login=? AND token_seria=?";
        // if (insDelUpdRows($sql, [$tokenNumber, $login, $tokenSeria]) === 0) {
        //     return false;
        // }
    }
    return registerToken($tokenSeria, $tokenNumber);
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
    if ($token === null) {
        return false;
    }

    //task. Дешевле оставить "как есть"
    // Проверяем токен на "левость" + ПОЛУЧИТЬ имя и login, а не только LOGIN
    $login = getTokenOwner($token);
    if ($login === null) {
        return false;
    }

    giveOutToken($login, $token['token_seria']);
    //task
    //пусть grantAccess будет таким grantAccess($login, $name);
    return grantAccess($login);
}


/* ------------------------------------------------------------------------------------------------------------------
-------------------------------------- РЕДАКТИРОВАНИЕ ОТДЕЛЬНЫХ ПОЛЕЙ ЗАПИСИ О ПОЛЬЗОВАТЕЛЕ -------------------------
--------------------------------------------------------------------------------------------------------------------*/

function editUserField(string $fieldName, string $fieldValue): array
{
    if (!isset($_SESSION['login'])) {
        return ["error" => "user is not autorized"];
    }
    $sql = "UPDATE users SET " . "$fieldName" . "=? WHERE login=?";

    if (insDelUpdRows($sql, [$fieldValue, $_SESSION['login']]) === 1) {
        return ["status" => "success"];
    }
    return ["error" => "smth went wrong"];
}
