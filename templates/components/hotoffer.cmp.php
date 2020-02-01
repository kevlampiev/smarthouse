<div class="goods-list">
    <h2 class="grayTitle"> Hot offers </h2>

    <?php foreach ($hotOffer as $key => $good) : ?>
        <div class="goods-item">
            <a href=<?= "good.php?id=" . $good['id']  ?>>
                <img src=<?= "\"/img/goods/" . $good['img'] . "\""; ?>>
            </a>
            <h3> <?= $good['name']; ?> </h3>
            <p> <?= $good['price'] . " " . $good['currency']; ?> </p>
            <button type="submit" class="buiItBtn orangeStyled" onclick="addItemToCarts(<?= $good['id'] . ',\'' . $good['name'] . '\',\'' . $good['img'] . '\',' . $good['price'] . ',\'' . $good['currency'] . '\'' ?> )">
                Buy it
            </button>
        </div>
    <?php endforeach; ?>

</div>