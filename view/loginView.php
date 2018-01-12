<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div>REGISTRO
            <form action="../index.php?controller=usuario&action=c" method="POST">
                username<input type="text" name="username"><br>
                password <input type="password" name="password"><br>
                fullname<input type="text" name="fullname"><br>
                correo<input type="email" name="correo"><br>
               <input type="submit">
            </form>
            LOGIN
            <form action="../index.php?controller=usuario&action=log" method="POST">
                username<input type="text" name="username">
               password <input type="password" name="password">
             
               <input type="submit">
            </form>
            
        </div>
    </body>
</html>
