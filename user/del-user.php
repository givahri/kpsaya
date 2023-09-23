<?php

session_start();

if(!isset($_SESSION["ssLoginSaya"])) {
  header("location:../auth/login.php");
  exit();
}

require "../config/config.php";
require "../config/functions.php";
require "../module/mode-user.php";

$id   =  $_GET['id'];
$foto =  $_GET['foto'];

if (delete($id, $foto)) {
    echo "
            <script>
                alert('user berhasil di hapus');
                document.location.href = 'data-user.php';
            </script> ";
} else {
    echo "
    <script>
        alert('user gagal di hapus');
        document.location.href = 'data-user.php';
    </script>
";
}
?>