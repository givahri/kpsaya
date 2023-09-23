<?php


session_start();

if(isset($_SESSION["ssLoginSaya"])){
    header("location:../dashboard.php");
    exit();

}

require "../config/config.php";

if(isset($_POST['login'])) {
    $username  = mysqli_real_escape_string($koneksi, $_POST['username']);
    $password  = mysqli_real_escape_string($koneksi, $_POST['password']);
    $queryLogin = mysqli_query($koneksi, "SELECT * FROM tbl_user WHERE username = '$username'");
 
    if(mysqli_num_rows($queryLogin)=== 1) {
        $row = mysqli_fetch_assoc($queryLogin);
        if(password_verify($password, $row['password'])) {
            //set session
            $_SESSION["ssLoginSaya"] = true;
            $_SESSION["ssUserSaya"]  = $username;
            header("location:../dashboard.php");
            exit();

        } else {
            echo "<script> alert('password salah..') </script>";
        }
    } else {
        echo "<script> alert('Username tidak terdaftar..') </script>";
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Login | Nan's Beauty</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?=  $main_url ?>asset/AdminLTE-3.2.0/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="<?=  $main_url ?>asset/AdminLTE-3.2.0/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?=  $main_url ?>asset/AdminLTE-3.2.0/dist/css/adminlte.min.css">
  
  <!-- favicon -->
  <link rel="shortcut icon" href="<?=  $main_url ?>asset/image/nans.png" type="image/x-icon">

  <link rel="stylesheet" href="style.css">
</head>
<body class="hold-transition login-page" id="bg-login">
<div class="login-box slide-down" style="margin-top: -70px ; opacity: .9">
  <!-- /.login-logo -->
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <a href="" class="h1 text-primary"><b >Nans </b> Beauty</a>
    </div>
    <div class="card-body">
      <p class="login-box-msg">Masuk untuk memulai sesi Anda</p>

      <form action="" method="post">
        <div class="input-group mb-4">
          <input type="text" name="username" class="form-control" placeholder="username">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-4">
          <input type="password" name="password" class="form-control" placeholder="Password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        
          <div class="mb-4">
            <button type="submit" name="login" class="btn btn-primary btn-block">Sign In</button>
          </div>
          <!-- /.col -->
    
      </form>

      
      <p class="my-3 text-center">
       <strong>Copyright &copy; 2023 <span class="text-info">Nans Beauty </span></strong>
      </p>
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="<?=  $main_url ?>asset/AdminLTE-3.2.0/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<?=  $main_url ?>asset/AdminLTE-3.2.0/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<?=  $main_url ?>asset/AdminLTE-3.2.0/dist/js/adminlte.min.js"></script>
</body>
</html>
