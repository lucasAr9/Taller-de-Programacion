/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejer4;

import java.util.Scanner;
import java.util.Random;

/**
 *
 * @author Lucas Arrigoni
 */
public class Ejer4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Scanner e = new Scanner(System.in);
        Random r = new Random();
        
        /* crear alumno de grado */
        Grado g = new Grado("ingeniero en computacion", "el pepe", 40134530);
        
        for (int i = 0; i < 30; i++) {
            int nota = r.nextInt(6) + 4;
            int mes = r.nextInt(12) + 1;
            int anio = r.nextInt(22) + 2000;
            g.cargarMateria(i, nota, mes, anio);
        }
        
        /* crear un alumno doctorado */
        Doctorado d = new Doctorado("agricultor", "UNLP", "jose", 40369230);
        
        for (int i = 0; i < 8; i++) {
            int nota = r.nextInt(6) + 4;
            int mes = r.nextInt(12) + 1;
            int anio = r.nextInt(22) + 2000;
            d.cargarMateria(i, nota, mes, anio);
        }
        
        System.out.println("GRADO---------------------------------------------------------");
        System.out.println(g.toString());
        System.out.println(g.determinarAprobacion());
        System.out.println("");
        System.out.println("");
        System.out.println("DOCTORADO-----------------------------------------------------");
        System.out.println(d.toString());
        System.out.println(d.determinarAprobacion());
    }
    
}
