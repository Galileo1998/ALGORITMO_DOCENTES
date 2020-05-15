/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidad;

import Database.Conexion;
import Interfaces.Mantenimiento;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author carlos
 */
public class Perfil implements Mantenimiento{
/*    
    PerCod int(11) AI PK 
    PerNom varchar(60) 
    PerApe varchar(60) 
    PerNacFech date 
    PerIde varchar(20) 
    PerEmpCod varchar(45) 
    PerTel varchar(20) 
    PerGen varchar(5) 
    PerMail varchar(80) 
    FacCod varchar(40) 
    PerImg varchar(250) 
    PerDesc varchar(512) 
    PerEst varchar(5)
 */          
    public String PerCod = "";
    public String PerNom = "";
    public String PerApe = "";
    public String PerNacFech = "";
    public String PerIde = "";
    public String PerEmpCod = "";
    public String PerTel = "";
    public String PerGen = "";
    public String PerMail = "";
    public String FacCod = "";
    public String PerImg = "";
    public String PerDesc = "";
    public String PerEst = "";
    public String UsrId = "";

    
    Conexion conn = new Conexion();
    
    @Override
    public ArrayList<String> Listar(){
        ArrayList<String> lista = new ArrayList();        
        try{
            PreparedStatement psListar = conn.getConnection().prepareStatement("SELECT PerNom, PerApe , PerMail, FacCod FROM PERFILES WHERE PerNom != ''");
            ResultSet rsListar = psListar.executeQuery();
            while(rsListar.next()){
                lista.add(rsListar.getString(1) + " " + rsListar.getString(2));
                lista.add(rsListar.getString(3));
                lista.add(rsListar.getString(4));                
            }
        }catch(SQLException e){
            System.out.println("Error Perfil Listar " + e.getMessage());
        }
        return lista;
    }
    
    @Override
    public boolean Crear() {
        boolean ejecuto = false;
        try{
            PreparedStatement psCrear = conn.getConnection().prepareStatement("INSERT INTO `unicah_portafolio_docentes`.`perfiles`\n" +
                                                                            "(`PerNom`, `PerApe`, `PerNacFech`, `PerIde`, `PerEmpCod`,\n" +
                                                                            "`PerTel`,`PerGen`, `PerMail`, `FacCod`, `PerImg`, `PerDesc`, `PerEst`)" +
                                                                            "VALUES\n" +
                                                                            "( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");           
            psCrear.setString(1, PerNom);
            psCrear.setString(2, PerApe);
            psCrear.setString(3, PerNacFech);
            psCrear.setString(4, PerIde);
            psCrear.setString(5, PerEmpCod);
            psCrear.setString(6, PerTel);
            psCrear.setString(7, PerGen);
            psCrear.setString(8, PerMail);
            psCrear.setString(9, FacCod);
            psCrear.setString(10, PerImg);
            psCrear.setString(11, PerDesc);
            psCrear.setString(12, PerEst);
            //psCrear.setString(13, UsrId);
            ejecuto = psCrear.execute();
        }catch(SQLException e){
            System.out.println("Error Perfil Crear " + e.getMessage());
        }
        return ejecuto;
    }
    
    
    
    @Override
    public boolean Actualizar() {
        boolean ejecuto = false;
        try{
            PreparedStatement psActualizar = conn.getConnection().prepareStatement("UPDATE `unicah_portafolio_docentes`.`perfiles`\n" +
                                                                                    "SET\n" +
                                                                                    "`PerNom` = ?, `PerApe` = ?, `PerNacFech` = ?, `PerIde` = ?, `PerEmpCod` = ?, `PerTel` = ?,\n" +
                                                                                    "`PerGen` = ?, `PerMail` = ?, `FacCod` = ?, `PerImg` = ?, `PerDesc` = ?, `PerEst` = ?\n" +
                                                                                    "WHERE `PerCod` = ?;");
            psActualizar.setString(1, PerNom);
            psActualizar.setString(2, PerApe);
            psActualizar.setString(3, PerNacFech);
            psActualizar.setString(4, PerIde);
            psActualizar.setString(5, PerEmpCod);
            psActualizar.setString(6, PerTel);
            psActualizar.setString(7, PerGen);
            psActualizar.setString(8, PerMail);
            psActualizar.setString(9, FacCod);
            psActualizar.setString(10, PerImg);
            psActualizar.setString(11, PerDesc);
            psActualizar.setString(12, PerEst);
            psActualizar.setString(13, PerCod);
            
            ejecuto = 1 == psActualizar.executeUpdate();
        }catch(SQLException e){
            System.out.println("Error Perfil Actualizar " + e.getMessage());
        }
        return ejecuto;
    }

    @Override
    public void Obtener(String llavePrimaria) {        
        if(true){
            try{
                PreparedStatement psObtener = conn.getConnection().prepareStatement("SELECT * FROM `perfiles`\n" +
                                                                                    "WHERE PerCod = ?;");
                psObtener.setString(1, llavePrimaria);                
                ResultSet rsObtener = psObtener.executeQuery();
                while(rsObtener.next()){
                    PerCod = rsObtener.getString(1);
                    PerNom = rsObtener.getString(2);
                    PerApe = rsObtener.getString(3);
                    PerNacFech = rsObtener.getString(4);
                    PerIde = rsObtener.getString(5);
                    PerEmpCod = rsObtener.getString(6);
                    PerTel = rsObtener.getString(7);
                    PerGen = rsObtener.getString(8);
                    PerMail = rsObtener.getString(9);
                    FacCod = rsObtener.getString(10);
                    PerImg = rsObtener.getString(11);
                    PerDesc = rsObtener.getString(12);
                    PerEst = rsObtener.getString(13);
                }
            }catch(SQLException e){
                System.out.println("Error Perfil Obtener " + e.getMessage());
            }
        }
    }

    @Override
    public boolean Existe(String llavePrimaria) {
        boolean existe = false;
        try{
            CallableStatement csExiste = conn.getConnection().prepareCall("CALL EXISTE_PERFIL(?);");
            csExiste.setString(1, PerCod);
            
            ResultSet rsExiste = csExiste.getResultSet();
            while(rsExiste.next()){
                existe = 1 == Integer.parseInt(rsExiste.getString(1));
            }
        }catch(SQLException e){
            System.out.println("Error Perfil Existe " + e.getMessage());
        }
        return existe;
    }

    @Override
    public String NombreACodigo(String nombre) {
        String codigo = "";
        try{
            PreparedStatement psCodigo = conn.getConnection().prepareStatement("SELECT  PerCod FROM Perfiles\n" +
                                                                               "WHERE CONCAT(PerNom, ' ', PerApe) = ?");
            psCodigo.setString(1, nombre);
            ResultSet rsCodigo = psCodigo.executeQuery();
            while(rsCodigo.next()){
                codigo = rsCodigo.getString(1);
            }
        }catch(SQLException e){
            System.out.println("Error Perfil NombreACodigo " + e.getMessage());
        }
        return codigo;
    }

    @Override
    public String CodigoANombre(String codigo) {
        String nombre = "";
        try{
            PreparedStatement psNombre = conn.getConnection().prepareStatement("SELECT PerNom FROM Perfiles\n" +
                                                                               "WHERE PerCod = ?");
            psNombre.setString(1, codigo);
            ResultSet rsNombre = psNombre.executeQuery();
            while(rsNombre.next()){
                nombre = rsNombre.getString(1);
            }
        }catch(SQLException e){
            System.out.println("Error Perfil CodigoANombre " + e.getMessage());
        }
        return nombre;
    }

    @Override
    public ArrayList<String> ListarBusqueda(String nom) {
                ArrayList<String> lista = new ArrayList();
        try{            
            PreparedStatement psListar = conn.getConnection().prepareStatement("SELECT PerNom, PerApe , PerMail, FacCod FROM PERFILES\n"
                                                                            +  "WHERE PerNom like ? or PerApe like ? or PerMail like ? or FacCod = ?");
            psListar.setString(1, nom + "%");
            psListar.setString(2, nom + "%");
            psListar.setString(3, nom + "%");
            psListar.setString(4, nom + "%");            
            ResultSet rsListar = psListar.executeQuery();
            while(rsListar.next()){
                lista.add(rsListar.getString(1) + " " + rsListar.getString(2));
                lista.add(rsListar.getString(3));
                lista.add(rsListar.getString(4));                
            }
            
        }catch(SQLException e){
            System.out.println("Error Usuario Listar " + e.getMessage());
        }
        return lista;
    }
    
    
}
