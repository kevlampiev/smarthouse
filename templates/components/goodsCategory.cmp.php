<div class="goods-list">
    <h2 class="grayTitle"> <?= $categoryInfo['name'] ?> </h2>

    <?php foreach ($goodsOfCategory as $key => $good) : ?>
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

<nav aria-label="Page navigation example">
    <ul class="pagination">
        <li class="page-item">
            <a class="page-link" href="#" onclick="getGoodsPage(<?= $categoryInfo['categoryId'] ?>,<?= max(0, $currentPage - 1) ?>)">Previous</a>
        </li>

        <?php for ($i = 0; $i <= min(9, floor(($categoryInfo['goods_count'] / GOODS_LIM))); $i++) : ?>
            <li class="page-item <?php if ($i == $currentPage) : ?> currentPage <?php endif; ?>">
                <a class="page-link" href="#" onclick="getGoodsPage(<?= $categoryInfo['categoryId'] ?>,<?= $i ?>)">
                    <?= ($i + 1) ?>
                </a>
            </li>
        <?php endfor; ?>
        <?php if ($categoryInfo['goods_count'] >= 96) : ?>
            <li class="page-item "> <a class="page-link" href="#">...</a></li>
        <?php endif; ?>

        <li class="page-item"><a class="page-link" href="#" onclick="getGoodsPage(<?= $categoryInfo['categoryId'] ?>,<?= min(10, $currentPage + 1) ?>)">Next</a></li>
    </ul>
</nav>