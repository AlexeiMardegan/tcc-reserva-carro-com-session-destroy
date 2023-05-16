<?php
if (isset($_POST["sair"])) 
    $_SESSION = array();

    session_destroy();
 ?>
            <script>
                window.location.href = "index.php";
                alert("Sessão deletada");
            </script>
            
