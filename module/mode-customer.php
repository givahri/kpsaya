<?php

if(userLogin()['level'] == 3) {
    header("location:" . $main_url . "error-page.php");
    exit();
}

function insert($data){
    global $koneksi;

    $nama          = mysqli_real_escape_string($koneksi, $data['nama']);
    $telepon       = mysqli_real_escape_string($koneksi, $data['telepon']);
    $alamat        = mysqli_real_escape_string($koneksi, $data['alamat']);
    $keterangan    = mysqli_real_escape_string($koneksi, $data['keterangan']);

    $sqlCustomer   = "INSERT INTO tbl_customer VALUES (null, '$nama', '$telepon','$keterangan','$alamat')";

    mysqli_query($koneksi, $sqlCustomer);
    return mysqli_affected_rows($koneksi);

}

function delete($id)
{
    global $koneksi;

    $sqlDelete  = "DELETE FROM tbl_customer WHERE id_customer = $id";
    mysqli_query($koneksi, $sqlDelete);

    return mysqli_affected_rows($koneksi);
}

function update($data){
    global $koneksi;

    $id            = mysqli_real_escape_string($koneksi, $data['id']);
    $nama          = mysqli_real_escape_string($koneksi, $data['nama']);
    $telepon       = mysqli_real_escape_string($koneksi, $data['telepon']);
    $alamat        = mysqli_real_escape_string($koneksi, $data['alamat']);
    $keterangan    = mysqli_real_escape_string($koneksi, $data['keterangan']);

    $sqlCustomer   = "UPDATE tbl_customer SET 
                        nama     = '$nama',
                        telepon  = '$telepon',
                        deskripsi= '$keterangan',
                        alamat   = '$alamat'
                        WHERE id_customer = $id 
                        ";

    mysqli_query($koneksi, $sqlCustomer);
    return mysqli_affected_rows($koneksi);

}
