/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidad;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import Database.Conexion;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;
import xml.analizador.dom.JespXML;
import xml.analizador.dom.modelo.Tag;
import org.apache.catalina.Store;
import java.io.IOException;
import java.io.File;
import java.io.FileInputStream;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author GALILEO
 */
public class Carga 
{
    public void insertarCarga(String CAMPUS, String PERIODO, String CLASE, String SECCION, String CATEDRATICO, String HORARIO,
        String EDIFICIO, int PERFIL)
    {
        int valor=0, valor2=0;
        try
        {
            Conexion bd=new Conexion();
            Statement stmt=null;
            ResultSet rs=null;
            bd.conexion();

            CallableStatement call=bd.con.prepareCall("{CALL obtener_Asignatura(?)}");
            call.setString(1, CLASE);
            call.execute();
            rs = call.getResultSet();
            while(rs.next())
            {
               valor=rs.getInt(1);
            }
            
            call=bd.con.prepareCall("{CALL obtenerCAMPUS(?)}");
            call.setString(1, CAMPUS);
            call.execute();
            rs = call.getResultSet();
            while(rs.next())
            {
               valor2=rs.getInt(1);
            }
            
            call=bd.con.prepareCall("{CALL insertar_carga_academica(?, ?, ?, ?, ?, ?, ?, ?)}");
            call.setInt(1, valor);
            call.setString(2, PERIODO);
            call.setInt(3, valor2);
            call.setString(4, SECCION);
            call.setString(5, CATEDRATICO);
            call.setString(6, HORARIO);
            call.setString(7, EDIFICIO);
            call.setInt(8, PERFIL);
            call.execute();

            
        }
        catch(Exception EX)
        {
            JOptionPane.showMessageDialog(null, EX.getMessage());
        }
    }
        
    public ArrayList<String> Listar(int codigo)
    {
        Conexion bd=new Conexion();
        Statement stmt=null;
        ResultSet rs=null;    
        bd.conexion();        
        ArrayList<String> lista = new ArrayList();        
        try{
            PreparedStatement psListar = bd.getConnection().prepareStatement("SELECT campus, periodo, clase, seccion, horario, edificio, idcarga_academica FROM carga_academica WHERE perfil="+codigo);
            ResultSet rsListar = psListar.executeQuery();
            while(rsListar.next()){
                lista.add(rsListar.getString(1));
                lista.add(rsListar.getString(2));
                lista.add(rsListar.getString(3));
                lista.add(rsListar.getString(4));
                lista.add(rsListar.getString(5));
                lista.add(rsListar.getString(6));
                lista.add(rsListar.getString(7));                   
            }
        }catch(SQLException e){
            System.out.println("Error Perfil Listar " + e.getMessage());
        }
        return lista;
    }
    
        public ArrayList<String> ListarEstudiantesCarga(int codigo)
    {
        Conexion bd=new Conexion();
        Statement stmt=null;
        ResultSet rs=null;    
        bd.conexion();        
        ArrayList<String> lista = new ArrayList();        
        try{
            PreparedStatement psListar = bd.getConnection().prepareStatement("SELECT cuenta_estudiantes, nombre_estudiantes FROM estudiantes A JOIN detalle_carga B ON A.idestudiantes=B.idestudiantes WHERE B.idcarga_academica="+codigo);
            ResultSet rsListar = psListar.executeQuery();
            while(rsListar.next()){
                lista.add(rsListar.getString(1));
                lista.add(rsListar.getString(2));                  
            }
        }catch(SQLException e){
            System.out.println("Error Perfil Listar " + e.getMessage());
        }
        return lista;
    }
    
    public String recuperarClase(int id)
    {
        String valor="";
        try
        {
            Conexion bd=new Conexion();
            Statement stmt=null;
            ResultSet rs=null;
            bd.conexion();

            CallableStatement call=bd.con.prepareCall("{CALL recuperarAsignatura(?)}");
            call.setInt(1, id);
            call.execute();
            rs = call.getResultSet();
            while(rs.next())
            {
               valor=rs.getString(1);
            }
            
        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
        }
        return valor;
    }    
        
    public void insertarEstudiante(String cuenta, String Nombre)
    {
        int valor=-1;
        try
        {
            Conexion bd=new Conexion();
            Statement stmt=null;
            ResultSet rs=null;
            bd.conexion();

            CallableStatement call=bd.con.prepareCall("{CALL existe_estudiante(?)}");
            call.setString(1, cuenta);
            call.execute();
            rs = call.getResultSet();
            while(rs.next())
            {
               valor=rs.getInt(1);
            }
            
            int last=0;
            call=bd.con.prepareCall("{CALL ultimaCarga()}");
            call.execute();
            rs = call.getResultSet();
            while(rs.next())
            {
               last=rs.getInt(1);
            }
            
            if(valor==0)
            {
                call=bd.con.prepareCall("{CALL estudiantes_Carga(?, ?, ?, ?)}");
                call.setString(1, cuenta);
                call.setString(2, Nombre);
                call.setInt(3, last);
                call.setInt(4, 0);
                call.execute();

            }
            else
            {
                call=bd.con.prepareCall("{CALL estudiantes_Carga(?, ?, ?, ?)}");
                call.setString(1, cuenta);
                call.setString(2, Nombre);
                call.setInt(3, last);
                call.setInt(4, 1);
                call.execute();
            }
            
        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
        }
    }
    
    public void insertarXML(String campus, String clase, String absoluteDiskPath) throws FileNotFoundException, TransformerException
    {
           try 
           {
                Tag raiz = new Tag("TEMPORALES");
                
                Tag campuss = new Tag("campus");
                Tag clases = new Tag("clase");
                
                campuss.addContenido(campus);
                clases.addContenido(clase);
                         
                raiz.addAtributo("PORTAFOLIO", "Docentes");   
                raiz.addTagHijo(campuss);
                raiz.addTagHijo(clases);

                
                JespXML j= new JespXML(absoluteDiskPath);
                j.escribirXML(raiz);
                
            } catch (ParserConfigurationException ex) {
                JOptionPane.showMessageDialog(null, ex.getMessage());
            } 
        
    }
}
