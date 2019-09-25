<?php  
require 'conection.php';

session_start();

// Variáveis do Orientação

$Siape = filter_input(INPUT_POST, 'orientador');
$Matricula = filter_input(INPUT_POST, 'estudante');

$cadastro_orientacao = "INSERT INTO tb_Orientacao(estMatricula_FK, profSIAPE_FK, idProjeto_FK) VALUES ('$Matricula', '$Siape', '0')";
$resultado = mysqli_query($conn, $cadastro_orientacao);
$query =  "SELECT idOrientacao FROM tb_Orientacao WHERE estMatricula_FK = '$Matricula' AND profSIAPE_FK = '$Siape' ORDER BY  idOrientacao DESC";
$get_id = mysqli_query($conn, $query);
$get_result = mysqli_fetch_array($get_id);

if(!$resultado){
    
    $_SESSION['orientacao_feedback'] = "<h2 style='text-align: center;'>Cadastro não realizado</h2>";
    header('Location: ../orientacao.php');

} else {

    $_SESSION['orientacao_feedback'] = "<h2 style='text-align: center;'>Cadastro Realizado com Sucesso sob ID $get_result[idOrientacao]</h2>";
    header('Location: ../orientacao.php');
}

?>