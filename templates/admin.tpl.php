<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title><?= $docTitle ?></title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <link rel="stylesheet" href="styles/admin.css">
</head>

<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <h1>Smarthouse administration panel</h1>
  </nav>
  <div class="form centered-form">
    <form class="form-horizontal" role="form" method="POST">
      <div class="form-group">
        <div class="form-group">
          <label for="inputEmail3" class="col-sm-2 control-label">Login</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" placeholder="Login" name="login">
          </div>
        </div>

        <?php if ($errorCode === 1) : ?>
          <div class="alert alert-danger" role="alert">
            Admin with this login doesn't exist
          </div>
        <?php endif; ?>

        <div class="form-group">
          <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
          <div class="col-sm-10">
            <input type="password" class="form-control" placeholder="Password" name="password">
          </div>
        </div>

        <?php if ($errorCode === 2) : ?>
          <div class="alert alert-danger" role="alert">
            Password is incorrect
          </div>
        <?php endif; ?>

        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-primary btn-sm">Log in</button>
          </div>
        </div>
    </form>
  </div><!-- form  -->

  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>

</html>