<?php

$conn = new mysqli("localhost","root", "", "crudflutter");

$id = $_POST["id"];
$nip = $_POST["nip"];
$nama = $_POST["nama"];
$tanggal_lahir = $_POST["tanggal_lahir"];
$nomor_telepon = $_POST["nomor_telepon"];
$email = $_POST["email"];
$password = $_POST["password"];

$data = mysqli_query($conn, "update pegawai set nip='$nip', nama='$nama', tanggal_lahir='$tanggal_lahir', nomor_telepon='$nomor_telepon', email='$email', password='$password' where id='$id' ");

if($data) {
    echo json_encode([
        'pesan' => 'Sukses']);
}else{
    echo json_encode([
        'pesan' => 'Gagal']);
}

?>