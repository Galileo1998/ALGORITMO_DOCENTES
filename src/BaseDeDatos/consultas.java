/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author GALILEO
 */
package BaseDeDatos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.JOptionPane;
import parroquia_cristo_resucitado.basededatos;
import principal.Principal;

public class consultas
{
    public static boolean login_user(String usuario, String contrasenna)
    {
            conexion bd = new conexion();
            Statement stmt=null;
            ResultSet rs=null;
            bd.conexion();
            int valor=0;
            int actividad=0;
            String rol="0";
            try
            {

                CallableStatement call=bd.con.prepareCall("{CALL EXISTS_LOGIN(?, ?)}");
                call.setString(1, usuario);
                call.setString(2, contrasenna);
                call.execute();
                rs = call.getResultSet();
                while(rs.next())
                {
                   valor=rs.getInt(1);
                   actividad= rs.getInt(2);
                   rol= String.valueOf(rs.getInt(3));
                }
            }
            catch(Exception ex)
            {
                JOptionPane.showMessageDialog(null, ex.getMessage());
            }     
            
            if (valor==1)
            {
                return true;
            }
            else
            {
                return false;
            }
    }
    
}

class conexion
{
    public Connection con=null;
    public Connection conexion()
    {
        try 
        {
               Class.forName("com.mysql.jdbc.Driver").newInstance();
        }
        catch (Exception ex) 
        {
               JOptionPane.showMessageDialog(null, "ERROR DE DRIVER");
        }
        try
        {
            String url = "jdbc:mysql://127.0.0.1:3306/parroquia_cristo_resucitado";
            String username = "root";
            String password = "Galileo1998";
            con = DriverManager.getConnection(url, username, password);
        }
        catch(Exception ex)
        {
            JOptionPane.showMessageDialog(null,ex.getMessage());
        }
        return con;
    }   
}

