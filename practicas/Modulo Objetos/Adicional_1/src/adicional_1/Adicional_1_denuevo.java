/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicional_1;

import java.util.Scanner;
/**
 *
 * @author Lucas Arrigoni
  * @author Lucas Arrigoni
 */
public class Adicional_1_denuevo {

    public static void main(String[] args) {
        /**
         * esto es una prueba para ver los commits que se mandan
         */
        Scanner e = new Scanner(System.in);
        
        /* crear un nuevo Proyecto */
        System.out.println("");
        System.out.println("github");
        System.out.println("");
        System.out.print("nombre del Proyecto: ");
        String nombre = e.nextLine();
        System.out.print("codigo del Proyecto: ");
        int codigo = e.nextInt();
        /* nuevo proyecto */
        Proyecto p = new Proyecto(nombre, codigo);
        /* setear director */
        System.out.print("nombre del Director: ");
        String director = e.nextLine();
        p.setDirector(director);
        
        /* agregar dos Investigadores al Proyecto */
        for (int i = 0; i < 2; i++) {
            System.out.println("");
            System.out.println("Investigador numero " + i);
            /* leer datos */
            System.out.print("nombre Investigador: ");
//            String nombreInvestigador = Lector.leerString();
//            System.out.print("categoria Investigador: ");
//            int categoria = GeneradorAleatorio.generarInt(5);
//            System.out.print("especialidad Investigador: ");
//            String especialidad = GeneradorAleatorio.generarString(10);
            /* nuevo Investigador */
//            Investigador inv = new Investigador(nombreInvestigador, categoria, especialidad);
            /* agregar un Investigador mas */
//            p.agregarInvestigador(inv);
        }
        
        /* agregar sub */
        System.out.print("github: ");
        System.out.print("github: ");
        System.out.print("si, no me inches las pelotas a ver: ");
        String nom = e.nextLine();
        System.out.print("monto: ");
        double monto = e.nextDouble();
        System.out.print("motivo: ");
        String motivo = e.nextLine();
        Subsidio s = new Subsidio (monto, motivo);
        p.agregarSubInvestigador(nom, s);
        System.out.print("si, no me inches las pelotas a ver: ");
        
        System.out.print("a quien se lo otorgamos to: ");
//        String uno = e.nextInt();
//        p.otorgarTodosSubs(uno);
        
        /* otorgarle todos los subs a uno */
        
        System.out.println(p.toString());
    }
    
}
