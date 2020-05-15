<%-- 
    Document   : dashboard
    Created on : Jun 26, 2019, 5:41:33 PM
    Author     : carlos
--%>

<%@page import="Entidad.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Estilo/dashboardstyle.css">
        <link rel="stylesheet" href="Estilo/cerrarsesion.css">
        <title>JSP Page</title>
        <%
        
        RequestDispatcher vista = null;
        Usuario user = new Usuario();    
        String id = session.getAttribute("UsrId").toString();
        user.Obtener(id);
        String rol = user.RolCod;
        String displayPerfiles = "";
        String displayUsuarios = "";
        if(session.getAttribute("UsrId")==null){              
            response.sendRedirect("iniciar");
            //response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        }else{
            if(rol.equals("DOC")){
                response.sendRedirect("Perfil?PerCod=" + user.getPerfil() + "&Mode=UPD");
            }else if(rol.equals("DEC")){
                displayUsuarios = "style= 'display:none;'";
            }
             
        }                        
        %>    
    </head>
    <body>

<header>
  <div class="nav-bar">
    Universidad Catolica de Honduras
    <br><span>"Nuestra Señora de la Paz"</span>
      <nav id="menuTop">
        <ul>
          <li class="nivel1"><a href="a"><img src="img/usuario.png" alt="" class="cerrarsesionimage"></a>
            <ul>
              <a href="perfil"><li class="nivel2">Perfil</li></a>
              <a href="cerrar"><li class="nivel2">Cerrar Sesión</li></a>
              
            </ul>
          </li>
        </ul>
      </nav>
  </div>
</header>
<body>

  <div class="logounicah">
    <img src="img/unicah2.png" alt="">
  </div>

  <div class="contenedor">
    <div <%=displayUsuarios%>  class="box">
      <a href="Usuarios" class="letter">Mantenimiento Usuario</a>
    </div>
    <div class="box">
      <a href="Perfiles" class="letter">Mantenimiento Perfil</a>
    </div>
  </div>
    </body>
</html>
