/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package examen_2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
/**
 *
 * @author Lucas Arrigoni
 */
public class Examen_2 {

    public static void main(String[] args) {
        
        System.out.print("cantidad de parejas en el concurso: ");
        int cant = Lector.leerInt();
        Concurso c = new Concurso(cant);
        
        for (int j = 0; j < 10; j++) {
            
            Pareja pareja = new Pareja();
        
            for (int i = 0; i < 2; i++) {
                
                String nombre = GeneradorAleatorio.generarString(10);
                System.out.println("");
                System.out.println("nombre: " + nombre);
        
                int dni = GeneradorAleatorio.generarInt(60600600);
                int edad = GeneradorAleatorio.generarInt(80);
            
                Participante p = new Participante(nombre, dni, edad);
                pareja.agregarParticipante(p);
            }
            
            c.agregarPareja(pareja);
        }
        System.out.println(c.parejaMasDiferencia());
    }
}
