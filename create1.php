<?php

$conn = new mysqli("localhost","root", "", "crudflutter");

$nomor_rm = $_POST["nomor_rm"];
$nama = $_POST["nama"];
$tanggal_lahir = $_POST["tanggal_lahir"];
$nomor_telepon = $_POST["nomor_telepon"];
$alamat = $_POST["alamat"];


$data = mysqli_query($conn, "insert into pasien set nomor_rm='$nomor_rm', nama='$nama', tanggal_lahir='$tanggal_lahir', nomor_telepon='$nomor_telepon', alamat='$alamat'");

if($data) {
    echo json_encode([
        'pesan' => 'Sukses']);
}else{
    echo json_encode([
        'pesan' => 'Gagal']);
}

?>