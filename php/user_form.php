<?php 
require 'conection.php';
session_start();

// variáveis de usário

$Cpf = filter_input(INPUT_POST, 'cpf'); 
$Nome = filter_input(INPUT_POST, 'nome');
$CEP = filter_input(INPUT_POST, 'cep');
$Numero = filter_input(INPUT_POST, 'numero_end');
$Complemento = filter_input(INPUT_POST, 'complemento_end');
$Email = filter_input(INPUT_POST, 'email');
$Sexo = filter_input(INPUT_POST, 'sexo');
$Categoria = filter_input(INPUT_POST, 'user_type');

// variáveis da tabela telefone

$Ddd = filter_input(INPUT_POST, 'ddd_tel'); 
$Numero = filter_input(INPUT_POST, 'num_telefone'); 
$Tipo = filter_input(INPUT_POST, 'tipo_tel'); 

$res_cadastro_tel = mysqli_query($conn, "INSERT INTO tb_Telefone(`dddTel`, `numeroTel`, `tipoCel`) VALUES ('$Ddd','$Numero','$Tipo')");
$pega_id_tel = "SELECT idTel FROM tb_Telefone WHERE dddTel = '$DDD' AND numeroTel = '$Numero' AND tipoCel = '$Tipo'";
$res_id_tel = mysqli_query($conn, $pega_id_tel);
$retorno_id_tel = mysqli_fetch_array($res_id_tel);
$cadastro_usuario = "INSERT INTO tb_Pessoa(CPF, pessoaNome, CEP_FK, endNumero, endComplemento, idTelefone_FK, pessoaEmail,pessoaSexo) VALUES ('$Cpf', '$Nome', '$CEP', '$Numero', '$Complemento','$retorno_id_tel[idTel]', '$Email', '$Sexo')";
$res_cadastro_user = mysqli_query($conn, $cadastro_usuario);

if($Categoria == 'professor'){
    
    // variáveis sobre os professores
    $Matricula = filter_input(INPUT_POST, 'siape');
    $Area = filter_input(INPUT_POST, 'area_conhecimento');
    $cadastro_professor = "INSERT INTO tb_Professor VALUES ('$Matricula', '$Cpf','$Area')";
    $res_cadastro_cat = mysqli_query($conn, $cadastro_professor);

}elseif ($Categoria == 'estudante') {
    
    // variáveis sobre os estudantes
    $Matricula = filter_input(INPUT_POST, 'matricula');
    $PeriodoIngresso = filter_input(INPUT_POST, 'periodo_ingresso');
    $PeriodoAtual = filter_input(INPUT_POST, 'periodo_atual');
    $Curso = filter_input(INPUT_POST, 'curso');
    $cadastro_estudante = "INSERT INTO tb_Estudante VALUES ('$Matricula', '$Cpf','$PeriodoIngresso','$PeriodoAtual', '$Curso')";
    $res_cadastro_cat = mysqli_query($conn, $cadastro_estudante);

} elseif ($Categoria == 'convidado') {

     // variáveis sobre os convidados
     $Instituicao = filter_input(INPUT_POST, 'instituicao_convidado');
     $Profissao = filter_input(INPUT_POST, 'profissao_convidado');
     $Area = filter_input(INPUT_POST, 'area_conhecimento');
  
     $cadastro_convidado = "INSERT INTO tb_Convidado(pessoaCPF_FK, idAreaConhecimento_FK, instituicao, profissao ) VALUES ('$Cpf','$Area','$Instituicao', '$Profissao')";
    $res_cadastro_cat = mysqli_query($conn, $cadastro_convidado);
}


if(!$res_cadastro_cat OR !$res_cadastro_user){
    
    $_SESSION['cadastro_feedback'] = "<h2 style='text-align: center;'>Cadastro não realizado</h2>";
    header('Location: ../index.php');

} else {

    $_SESSION['cadastro_feedback'] = "<h2 style='text-align: center;'>Cadastro Realizado com Sucesso</h2>";
    header('Location: ../index.php');
}

?>
