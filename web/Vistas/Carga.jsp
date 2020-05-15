<%-- 
    Document   : carga_academica
    Created on : 15 jul. 2019, 22:35:10
    Author     : GALILEO
--%>

<%@page import="java.sql.CallableStatement"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Database.Conexion"%>
<%@page import="Database.Conexion"%>
<%@page import="javax.xml.parsers.ParserConfigurationException"%>
<%@page import="xml.analizador.dom.modelo.Tag"%>
<%@page import="xml.analizador.dom.JespXML"%>
<%@page import="Entidad.Carga"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="jxl.Sheet"%>
<%@page import="jxl.Workbook"%>
<%@page import="jxl.Workbook"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.apache.catalina.Store"%>
<%@page import="jxl.Cell"%>
<%@page import="jxl.read.biff.BiffException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" accept-charset="UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Estilo/styleCarga.css">
    </head>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%
        String Codigo= request.getParameter("PerCod");
        String Carga= request.getParameter("CARGA");
        String files="", urls="";
        String solover= request.getParameter("SOLOVER");
                String res= "disponibilidad.xml"; 
                String absos = getServletContext().getRealPath(res);
                
                            JespXML xmm = new JespXML(absos);
                            xmm= new JespXML(absos);
                            Tag rut = xmm.leerXML();
                            Tag ro = rut.getTagsHijos().get(0);
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
        <h1>Carga Académica</h1>
        <form action="Carga?PerCod=<%=Codigo%>&SOLOVER=<%=ro.getContenido()%>&CARGA=<%=Carga%>" method="POST">
            <div class="conten2">
                <%if(solover.charAt(0)=='0')
                {%>
                    <input class="boto1" type="file" name="file" id="file" value="<%=files%>" accept=".xls"/>
                    <input class="boto" type="submit"  name="cargar" value="cargar"/>
                <%}%>
            </div>
            <%
                String re= "disponibilidad.xml"; 
                String abso = getServletContext().getRealPath(re);

            try
            {
                Tag raiz = new Tag("DISPONIBILIDAD");
                
                Tag rol = new Tag("DIS");
                
                rol.addContenido(request.getParameter("SOLOVER"));
                         
                raiz.addAtributo("PORTAFOLIO", "Docentes");   
                raiz.addTagHijo(rol);

                JespXML j= new JespXML(abso);
                j.escribirXML(raiz);
                
            } 
            catch(ParserConfigurationException ex) 
            {
                JOptionPane.showMessageDialog(null, ex.getMessage());
            } 

                String campus="", periodo="", clase="", seccion="", catedra="", horario="", edificio="", perfil="", cuenta="";
                String EXCEL_FILE_LOCATION = "";
                Workbook workbook = null;
                Sheet sheet = null;
                Cell cell1=null;
                
                if(Integer.parseInt(solover)==1 && request.getParameter("file")==null)
                {
                        Conexion bd=new Conexion();
                        Statement stmt=null;
                        ResultSet rs=null;    
                        bd.conexion();              
                        try{
                            PreparedStatement psListar = bd.getConnection().prepareStatement("SELECT campus, periodo, clase, seccion, horario, edificio, idcarga_academica, catedratico FROM carga_academica WHERE idcarga_academica="+request.getParameter("CARGA"));
                            psListar.execute();
                            ResultSet rsListar= psListar.getResultSet();
                            while(rsListar.next())
                            {
                                campus=rsListar.getString(1);
                                periodo=rsListar.getString(2);
                                clase=rsListar.getString(3);
                                seccion=rsListar.getString(4);
                                horario=rsListar.getString(5);
                                edificio=rsListar.getString(6);
                                catedra=rsListar.getString(8);
                            }
                        }
                        catch(Exception e)
                        {
                            System.out.println("Error Perfil Listar " + e.getMessage());
                        }
                
                }

                if(request.getParameter("cargar")!=null && request.getParameter("file")!=null)
                {
                    EXCEL_FILE_LOCATION = request.getParameter("file");
                    workbook = Workbook.getWorkbook(new File(EXCEL_FILE_LOCATION));
                    sheet = workbook.getSheet(0);
                    cell1 = sheet.getCell(0, 0);
                    cuenta= cell1.getContents();
                    cell1 = sheet.getCell(1, 2);
                    campus= cell1.getContents();
                    cell1 = sheet.getCell(1, 3);
                    periodo=cell1.getContents();
                    cell1 = sheet.getCell(1, 4);
                    clase=  cell1.getContents();
                    cell1 = sheet.getCell(1, 5);
                    seccion=cell1.getContents();
                    cell1 = sheet.getCell(1, 6);
                    catedra= cell1.getContents();
                    cell1 = sheet.getCell(1, 7);
                    horario=cell1.getContents();
                    cell1 = sheet.getCell(1, 8);
                    edificio=cell1.getContents();
                    
                    Carga con = new Carga();
                    String relativeWebPath = "temporales.xml"; 
                    String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
                    con.insertarXML(campus, clase, absoluteDiskPath);
                    
                      try 
                      {
                           String relativeWeb = "urlEXCEL.xml"; 
                           String absoluteDisk = getServletContext().getRealPath(relativeWeb);
                           Tag raiz = new Tag("EXCEL");

                           Tag path = new Tag("URL");

                           path.addContenido(EXCEL_FILE_LOCATION);

                           raiz.addAtributo("PORTAFOLIO", "Docentes");   
                           raiz.addTagHijo(path);


                           JespXML j= new JespXML(absoluteDisk);
                           j.escribirXML(raiz);

                       } catch (ParserConfigurationException ex) {
                           JOptionPane.showMessageDialog(null, ex.getMessage());
                       } 
                      
                            JespXML xm = new JespXML(absoluteDiskPath);
                            String relative = "urlEXCEL.xml"; 
                            String absolute = getServletContext().getRealPath(relative);
                            xm= new JespXML(absolute);
                            Tag ruta = xm.leerXML();
                            Tag route = ruta.getTagsHijos().get(0);
                            
                            urls=route.getContenido();
                }
                
                if(request.getParameter("asistencia")!=null)
                {
                            String numeros = "";
                            String relativeConteo = "conteo.xml"; 
                            String absoluteConteo = getServletContext().getRealPath(relativeConteo);
                            JespXML xm = new JespXML(absoluteConteo);
                            Tag rutaConteo = xm.leerXML();
                            Tag routeConteo = rutaConteo.getTagsHijos().get(0); 
                            numeros=routeConteo.getContenido();
                            
                            String valorA = "";
                            String valorB = "";
                            String valorC = "";
                            String valorD = "";
                            String valorE = "";
                            String valorF = "";
                            String valorG = "";
                            String valorH = "";
                            String valorI = "";
                            String valorJ = "";
                            String valorK = "";
                            String valorL = "";
                            String valorM = "";
                            String valorN = "";
                            String valorO = "";
                            String valorP = "";
                            String valorQ = "";
                            String valorR = "";
                            String valorS = "";
                            String valorT = "";
                            String valorU = "";
                            String valorV = "";
                            String valorW = "";
                            String valorX = "";

                            for (int A=1; A<=Integer.parseInt(numeros); A++)
                            {
                                if(request.getParameter("A"+A)!=null)
                                {
                                    valorA = valorA+request.getParameter("A"+A);  
                                }
                                else
                                {
                                    valorA = valorA+"0"; 
                                }
                            }
                            
                                for (int B=1; B<=Integer.parseInt(numeros); B++)
                            {
                                if(request.getParameter("B"+B)!=null)
                                {
                                    valorB = valorB+request.getParameter("B"+B);  
                                }
                                else
                                {
                                    valorB = valorB+"0"; 
                                } 
                            } 
                            for (int C=1; C<=Integer.parseInt(numeros); C++)
                            {
                                if(request.getParameter("C"+C)!=null)
                                {
                                    valorC = valorC+request.getParameter("C"+C);  
                                }
                                else
                                {
                                    valorC = valorC+"0"; 
                                } 
                            }                
                
                            for (int D=1; D<=Integer.parseInt(numeros); D++)
                            {
                                if(request.getParameter("D"+D)!=null)
                                {
                                    valorD = valorD+request.getParameter("D"+D);  
                                }
                                else
                                {
                                    valorD = valorD+"0"; 
                                } 
                            }
                            
                            for (int E=1; E<=Integer.parseInt(numeros); E++)
                            {
                                if(request.getParameter("E"+E)!=null)
                                {
                                    valorE = valorE+request.getParameter("E"+E);  
                                }
                                else
                                {
                                    valorE = valorE+"0"; 
                                }   
                            }
                            
                            for (int F=1; F<=Integer.parseInt(numeros); F++)
                            {
                                if(request.getParameter("F"+F)!=null)
                                {
                                    valorF = valorF+request.getParameter("F"+F);  
                                }
                                else
                                {
                                    valorF = valorF+"0"; 
                                }   
                            }
                            for (int G=1; G<=Integer.parseInt(numeros); G++)
                            {
                                if(request.getParameter("G"+G)!=null)
                                {
                                    valorG = valorG+request.getParameter("G"+G);  
                                }
                                else
                                {
                                    valorG = valorG+"0"; 
                                }    
                            }                
                
                            for (int H=1; H<=Integer.parseInt(numeros); H++)
                            {
                                if(request.getParameter("H"+H)!=null)
                                {
                                    valorH = valorH+request.getParameter("H"+H);  
                                }
                                else
                                {
                                    valorH = valorH+"0"; 
                                }    
                            }
                            
                            for (int I=1; I<=Integer.parseInt(numeros); I++)
                            {
                                if(request.getParameter("I"+I)!=null)
                                {
                                    valorI = valorI+request.getParameter("I"+I);  
                                }
                                else
                                {
                                    valorI = valorI+"0"; 
                                }     
                            }
                            
                            for (int J=1; J<=Integer.parseInt(numeros); J++)
                            {
                                if(request.getParameter("J"+J)!=null)
                                {
                                    valorJ = valorJ+request.getParameter("J"+J);  
                                }
                                else
                                {
                                    valorJ = valorJ+"0"; 
                                }     
                            }
                            for (int K=1; K<=Integer.parseInt(numeros); K++)
                            {
                                if(request.getParameter("K"+K)!=null)
                                {
                                    valorK = valorK+request.getParameter("K"+K);  
                                }
                                else
                                {
                                    valorK = valorK+"0"; 
                                }    
                            }                
                
                            for (int L=1; L<=Integer.parseInt(numeros); L++)
                            {
                                if(request.getParameter("L"+L)!=null)
                                {
                                    valorL = valorL+request.getParameter("L"+L);  
                                }
                                else
                                {
                                    valorL = valorL+"0"; 
                                }    
                            }
                            
                            for (int M=1; M<=Integer.parseInt(numeros); M++)
                            {
                                if(request.getParameter("M"+M)!=null)
                                {
                                    valorM = valorM+request.getParameter("M"+M);  
                                }
                                else
                                {
                                    valorM = valorM+"0"; 
                                }      
                            }
                            
                            for (int N=1; N<=Integer.parseInt(numeros); N++)
                            {
                                if(request.getParameter("N"+N)!=null)
                                {
                                    valorN = valorN+request.getParameter("N"+N);  
                                }
                                else
                                {
                                    valorN = valorN+"0"; 
                                }    
                            }
                            for (int O=1; O<=Integer.parseInt(numeros); O++)
                            {
                                if(request.getParameter("O"+O)!=null)
                                {
                                    valorO = valorO+request.getParameter("O"+O);  
                                }
                                else
                                {
                                    valorO = valorO+"0"; 
                                }     
                            }                
                
                            for (int P=1; P<=Integer.parseInt(numeros); P++)
                            {
                                if(request.getParameter("P"+P)!=null)
                                {
                                    valorP = valorP+request.getParameter("P"+P);  
                                }
                                else
                                {
                                    valorP = valorP+"0"; 
                                }     
                            }
                            
                            for (int Q=1; Q<=Integer.parseInt(numeros); Q++)
                            {
                                if(request.getParameter("Q"+Q)!=null)
                                {
                                    valorQ = valorQ+request.getParameter("Q"+Q);  
                                }
                                else
                                {
                                    valorQ = valorQ+"0"; 
                                }     
                            }
                            
                            for (int R=1; R<=Integer.parseInt(numeros); R++)
                            {
                                if(request.getParameter("R"+R)!=null)
                                {
                                    valorR = valorR+request.getParameter("R"+R);  
                                }
                                else
                                {
                                    valorR = valorR+"0"; 
                                }     
                            }
                            for (int S=1; S<=Integer.parseInt(numeros); S++)
                            {
                                if(request.getParameter("S"+S)!=null)
                                {
                                    valorS = valorS+request.getParameter("S"+S);  
                                }
                                else
                                {
                                    valorS = valorS+"0"; 
                                }       
                            }                
                
                            for (int T=1; T<=Integer.parseInt(numeros); T++)
                            {
                                if(request.getParameter("T"+T)!=null)
                                {
                                    valorT = valorT+request.getParameter("T"+T);  
                                }
                                else
                                {
                                    valorT = valorT+"0"; 
                                }       
                            }
                            
                            for (int U=1; U<=Integer.parseInt(numeros); U++)
                            {
                                if(request.getParameter("U"+U)!=null)
                                {
                                    valorU = valorU+request.getParameter("U"+U);  
                                }
                                else
                                {
                                    valorU = valorU+"0"; 
                                }       
                            }
                            
                            for (int V=1; V<=Integer.parseInt(numeros); V++)
                            {
                                if(request.getParameter("V"+V)!=null)
                                {
                                    valorV = valorV+request.getParameter("V"+V);  
                                }
                                else
                                {
                                    valorV = valorV+"0"; 
                                }       
                            }
                            for (int W=1; W<=Integer.parseInt(numeros); W++)
                            {
                                if(request.getParameter("W"+W)!=null)
                                {
                                    valorW = valorW+request.getParameter("W"+W);  
                                }
                                else
                                {
                                    valorW = valorW+"0"; 
                                }       
                            }                
                
                            for (int X=1; X<=Integer.parseInt(numeros); X++)
                            {
                                if(request.getParameter("X"+X)!=null)
                                {
                                    valorX = valorX+request.getParameter("X"+X);  
                                }
                                else
                                {
                                    valorX = valorX+"0"; 
                                }        
                            }
                            
                            String cadenaTotal = valorA + "|" + valorB + "|" + valorC + "|" + valorD 
                                    + "|" + valorE + "|" + valorF + "|" + valorG + "|" + valorH
                                    + "|" + valorI + "|" + valorJ + "|" + valorK + "|" + valorL
                                    + "|" + valorM + "|" + valorN + "|" + valorO + "|" + valorP
                                    + "|" + valorQ + "|" + valorR + "|" + valorS + "|" + valorT
                                    + "|" + valorU + "|" + valorV + "|" + valorW + "|" + valorX;
                            
                           System.out.println(cadenaTotal);
                            
                            try
                            {
                                Conexion bd=new Conexion();
                                Statement stmt=null;
                                ResultSet rs=null;
                                bd.conexion();

                                CallableStatement call=bd.con.prepareCall("{CALL actualizar_asistencia(?, ?)}");
                                call.setString(1, cadenaTotal);
                                call.setString(2, Carga);
                                call.execute();
                            }
                            catch(Exception ex)
                            {
                                JOptionPane.showMessageDialog(null, ex.getMessage());
                            }
                }
                
                if(request.getParameter("subir")!=null)
                {
                    String relativeWebPath = "temporales.xml"; 
                    String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
                    
                    JespXML xm = new JespXML(absoluteDiskPath);
                    Tag primera= xm.leerXML();               
                    Tag campuus=primera.getTagsHijos().get(0);
                    Tag clasee = primera.getTagsHijos().get(1);
                    Carga con = new Carga();
                    con.insertarCarga(campuus.getContenido(), request.getParameter("periodo"), clasee.getContenido(), request.getParameter("seccion"), request.getParameter("catedra"), request.getParameter("horario"), request.getParameter("edificio"), Integer.parseInt(request.getParameter("PerCod")));
                           
                            
                            String relative = "urlEXCEL.xml"; 
                            String absolute = getServletContext().getRealPath(relative);
                            xm= new JespXML(absolute);
                            Tag ruta = xm.leerXML();
                            Tag route = ruta.getTagsHijos().get(0);
                            EXCEL_FILE_LOCATION=route.getContenido();
                            out.println(EXCEL_FILE_LOCATION);
                            workbook = Workbook.getWorkbook(new File(EXCEL_FILE_LOCATION));
                            sheet = workbook.getSheet(0);
                            for(int i=10; i<120; i++)
                            {
                                if(sheet.getCell(0, i).getContents()!="")
                                {
                                    int valor=0;
                                        for(int t=0; t<sheet.getCell(1, i).getContents().length(); t++)
                                        {
                                            if(sheet.getCell(1, i).getContents().charAt(t)==' ')
                                            {
                                                valor=t;
                                                break;
                                            }
                                        }
                                    String count=sheet.getCell(1, i).getContents().substring(0, valor);
                                    String name=sheet.getCell(1, i).getContents().substring(valor+1);
                                    con.insertarEstudiante(count, name);
                                }
                                else
                                {
                                    break;
                                }
                            }
                    
                    
                }
                
                String nombreClase="";
                if(solover=="0")
                {
                    Entidad.Carga car= new Entidad.Carga();
                    nombreClase= car.recuperarClase(Integer.parseInt(clase)); 
                }
                else
                {
                    nombreClase="";
                }
            %>
         <br/>
         <div class="conten">
         <label>URL          </label><input class="info" type="text" name="url" value="<%=urls%>" /><br/><br/>
         <label>CUENTA:      </label><input class="info" type="text" name="cuenta" value="<%=cuenta%>" /><br/><br/>
         <label>CAMPUS:      </label><input class="info" type="text" name="campus" value="<%=campus%>" /><br/><br/>
         <label>AÑO/PERIODO: </label><input class="info" type="text" name="periodo" value="<%=periodo%>" /><br/><br/>
         <label>CLASE:       </label><input class="info" type="text" name="clase" value="<%=nombreClase%>" /><br/><br/>
         <label>SECCIÓN:     </label><input class="info" type="text" name="seccion" value="<%=seccion%>" /><br/><br/>
         <label>CATEDRÁTICO: </label><input class="info" type="text" name="catedra" value="<%=catedra%>" /><br/><br/>
         <label>HORARIO:     </label><input class="info" type="text" name="horario" value="<%=horario%>" /><br/><br/>
         <label>EDIFICIO:    </label><input class="info" type="text" name="edificio" value="<%=edificio%>" /><br/><br/>
         <label>PERFIL:      </label><input class="info" type="text" name="perfil" value="<%=request.getParameter("PerCod")%>" /><br/><br/>
         </div>
         <fieldset>
             <table>
                    <thead>
                       <tr>
                          <th width="50px">N°</th>
                          <th width="250px">Cuenta</th>
                          <th width="500">Nombres y Apellidos</th>
                          <th width="20px">L</th>
                          <th width="20px">M</th>
                          <th width="20px">M</th>
                          <th width="20px">J</th>
                          <th width="20px">V</th>
                          <th width="20px">S</th>
                          <th width="20px">L</th>
                          <th width="20px">M</th>
                          <th width="20px">M</th>
                          <th width="20px">J</th>
                          <th width="20px">V</th>
                          <th width="20px">S</th>
                          <th width="20px">L</th>
                          <th width="20px">M</th>
                          <th width="20px">M</th>
                          <th width="20px">J</th>
                          <th width="20px">V</th>
                          <th width="20px">S</th>
                          <th width="20px">L</th>
                          <th width="20px">M</th>
                          <th width="20px">M</th>
                          <th width="20px">J</th>
                          <th width="20px">V</th>
                          <th width="20px">S</th>
                       </tr>
                   </thead>
                   <tbody> 
                 <tbody>
                     <% 
                         if(request.getParameter("cargar")!=null)
                         {
                            for(int i=10; i<120; i++)
                            {
                                if(sheet.getCell(0, i).getContents()!="")
                                {
                                %>
                                    <tr border="1px">
                                         <td><%=i-9%></td>
                                         <%
                                             int valor=0;
                                             for(int t=0; t<sheet.getCell(1, i).getContents().length(); t++)
                                             {
                                                 if(sheet.getCell(1, i).getContents().charAt(t)==' ')
                                                 {
                                                     valor=t;
                                                     break;
                                                 }
                                             }
                                             String cuentas=sheet.getCell(1, i).getContents().substring(0, valor);
                                             String nombres=sheet.getCell(1, i).getContents().substring(valor+1);
                                             
                                             //Entidad.Carga car = new Entidad.Carga();
                                             //car.insertarEstudiante(cuentas, nombres);
;                                         %>
                                         <td><%=cuentas%></td>
                                         <td><%=nombres%></td>
                                         <td><%=sheet.getCell(2, i).getContents()%></td>
                                         <td><%=sheet.getCell(3, i).getContents()%></td>
                                         <td><%=sheet.getCell(4, i).getContents()%></td>
                                         <td><%=sheet.getCell(5, i).getContents()%></td>
                                         <td><%=sheet.getCell(6, i).getContents()%></td>
                                         <td><%=sheet.getCell(7, i).getContents()%></td>
                                         <td><%=sheet.getCell(8, i).getContents()%></td>
                                         <td><%=sheet.getCell(9, i).getContents()%></td>
                                         <td><%=sheet.getCell(10, i).getContents()%></td>
                                         <td><%=sheet.getCell(11, i).getContents()%></td>
                                         <td><%=sheet.getCell(12, i).getContents()%></td>
                                         <td><%=sheet.getCell(13, i).getContents()%></td>
                                         <td><%=sheet.getCell(14, i).getContents()%></td>
                                         <td><%=sheet.getCell(15, i).getContents()%></td>
                                         <td><%=sheet.getCell(16, i).getContents()%></td>
                                         <td><%=sheet.getCell(17, i).getContents()%></td>
                                         <td><%=sheet.getCell(18, i).getContents()%></td>
                                         <td><%=sheet.getCell(19, i).getContents()%></td>
                                         <td><%=sheet.getCell(20, i).getContents()%></td>
                                         <td><%=sheet.getCell(21, i).getContents()%></td>
                                         <td><%=sheet.getCell(22, i).getContents()%></td>
                                         <td><%=sheet.getCell(23, i).getContents()%></td>
                                         <td><%=sheet.getCell(24, i).getContents()%></td>
                                         <td><%=sheet.getCell(25, i).getContents()%></td>
                                    </tr>
                                <%
                                }
                                else
                                {
                                    break;
                                }
                            }

                        }

                     %>
                     <%
                            String r= "disponibilidad.xml"; 
                            String a = getServletContext().getRealPath(r);
                
                            JespXML xmmm = new JespXML(a);
                            xmmm= new JespXML(a);
                            Tag rutt = xmmm.leerXML();
                            Tag roo = rutt.getTagsHijos().get(0);
                         if(Integer.parseInt(roo.getContenido())==1 && request.getParameter("file")==null)
                         {
                             
                            Carga per = new Carga();
                            ArrayList<String> lista = new ArrayList();
                                int cont =0;
                                lista = per.ListarEstudiantesCarga(Integer.parseInt(request.getParameter("CARGA")));
                                Iterator iter = lista.iterator();
                                while(iter.hasNext())
                                {   
                                    cont++;
                                    String raccont = iter.next().toString();
                                    String name = iter.next().toString();
                                    String cadenaA = "";
                                    try
                                    {
                                        Conexion bd=new Conexion();
                                        Statement stmt=null;
                                        ResultSet rs=null;
                                        bd.conexion();
                                        

                                        CallableStatement call=bd.con.prepareCall("{CALL  recuperarAsistencia(?)}");
                                        call.setString(1, Carga);
                                        call.execute();
                                        rs = call.getResultSet();
                                        while(rs.next())
                                        {
                                           cadenaA = rs.getString(1);
                                        }
            
                                    }
                                    catch(Exception ex)
                                    {
                                        JOptionPane.showMessageDialog(null, ex.getMessage());
                                    }
                                    
                            String numeros = "";
                            String relativeConteo = "conteo.xml"; 
                            String absoluteConteo = getServletContext().getRealPath(relativeConteo);
                            JespXML xm = new JespXML(absoluteConteo);
                            Tag rutaConteo = xm.leerXML();
                            Tag routeConteo = rutaConteo.getTagsHijos().get(0); 
                            numeros=routeConteo.getContenido();

                     %>
                                <tr>
                                         <td><%=cont%></td>
                                         <td><%=raccont%></td>
                                         <td><%=name%></td>
                                         <td><input style=" width: 18px; height: 18px;" type="checkbox" name="A<%=cont%>" value="1" <%if (cadenaA.charAt(cont-1)=='1'){%> checked <%}%>/></td>
                                         <td><input style=" width: 18px; height: 18px;" type="checkbox" name="B<%=cont%>" value="1" <%if (cadenaA.charAt(cont+Integer.parseInt(numeros))=='1'){%> checked <%}%>/></td>
                                         <td><input style=" width: 18px; height: 18px;" type="checkbox" name="C<%=cont%>" value="1" <%if (cadenaA.charAt(cont+(2*Integer.parseInt(numeros))+1)=='1'){%> checked <%}%>/></td>
                                         <td><input style=" width: 18px; height: 18px;" type="checkbox" name="D<%=cont%>" value="1" <%if (cadenaA.charAt(cont+(3*Integer.parseInt(numeros))+2)=='1'){%> checked <%}%>/></td>
                                         <td><input style=" width: 18px; height: 18px;" type="checkbox" name="E<%=cont%>" value="1" <%if (cadenaA.charAt(cont+(4*Integer.parseInt(numeros))+3)=='1'){%> checked <%}%>/></td>
                                         <td><input style=" width: 18px; height: 18px;" type="checkbox" name="F<%=cont%>" value="1" <%if (cadenaA.charAt(cont+(5*Integer.parseInt(numeros))+4)=='1'){%> checked <%}%>/></td>
                                         <td><input style=" width: 18px; height: 18px;" type="checkbox" name="G<%=cont%>" value="1" <%if (cadenaA.charAt(cont+(6*Integer.parseInt(numeros))+5)=='1'){%> checked <%}%>/></td>
                                         <td><input style=" width: 18px; height: 18px;" type="checkbox" name="H<%=cont%>" value="1" <%if (cadenaA.charAt(cont+(7*Integer.parseInt(numeros))+6)=='1'){%> checked <%}%>/></td>
                                         <td><input style=" width: 18px; height: 18px;" type="checkbox" name="I<%=cont%>" value="1" <%if (cadenaA.charAt(cont+(8*Integer.parseInt(numeros))+7)=='1'){%> checked <%}%>/></td>
                                         <td><input style=" width: 18px; height: 18px;" type="checkbox" name="J<%=cont%>" value="1" <%if (cadenaA.charAt(cont+(9*Integer.parseInt(numeros))+8)=='1'){%> checked <%}%>/></td>
                                         <td><input style=" width: 18px; height: 18px;" type="checkbox" name="K<%=cont%>" value="1" <%if (cadenaA.charAt(cont+(10*Integer.parseInt(numeros))+9)=='1'){%> checked <%}%>/></td>
                                         <td><input style=" width: 18px; height: 18px;" type="checkbox" name="L<%=cont%>" value="1" <%if (cadenaA.charAt(cont+(11*Integer.parseInt(numeros))+10)=='1'){%> checked <%}%>/></td>
                                         <td><input style=" width: 18px; height: 18px;" type="checkbox" name="M<%=cont%>" value="1" <%if (cadenaA.charAt(cont+(12*Integer.parseInt(numeros))+11)=='1'){%> checked <%}%>/></td>
                                         <td><input style=" width: 18px; height: 18px;" type="checkbox" name="N<%=cont%>" value="1" <%if (cadenaA.charAt(cont+(13*Integer.parseInt(numeros))+12)=='1'){%> checked <%}%>/></td>
                                         <td><input style=" width: 18px; height: 18px;" type="checkbox" name="O<%=cont%>" value="1" <%if (cadenaA.charAt(cont+(14*Integer.parseInt(numeros))+13)=='1'){%> checked <%}%>/></td>
                                         <td><input style=" width: 18px; height: 18px;" type="checkbox" name="P<%=cont%>" value="1" <%if (cadenaA.charAt(cont+(15*Integer.parseInt(numeros))+14)=='1'){%> checked <%}%>/></td>
                                         <td><input style=" width: 18px; height: 18px;" type="checkbox" name="Q<%=cont%>" value="1" <%if (cadenaA.charAt(cont+(16*Integer.parseInt(numeros))+15)=='1'){%> checked <%}%>/></td>
                                         <td><input style=" width: 18px; height: 18px;" type="checkbox" name="R<%=cont%>" value="1" <%if (cadenaA.charAt(cont+(17*Integer.parseInt(numeros))+16)=='1'){%> checked <%}%>/></td>
                                         <td><input style=" width: 18px; height: 18px;" type="checkbox" name="S<%=cont%>" value="1" <%if (cadenaA.charAt(cont+(18*Integer.parseInt(numeros))+17)=='1'){%> checked <%}%>/></td>
                                         <td><input style=" width: 18px; height: 18px;" type="checkbox" name="T<%=cont%>" value="1" <%if (cadenaA.charAt(cont+(19*Integer.parseInt(numeros))+18)=='1'){%> checked <%}%>/></td>
                                         <td><input style=" width: 18px; height: 18px;" type="checkbox" name="U<%=cont%>" value="1" <%if (cadenaA.charAt(cont+(20*Integer.parseInt(numeros))+19)=='1'){%> checked <%}%>/></td>
                                         <td><input style=" width: 18px; height: 18px;" type="checkbox" name="V<%=cont%>" value="1" <%if (cadenaA.charAt(cont+(21*Integer.parseInt(numeros))+20)=='1'){%> checked <%}%>/></td>
                                         <td><input style=" width: 18px; height: 18px;" type="checkbox" name="W<%=cont%>" value="1" <%if (cadenaA.charAt(cont+(22*Integer.parseInt(numeros))+21)=='1'){%> checked <%}%>/></td>
                                         <td><input style=" width: 18px; height: 18px;" type="checkbox" name="X<%=cont%>" value="1" <%if (cadenaA.charAt(cont+(23*Integer.parseInt(numeros))+22)=='1'){%> checked <%}%>/></td>
                                </tr>
                     <%
                             }
                            String reConteo= "conteo.xml"; 
                            String absoConteo = getServletContext().getRealPath(reConteo);

                            try
                            {
                                Tag raiz = new Tag("CONTEO");

                                Tag rol = new Tag("CON");

                                rol.addContenido(String.valueOf(cont));

                                raiz.addAtributo("PORTAFOLIO", "Docentes");   
                                raiz.addTagHijo(rol);

                                JespXML j= new JespXML(absoConteo);
                                j.escribirXML(raiz);

                            } 
                            catch(ParserConfigurationException ex) 
                            {
                                JOptionPane.showMessageDialog(null, ex.getMessage());
                            } 
                        }
                     %>
                     
                 </tbody>
                   </tbody>
               </table>
         </fieldset>
                 <center>
                     <%if(solover.charAt(0)=='0')
                     {%>
                            <button class="boto2" name="subir" style="">Subir</button>
                     <%}%>
                     <br/>
                     <%if(solover.charAt(0)=='1')
                     {%>
                     <button class="boto2" name="asistencia" style=" width: 100px; ">Guardar Asistencia</button>
                     <%}%>
                 </center>
        </form>
        
    </body>
</html>
