<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><? $document ?></title>
</head>

<body>
    <div class="notFoundBox">
        <div>
            <h1 class="error_header">Error 404</h1>
            <p>This page can't be found</p>
            <p>Press <a href="/">here </a> to return ...</p>
        </div>
    </div>
    <style>
        body {
            position: relative;
            height: 100vh;
            width: 100vw;
            background-image: url("img/no-way.jpeg");

        }

        .notFoundBox {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fbf2d3;
            color: black;
            width: 500px;
            padding: 25px;
            font-size: 25px;
            box-shadow: 10px 10px 5px 2px rgba(0, 0, 0, 0.52);

        }

        .notFoundBox div {
            border: 1px solid #777;
            padding: 25px;

        }

        .error_header {
            color: maroon;
            width: 100%;
            text-align: center;
        }
    </style>
</body>

</html>