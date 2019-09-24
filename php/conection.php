<?php 

$host = 'localhost';
$db_user = 'rodolfom';
$db_password = 'toor';
$db_name = 'dbGestaoTCC';

$conn = mysqli_connect($host, $db_user, $db_password, $db_name);

if(!$conn){
    echo 'Falha ao conectar: '.mysqli_connect_error();
}

?>