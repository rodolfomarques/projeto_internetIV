<?php include "header.php";?>

    <div id="main_container">
        <form action="" method="post">
            <fieldset>
                <h2 class="sub_title">Seja bem vindo ao nosso sistema. O que você gostaria de fazer</h2>
                <ul id="first_menu">
                    <li class="menu_item"><a href="./usuario.php" class="menu_link">Cadastrar Usuário</a></li>
                    <li class="menu_item"><a href="./orientacao.php" class="menu_link">Cadastrar Orientação</a></li>
                    <li class="menu_item"><a href="./local.php" class="menu_link">Cadastrar Local</a></li>
                    <li class="menu_item"><a href="./banca.php" class="menu_link">Cadastrar banca</a></li>
                    <li class="menu_item"><a href="./tcc.php" class="menu_link">Cadastrar TCC </a></li>
                    <li class="menu_item"><a href="./lista.php" class="menu_link">Pesquisar TCC</a></li>
                </ul>
                <?php 
                if(isset($_SESSION['cadastro_feedback'])){
                    echo $_SESSION['cadastro_feedback'];
                    unset($_SESSION['cadastro_feedback']);
                }
            ?>
                <button type='button' name=></button>
            </fieldset>
        </form>
    </div>



<?php include "footer.php";?>