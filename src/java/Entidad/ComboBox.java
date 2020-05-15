/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidad;

import java.util.ArrayList;
import Database.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author carlos
 */
public class ComboBox {
    
    public static ArrayList<String> listarFacultades(){
        ArrayList<String> lista = new ArrayList();
        Conexion conn = new Conexion();
        try{
            PreparedStatement ps = conn.getConnection().prepareStatement("SELECT FacCod FROM FACULTADES");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                lista.add(rs.getString("FacCod"));
            }
        }catch(SQLException e){
            System.out.println("Error Facultad listarFacultades");
        }
        
        return lista;
    }
    
    public static ArrayList<String> listarRoles(){
        ArrayList<String> lista = new ArrayList();
        Conexion conn = new Conexion();
        try{
            PreparedStatement ps = conn.getConnection().prepareStatement("SELECT RolCod FROM Roles");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                lista.add(rs.getString("RolCod"));
            }
        }catch(SQLException e){
            System.out.println("Error Facultad listarRoles");
        }
        
        return lista;
    }
}
