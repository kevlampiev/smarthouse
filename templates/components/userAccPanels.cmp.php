<h2 class="grayTitle"> User account </h2>
<div class="userAccount">

    <div class="userAccPanel">
        <h3> User Info </h3>
        <img src="img/users/no_photo.png" alt="userPhoto" class="user_card">

        <div class="fieldBlock" id="login">
            <div class="fieldBlock__label"> Login:</div>
            <div class="fieldBlock__data"> <?= $userInfo['login']; ?></div>
            <div class="fieldBlock__editBtn">
                <a href="#" onclick="startEditUserData('login','Login:')"> <i class="fa fa-pencil" aria-hidden="true"></i></a>
            </div>
        </div>

        <div class="fieldBlock" id="password">
            <div class="fieldBlock__label"> Password:</div>
            <div class="fieldBlock__data"> ***************</div>
            <div class="fieldBlock__editBtn">
                <a href="#" onclick="alert('not available now')"> <i class="fa fa-pencil" aria-hidden="true"></i></a>
            </div>
        </div>

        <div class="fieldBlock" id="name">
            <div class="fieldBlock__label"> Name:</div>
            <div class="fieldBlock__data"> <?= $userInfo['name']; ?></div>
            <div class="fieldBlock__editBtn">
                <a href="#" onclick="startEditUserData('name','Full name:')"> <i class="fa fa-pencil" aria-hidden="true"></i></a>
            </div>
        </div>

        <div class="fieldBlock" id="phone">
            <div class="fieldBlock__label"> Phone №:</div>
            <div class="fieldBlock__data"> <?= $userInfo['phone']; ?></div>
            <div class="fieldBlock__editBtn">
                <a href="#" onclick="startEditUserData('phone','Phone number: ')"> <i class="fa fa-pencil" aria-hidden="true"></i></a>
            </div>
        </div>

        <div class="fieldBlock" id="email">
            <div class="fieldBlock__label"> E-mail:</div>
            <div class="fieldBlock__data"> <?= $userInfo['email']; ?></div>
            <div class="fieldBlock__editBtn">
                <a href="#" onclick="startEditUserData('email','E-mail adress:')"> <i class="fa fa-pencil" aria-hidden="true"></i></a>
            </div>
        </div>

        <div class="fieldBlock" id="address">
            <div class="fieldBlock__label"> Adress:</div>
            <div class="fieldBlock__data"> <?= $userInfo['address']; ?></div>
            <div class="fieldBlock__editBtn">
                <a href="#" onclick="startEditUserData('address','Adress:')"> <i class="fa fa-pencil" aria-hidden="true"></i></a>
            </div>
        </div>

    </div>
    <div class="userAccPanel">
        <h3> Orders </h3>
        <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit.
            Corporis dolore fuga porro dolor? Laboriosam provident ex
            recusandae odio quaerat ad labore iure ducimus ratione soluta
            voluptatem natus saepe nostrum nulla qui perferendis quasi facilis,
            neque quo alias doloremque reprehenderit aspernatur dignissimos
            aperiam. Temporibus, veniam veritatis debitis nostrum quas beatae sint?
        </p>
    </div>

    <div class="fieldEditForm hidden-form" data-fieldName="noname">

        <div>

            <h4>variable</h4>
            <input type="text" value="variable">


            <button onclick="proceedEditUserData()">Save</button>
            <button onclick="cancelEditUserData()">Cancel</button>
        </div>

    </div>
</div>

<script src="js/userAccount.js" defer></script>