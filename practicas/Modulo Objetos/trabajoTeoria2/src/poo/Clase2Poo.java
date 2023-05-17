/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clase2.poo;

import PaqueteLectura.Lector;

/**
 *
 * @author Victoria
 */
public class Clase2Poo {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Estacionamiento e = new Estacionamiento("ABC","12 e/ 45 y 46","6:00","22:00",3,3);
        
        for (int i = 0; i<6; i++){
           System.out.println("Ingrese patente, dueño, piso (1..3) y plaza (1..3) ");
           int patente = Lector.leerInt();
           String dueño = Lector.leerString();
           int piso = Lector.leerInt();
           int plaza=Lector.leerInt();
           
           Auto a = new Auto(dueño, patente);
           e.registrar(a, piso,plaza);
               
        }
        
        System.out.println(e.toString());
        
         System.out.println("Ingrese patente a buscar");
        int patente = Lector.leerInt();
        System.out.println( e.buscarAutoPorPatente(patente) );
        
        
        
        
    }
    
}
