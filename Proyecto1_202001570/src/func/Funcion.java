/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package func;

import java.util.HashMap;
import java.util.LinkedList;
import javax.swing.JOptionPane;
/**
 *
 * @author Natal
 */
public class Funcion {
    public static LinkedList<String> funciones = new LinkedList<>();//Lista de funciones estadisticas
    public static int contador = 0; //Contador de tabulaciones
    public static LinkedList<String> traduccion = new LinkedList<>();//Lista de traduccion 
    
    // Agregar Tabulaciones
    public static LinkedList<String>  tabulaciones(LinkedList<String> lista){
        String tabs = "";
        for (int i = 0; i < contador; i++) {
            tabs = "\t"+tabs;
        }
        
        for (int i = 0; i < lista.size(); i++) {
            lista.set(i, tabs+lista.get(i));
        }
        
        return lista;
    }

    
}