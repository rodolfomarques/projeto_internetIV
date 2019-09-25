<?php  
require 'conection.php';

session_start();

// Variáveis do local

$Name = filter_input(INPUT_POST, 'local_name');
$Type = filter_input(INPUT_POST, 'local_tipo');
$Place = filter_input(INPUT_POST, 'localizacao');

$cadastro_local = "INSERT INTO id_Local(nomeLocal, tipoLocal, localizacao) VALUES ('$Name', '$Type', '$Place')";
$resultado = mysqli_query($conn, $cadastro_local);
$query =  "SELECT idLocal FROM id_Local WHERE nomeLocal = '$Name' AND tipoLocal = '$Type' ORDER BY  idLocal DESC";
$get_id = mysqli_query($conn, $query);
$get_result = mysqli_fetch_array($get_id);

if(!$resultado){
    
    $_SESSION['local_feedback'] = "<h2 style='text-align: center;'>Cadastro não realizado</h2>";
    header('Location: ../local.php');

} else {

    $_SESSION['local_feedback'] = "<h2 style='text-align: center;'>Cadastro Realizado com Sucesso sob ID $get_result[idLocal]</h2>";
    header('Location: ../local.php');
}

?>