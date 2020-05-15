<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link href="style.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
    </head>
    <body style="font-family: 'Roboto', sans-serif;">
        <center>
            <div>
                <h1>UNICAH</h1>
                <form action="index.jsp">
                    <fieldset style="">
                        <br/>
                        <label for="txtUsuario">Usuario: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>&nbsp;
                        <input type="text" name="txtUsuario"></input><br/><br/>
                        <label for="txtPass">Contraseña: </label>&nbsp;
                        <input type="password" name="txtPass"></input><br/><br/>
                        <button name="btnAcceder" type="submit">Acceder</button><br/><br/>
                        <label>¿Desea recuperar la contraseña?</label><br/><br/>
                    </fieldset>
                    <br/><br/>
                </form>
            </div>
        </center>
    </body>
</html>
