<?php

session_start();
if(!isset($_SESSION['idusuario'])){
    login();
}elseif (isset ($_GET['controller'])) {
    switch ($_GET['controller']){
        case
    }    
}