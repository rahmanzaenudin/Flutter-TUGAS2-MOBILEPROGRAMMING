<?php

$conn = new mysqli("localhost","root", "", "crudflutter");
$nip = $_POST["nip"];

$data = mysqli_query($conn, "delete  from pegawai where nip='$nip'");

if($data) {
    echo json_encode([
        'pesan' => 'Sukses']);
}else{
    echo json_encode([
        'pesan' => 'Gagal']);
}

?>