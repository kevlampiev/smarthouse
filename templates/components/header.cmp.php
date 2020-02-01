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
    <script src="js/main.js" defer></script>
    <script src="js/cart/cartLocal.js" defer></script>
    <script src="js/cart/cartDB.js" defer></script>
    <script src="js/cart/cartOperations.js" defer></script>
    <script src="js/cart.js" defer></script>
    <script src="js/header.js" defer></script>







    <title><?= $document ?></title>
</head>

<body>
    <div class="container">
        <div class="header">
            <div class="header__linksBand orangeStyled">
                <div class="header__logo">
                    <a href="/"><img class="header__logoImage" src="./img/atom.png" alt="Logo"></a>
                    <p>Atomic</p>

                </div>
                <div class="userNameDspl">
                    <!-- Сбойный элемент: статический текст. Что-то надо придумать поумнее -->
                    <?= $_SESSION['name'] ?>
                </div>



                <ul class="userMenu">
                    <li v-if="registered"> <a class="userMenu__item" href="#">wish list</a></li>
                    <li v-if="registered"><a class="userMenu__item" href="#">my account</a></li>
                    <li v-if="registered"><a class="userMenu__item" href="#">checkout</a></li>

                    <li v-if="registered"><a class="userMenu__item" href="#" @click="logOut()">log out</a></li>
                    <template v-else>
                        <li>
                            <a class="userMenu__item" href="#" @click="startLogin()">log in</a>
                        </li>
                        <li>
                            <a href="regNewUser.php" class="userMenu__item">sign up</a>
                        </li>
                        <li><a href="#" class="userMenu__letterItem"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                        <li><a href="#" class="userMenu__letterItem"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                        <li><a href="#" class="userMenu__letterItem"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>

                    </template>
                    <li> <a class="userMenu__letterItem" href="#" @click="isVisibleCart=!isVisibleCart">
                            <i class="fas fa-shopping-basket"> cart</i>
                        </a>
                    </li>
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


                <div class="searchForm">
                    <input type="search" placeholder="Enter search string here...">
                    <button><i class="fa fa-search" aria-hidden="true"></i></button>
                </div>
            </div>

            <!-- окно ввода пароля -->
            <div class="login-form cyanStyled" v-if="logInInProcess">
                <div>
                    <label for="login">Login: </label>
                    <input type="text" name="login" v-model="login">
                    <label for="password">Password: </label>
                    <input type="password" name="password" v-model="password">
                    <label>
                        <input type="checkbox" name="rememberMe" value="rememberMe" v-model="rememberMe"> Remember me </label>
                    <div class="button_cont">
                        <button @click="proceedLogin()">Ok</button>

                        <button @click="cancelLogin()">Cancel</button>
                    </div>

                </div>
            </div>

            <cart v-bind:isvisiblecart="isVisibleCart" ref="cart"> </cart>

        </div>