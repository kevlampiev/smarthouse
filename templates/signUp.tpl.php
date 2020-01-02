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

                <label for="adress">Adress:</label>
                <textarea name="adress" id="adress" cols="30" rows="10"></textarea>

                <label for="comment">Comment:</label>
                <textarea name="comment" id="comment" cols="30" rows="10"></textarea>

                <div class="button_cont">
                    <input type="submit" value="Save">
                    <input type="reset" value="Reset">
                </div>

            </form>
        </div>
    </div>
    <style>
        .container {
            width: 1000px;
            height: 100vh;
            margin: 0 auto;
            background-image: url("img/smartHouse.jpg");
            background-size: cover;
            position: relative;
        }

        .registration_form {
            position: fixed;
            transform: translate(-50%, -50%);
            top: 50%;
            left: 50%;

            width: 700px;
            opacity: 0.7;
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 10px;
            box-shadow: 7px 13px 24px 13px rgba(0, 0, 0, 0.45);
        }

        .registration_form form {
            border: 1px solid #ccc;
            padding: 10px;
        }

        .registration_form label {
            width: 500px;
            color: maroon;
        }

        .registration_form input,
        textarea {
            width: 650px;
            color: maroon;
            margin-bottom: 10px;
            min-height: 20px;
            border-radius: 7px;
            border: none;
            background-color: #ddd;
            padding: 5px 15px;
        }

        .registration_form input[type="submit"],
        input[type="reset"] {
            width: 100px;
            color: #fff;

            border: none;
            background-color: orangered;
            padding: 5px 15px;
            margin: 0 15px;
        }

        .button_cont {
            display: flex;
            justify-content: center;
            width: 650px;
        }

        h3 {
            width: 100%;
            background-color: orangered;
            color: #fff;
            text-align: center;
        }
    </style>
</body>

</html>