/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejer2;

import java.util.Scanner;
/**
 *
 * @author Lucas Arrigoni
 */
public class Ejer2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Scanner e = new Scanner(System.in);
        NomRandom random = new NomRandom();
        
        GrupoBeta gB = new GrupoBeta(10);
        GrupoAlfa gA = new GrupoAlfa(10);
        
        /* llenar los dos grupos */
        for (int i = 0; i < 10; i++) {
            gB.agregarPaciente(random.getNombre());
            gA.agregarPaciente(random.getNombre());
        }
        
        /* ebtener los datos de un paciente segun su ID */
        System.out.print("numero de ID del paciente: ");
        int id = e.nextInt();
        if ((id >= 1) & (id <= 10)) {
            System.out.println(gB.obtenerPaciente(id));
            System.out.println(gA.obtenerPaciente(id));
        } else {
            System.out.println("ID incorrecto, no hay nadie con ese ID");
        }
        
        /* aplicar el farmaco a los dos grupos */
        double farmaco = Math.random();
        gB.aplicarElFarmaco(farmaco);
        gA.aplicarElFarmaco(farmaco);
        
        /* no funcionan los agregarPaciente, me parece que esta mal vector en los grupos
        y tiene que estar en la clase Paciente */
    }
    
}
