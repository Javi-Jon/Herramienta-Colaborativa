
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
            <form action='../index.php?controller=usuario&action=rbyuser' method="POST">
                <input type="text" name="username">
                <input type="submit">
            </form>
            
        </div>
    </body>
</html>
