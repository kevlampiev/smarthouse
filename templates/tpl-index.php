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
    <link rel="stylesheet" href="styles/slider.css">

    <title><?= $document ?></title>
</head>

<body>
    <div class="container">
        <div class="header">
            <div class="header__linksBand orangeStyled">
                <div class="header__logo">
                    <img class="header__logoImage" src="./img/atom.png" alt="Логотип">
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
        <div class="main">
            <h2 class="grayTitle"> featured </h2>

            <component>header</component>

            <goods-list ref="catalog" :isVisibleCart="isVisibleCart">

            </goods-list>

            <div class="main__nav">

            </div>


        </div>
        <div class="footer">
            <div class="footer__additional yellowStyled bottomYellowBordered">
                <article>
                    <h3>SUSPENDISSE SED</h3>
                    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Natus, quibusdam. Sequi voluptatem
                        sapiente odio explicabo quam consequuntur eaque quo suscipit.</p>
                </article>
                <article>
                    <h3>SUSPENDISSE SED</h3>
                    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Natus, quibusdam. Sequi voluptatem
                        sapiente odio explicabo quam consequuntur eaque quo suscipit.</p>
                </article>
                <article>
                    <h3>SUSPENDISSE SED</h3>
                    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Natus, quibusdam. Sequi voluptatem
                        sapiente odio explicabo quam consequuntur eaque quo suscipit.</p>
                </article>

            </div>
            <div class="footer__contacts  darkGrayStyled bottomGrayBordered">
                <article>
                    <h3>about us</h3>
                    <p> Lorem ipsum dolor sit amet consectetur adipisicing elit. </p>
                </article>
                <article>
                    <h3>information</h3>
                    <ul>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Delivery Informarion</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Terms & Conditions</a></li>
                    </ul>
                </article>
                <article>
                    <h3>customer service</h3>
                    <ul>
                        <li><a href="#">Contact Us</a></li>
                        <li><a href="#">Returns</a></li>
                        <li><a href="#">Site Map</a></li>
                    </ul>
                </article>
                <article>
                    <h3>my account</h3>
                    <ul>
                        <li><a href="#">My account</a></li>
                        <li><a href="#">order history</a></li>
                        <li><a href="#">Wish list</a></li>
                        <li><a href="#">newsletter</a></li>
                    </ul>
                </article>
                <article>
                    <h3>extras</h3>
                    <ul>
                        <li><a href="#">brands</a></li>
                        <li><a href="#">gift vouchers</a></li>
                        <li><a href="#">affiliates</a></li>
                        <li><a href="#">specials</a></li>
                    </ul>
                </article>

            </div>

        </div>

        <cart :isVisibleCart="isVisibleCart" ref="cart"> </cart>


        <error_notification :display="displayErrorNotification" :message="notificationMessage"> </error_notification>
        <buy_notification :display="displayBuyNotification"> </buy_notification>


    </div>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.17/dist/vue.js"></script>
    <script src="js/catalog.js"></script>
    <script src="js/search.js"></script>
    <script src="js/cart.js"></script>
    <script src="js/error_notification.js"></script>
    <script src="js/buy_notification.js"></script>
    <script src="js/slider.js"></script> -->
    <script src="js/main.js"></script>


</body>

</html>