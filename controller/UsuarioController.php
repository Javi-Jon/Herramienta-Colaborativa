<?php
require_once 'ControllerGenerico.php';
require_once __DIR__ .'/../Modelo/Usuario.php';
require_once 'ProyectoController.php';
require_once 'TareasController.php';
class UsuarioController extends Controller{
      
    function run($action){
        switch ($action) {
            case 'c':
                $this->registrar();
                break;
            case 'log':
                $this->logearse();
                break;
            case 'rbyuser':
                $this->buscarByUsername();                
                break;
            case 'rself':
                $this->buscarSelf();
                break;
            case 'rcomp':
                $this->buscarCompaneros();
                break;
            case 'confirm':
                $this->confirmarCuenta();
                break;
            case 'uuser':
                $this->actualizarUser();
                break;
            case 'logout':
                unset($_SESSION['idusuario']);
                header("Location: index.php");
                break;
            default:
                break;
        }
    }
    function registrar() {
        $usuario=new Usuario();
        $usuario->setUsername($_POST['username']);
        $usuario->setPassword($_POST['password']);
        $usuario->setTipo(0);
        $usuario->setFullname($_POST['fullname']);
        $usuario->setCorreo($_POST['correo']);
        $id=$usuario->registrar();
        if ($id!=0){
            $mensaje = '<a href="http://172.20.224.102/HColaborativ/index.php?confirm=afusdfiunsdug&controller=usuario&action=confirm&id='.$id.'">te has registrado con exito</a> ';

        //para el envío en formato HTML 
        $headers = "MIME-Version: 1.0\r\n";
        $headers .= "Content-type: text/html; charset=iso-8859-1\r\n";

        //dirección del remitente 
        $headers .= "From: javier marin <pruebasjavier3@gmail.com>\r\n";

        //dirección de respuesta, si queremos que sea distinta que la del remitente 
        $headers .= "Reply-To: pruebasjavier3@gmail.com\r\n";

     if (@mail($usuario->getCorreo(), 'pruebaclase', $mensaje, $headers)) {
           $this->view('login', ['success'=>'Registro efectuado con exito en cosa de 30 segundos recibirás el e-mail de verificación']);    
        } else {
           $this->view('login', ['error'=>'Error de servidor por favor ponte en contacto con el administrador de la web']);    
        } 
        } else {
            $this->view('login', ['error'=>'El nombre de usuario y/o el correo ya estan en uso']);    
        }
        
        
       
    }
    function logearse() {
        $usuario=new Usuario();
        $usuario->setUsername($_POST['username']);
        $usuario->setPassword($_POST['password']);        
        $item=$usuario->login();
        
       if(isset ($item->tipo)){
            if($item->tipo==0){
                 $this->view('login',['error'=>'Esta cuenta aun no esta verificada']);
            }else{
                if (password_verify($usuario->getPassword(), $item->password)) {
                    $_SESSION['idusuario'] = $item->id;
                    index();
                }else{
                         $this->view('login',['error'=>'Login incorrecto']);
                }
            }
       
        } else {
            $this->view('login',['error'=>'Login incorrecto']);

        } 
    }
    function buscarByUsername(){
        $user=new Usuario();
        $user->setUsername($_POST['username']);
        $ausuario=$user->getUsuarioByUsername();
        echo json_encode($ausuario);              
    }
    function buscarSelf(){
        $user=new Usuario();
        $user->setId($_SESSION['idusuario']);        
        $ausuario=$user->getUsuarioByID();
        echo json_encode($ausuario);
//        return $ausuario;      
        
    }

    function getInfoUsuario($idusuario){
         $pc=new ProyectoController();
          $proyectos=  $pc->getProyectosUsuario($idusuario);
          $usuario=new Usuario();
          $usuario->setId($idusuario);
         $datosusuario= $usuario->getUsuarioByID();
          $tc=new TareasController();
          foreach($proyectos as &$proyecto){
            $numeros=$tc->getProgreso($proyecto['id']);
            if($numeros[0]->total==0){
                $proyecto['prog'] = 0;
                
            } else {
                $proyecto['prog']= round($numeros[1]->total/$numeros[0]->total*100);

            }           
          }
          unset($proyecto);
         
          return ["proyectos"=>$proyectos,"usuario"=>$datosusuario];
    }
    function buscarCompaneros(){
        $usuario=new Usuario();
        $usuario->setId($_SESSION['idusuario']);
        $compas=$usuario->getCompaneros();
        echo json_encode($compas);        
    }
    function confirmarCuenta(){
        $usuario=new Usuario();
        $usuario->setId($_GET['id']);
        $filas=$usuario->confirmAcc();
        if($filas==1){
            $_SESSION['idusuario']=$_GET['id'];
      
            header('Location:index.php');
      
        }
    }

    function actualizarUser(){
        $v=false;
        $usuario=new Usuario();
        $usuario->setId($_SESSION['idusuario']);
        $usuario->setUsername($_POST['username']);
        if(isset($_POST['password'])&& $_POST['password']!=''){
             $usuario->setPassword(password_hash($_POST['password'], 1));
             $v=true;
        }
       
        $usuario->setFullname($_POST['fullname']);
        $usuario->setCorreo($_POST['correo']);
        if($v){
            $uuser=$usuario->updateUsuarioByID();
        }else{
             $uuser=$usuario->updateUsuarioByIDsinContra();
        }
        
        if ($uuser == 1) {
            echo '1';
        } else {
            echo '0';
        }
//        return $uuser;

    }
    
}
