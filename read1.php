<?php
$conn=new mysqli("localhost", "root", "", "crudflutter");
$query=mysqli_query($conn, "select * from pasien");
$data=mysqli_fetch_all($query,MYSQLI_ASSOC);
echo json_encode($data)
?>