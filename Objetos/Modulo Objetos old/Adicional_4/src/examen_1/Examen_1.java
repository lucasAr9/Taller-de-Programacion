/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package examen_1;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author Lucas Arrigoni
 */
public class Examen_1 {

    public static void main(String[] args) {
        
        Agenda a = new Agenda();
        
        System.out.print("nombre paciente: ");
        String nombre = Lector.leerString();
        
        while (!nombre.equals("nada")) {
            
            boolean obraSocial = GeneradorAleatorio.generarBoolean();
            double costo = GeneradorAleatorio.generarDouble(90900);
            
            Paciente p = new Paciente(nombre, obraSocial, costo);
            
            System.out.print("en que dia: ");
            int d = Lector.leerInt();
            
            System.out.println(a.agregarPaciente(p, d));
            
            System.out.println("");
            System.out.print("nombre paciente: ");
            nombre = Lector.leerString();
        }
        
        System.out.print("");
        System.out.print("de quien queres liberar los turnos: ");
        String liberar = Lector.leerString();
        
        System.out.println(a.liberarTurno(liberar));
    }
}
