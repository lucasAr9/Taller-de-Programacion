/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejer1;

import java.util.*;
/**
 *
 * @author Lucas Arrigoni
 */
public class Ejer1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Scanner e = new Scanner(System.in);
        GeneraRandom r = new GeneraRandom();
        
        /**
         * crear un objeto Alumno de Doctorado.
         */
        r.generadorRandom();
        Doctorado d = new Doctorado(r.getDni(), r.getNombre(), r.getMateria(), r.getTitulo(), r.getUni());
        
        /**
         * creo un objeto Alumno de Grado.
         */
        r.generadorRandom();
        Grado g = new Grado(r.getDni(), r.getNombre(), r.getMateria(), r.getTitulo());
        
        /**
         * cargar las materias del Alumno Doctorado y del de Grado.
         */
        for (int i = 0; i < d.getCantMaterias(); i++) {
            r.generarRandomMateria();
            Fecha f = new Fecha(r.getDia(), r.getMes(), r.getAnio());
            Materia m = new Materia(r.getNombreM(), r.getNota(), f);
            d.agregarMateria(m);
        }
        d.aprobarTesis();
        
        for (int i = 0; i < g.getCantMaterias(); i++) {
            r.generarRandomMateria();
            Fecha f = new Fecha(r.getDia(), r.getMes(), r.getAnio());
            Materia m = new Materia(r.getNombreM(), r.getNota(), f);
            g.agregarMateria(m);
        }
        g.aprobarTesis();
        
        /**
         * imprimir la informacion
         */
        System.out.println(d.toString() + "\n" + d.siSeGraduo());
        System.out.println(g.toString() + "\n" + g.siSeGraduo());
    }
    
}
