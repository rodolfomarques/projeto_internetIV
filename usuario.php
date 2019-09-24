<?php include 'header.php';?>

    <form id="user_form" action="./php/user_form.php" method="post">
        <fieldset> 
        <legend>Cadastro de Usuário</legend>
            <section id="user_cat">
                <h2>Qual Sua Categoria?</h2>
                <label for="user_type">
                    <input type="radio" name="user_type" id="" value="aluno">
                    Estudante
                </label>
                <label for="user_type">
                    <input type="radio" name="user_type" id="" value="professor">
                    Professor
                </label>
                <label for="user_type">
                    <input type="radio" name="user_type" id="" value="convidado">
                    Convidado
                </label>
            </section>
            <section id="user_data">

            </section>
        </fieldset>
    </form>



<?php include 'footer.php';?>

