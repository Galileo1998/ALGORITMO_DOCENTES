<%-- 
    Document   : index
    Created on : Jun 8, 2019, 1:22:24 PM
    Author     : carlos
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet, Database.*, Entidad.Usuario, java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenimiento de Usuarios</title>
        <link rel="stylesheet" href="Estilo/styleMantenimientoPerfiles.css">
        <%
          RequestDispatcher vista = null;
          Usuario user = new Usuario();    
          if(session.getAttribute("UsrId")==null){              
              response.sendRedirect("iniciar"); 
          }else{
            String id = session.getAttribute("UsrId").toString();
            user.Obtener(id);
            String rol = user.RolCod;
            
            if(rol.equals("DOC")){
                response.sendRedirect("iniciar");
            }else if(rol.equals("DEC")){
                response.sendRedirect("iniciar");
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
                  response.sendRedirect("Usuarios");
              }
          }           
        %>
            <h1><a href="Usuarios">Usuarios</a></h1>    
        <div class="contenedor">
        <form action="Usuarios?" method="get">
            <div class="busqueda">                
                <input type="text" name="txtBusqueda" value=""/>   
                <button>Buscar</button>   
            </div>
        </form>
            
        <table>
            <thead>
                <tr>
                    <th>Usuario</th>
                    <th>Nombre</th>
                    <th>Facultad</th>
                    <th><a href="Usuario?UsrId=&Mode=INS"> + </a>
                </tr>
            </thead>
            <tbody> 
                <%
                    Usuario usuario = new Usuario();
                    ArrayList<String> lista = new ArrayList();
                    if(!query){                        
                        lista = usuario.Listar();                        
                    }else{
                        lista = usuario.ListarBusqueda(busqueda);
                    }
                        Iterator iter = lista.iterator();
                        while(iter.hasNext()){     
                           String Nombre = iter.next().toString();
                           String Codigo = usuario.NombreACodigo(Nombre);
                %>
                <tr>
                    <td><a href = "Usuario?UsrId=<%= Codigo %>&Mode=DSP" > <%= Nombre %> </a></td>
                    <td><%= iter.next().toString() %></td>
                    <td><%= iter.next().toString() %></td>
                    <td><a href="Usuario?UsrId=<%= Codigo %>&Mode=UPD"> UPD </a></td>                    
                </tr>
                <% } %>
            </tbody>
        </table>

        </div>
    </body>
</html>

<%--
    JSP Scripting Elements

JSP Expression: <%= %> Returns Java value to String
JSP Scriplet <% %>
JSP Declaration <%! %>

 --%>
