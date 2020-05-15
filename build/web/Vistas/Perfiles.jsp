<%-- 
    Document   : Mantenimiento Perfiles
    Created on : Jun 12, 2019, 12:47:19 AM
    Author     : carlos
--%>

<%@page import="Entidad.Usuario"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidad.Perfil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet, Database.*" %>

<!DOCTYPE html>
<html lang="esp">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Mantenimiento de Perfiles</title>
        <link rel="stylesheet" href="Estilo/styleMantenimientoPerfiles.css">
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
            <a href="iniciar">
            Universidad Catolica de Honduras
            <br><span>"Nuestra Señora de la Paz"</span>
            </a>
          </div>
        </header>
        <%
          boolean query = false;  
          String busqueda = "";
          if(request.getParameter("txtBusqueda") != null){
              busqueda = request.getParameter("txtBusqueda");   
              query = true;
              System.out.println("Query: " + query + " busqueda: " + busqueda);
              if(busqueda.equals("")){
                  response.sendRedirect("Perfiles");
              }
          }           
        %>

        <h1><a href="Perfiles">Perfiles</a></h1>
        <div class="contenedor">
        <form action="Perfiles" method="GET">
            <div class="busqueda">                
                <input type="text" name="txtBusqueda" value=""/>
                <button>Buscar</button>            
            </div>           
        </form>
        <table>
            <thead>
                <tr>
                    <th>Nombre</th>                    
                    <th>Correo</th>
                    <th>Facultad</th>     
                    <th><a href="Perfil?PerCod=&Mode=INS"> + </a></th>
                    <th>Clases</th>
                </tr>
            </thead>
            <tbody>                   
                <%
                    Perfil perfil = new Perfil();
                    ArrayList<String> lista = new ArrayList();
                    if(!query){                        
                        lista = perfil.Listar();                        
                    }else{
                        lista = perfil.ListarBusqueda(busqueda);
                    }
                        Iterator iter = lista.iterator();
                        while(iter.hasNext()){     
                           String Nombre = iter.next().toString();                          
                           String Codigo = perfil.NombreACodigo(Nombre);
                          
                %>    
                <tr>
                    <td><a href = "Perfil?PerCod=<%= Codigo %>&Mode=DSP" > <%= Nombre %> </a></td>                    
                    <td><%= iter.next().toString() %> </td>
                    <td><%= iter.next().toString() %></td>
                    <td><a href="Perfil?PerCod=<%= Codigo %>&Mode=UPD"> UPD </a></td>
                    <td><a href="ListaCargas?PerCod=<%= Codigo %>">Carga académica</a></td>
                </tr>                
                <% } %>
            </tbody>
        </table>
        </div>>
    </body>
</html>

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

    Facultades
FacCod varchar(40) PK 
FacNom varchar(100)

Conexión

JDBC
jdbc:mysql://localhost:3306/?user=root

Connection
root@localhost:3306
--%>

<%--
    JSP Scripting Elements

JSP Expression: <%= %> Returns Java value to String
JSP Scriplet <% %> Realiza procedimiento en Java
JSP Declaration <%! %> Crea Clases 

<% String buscar = request.getParameter("txtBusqueda"); %>                

 --%>
