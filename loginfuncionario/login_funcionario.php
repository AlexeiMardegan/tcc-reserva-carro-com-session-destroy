<?php

require_once("../conexao.php");
// if (!isset($_SESSION)) {
//     session_start($sql = "SELECT idlogin_Funcionario FROM login_funcionario WHERE usuario_funcionario_funcionario = '{$usuario_funcionario_funcionario}' AND senha_funcionario = '{$senha_funcionario}'");
  
// }
// $sql = "SELECT idlogin_funcionario FROM login WHERE usuario_funcionario = '{$usuario_funcionario}' AND senha_funcionario = '{$senha_funcionario}'";
if (isset($_POST["acessar"])) {
    $usuario_funcionario = $_POST["usuario_funcionario"];
    $senha_funcionario = $_POST["senha_funcionario"];

    if (($usuario_funcionario == "") || ($senha_funcionario == "")) {
?>
        <script>
            window.location.href = "../index.php";
            alert("Você precisa preencher usuário e senha_funcionario para acessar o sistema!");
        </script>
        <?php

    } else {
        
        $sql = "SELECT idlogin_funcionario FROM login_funcionario WHERE usuario_funcionario = '$usuario_funcionario' AND senha_funcionario = '$senha_funcionario'";
$query = mysqli_query($conn, $sql);
        $response = verifica_usuario_funcionario($usuario_funcionario, $senha_funcionario);

        if ($response["response"]) {
            $usuario_funcionario = mysqli_fetch_assoc($response["result"]);
            $_SESSION["usuario_funcionario_logado"] = $usuario_funcionario["idlogin_funcionario"];
            //unset($_SESSION["idfuncionario"]); apenas para remover o idfuncionario que estava sendo adicionado 1 por 1 a cada agendamento
            //unset($_SESSION["idcarro"]);
            //unset($_SESSION["last_activity"]);
            //unset($_SESSION["usuario_logado"]);
            unset($_SESSION["usuario_Funcionario_logado"]);
            header("Location: ../homefuncionario/home_funcionario.php");
        
        } else {
        ?>
            <script>
                window.location.href = "../index.php";
                alert("Usuário Não Encontrado!");
            </script>
<?php
        }
    }
}

function verifica_usuario_funcionario($usuario_funcionario, $senha_funcionario)
{
    $senha_funcionario = hash("sha256", $senha_funcionario);

    $sql = "SELECT * FROM login_funcionario WHERE usuario_funcionario = '{$usuario_funcionario}' AND senha_funcionario = '{$senha_funcionario}'";

    $result = mysqli_query($_SESSION["conexao"], $sql);

    $response["result"] = $result;

    $response["response"] = mysqli_num_rows($result) > 0 ? true : false;

    return $response;
}
