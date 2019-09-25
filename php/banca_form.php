<?php  
require 'conection.php';

session_start();

// Variáveis do local

$Orientador = filter_input(INPUT_POST, 'orientador');
$Membro1 = filter_input(INPUT_POST, 'membro1');
$Membro2 = filter_input(INPUT_POST, 'membro2');

$cadastro_membros = "INSERT INTO tb_Membros(profSIAPE_FK, idMembro1_FK, idMembro2_FK) VALUES ('$Orientador', '$Membro1', '$Membro2')";
$resultado = mysqli_query($conn, $cadastro_membros);
$query =  "SELECT idMembros FROM tb_Membros WHERE profSIAPE_FK = '$Orientador' AND idMembro1_FK = '$Membro1' AND idMembro1_FK = '$Membro2' ORDER BY  idMembros DESC";
$get_id = mysqli_query($conn, $query);
$get_result = mysqli_fetch_array($get_id);

$cadastro_banca = "INSERT INTO tb_Banca(idMembros_FK, statusComparecimento) VALUES ('$get_result[idMembros]', 'Aguardando')";
$result_cadastro_banca = mysqli_query($conn, $cadastro_banca);
$query2 =  "SELECT idBanca FROM tb_Banca ORDER BY idBanca DESC";
$get_idbanca = mysqli_query($conn, $query2);
$get_result_banca = mysqli_fetch_array($get_idbanca);

if(!$result_cadastro_banca){
    
    $_SESSION['banca_feedback'] = "<h2 style='text-align: center;'>Cadastro não realizado</h2>";
    header('Location: ../banca.php');

} else {

    $_SESSION['banca_feedback'] = "<h2 style='text-align: center;'>Cadastro de Banca Realizado com Sucesso sob ID $get_result_banca[idBanca]</h2>";
    header('Location: ../banca.php');
}

?>