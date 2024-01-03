<?php

$conn = new mysqli("localhost","root", "", "crudflutter");
$nomor_rm = $_POST["nomor_rm"];

$data = mysqli_query($conn, "delete  from pasien where nomor_rm='$nomor_rm'");

if($data) {
    echo json_encode([
        'pesan' => 'Sukses']);
}else{
    echo json_encode([
        'pesan' => 'Gagal']);
}

?>