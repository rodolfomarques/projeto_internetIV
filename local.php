<?php 
session_start();
include 'header.php';

?>

<form id="orientacao_form" action="./php/local_form.php" method="post">
    <fieldset>
        <legend>Cadastre Local de Apresentação</legend>
        <section class="default_section">
            <div class="input_blocks">
                <label for="local_name">Nome do Local</label>
                <input type="text" name="local_name">
            </div>
            <div class="input_blocks">
                <label for="local_tipo">Tipo</label>
                <input type="text" name="local_tipo" placeholder="Sala, Auditório...">
            </div>
            <div class="input_blocks">
                <label for="localizacao">Localização</label>
                <input type="text" name="localizacao">
            </div>
        </section>
        <div class="input_blocks">
            <button type="submit">Enviar</button>
        </div>   
        <?php 
                if(isset($_SESSION['local_feedback'])){
                    echo $_SESSION['local_feedback'];
                    unset($_SESSION['local_feedback']);
                }
            ?>
    </fieldset>
</form>

<?php include "footer.php";?>