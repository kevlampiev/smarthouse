<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><?= $document ?></title>
</head>

<body>
    <div class="container">
        <div class="registration_form">
            <h3>Registration form</h3>

            <form action="#" method="POST">
                <label for="login">Login:</label>
                <input type="text" name="login">

                <label for="password">Password:</label>
                <input type="password" name="password">

                <label for="repass">Re-enter password:</label>
                <input type="password" name="repass">

                <label for="name">Name:</label>
                <input type="text" name="name">

                <label for="phone">Phone number:</label>
                <input type="text" name="phone">

                <label for="email">Email:</label>
                <input type="text" name="email">

                <label for="address">Adress:</label>
                <textarea name="address" id="address" cols="30" rows="10"></textarea>

                <label for="comment">Comment:</label>
                <textarea name="comment" id="comment" cols="30" rows="10"></textarea>

                <div class="button_cont">
                    <input type="submit" value="Save">
                    <input type="reset" value="Reset">
                </div>

            </form>
        </div>
    </div>

    <div class="error-notification hidden-form">
        <div>
            <p class="errors-list"> <?= "$errors" ?> </p>
            <button onclick="errWindowClose()">Close</button>
        </div>
    </div>

    <link rel="stylesheet" href="styles/mainStyle.css">
    <link rel="stylesheet" href="styles/signUp.css">
    <script src="js/signUp.js"></script>


</body>

</html>