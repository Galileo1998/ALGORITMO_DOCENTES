package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

public class Conexion
{
    public Connection con=null;

    public Conexion() {
        try {
           Class.forName("com.mysql.cj.jdbc.Driver");
        }catch (Exception ex){
           JOptionPane.showMessageDialog(null, "ERROR DE DRIVER");
        }        
        
        try{
            String url = "jdbc:mysql://localhost/unicah_portafolio_docentes?"
                    + "";
            String username = "root";
            String password = "";
            con = DriverManager.getConnection(url, username, password);
        }catch(Exception ex){
            JOptionPane.showMessageDialog(null,ex.getMessage());
        }        
    }        
    
    public Connection conexion(){
        if(con != null){
           return con;
        }else{
            System.out.println("ERROR EN LA CONEXION getConnection");
           return null;
        }        
    }
    
    public Connection getConnection(){
        if(con != null){
           return con;
        }else{
            System.out.println("ERROR EN LA CONEXION getConnection");
           return null;
        }
    }
    
}
