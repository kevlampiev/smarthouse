let dbCardUrl = "/cartController.php"

/**
 * Возвращает содержимое корзины в виде массива item'ов
 */
async function getDBCart() {
    let result = await postJson(dbCardUrl, {
        action: "getCart"
    })
    return result
}

/**
 * Сохраняет корзину в базу, старая корзина затирается 
 * @param {Array} cart 
 */
function saveBDCart(cart) {
    let result = await postJson(dbCardUrl, {
        action: "saveCart",
        cart: cart
    })
    return result
}

/**
 * сливает корзину с корзиной, сохраненной в базе
 * @param {Array} cart 
 */
function mergeToBDCart(cart) {
    let result = await postJson(dbCardUrl, {
        action: "mergeCarts",
        cart: cart
    })
    return result
}

/**
 * Добавляет товары в корзину. Количество товара изменяется на величину item.amount
 * @param {CartItem} item 
 */
function addToDBCartItem(item) {
    let result = await postJson(dbCardUrl, {
        action: "addToCart",
        cart: item
    })
    return result
}

/**
 * Заменяет позицию в козине, количество товара будет равно item.count
 * @param {CartItem} item 
 */
function editDBCartItem(item) {
    let result = await postJson(dbCardUrl, {
        action: "editCartItem",
        cart: item
    })
    return result
}