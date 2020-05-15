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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;

/**
 *
 * @author carlos
 */
public class Usuario implements Mantenimiento{
/*
    UsrId int(11) AI PK 
    UsrUsr varchar(40) 
    UsrPwd varchar(60) 
    UsrNom varchar(120) 
    UsrTel varchar(20) 
    UsrMail varchar(120) 
    UsrstAcc datetime 
    UsrEst varchar(45) 
    FacCod varchar(45)
*/    
    public String UsrId = "";
    public String UsrUsr = "";
    public String UsrPwd = "";
    public String UsrNom = "";
    public String UsrTel = "";
    public String UsrMail = "";
    public String UsrstAcc = "";
    public String UsrEst = "";
    public String FacCod = "";
    public String RolCod = "";

    public Usuario() {
    
    }
    Conexion conn = new Conexion();
    
    @Override
    public ArrayList<String> Listar(){
        ArrayList<String> lista = new ArrayList();
        try{
            PreparedStatement psListar = conn.getConnection().prepareStatement("SELECT UsrUsr, UsrNom, FacCod FROM USUARIO");
            ResultSet rsListar = psListar.executeQuery();
            while(rsListar.next()){
                lista.add(rsListar.getString(1));
                lista.add(rsListar.getString(2));
                lista.add(rsListar.getString(3));              
            }
        }catch(SQLException e){
            System.out.println("Error Usuario Listar " + e.getMessage());
        }
        return lista;
    }
    
    @Override
    public ArrayList<String> ListarBusqueda(String nom) {
            ArrayList<String> lista = new ArrayList();
        try{
            PreparedStatement psListar = conn.getConnection().prepareStatement("SELECT UsrUsr, UsrNom, FacCod FROM USUARIO WHERE UsrUsr like ? or UsrNom like ?");
            psListar.setString(1, nom + "%");
            psListar.setString(2, nom + "%");
            ResultSet rsListar = psListar.executeQuery();
            while(rsListar.next()){
                lista.add(rsListar.getString(1));
                lista.add(rsListar.getString(2));
                lista.add(rsListar.getString(3));              
            }
        }catch(SQLException e){
            System.out.println("Error Usuario Listar " + e.getMessage());
        }
        return lista;
    }
    
    @Override
    public boolean Crear() {
        boolean ejecuto = false;
        try{
            CallableStatement psCrear = conn.getConnection().prepareCall("CALL `unicah_portafolio_docentes`.`CrearUsuario`(?, ?, ?, ?, ?, ?, ?, ?);");
            psCrear.setString(1, UsrUsr);
            psCrear.setString(2, UsrPwd);
            psCrear.setString(3, UsrNom);
            psCrear.setString(4, UsrTel);
            psCrear.setString(5, UsrMail);
            psCrear.setString(6, UsrEst);            
            psCrear.setString(7, RolCod);
            psCrear.setString(8, FacCod);
            ejecuto = 1 == psCrear.executeUpdate();
        }catch(SQLException e){
            System.out.println("Error en CrearUsuario " + e.getMessage());
        }
        
        return ejecuto;
    }

    @Override
    public boolean Actualizar() {
        boolean ejecuto = false;
        try{
            PreparedStatement psInsert = conn.getConnection().prepareStatement("UPDATE `unicah_portafolio_docentes`.`usuario`\n" +
                                                                              "SET\n" +
                                                                              "`UsrUsr` = ?, `UsrPwd` = ?, `UsrNom` = ?, `UsrTel` = ?, \n" +
                                                                              "`UsrMail` = ?, `UsrEst` = ?, `RolCod` = ? ,`FacCod` = ?\n" +
                                                                              "WHERE `UsrId` = ?;");
            psInsert.setString(1, UsrUsr);
            psInsert.setString(2, UsrPwd);
            psInsert.setString(3, UsrNom);
            psInsert.setString(4, UsrTel);
            psInsert.setString(5, UsrMail);
            psInsert.setString(6, UsrEst);            
            psInsert.setString(7, RolCod);
            psInsert.setString(8, FacCod);
            psInsert.setString(9, UsrId);
            
            ejecuto = 1 == psInsert.executeUpdate();                        
        }catch(SQLException e){
            System.out.println("Error Usuario Actualizar " + e.getMessage());
        }
        return ejecuto;
    }
    
    @Override
    public void Obtener(String llavePrimaria) {
        if(Existe(llavePrimaria)){
            try{
                PreparedStatement psObtener = conn.getConnection().prepareStatement("SELECT * FROM usuario\n" +
                                                                                 "WHERE UsrId = ?;");
                psObtener.setString(1, llavePrimaria);
                ResultSet rsObtener = psObtener.executeQuery();
                while(rsObtener.next()){                    
                    UsrId = rsObtener.getString(1);
                    UsrUsr = rsObtener.getString(2);
                    UsrPwd = rsObtener.getString(3);
                    UsrNom = rsObtener.getString(4);
                    UsrTel = rsObtener.getString(5);
                    UsrMail = rsObtener.getString(6);
                    UsrstAcc = rsObtener.getString(7);
                    UsrEst = rsObtener.getString(8);
                    RolCod = rsObtener.getString(9);
                    FacCod = rsObtener.getString(10);                    
                }
            }catch(SQLException e){
                System.out.println("Error Usuario Obtener() " + e.getMessage());
            }
        }      
    }

    @Override
    public boolean Existe(String llavePrimaria) {
        boolean existe = false;
        try{
            CallableStatement csExiste = conn.getConnection().prepareCall("CALL EXISTE_USUARIO(?);");
            csExiste.setString(1, llavePrimaria);
            csExiste.execute();
            
            ResultSet rsExiste = csExiste.getResultSet();
            while(rsExiste.next()){
                existe = 1 == Integer.parseInt(rsExiste.getString(1));
            }
        }catch(SQLException e){
            System.out.println("Error Usuario Existe() " + e.getMessage());
        }
        return existe;
    }
    
    public String getPerfil(){
        String PerCod = "";
        try{
            Conexion conn = new Conexion();
            PreparedStatement ps = conn.getConnection().prepareStatement("SELECT PERCOD FROM PERFILES WHERE USRID = ?");
            ps.setString(1, UsrId);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
               PerCod = rs.getString(1);
            }else{
                
            }            
        }catch(SQLException e){
            
        }
        return PerCod;
    }
    
    @Override
    public String NombreACodigo(String nombre) {
        String codigo = "";
        try{
            PreparedStatement psCodigo = conn.getConnection().prepareStatement("SELECT UsrId FROM USUARIO\n"+
                                                                               "WHERE UsrUsr = ?");
            psCodigo.setString(1, nombre);
            
            ResultSet rsCodigo = psCodigo.executeQuery();
            while(rsCodigo.next()){
                codigo = rsCodigo.getString(1);
            }
        }catch(SQLException e){
            System.out.println("Error Usuario NombreACodigo " + e.getMessage());
        }
        return codigo;
    }

    @Override
    public String CodigoANombre(String codigo) {
        String nombre = "";
        try{
            PreparedStatement psNombre = conn.getConnection().prepareStatement("SELECT UsrNom FROM USUARIO\n"+
                                                                               "WHERE UsrId = ?");
            psNombre.setString(1, codigo);
            
            ResultSet rsNombre = psNombre.executeQuery();
            while(rsNombre.next()){
                nombre = rsNombre.getString(1);
            }
        }catch(SQLException e){
            System.out.println("Error Usuario CodigoANombre " + e.getMessage());
        }
        return nombre;
    }
    
    public  boolean loginuser(String usuario, String contrasenna)
    {
            Conexion bd = new Conexion();            

            int valor=0;
            try
            {
                CallableStatement call = bd.getConnection().prepareCall("{CALL BUSCAR_USUARIO(?, ?)}");
                call.setString(1, usuario);
                call.setString(2, contrasenna);
                call.execute();
                ResultSet rs = call.getResultSet();
                while(rs.next())
                {
                   valor=rs.getInt(1);
                }
            }
            catch(Exception ex)
            {
                JOptionPane.showMessageDialog(null, ex.getMessage());
            }     
            
            return valor == 1;
    }
        
    public  boolean mail(String correo)
    {
            Conexion bd = new Conexion();
            Statement stmt=null;
            ResultSet rs=null;
            bd.conexion();
            int valor=0;
            int actividad=0;
            String contra="";
            String rol="0";
            try
            {

                CallableStatement call=bd.con.prepareCall("{CALL EXISTE_CORREO(?)}");
                call.setString(1, correo);
                call.execute();
                rs = call.getResultSet();
                while(rs.next())
                {
                   valor=rs.getInt(1);
                   contra=rs.getString(2);
                }
            }
            catch(Exception ex)
            {
                JOptionPane.showMessageDialog(null, ex.getMessage());
            }     
            
            if (valor==1)
            {
                System.out.println("éxito");
                return true;
            }
            else
            {
                return false;
            }
    }  
     
    
    public String pass(String correo)
    {
            Conexion bd = new Conexion();
            Statement stmt=null;
            ResultSet rs=null;
            bd.conexion();
            String contra="";
            try
            {

                CallableStatement call=bd.con.prepareCall("{CALL EXISTE_CORREO(?)}");
                call.setString(1, correo);
                call.execute();
                rs = call.getResultSet();
                while(rs.next())
                {
                   contra=rs.getString(2);
                }
            }
            catch(Exception ex)
            {
                JOptionPane.showMessageDialog(null, ex.getMessage());
            }     
            return contra;
    }
    
        public  boolean enviarcorreo(String de, String clave,String para,String mensaje,String asunto)
        {
        boolean enviado = false;
        try{

                    String host="smtp.gmail.com";

                    Properties prop=System.getProperties();

                    prop.put("mail.smtp.starttls.enable","true");
                    prop.put("mail.smtp.host",host);
                    prop.put("mail.smtp.user",de);
                    prop.put("mail.smtp.password",clave);
                    prop.put("mail.smtp.port",587);
                    prop.put("mail.smtp.auth", "true");

                    Session session=Session.getDefaultInstance(prop,null);
                    MimeMessage message= new MimeMessage(session);

                    message.setFrom(new InternetAddress(de));

                    message.setRecipient(Message.RecipientType.TO, new InternetAddress(para));
                    message.setSubject(asunto);
                    message.setText(mensaje);

                    System.out.print(message);

                    Transport transport=session.getTransport("smtp");
                    transport.connect(host,de,clave);

                    transport.sendMessage(message, message.getAllRecipients());
                    transport.close();
                    enviado=true;
                    System.out.print(enviado);

            }
            catch (Exception e)
            {
                    e.printStackTrace();

            }
                return enviado;
        }
  
    
}
