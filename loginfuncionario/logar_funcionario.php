<?php
require_once("../conexao.php");
?>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

<body div class="p-3 mb-2 bg-dark-subtle text-center">

        <div class="col">Logar como Funcionário</h1>
            <div id="formContent">
                <div class="fadeIn first">
                </div>
                <!-- Login Form -->
                <form action="login_funcionario.php" method="POST">
                    <input type="text" class="w-25 p-3" id="floatingInput" name="usuario_funcionario" placeholder="login">
                    <div class="form-floating">
                        <input type="password" class="w-25 p-3" id="floatingPassword" name="senha_funcionario" placeholder="senha">
                        <label for="floatingPassword"></label>
                    </div>
          
            </div>
            <button class="w-25 p-3 btn-primary" type="submit" name="acessar">Logar 
            </button>
            <a href="../login/logar.php" type="button" >          
            Entrar Como Admin.
            </a>
                
        </div>
        </div>
        
    </form>
</body>
</html>


