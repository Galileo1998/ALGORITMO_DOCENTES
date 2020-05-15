package Controlador;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Controlador.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import Entidad.Usuario;

/**
 *
 * @author GALILEO
 */
public class recuperacionEmail extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String correo = request.getParameter("txtCorreo");
        String password="";
        Usuario con = new Usuario();
        RequestDispatcher vista = request.getRequestDispatcher("Vistas/recuperar_login.jsp");
        vista.forward(request, response);
        if(con.mail(correo))
        {
            email em= new email();
            em.enviarcorreo("parrocristoresucitado@gmail.com", "resucitado3", correo, con.pass(correo), "Recuperación de contraseña");
                  
            String mensaje="<script language='javascript'>var men = confirm('Se ha enviado un mensaje a tu correo.'); if(men){window.open('index.jsp','_self');} else {window.open('recuperar_login.jsp','_self');}</script>";
            //String mensaje="<script language='javascript'> var confirm= alertify.confirm('Probando confirm','Confirmar solicitud?',null,null).set('labels', {ok:'Confirmar', cancel:'Cancelar'});</script>"; 
            out.println(mensaje); 

            //response.sendRedirect("index.jsp");
        }
        else
        {
            String mensaje="<script language='javascript'>var men = confirm('Est correo no está vinculado a ninguna cuenta.'); if(men){window.open('recuperar_login.jsp','_self');} else {window.open('recuperar_login.jsp','_self');}</script>"; 
            out.println(mensaje); 
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
class email
{
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