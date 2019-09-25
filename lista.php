<?php

    include 'header.php';
    require './php/conection.php';

?>

    <section id="tcc_list">
        <button onclick="w3Acordeon('01')" class="w3-button w3-block btn_acordeon">
            <h3>Título: TCC foda!</h3> 
            <h3>Autor: Rodolfo Marques</h3> 
        </button>

        <div id="01" class="w3-container w3-hide tcc_list_item">
            Orientador
            banca
            tema
            local
            palavras chaves
            status

        </div>

        <button onclick="w3Acordeon('02')" class="w3-button w3-block btn_acordeon">
            <h3>Título: TCC foda!</h3> 
            <h3>Autor: Rodolfo Marques</h3> 
        </button>

        <div id="02" class="w3-container w3-hide tcc_list_item">
        <p>Some text..</p>
        </div>

        <button onclick="w3Acordeon('03')" class="w3-button w3-block btn_acordeon">
            <h3>Título: TCC foda!</h3> 
            <h3>Autor: Rodolfo Marques</h3> 
        </button>

        <div id="03" class="w3-container w3-hide tcc_list_item">
        <p>Some text..</p>
        </div> 
    
    </section>

<?php include 'footer.php';?>

