<%-- 
    Document   : recuperar_login
    Created on : 7 jun. 2019, 18:36:22
    Author     : Dennis McCoy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Estilo/style.css"/>
        <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
        <title>JSP Page</title>
    </head>
   <body class="back">
    <section >
            <div>
                <h1>UNICAH</h1>
                <form action="recuperacionEmail">
                    <div><img src="img/UNICAH_logo.png"></div>
                    <fieldset class="tam_m">
                        <br/>
                        <label class="iniciar_sesion">Recuperar contraseña</label>
                        <br/><br/>
                        <input class="style_input" type="email" name="txtCorreo" placeholder="Correo"></input><br/><br/>
                        <button class="style_button" name="btnAcceder" type="submit">Enviar correo</button><br/><br/>
                        <label><a class="recuperar" href="recuperar_login.jsp">Se enviará un mensaje a su correo.</a></label><br/><br/>
                    </fieldset>
                    <br/><br/>
                </form>
            </div>
    </section>
    </body>
</html>
