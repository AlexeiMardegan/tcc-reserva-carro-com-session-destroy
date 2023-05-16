<?php 
include_once("../includes.php");
if (isset($_POST["salvarcadastro"]))
{
    $conn = $_SESSION["conexao"];

        $usuario_funcionario = $_POST["usuario_funcionario"];
        $senha_funcionario = $_POST["senha_funcionario"];
        $funcionario_idfuncionario = $_POST["idfuncionario"];

        
        if (!isset($_POST["idfuncionario"])) // Verifica se pegou idfuncionario, se não ele volta ao header.
        {
            header("Location:lista_funcionario.php");
        }
    

        if (($usuario_funcionario == "") || ($senha_funcionario == ""))
        {
            ?>
            <script>
                window.location.href = "form_cadastros.php";
                alert("Você precisa preencher os dados!");
    
            </script>
            <?php
        }
        else 
        {
            $senha_hash_funcionario = hash("sha256", $senha_funcionario); // Variavel chama a função "hash" e então codifica em "sha256" o conteudo do que estiver em $senha_funcionario
            $sql = "INSERT INTO login_funcionario (usuario_funcionario, senha_funcionario, funcionario_idfuncionario) VALUES ('{$usuario_funcionario}', '{$senha_hash_funcionario}', '{$funcionario_idfuncionario}')";
            
            $result = mysqli_query($conn, $sql);
           
      
           if (mysqli_affected_rows($conn) == 1) {
                $_SESSION["usuario_Funcionario_logado"] = mysqli_insert_id($conn);   
            }
            ?>
            <script>
                window.location.href = "form_cadastros.php";
                
                alert("Cadastro efetuado com sucesso!");
            </script>
            <?php  
}
if (!mysqli_affected_rows($conn) == 1)
{
    ?>
    <script>
        window.location.href = "form_cadastros.php";
        alert("Erro ao inserir cadastro!");
    </script>
    <?php  
}
}
// function verifica_usuario($usuario_funcionario, $senha_funcionario)
// {
//     $senha_funcionario = hash("sha256", $senha_funcionario);

//     $sql = "SELECT * FROM login_funcionario WHERE usuario_funcionario = '{$usuario_funcionario}' AND senha_funcionario = '{$senha_funcionario}'";

//     $result = mysqli_query($_SESSION["conexao"], $sql);

//     $response["result"] = $result;

//     $response["response"] = mysqli_num_rows($result) > 0 ? true : false;

//     return $response;
// }

?>