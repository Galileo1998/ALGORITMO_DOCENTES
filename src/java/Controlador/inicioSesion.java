package Controlador;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Entidad.Usuario;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

public class inicioSesion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    
        PrintWriter writer = response.getWriter();
        String usuario = request.getParameter("txtUsuario");
        String pass = request.getParameter("txtPass");
        Usuario user = new Usuario();

        HttpSession session = request.getSession();
        RequestDispatcher vista = null;
        System.out.println("InicioSession");
        if(session.getAttribute("UsrId")==null){
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");            
            if(user.loginuser(usuario, pass))
            {   
                user.Obtener(user.NombreACodigo(usuario));
                vista = null;
                session.setAttribute("UsrId", user.UsrId);
                session.setAttribute("FacCod", user.FacCod);
                session.setAttribute("RolCod", user.RolCod);
                
                String rol = user.RolCod;
                System.out.println("Rol: " + rol);
                if(rol.equals("ADM")){
                   vista = request.getRequestDispatcher("Vistas/dashboard.jsp");
                   vista.forward(request, response); 
                }else if(rol.equals("DEC")){
                    vista = request.getRequestDispatcher("Vistas/dashboard.jsp");
                    vista.forward(request, response); 
                }else if(rol.equals("DOC")){
//                    vista = request.getRequestDispatcher("Vistas/Perfil.jsp?PerCod=" + user.getPerfil() + "&Mode=UPD");
//                    vista.forward(request, response); 
                      response.sendRedirect("Perfil?PerCod=" + user.getPerfil() + "&Mode=UPD");
                }                    
            }else{
                vista = request.getRequestDispatcher("index.jsp");
                vista.forward(request, response);
                
            }
        }
        else
        {             
           vista = request.getRequestDispatcher("Vistas/dashboard.jsp");
           vista.forward(request, response); 
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
