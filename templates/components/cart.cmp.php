<div class="cartItem">
    <img class="cartItem__img" :src="img_url+cartItem.certImg" alt="Изображение">
    <p class="cartItem__name"> {{cartItem.title}} </p>
    <p class="cartItem__price"> {{cartItem.price.toFixed(2)}}</p>
    <button class="cartItem__plusBtn" @click="$parent.addToCart(cartItem,cartItem.quantity+1)">
        <i class="fa fa-plus" aria-hidden="true"></i>
    </button>
    <input class="cartItem__quantity" type="number" min="0" max="99" v-model="cartItem.quantity" @change="$parent.addToCart(cartItem,cartItem.quantity)">
    <button class="cartItem__minusBtn" @click="$parent.addToCart(cartItem,cartItem.quantity-1)">
        <i class="fa fa-minus" aria-hidden="true"></i>
    </button>
    <button class="cartItem__minusBtn" @click="$parent.deleteFromCart(cartItem)">
        <i class="fa fa-trash-o" aria-hidden="true"></i>
    </button>
    <p class="cartItem__totalSum">
        {{(Number(cartItem.price)*Number(cartItem.quantity)).toFixed(2)}}</p>
</div>