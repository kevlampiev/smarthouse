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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>



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
                <ul class="userMenu">
                    <li> <a class="userMenu__item" href="#">wish list</a></li>
                    <li><a class="userMenu__item" href="#">my account</a></li>
                    <li><a class="userMenu__item" href="#">shopping card </a></li>
                    <li><a class="userMenu__item" href="#">checkout</a></li>
                    <li><a class="userMenu__item" href="#">shopping card</a></li>
                    <li> <a class="userMenu__item" href="#" @click="isVisibleCart=!isVisibleCart">
                            <i class="fas fa-shopping-basket"></i>
                            <!-- <span class="basket_indicator">{{cartAmount}}</span> -->
                        </a> </li>
                </ul>
            </div>



            <div class="header__linksBand yellowStyled">

                <ul class="userMenu">
                    <li> <a class="userMenu__item" href="#">Kits</a></li>
                    <li><a class="userMenu__item" href="#">controllers</a></li>
                    <li><a class="userMenu__item" href="#">sensors </a></li>
                    <li><a class="userMenu__item" href="#">software</a></li>

                </ul>
            </div>

            <div class="header__linksBand grayStyled">

                <p class="header__info">Welcome visitor you can login or create an account.</p>
                <div class="header__socialIconsContainer">
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