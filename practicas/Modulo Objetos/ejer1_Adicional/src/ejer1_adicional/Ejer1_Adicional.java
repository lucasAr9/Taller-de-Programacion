/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejer1_adicional;

import java.util.Scanner;
import java.util.Random;

/**
 *
 * @author Lucas Arrigoni
 */
public class Ejer1_Adicional {
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        Scanner e = new Scanner(System.in);
        Random r = new Random();
        RandomNom ranNom = new RandomNom();

        Beta b = new Beta();
        Alfa a = new Alfa();

        for (int i = 0; i < 10; i++) {

            String nombre = ranNom.generarNombre();
            double ultimaDosis = r.nextDouble();
            double ultimoFarmaco = r.nextDouble();

            Paciente pac = new Paciente(nombre, ultimaDosis, ultimoFarmaco);

            String nombre2 = ranNom.generarNombre();
            double ultimaDosis2 = r.nextDouble();
            double ultimoFarmaco2 = r.nextDouble();

            Paciente pac2 = new Paciente(nombre2, ultimaDosis2, ultimoFarmaco2);

            b.agregarPaciente(pac);
            a.agregarPaciente(pac2);
        }

        System.out.println("Los tres primeros pacientes del grupo Beta");
        System.out.println(b.obtenerPaciente(1).toString());
        System.out.println(b.obtenerPaciente(2).toString());
        System.out.println(b.obtenerPaciente(3).toString());
        System.out.println("Los tres primeros pacientes del grupo Alfa");
        System.out.println(a.obtenerPaciente(1).toString());
        System.out.println(a.obtenerPaciente(2).toString());
        System.out.println(a.obtenerPaciente(3).toString());
        
        System.out.println("");
        System.out.println("lista antes del farmaco");
        System.out.println(b.toString());
        System.out.println(a.toString());
        
        b.aplicarFarmaco(2);
        a.aplicarFarmaco(2);
        
        System.out.println("");
        System.out.println("lista despues del farmaco");
        System.out.println(b.toString());
        System.out.println(a.toString());
    }

}
