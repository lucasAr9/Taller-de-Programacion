/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5_2;

import PaqueteLectura.Lector;

public class Punto2 {

    public static void main(String[] args) {
        
                
        System.out.print("nombre: ");
        String nombre = Lector.leerString();
        System.out.print("sueldo: ");
        double sueldo = Lector.leerDouble();
        System.out.print("cantidad de partidos ganados: ");
        int partidosGan = Lector.leerInt();
        
        Entrenador entrenador = new Entrenador(nombre, sueldo, partidosGan);
        
        System.out.println(entrenador.calcularSueldoACobrar());
        System.out.println(entrenador.toString());
    }
    
}
