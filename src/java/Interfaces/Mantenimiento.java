/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import java.util.ArrayList;

/**
 *
 * @author carlos
 */
public interface Mantenimiento {
    
    public ArrayList<String> Listar();
    
    public ArrayList<String> ListarBusqueda(String nombre);
    
    public boolean Crear();
    
    public boolean Actualizar();
    
    public void Obtener(String llavePrimaria);
 
    public boolean Existe(String llavePrimaria);
    
    public String NombreACodigo(String nombre);
    
    public String CodigoANombre(String codigo);
    
}
