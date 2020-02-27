<?php
require_once __DIR__ . "/../settings/common.php";
require_once __DIR__ . "/../engine/functions.php";
require_once __DIR__ . "/../engine/goodsCategory.data.php";
require_once __DIR__ . "/../engine/categories.data.php";
require_once __DIR__ . "/../engine/auth.php";


function displayNewPage(int $categoryId): void
{
    $goodsOfCategory = goodsOfCategory($categoryId);

    if (!$goodsOfCategory) {
        echo render("notFound.tpl", [
            'document' => "Smarthouse",
            'categories' => categories()
        ]);
    } else {
        echo render("goodsCategory.tpl", [
            'document' => "Smarthouse",
            'categories' => categories(),
            'goodsOfCategory' => $goodsOfCategory,
            'categoryInfo' => currentCategoryInfo($categoryId),
            'currentPage' => 0
        ]);
    }
    autoLogin();
}


function returnGoods(int $categoryId, int $pageNo): string
{
    $goods = goodsOfCategory($categoryId, GOODS_LIM, GOODS_LIM * $pageNo);

    return render('components/goodsCategory.cmp', [
        'goodsOfCategory' => $goods,
        'categoryInfo' => currentCategoryInfo($categoryId),
        'currentPage' => $pageNo
    ]);
}



if ($_SERVER['REQUEST_METHOD'] === "POST") {
    //Пришел пост-запрос на обновление отображенной страницы
    $input = json_decode(file_get_contents("php://input"), true);
    $categoryId = $input['categoryId'];
    $pageNo = $input['pageNo'];

    $html = returnGoods($categoryId, $pageNo);
    echo json_encode(['status' => 'success', 'page' => $html], JSON_UNESCAPED_UNICODE);
} else {
    //первый раз рисует страницу
    $categoryId = (int) $_GET["id"];
    displayNewPage($categoryId);
}
