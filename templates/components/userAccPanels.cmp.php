<h2 class="grayTitle"> User account </h2>
<div class="userAccount">

    <div class="userAccPanel">
        <h3 > User Info </h3>
        <img src="img/users/no_photo.png" alt="userPhoto" class="user_card">
                <p>Login:</p>
                <input type="text" name="login" v-model="login" v-bind:class="{error_data: !loginValid&&this.loginEntered}" @input.lazy="loginEntered=true">
                
                <p>Name:</p>
                <input type="text" name="name" @input.lazy="nameEntered=true">

                <p>Phone number:</p>
                <input type="text" name="phone" v-model="phone" pattern="2-[0-9]{3}-[0-9]{3}" v-bind:class="{error_data: !phoneValid&&phoneEntered}" @input.lazy="phoneEntered=true">

                <p>Email:</p>
                <input type="text" name="email" v-model="email" v-bind:class="{error_data: !emailValid&&emailEntered}" @input.lazy="emailEntered=true">

                <p>Adress:</p>
                <textarea name="address" id="address" cols="30" rows="10"></textarea>

                <p>Comment:</p>
                <textarea name="comment" id="comment" cols="30" rows="10"></textarea>        
    </div>
    <div class="userAccPanel">
        <h3 > Orders </h3>
        <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. 
            Corporis dolore fuga porro dolor? Laboriosam provident ex 
            recusandae odio quaerat ad labore iure ducimus ratione soluta 
            voluptatem natus saepe nostrum nulla qui perferendis quasi facilis, 
            neque quo alias doloremque reprehenderit aspernatur dignissimos 
            aperiam. Temporibus, veniam veritatis debitis nostrum quas beatae sint?
        </p>
    </div>
</div>