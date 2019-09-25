<?php include 'header.php';
require './php/conection.php';
session_start();

$query = "SELECT * FROM tb_Orientacao";
$pedido = mysqli_query($conn, $query);


?>

    <form id="user_form" action="./php/user_form.php" method="post">
        <fieldset> 
        <legend>Cadastro de TCC</legend>
            <section id="tcc_data" class="w3-content w3-display-container">
                <div  class="mySlides">
                    <div class="input_blocks">
                        <label for="nome_projeto">Nome do Projeto</label>
                        <input type="text" require>
                    </div>
                    <div class="input_blocks">
                    <label for="orientacao">Orientação</label>
                        <select name="orientacao">
                            <?php while($resultado = mysqli_fetch_array($pedido)){
                             echo "<option value='$resultado[idOrientacao]'>$resultado[idOrientacao]</option>";};?>
                        </select>
                    </div>
                    <div class="input_blocks">
                        <label for="tema">Tema do Projeto</label>
                        <input type="text" name="tema">
                    </div>
                </div>
                <div  class="mySlides">
                    <div class="input_blocks">
                        <label for="palavra1">Palavra Chave #1</label>
                        <input type="text" name="palavra1">
                    </div>
                    <div class="input_blocks">
                        <label for="palavra2">Palavra Chave #2</label>
                        <input type="text" name="palavra2">
                    </div>
                    <div class="input_blocks">
                        <label for="palavra3">Palavra Chave #3</label>
                        <input type="text" name="palavra3">
                    </div>
                    <div class="input_blocks">
                        <label for="palavra4">Palavra Chave #4</label>
                        <input type="text" name="palavra4">  
                    </div>
                    <div class="input_blocks">
                        <label for="palavra5">Palavra Chave #5</label>
                        <input type="text" name="palavra5">
                    </div>
                </div>
                <div  class="mySlides">
                    <div class="input_blocks">
                        <label for="area">Area do Projeto</label>
                        <input type="text" name="area">
                    </div>
                    
                    <div>
                        <label for="membro1">Primeiro Membro</label>
                        <input type="text" name="membro1">
                    </div>

                    <div>
                        <label for="membro2">Primeiro Membro</label>
                        <input type="text" name="membro2">
                    </div>
                    
                    <div>
                        <label for="status">status</label>
                        <input type="text" name="status">
                    </div>
    
                    <div>
                        <label for="documento">Documento TCC</label>
                        <input type="text" name='documento'>
                    </div>
                    <button type="submit">Enviar</button>
                </div>
            </section>
        </fieldset>
    </form>
    <button class="w3-button w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
        <button class="w3-button w3-display-right" onclick="plusDivs(+1)">&#10095;</button>
<script>

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


<?php include 'footer.php';?>
