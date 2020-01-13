let header = new Vue({
    el: '.header',
    data: {
        registered: false,
        name: 'guest',
        cartCount: 0,
        cartSumm: 0,
        logInInProcess: false, //открывает диалоговае окно ввода пароля
        login: "",
        password: "",
        rememberMe: true
    },
    methods: {

        startLogin() {
            this.logInInProcess = true;
        },
        closeLoginWnd() {
            this.logInInProcess = false;
        },
        cancelLogin() {
            this.login = "";
            this.password = "";
            closeLoginWnd()
        },
        drawName() {
            let nameEl = document.querySelector('.userNameDspl');
            nameEl.innerHTML = this.name;
        },
        async proceedLogin() {
            let requestBody = {
                login: this.login,
                password: this.password
            }
            if (this.rememberMe) {
                requestBody.rememberMe = "rememberMe"
            }

            let result = await postJson('/login.php', requestBody)
            if ('error' in result) {
                alert(result.error)
            } else {
                this.name = result.name
                this.cart_count = result.cart_count
                this.cart_summ = result.cart_summ
                this.registered = true
                this.closeLoginWnd()
                this.drawName()
            }
        },
        getData() {
            this.registered = (getCookie('is_logged_in') == 'true')
        }
    },
    mounted() {
        this.getData()
    },
})