<div class="goods-list">
    <h2 class="grayTitle"> Most popular goods </h2>

    <? foreach ($mostPopular as $key => $good) : ?>
        <div class="goods-item">

            <img src=<?= "\"/img/goods/" . $good['img'] . "\""; ?>>
            <h3> <?= $good['name']; ?> </h3>
            <p> <?= $good['price'] . " " . $good['currency']; ?> </p>
            <button type="submit" class="buiItBtn orangeStyled">Buy it</button>
        </div>
    <? endforeach; ?>

</div>