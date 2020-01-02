<div class="goods-list">
    <h2 class="grayTitle"> Hot offers </h2>

    <? foreach ($hotOffer as $key => $good) : ?>
        <div class="goods-item">
            <a href=<?= "good.php?id=" . $good['id']  ?>>
                <img src=<?= "\"/img/goods/" . $good['img'] . "\""; ?>>
            </a>
            <h3> <?= $good['name']; ?> </h3>
            <p> <?= $good['price'] . " " . $good['currency']; ?> </p>
            <button type="submit" class="buiItBtn orangeStyled">Buy it</button>
        </div>
    <? endforeach; ?>

</div>