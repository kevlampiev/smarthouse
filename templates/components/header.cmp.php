<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="styles/mainStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <!-- <script src="https://unpkg.com/axios/dist/axios.min.js"></script> -->
    <script src="js/main.js" defer></script>



    <title><?= $document ?></title>
</head>

<body>
    <div class="container">
        <div class="header">
            <div class="header__linksBand orangeStyled">
                <div class="header__logo">
                    <a href="/"><img class="header__logoImage" src="./img/atom.png" alt="Логотип"></a>
                    <p>Atomic</p>

                </div>
                <div class="userNameDspl">
                    <?= $_SESSION['name'] ?>
                </div>

                <ul class="userMenu">
                    <li> <a class="userMenu__item" href="#">wish list</a></li>
                    <li><a class="userMenu__item" href="#">my account</a></li>
                    <li><a class="userMenu__item" href="#">checkout</a></li>
                    <li> <a class="userMenu__item" href="#" @click="isVisibleCart=!isVisibleCart">
                            <i class="fas fa-shopping-basket"></i>
                            <!-- <span class="basket_indicator">{{cartAmount}}</span> -->
                        </a> </li>
                    <?php if (isset($_SESSION['name'])) : ?>
                        <li><a class="userMenu__item" href="#" onclick="logOut()">log out</a></li>
                    <?php else : ?>
                        <li><a class="userMenu__item" href="#" onclick="startLogin()">log in</a></li>
                    <?php endif; ?>

                </ul>
            </div>



            <div class="header__linksBand yellowStyled">

                <ul class="userMenu">
                    <?php foreach ($categories as $key => $category) : ?>
                        <li> <a class="userMenu__item" href=<?= "\"/goodsCategory.php?id=" . $category['id'] . "\"" ?>>
                                <?= $category['name'] ?> </a></li>
                    <?php endforeach; ?>
                </ul>
            </div>

            <div class="header__linksBand grayStyled">

                <p class="header__info <?= (isset($_SESSION['name'])) ? "non-displayed" : "" ?>">
                    Welcome visitor you can
                    <a href="#" onclick="startLogin()" class="signUp-link">login</a>
                    or
                    <a href="regNewUser.php" class="signUp-link">create an account</a>.
                </p>
                <div class="header__socialIconsContainer <?= (isset($_SESSION['name'])) ? "non-displayed" : "" ?>">

                    <a href="#" class="header__socialIcon"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                    <a href="#" class="header__socialIcon"><i class="fa fa-google-plus" aria-hidden="true"></i></a>
                    <a href="#" class="header__socialIcon"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                </div>

                <div class="searchForm">
                    <input type="search" placeholder="Enter search string here...">
                    <button><i class="fa fa-search" aria-hidden="true"></i></button>
                </div>
            </div>




        </div>