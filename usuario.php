<?php include 'header.php';
require './php/conection.php';

session_start();

$query = "SELECT * FROM tb_AreaConhecimento ORDER BY idAreaConhecimento ASC";
$pedido = mysqli_query($conn, $query);

$query2 = "SELECT * FROM tb_AreaConhecimento ORDER BY idAreaConhecimento ASC";
$pedido2 = mysqli_query($conn, $query2);



?>

    <form id="user_form" action="./php/user_form.php" method="post">
        <fieldset class="w3-content w3-display-container"> 
        <legend>Cadastro de Usuário</legend>
            <div  class="mySlides">
                <section id="user_cat">
                    <h2>Qual Sua Categoria?</h2>
                    <label for="user_type">
                        <input type="radio" name="user_type" id="" value="estudante" onclick="catSelector()">
                        Estudante
                    </label>
                    <label for="user_type">
                        <input type="radio" name="user_type" id="" value="professor" onclick="catSelector()">
                        Professor
                    </label>
                    <label for="user_type">
                        <input type="radio" name="user_type" id="" value="convidado" onclick="catSelector()">
                        Convidado
                    </label>
                </section>
            </div>
            <div  class="mySlides">
                <section id="user_data">
                    <div>
                        <label for="cpf">CPF</label>
                        <input name="cpf" type="text">
                    </div>
                    <div>
                        <label for="nome">Nome Completo</label>
                        <input name="nome" type="text" >
                    </div>
                    <div>
                        <label for="cep">CEP</label>
                        <input name="cep" type="text">
                    </div>
                    <div>
                        <label for="numero_end">Número da Residência</label>
                        <input name="numero_end" type="text" >
                    </div>
                    <div>
                        <label for="complemento_end">Complemento</label>
                        <input name="complemento_end" type="text" placeholder="apto 101">
                    </div>
                    <div>
                        <label for="email">E-mail</label>
                        <input name="email" type="email" >
                    </div>
                    <div>
                        <label for="sexo">Sexo</label>
                        <input name="sexo" type="text" placeholder="M - F" >
                    </div>
                    <div>
                        <label for="ddd_tel">DDD</label>
                        <input name="ddd_tel" type="number">
                    </div>
                    <div>
                        <label for="num_telefone">Telefone</label>
                        <input name="num_telefone" type="text" >
                    </div>
                    <div>
                        <label for="tipo_tel">Tipo do Aparelho</label>
                        <input name="tipo_tel" type="text" placeholder="Fixo, celular">
                    </div>
                </section>
            </div>
            <div class="mySlides">
                <section id="cat_data">
                 
                </section>
            </div>
            <?php 
                if(isset($_SESSION['cadastro_feedback'])){
                    echo $_SESSION['cadastro_feedback'];
                    unset($_SESSION['cadastro_feedback']);
                }
            ?>
            </fieldset>
        </form>
        
        <button class="w3-button w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
        <button class="w3-button w3-display-right" onclick="plusDivs(+1)">&#10095;</button>
<script>

var professorData = {
    siape: `<label for="siape">SIAPE</label><input name="siape" type="text" require>`,
    areaConhecimento: `<label for="area_conhecimento">Área de Conhecimento</label>
                        <select name="area_conhecimento">
                            <?php while($resultado = mysqli_fetch_array($pedido)){
                             echo "<option value='$resultado[idAreaConhecimento]'>$resultado[areaDeConhecimento]</option>";};?>
                        </select>`,
    button: `<button type="submit">Enviar</button>`
}

var estudanteData = {
    matricula: `<label for="matricula">Matrícula</label>
                <input name="matricula" type="text" require>`,
    periodoIngresso: `<label for="periodo_ingresso">Período de Ingresso</label>
                    <input name="periodo_ingresso" type="text" require>`,
    periodoAtual: `<label for="periodo_atual">Período atual</label>
                <input name="periodo_atual" type="text" require>`,
    curso: `<label for="curso">Curso</label>
            <input name="curso" type="text" require>`,
    button: `<button type="submit">Enviar</button>`
}

var convidadoData = {
    instituicao: `<label for="instituicao_convidado">Instituição de Origem</label>
                <input name="instituicao_convidado" type="text" require>`,
    profissao: `<label for="profissao_convidado">Profissão</label>
                <input name="profissao_convidado" type="text" require>`,
    areaConhecimento: `<label for="area_conhecimento">Área de Conhecimento</label>
                        <select name="area_conhecimento">
                        <?php while($resultado2 = mysqli_fetch_array($pedido2)){
                             echo "<option value='$resultado2[idAreaConhecimento]'>$resultado2[areaDeConhecimento]</option>";};?>
                        </select>`,
    button: `<button type="submit">Enviar</button>`
}

function catSelector(){

    var dataPlace = document.getElementById('cat_data');
    selectors = document.querySelectorAll('[name=user_type]:checked');
    
    if(selectors[0].value == 'professor') {
        dataPlace.innerHTML = professorData.siape + professorData.areaConhecimento + professorData.button;
    } else if(selectors[0].value == 'estudante'){
        dataPlace.innerHTML = estudanteData.matricula + estudanteData.periodoIngresso + estudanteData.periodoAtual + estudanteData.curso + estudanteData.button;
    } else if(selectors[0].value == 'convidado'){
        dataPlace.innerHTML = convidadoData.instituicao + convidadoData.profissao + convidadoData.areaConhecimento + convidadoData.button;
    }
}

var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length} ;
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  x[slideIndex-1].style.display = "block";
}

</script>


<?php 
include 'footer.php';?>