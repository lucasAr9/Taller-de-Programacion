/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejer5;

import java.util.Scanner;

/**
 *
 * @author Lucas Arrigoni
 */
public class Ejer5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Scanner e = new Scanner(System.in);
        NomRandom nombresRan = new NomRandom();
        
        int cuantosAgregar = 3;
        int cantPacPorGrupo = 10;
        Beta beta = new Beta(cantPacPorGrupo);
        Alfa alfa = new Alfa(cantPacPorGrupo);
        
        /* agregar pacientes en el grupo Beta */
        for (int i = 0; i < cuantosAgregar; i++) {
            
            /* generar los valores random del Paciente */
            String nombre = nombresRan.generadorNombre();
            double ultimaDosisDeFarmaco = Math.random() + 2;
            double ultimoValorGlucosa = Math.random() + 2;
            
            /* crear el Paciente */
            Paciente p = new Paciente(nombre, ultimoValorGlucosa, ultimaDosisDeFarmaco);
            
            /* agregarlo al grupo Beta */
            beta.agregarPaciente(p);
        }
        
        /* agregar pacientes en el grupo Alfa */
        for (int i = 0; i < cuantosAgregar; i++) {
            
            /* generar los valores random del Paciente */
            String nombre = nombresRan.generadorNombre();
            double ultimaDosisDeFarmaco = Math.random() + 2;
            double ultimoValorGlucosa = Math.random() + 2;
            
            /* crear el Paciente */
            Paciente p = new Paciente(nombre, ultimoValorGlucosa, ultimaDosisDeFarmaco);
            
            /* agregarlo al grupo Beta */
            alfa.agregarPaciente(p);
        }
        
        System.out.println("");
        System.out.println("");
        System.out.println("ver un paciente por ID, con un ID valido.");
        System.out.println("grupo Beta " + beta.retornarPaciente(cuantosAgregar - 1));
        System.out.println("grupo Alfa " + alfa.retornarPaciente(cuantosAgregar - 1));
        System.out.println("ver un paciente por ID, con un ID invalido.");
        System.out.println("grupo Beta " + beta.retornarPaciente(cuantosAgregar + 1));
        System.out.println("grupo Alfa " + alfa.retornarPaciente(cuantosAgregar + 1));
        
        System.out.println("");
        System.out.println("");
        System.out.println("el toString del grupo Beta.");
        System.out.println(beta.toString());
        System.out.println("el toString del grupo Alfa.");
        System.out.println(alfa.toString());
        
        beta.aplicarDosisBeta(2.3);
        alfa.aplicarDosisAlfa(2.3);
        System.out.println("");
        System.out.println("");
        System.out.println("Aplicada las dosis.");
        System.out.println(beta.toString());
        System.out.println(alfa.toString());
    }
    
}
