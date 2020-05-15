<%-- 
    Document   : EntradaUsuario
    Created on : Jun 15, 2019, 8:12:40 AM
    Author     : carlos
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidad.ComboBox"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="Entidad.Usuario"%>
<%@page import="Database.Conexion"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Estilo/stylenewuser.css">
        <title>Nuevo Usuario</title>
        <%
          RequestDispatcher vista = null;  
          String js = "Vistas/validaciones.js";
        %>
        <script type="text/javascript" src="<%=js%>">                
        </script> 
        <%
          if(session.getAttribute("UsrId")==null){              
              response.sendRedirect("iniciar"); 
          }  
            
        %> 
    </head>
    <body>
      <header>
        <div class="nav-bar">
            <a href="iniciar">
            Universidad Catolica de Honduras
            <br><span>"Nuestra Señora de la Paz"</span>
            </a>
        </div>
      </header>
        <div class="titulo">
          <h1 class="unicah">Nuevo Usuario</h1>
        </div>

        <div id="logo" class="logounicah">
          <img src="img/unicah2.png" alt="">
        </div>
        <%                            
            Usuario user = new Usuario();
            
            String Mode = request.getParameter("Mode");
            user.UsrId = request.getParameter("UsrId");
            
            Boolean ins = false;
            Boolean upd = false;                        
            String displayUltimo = "";
            if(Mode == null){
                
            }else if(Mode.equals("DSP")){               
                user.Obtener(user.UsrId);
            }else if(Mode.equals("UPD")){
                upd = true;
                user.Obtener(user.UsrId);
            }else if(Mode.equals("INS")){
                ins = true;
                displayUltimo = "style= 'display:none;'";
            }else{
                System.out.println("ERROR EN MODE");
            }            
        
        %>        
        <div class="contenedor"> 
            <form class="form" action="Usuario?UsrId=<%= user.UsrId %>&Mode=<%= Mode %>" onsubmit="return validateUsuarios()" method="POST">
            <div class="form-header">
              <h1 class= "form-title"><span></span></h1>
            </div>

            <label for="user" class="form-label">Usuario</label>
            <input type="text" class="form-input" id="inputUsr" name="UsrUsr" value="<%= user.UsrUsr %>" placeholder="Escriba el nombre de Usuario"></input>
            <label class="label-error" id="errorUsr"></label>

            <label for="password" class="form-label">Contraseña</label>
            <input type="password" class="form-input" id="inputCont" name="UsrPwd" value="<%= user.UsrPwd %>" placeholder="Escriba su Contraseña"></input>
            <label class="label-error" id="errorCont"></label>
            
            <label for="nombre" class="form-label">Nombre Completo</label>
            <input type="text" class="form-input" name="UsrNom" value="<%= user.UsrNom %>" placeholder="Nombre Completo"></input>

            
            <label for="facultad" class="form-label">Facultad</label>                
            <select class="form-input" name="FacCod">
            <%ArrayList<String> facultades = ComboBox.listarFacultades(); 
                Iterator iter = facultades.iterator();
                String listaFac = "";
                String facultad = "";
                while(iter.hasNext()){
                   listaFac = iter.next().toString();
                   String selected = "";
                   if(user.FacCod.equals(listaFac)){
                       selected = "selected";                       
                   }else{
                       selected = "";
                   }                    
            %>
            <option <%=selected%> value="<%=listaFac%>"><%= listaFac  %></option>
            <% } %>
            </select>
            
            <label for="rol" class="form-label">Rol</label>                
            <select class="form-input" name="RolCod">
            <%ArrayList<String> roles = ComboBox.listarRoles();
                Iterator iterRol = roles.iterator();
                String listaRol = "";
                String rol = "";
                while(iterRol.hasNext()){
                   listaRol = iterRol.next().toString();
                   String selected = "";
                   if(user.RolCod.equals(listaRol)){
                       selected = "selected";                       
                   }else{
                       selected = "";
                   }                    
            %>
            <option <%=selected%> value="<%=listaRol%>"><%= listaRol  %></option>
            <% } %>
            </select>

            <label for="telefono" class="form-label">Telefono</label>
            <input id="inputTele" type="text" class="form-input" name="UsrTel" value="<%= user.UsrTel %>" placeholder="Numero de telefono"></input>
            <label class="label-error" id="errorTele"></label>
            
            <label for="mail" class="form-label">Correo</label>
            <input id="inputCorreo" type="mail"  class="form-input" name="UsrMail" value="<%= user.UsrMail %>" placeholder="Escriba su Correo"></input>
            <label class="label-error" id="errorCorreo"></label>
            
            <div <%=displayUltimo%>>                
                <label for="acceso"class="form-label">Ultimo Acceso</label>
                <input type="text" class="form-input" name="UsrstAcc" value="<%= user.UsrstAcc %>" readonly></input>
            </div>

            <div class="">
              <legend class="form-label">Estado</legend>
              <%
              String activo = "";
              String inactivo = "";
              if(user.UsrEst.equals("1")){
                  activo = "checked";
              }else{
                  inactivo = "checked";
              }
              %>
              <input type='radio' class="form-radio" name="UsrEst" value='1' <%=activo%>>Activo</input>
              <input type='radio' class="form-radio" name="UsrEst" value='0' <%=inactivo%>>Inactivo</input>
            </div>

            <input type="submit" class="btn-submit" name="submit" id="submit" value="Guardar">
            </form>
        </div>
        <%                                   
            
            if(request.getParameter("submit") != null && (upd == true || ins == true)){
                
                if(request.getParameter("UsrUsr") != null){
                    user.UsrUsr = request.getParameter("UsrUsr");                     
                }
                
                if(request.getParameter("UsrPwd") != null){
                    user.UsrPwd = request.getParameter("UsrPwd");
                }
                
                if(request.getParameter("UsrNom") != null){
                     user.UsrNom = request.getParameter("UsrNom");
                }
                
                if(request.getParameter("UsrTel") != null){
                     user.UsrTel = request.getParameter("UsrTel");
                }
                
                if(request.getParameter("UsrMail") != null){
                    user.UsrMail = request.getParameter("UsrMail");
                }
                
                if(request.getParameter("UsrstAcc") != null){
                     user.UsrstAcc = request.getParameter("UsrstAcc");
                }
                
                if(request.getParameter("UsrEst") != null){
                     user.UsrEst = request.getParameter("UsrEst");                     
                }
                
                if(request.getParameter("FacCod") != null){
                     user.FacCod = request.getParameter("FacCod");
                }
                
                if(request.getParameter("RolCod") != null){
                     user.RolCod = request.getParameter("RolCod");
                }
                
                if(ins == true){
                    if(user.Crear()){                        
                        response.sendRedirect("Usuarios");
                    }
                }else if(upd == true){
                    if(user.Actualizar()){
                        response.sendRedirect("Usuarios");
                    }
                }else{
                    System.out.println("Error En El Submit");
                }
            }else if(request.getParameter("submit") != null){
                response.sendRedirect("Usuarios");
            }            
        %>
            
        <%--
            Usuarios
        UserUser varchar(40) PK 
        UsrPwd varchar(60) 
        UsrNom varchar(120) 
        UsrTel varchar(20) 
        UsrMail varchar(120) 
        UsrstAcc datetime 
        UsrEst varchar(45) 
        FacCod varchar(45)
        --%>
    </body>
</html>
