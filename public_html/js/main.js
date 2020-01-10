function logOut() {
    let date = new Date(Date.now() - 3600)
    date = date.toUTCString()
    document.cookie = "login='';expires=" + date
    document.cookie = "password='';expires=" + date
    document.cookie = "username='';expires=" + date
    location.reload()

}

function startLogin() {

    let wnd = document.querySelector('.login-form');
    wnd.classList.remove("hidden-form");
}

function closeLoginWnd() {
    let wnd = document.querySelector('.login-form');
    wnd.classList.add("hidden-form");
}

function cancelLogin() {
    closeLoginWnd()
}

function setUserData(userInfo) {
    let userNameEl = document.querySelector('.userNameDspl')
    userNameEl.innerHTML = userInfo.name;

    let singUpEl = document.querySelector('.header__info')
    //singUpEl.classList.add('hidden-form');
    singUpEl.style.display = "none"

    let socialIcons = document.querySelector('.header__socialIconsContainer');
    socialIcons.style.display = "none"
}


async function postJson(url, data) {
    try {
        const result = await fetch(url, {
            method: 'POST',
            headers: {
                "Content-type": "application/json"
            },
            body: JSON.stringify(data)
        });
        return result.json();
    } catch (err) {
        console.error(err);
        //НАдо добить вывод ошибки в отдельном окошке всплывающем
    }
}


async function proceedLogin() {

    //let loginWnd = document.querySelector('.login-form')
    let lgn = document.getElementsByName('login')[0].value
    let pass = document.getElementsByName('password')[0].value
    let rememberMe = document.getElementsByName('rememberMe')[0].value

    let result = await postJson('/login.php', {
        login: lgn,
        password: pass,
        rememberMe
    })

    if ('error' in result) {
        alert(result.error)
    } else {
        setUserData(result)
        closeLoginWnd()
    }
}