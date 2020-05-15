<%-- 
    Document   : ListaCargas
    Created on : 17 jul. 2019, 23:37:16
    Author     : GALILEO
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Database.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.xml.parsers.ParserConfigurationException"%>
<%@page import="xml.analizador.dom.modelo.Tag"%>
<%@page import="xml.analizador.dom.JespXML"%>
<%@page import="Entidad.Carga"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="jxl.Sheet"%>
<%@page import="jxl.Workbook"%>
<%@page import="jxl.Workbook"%>
<%@page import="org.apache.catalina.Store"%>
<%@page import="jxl.Cell"%>
<%@page import="jxl.read.biff.BiffException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Estilo/styleMantenimientoPerfiles.css">
    </head>
    <%
            String nombre="";                
            Conexion bds=new Conexion();
            ResultSet rssss=null;
            bds.conexion();

            CallableStatement calls=bds.con.prepareCall("{CALL buscarPerfil(?)}");
            calls.setString(1, request.getParameter("PerCod"));
            calls.execute();
            rssss = calls.getResultSet();
            while(rssss.next())
            {
               nombre = rssss.getString(1);
            }
    %>
    <body>
        <header>
        <div class="nav-bar">
        <a href="iniciar">
        Universidad Catolica de Honduras
        <br><span>"Nuestra Señora de la Paz"</span>
        </a>
        </div>
        </header>
        <h1>BIENVENIDO: <%=nombre%></h1>
        <%
            String var ="0";
            String car ="0";
        %>
        
        <div class="contenedor">
            <p Style="margin-left: 10px;"><a Style="font-size: 20px;" href="Carga?PerCod=<%= request.getParameter("PerCod")%>&CARGA=<%=car%>&SOLOVER=<%=var%>">Subir nueva carga</a></p>
            <form>
                <table>
                    <thead>
                        <tr>
                            <th width="250px">CAMPUS</th>                    
                            <th width="250px">PERIODO</th>
                            <th width="250px">CLASE</th>     
                            <th width="250px">SECCIÓN</th>                    
                            <th width="250px">HORARIO</th>
                            <th width="250px">EDIFICIO</th> 
                            <th width="250px">VER CARGA</th> 
                        </tr>
                    </thead>
                    <tbody>                   
                        <%
                            Carga perfil = new Carga();
                            ArrayList<String> lista = new ArrayList();
     
                                lista = perfil.Listar(Integer.parseInt(request.getParameter("PerCod")));
                                Iterator iter = lista.iterator();
                                while(iter.hasNext())
                                {     
                                   String campus = iter.next().toString();
                                   String periodo = iter.next().toString();
                                   String clase =iter.next().toString();
                                   String seccion = iter.next().toString();
                                   String horario =iter.next().toString();
                                   String edificio = iter.next().toString();
                                   String carga= iter.next().toString();
                        %>    
                        <tr>
                            <td><%=campus%></td>                    
                            <td><%=periodo%></td>
                            <td><%=clase%></td>
                            <td><%=seccion%></td>
                            <td><%=horario%></td>
                            <td><%=edificio%></td>
                            <td><label><a href="Carga?PerCod=<%= request.getParameter("PerCod") %>&CARGA=<%=carga%>&SOLOVER=<%=1%>">VER CARGA</a></label></td>
                        </tr>                
                        <% } %>
                    </tbody>
                </table>
                
            </form>
        </div>
    </body>
</html>
