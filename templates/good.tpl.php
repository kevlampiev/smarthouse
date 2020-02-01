<?php require("../templates/components/header.cmp.php"); ?>


<div class="main">
    <div class="good_desc">



        <div class="good_info">

            <img class="good_main_img" src=<?= "img/goods/" . $good['img'] ?> alt="">
            <h1 class="good_name"> <?= $good['name'] ?></h1>
            <p><?= $good['description'] ?></p>
            <p class="price_info"> <?= $good['price'] . " " . $good['currency']; ?> </p>
            <button type="submit" class="buiItBtn orangeStyled" onclick="addItemToCarts(<?= $good['id'] . ',\'' . $good['name'] . '\',\'' . $good['img'] . '\',' . $good['price'] . ',\'' . $good['currency'] . '\'' ?> )">Buy it</button>
        </div>
    </div>

</div>

<style>
    .good_desc {
        padding: 25px;
    }

    .good_name {
        color: maroon;
    }

    .good_info {
        height: 250px;
    }

    .good_main_img {
        float: left;
        height: 230px;
    }

    .price_info {
        display: inline-block;
        color: maroon;
        font-size: 20px;
        font-weight: 800;
        background-color: #999;
        padding: 5px;
    }
</style>


<?php require("../templates/components/footer.cmp.php"); ?>


<!-- </div> -->