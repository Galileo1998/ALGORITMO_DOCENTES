<%-- 
    Document   : EntradaPerfil
    Created on : Jun 15, 2019, 7:51:02 AM
    Author     : carlos
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entidad.Usuario"%>
<%@page import="java.util.Iterator"%>
<%@page import="Entidad.ComboBox"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidad.Perfil"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="Database.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="esp">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
        <link rel="stylesheet" href="Estilo/stylenewuser.css">                        
        <title>Perfil</title>
        <%
          RequestDispatcher vista = null;  
          String js = "Vistas/validaciones.js";
        %>
        <script type="text/javascript" src="<%=js%>">                
        </script>          
        <%                         
          Usuario user = new Usuario();
          if(session.getAttribute("UsrId")==null){               
              response.sendRedirect("iniciar"); 
          }else{
              String id = session.getAttribute("UsrId").toString();
              user.Obtener(id);
          }
          DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
          Calendar cal = Calendar.getInstance();
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
            <h1 class="unicah">Nuevo Perfil</h1>
        </div>
        
        <div id="logo" class="logounicah">
          <img src="img/unicah2.png" alt="">
        </div>
        <%                            
            Perfil perfil = new Perfil();
            
            String Mode = request.getParameter("Mode");
            perfil.PerCod = request.getParameter("PerCod");
            
            Boolean ins = false;
            Boolean upd = false;                        
            
            if(Mode == null){
                
            }else if(Mode.equals("DSP")){               
                perfil.Obtener(perfil.PerCod);
               
            }else if(Mode.equals("UPD")){
                upd = true;
                perfil.Obtener(perfil.PerCod);
            }else if(Mode.equals("INS")){
                ins = true;
            }else{
                System.out.println("ERROR EN MODE");
            }            
        
        %>
         <div class="contenedor"> 
            <form class="form" action="Perfil?PerCod=<%= perfil.PerCod %>&Mode=<%= Mode %>" onsubmit="return validateForm()" method="POST">
            <div class="form-header">
              <h1 class= "form-title"><span></span></h1>
            </div>
            
            <label for="Per" class="form-label">Nombre Perfil</label>
            <input lang="esp" id="inputNombre" type="text" class="form-input" name="PerNombre" value="<%= perfil.PerNom %>" ></input>
            <label class="label-error" id="errorNombre"></label>
            
            <label for="Per" class="form-label">Apellido Perfil</label>
            <input lang="esp" id="inputApellido" type="text" class="form-input" name="PerApe" value="<%= perfil.PerApe %>" ></input>
            <label class="label-error" id="errorApellido"></label>
            
            <label for="Per" class="form-label">Fecha de Nacimiento</label>
            <input type="date"  min="01/01/1930" max="12/12/2019" class="form-input" name="PerNacFech" value="<%= perfil.PerNacFech %>"></input>
            
            <label for="Per" class="form-label">ID de Perfil</label>
            <input type="text" class="form-input" name="PerIde" value="<%= perfil.PerIde %>"></input>
            
            <label for="Per" class="form-label">Código Empleado</label>
            <input type="text" class="form-input" name="PerEmpCod" value="<%= perfil.PerEmpCod %>"></input>
            
            <label for="Per" class="form-label">Telefono</label>
            <input type="text" class="form-input" name="PerTel" value="<%= perfil.PerTel %>"></input>
            
            <div class="">
                <legend class="form-label">Genero</legend>
                <%
                
                String masculino = "";
                String feminino = "";  
                if(perfil.PerGen != null){
                    if(perfil.PerGen.equals("masc")){
                        masculino = "checked";                
                    }else{
                        feminino = "checked";
                    }                
                }
                %>
                <input type="radio" class="form-radio" name="PerGen" value="masc" <%=masculino%>> Masculino </input>
                <input type="radio" class="form-radio" name="PerGen" value="fem" <%=feminino%>> Feminino </input>
            </div>            
            
            <label for="Per" class="form-label">Correo</label>
            <input type="mail" class="form-input" name="PerMail" value="<%= perfil.PerMail %>"></input>
                      
            <label for="facultad" class="form-label">Facultad</label>                
            <select class="form-input" name="FacCod">
            <%ArrayList<String> facultades = ComboBox.listarFacultades(); 
                Iterator iter = facultades.iterator();
                String listaFac = "";
                String facultad = "";
                while(iter.hasNext()){
                   listaFac = iter.next().toString();
                   String selected = "";
                   if(perfil.FacCod.equals(listaFac)){
                       selected = "selected";                       
                   }else{
                       selected = "";
                   }                    
            %>
            <option <%=selected%> value="<%=listaFac%>"><%= listaFac  %></option>
            <% } %>
            </select>
            
            
            <label for="Per" class="form-label">Imagen</label>
            <input type="text" class="form-input" name="PerImg" value="<%= perfil.PerImg %>"></input>
            
            <label for="Per" class="form-label">Descripción</label>
            <input type="text" class="form-input" name="PerDesc" value="<%= perfil.PerDesc %>"></input>

            <div class="">
                <legend class="form-label">Estado</legend>
                <%
                String activo = "";
                String inactivo = "";   
                if(perfil.PerEst != null){
                    if(perfil.PerEst.equals("1")){
                        activo = "checked";                
                    }else{
                        inactivo = "checked";
                    }                
                }
                %>                                  
                <input type="radio" class="form-radio" name="PerEst" value="1" <%=activo%>> Activo </input>
                <input type="radio" class="form-radio" name="PerEst" value="0" <%=inactivo%>> Inactivo </input>
            </div>
            
            
            <input type="submit" class="btn-submit" value="Guardar" name="submit"></input>
            
            </form>
        </div>    
            
        <%              
            if(request.getParameter("submit") != null && (upd == true || ins == true)){
                                
                
                if(request.getParameter("PerNombre") != null){
                    perfil.PerNom = request.getParameter("PerNombre");
                }
                
                if(request.getParameter("PerApe") != null){
                    perfil.PerApe = request.getParameter("PerApe");
                }
                
                if(request.getParameter("PerNacFech") != null){
                    perfil.PerNacFech = request.getParameter("PerNacFech").toString();
                    System.out.println("Fecha: " + perfil.PerNacFech);
                }
                
                if(request.getParameter("PerIde") != null){
                    perfil.PerIde = request.getParameter("PerIde");
                }
                
                if(request.getParameter("PerEmpCod") != null){
                    perfil.PerEmpCod = request.getParameter("PerEmpCod");
                }
                
                if(request.getParameter("PerTel") != null){
                    perfil.PerTel = request.getParameter("PerTel");
                }
                
                if(request.getParameter("PerGen") != null){
                    perfil.PerGen = request.getParameter("PerGen");
                }
                
                if(request.getParameter("PerMail") != null){
                    perfil.PerMail = request.getParameter("PerMail");
                }
                
                if(request.getParameter("FacCod") != null){
                    perfil.FacCod = request.getParameter("FacCod");
                }
                
                if(request.getParameter("PerImg") != null){
                    perfil.PerImg = request.getParameter("PerImg");
                }
                
                if(request.getParameter("PerDesc") != null){
                    perfil.PerDesc = request.getParameter("PerDesc");
                }
                
                if(request.getParameter("PerEst") != null){
                    perfil.PerEst = request.getParameter("PerEst");
                }
                
                if(ins == true){
                    if(perfil.Crear()){
                        response.sendRedirect("Perfiles");
                    }
                }else if(upd == true){
                    if(perfil.Actualizar()){
                        String rol = user.RolCod;                        
                        if(rol.equals("DOC")){
                            response.sendRedirect("Perfil?PerCod=" + user.getPerfil() + "&Mode=UPD");
                        }else
                            response.sendRedirect("Perfiles");                        
                    }                    
                }
            }else if(request.getParameter("submit") != null){                
                response.sendRedirect("Perfiles");
            }                                    
        %>
        
        
        <%--
                Perfiles
            PerCod varchar(40) PK 
            PerNom varchar(60) 
            PerApe varchar(60) 
            PerNacFech date 
            PerIdle varchar(20) 
            PerEmpCod varchar(10) 
            PerTel varchar(20) 
            PerGen varchar(5) 
            PerMail varchar(80) 
            FacCod varchar(40) 
            PerImg varchar(250) 
            PerDesc varchar(512) 
            PerEst varchar(5)

        ---%>
        
    </body>
</html>
