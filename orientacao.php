<?php 
session_start();
include 'header.php';
require './php/conection.php';

$query = "SELECT * FROM tb_Estudante JOIN tb_Pessoa ON tb_Pessoa.CPF = tb_Estudante.pessoaCPF_FK ORDER BY tb_Pessoa.pessoaNome ASC";
$pedido = mysqli_query($conn, $query);

$query2 = "SELECT * FROM tb_Professor JOIN tb_Pessoa ON tb_Pessoa.CPF = tb_Professor.pessoaCPF_FK ORDER BY tb_Pessoa.pessoaNome ASC";
$pedido2 = mysqli_query($conn, $query2);

?>

<form id="orientacao_form" action="./php/orientacao_form.php" method="post">
    <fieldset>
        <legend>Cadastre Sua Orientação</legend>
        <section class="default_section">
            <div class="input_blocks">
                <label for="estudante">Nome do Estudante</label>
                <select name="estudante" id="">
                <?php while($resultado = mysqli_fetch_array($pedido)){
                                echo "<option value='$resultado[estMatricula]'>$resultado[pessoaNome]</option>";};?>
                </select>
            </div>
            <div class="input_blocks">
                <label for="orientador">Nome do Orientador</label>
                <select name="orientador" id="">
                <?php while($resultado2 = mysqli_fetch_array($pedido2)){
                                echo "<option value='$resultado2[profSIAPE]'>$resultado2[pessoaNome]</option>";};?>
                </select>
            </div>
        </section>
        <div class="input_blocks">
            <button type="submit">Enviar</button>
        </div>   
        <?php 
                if(isset($_SESSION['orientacao_feedback'])){
                    echo $_SESSION['orientacao_feedback'];
                    unset($_SESSION['orientacao_feedback']);
                }
            ?>
    </fieldset>
</form>

<?php include "footer.php";?>