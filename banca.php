<?php 
session_start();
include 'header.php';
require './php/conection.php';

$query = "SELECT * FROM tb_Professor JOIN tb_Pessoa ON tb_Pessoa.CPF = tb_Professor.pessoaCPF_FK ORDER BY tb_Pessoa.pessoaNome ASC";
$pedido = mysqli_query($conn, $query);

$query2 = "SELECT * FROM tb_Pessoa JOIN tb_Professor ON tb_Pessoa.CPF = tb_Professor.pessoaCPF_FK JOIN tb_Convidado ON tb_Pessoa.CPF = tb_Convidado.pessoaCPF_FK ORDER BY tb_Pessoa.pessoaNome ASC";
$pedido2 = mysqli_query($conn, $query2);

$query3 = "SELECT * FROM tb_Pessoa JOIN tb_Professor ON tb_Pessoa.CPF = tb_Professor.pessoaCPF_FK JOIN tb_Convidado ON tb_Pessoa.CPF = tb_Convidado.pessoaCPF_FK ORDER BY tb_Pessoa.pessoaNome ASC";
$pedido3 = mysqli_query($conn, $query3);

?>

<form id="orientacao_form" action="./php/banca_form.php" method="post">
    <fieldset>
        <legend>Cadastre Local da banca</legend>
        <section class="default_section">
            <div class="input_blocks">
                <label for="orientador">Nome do Orientador</label>
                <select name="orientador" id="">
                <?php while($resultado = mysqli_fetch_array($pedido)){
                                echo "<option value='$resultado[profSIAPE]'>$resultado[pessoaNome]</option>";};?>
                </select>
            </div>
            <div class="input_blocks">
                <label for="membro1">Membro 1</label>
                <select name="membro1" id="">
                <?php while($resultado2 = mysqli_fetch_array($pedido2)){
                                echo "<option value='$resultado2[CPF]'>$resultado2[pessoaNome]</option>";};?>
                </select>
            </div>
            <div class="input_blocks">
                <label for="membro2">Membro 2</label>
                <select name="membro2" id="">
                <?php while($resultado3 = mysqli_fetch_array($pedido3)){
                                echo "<option value='$resultado3[CPF]'>$resultado3[pessoaNome]</option>";};?>
                </select>
            </div>
        </section>
        <div class="input_blocks">
            <button type="submit">Enviar</button>
        </div>   
        <?php 
                if(isset($_SESSION['banca_feedback'])){
                    echo $_SESSION['banca_feedback'];
                    unset($_SESSION['banca_feedback']);
                }
            ?>
    </fieldset>
</form>

<?php include "footer.php";?>