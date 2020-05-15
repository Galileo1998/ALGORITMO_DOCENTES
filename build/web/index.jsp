<%@page import="java.io.PrintWriter"%>
<%@page import="Entidad.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link href="Estilo/style.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
        <%
          RequestDispatcher vista = null;  
          String js = "Vistas/validaciones.js";
        %>
        <script type="text/javascript" src="<%=js%>">                
        </script>    
        <%
          response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");  
          if(session.getAttribute("UsrId") != null){
              System.out.println("USER: INDEX");
              vista = request.getRequestDispatcher("Vistas/dashboard.jsp");
              vista.forward(request, response); 
          }else{
               //response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
          }   
        %>    
    </head>
    <body class="back" oncopy="return false" onpaste="return false">
    <section class="marco">         
        <h1>UNICAH</h1>
        
         
        
        <div class="contenedor">
            <form class="userForm" action="iniciar" method="post">  
                <div><img src="img/unicah.png"></div>
                <br>
                <label class="style_label">Iniciar sesion</label>                
                <input class="style_input" type="text" name="txtUsuario" placeholder="Usuario" id="bloquear" value=""></input>
                <input class="style_input" type="password" name="txtPass" placeholder="Contraseña" value=""></input>
                <button class="style_button" name="btnAcceder" type="submit">Ingresar</button>
                <label><a class="recuperar" href="recuperar">¿Ha olvidado su contraseña?</a></label>
            </form>
        </div>
        <%
          Usuario user = new Usuario();
          String mensaje = "";      
          PrintWriter writer = response.getWriter();
          if(request.getParameter("txtUsuario") != null && request.getParameter("txtPass") != null ){
              if(user.loginuser(request.getParameter("txtUsuario"), request.getParameter("txtPass"))){

              }else{                
                  writer.print("<script type='text/javascript'>\n alert('Usuario o Contraseña Incorrecta'); \n</script>");
              }
          }                    
        %>
        <!--
        <script type="text/javascript">
            alert("");
        </script>
        -->
    </section> 
    </body>
</html>
