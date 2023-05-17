/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejer3;

import java.util.Random;
import java.util.Scanner;

/**
 *
 * @author Lucas Arrigoni
 */
public class Ejer3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Scanner e = new Scanner(System.in);
        Random r = new Random();
        Ran ran = new Ran();
        
        Estanteria est = new Estanteria(5, 10);
        
        /* CARGAR 25 LIBROS EN ORDEN */
        for (int i = 0; i < 25; i++) {
            
            /* Autor */
            String nombre = ran.generarNombres();
            String bio = ran.generarBio();
            Autor a = new Autor(nombre, bio);
            
            /* Libro */
            String titulo = ran.generarTitulo();
            int cantPag = r.nextInt(500);
            double peso = r.nextDouble();
            Libro l = new Libro(titulo, cantPag, peso, a);

            /* agregarlo al estante */
            System.out.println(est.agregarLibro(l));
        }
        
        System.out.println("aca termina el agregado de libros-------------------------------");
        System.out.println("");
        System.out.println("");
        System.out.println("SE IMPRIME LA ESTANTERIA COMPLETA");
        System.out.println(est.toString());
        
        /* AGREGAR UN LIBRO POR POS */
        System.out.println("");
        System.out.println("");
        System.out.println("AGREGAR UN LIBRO, EL LIBRO ES: ");
        /* Autor */
        String nombre = ran.generarNombres();
        String bio = ran.generarBio();
        Autor a = new Autor(nombre, bio);
        /* Libro */
        String titulo = ran.generarTitulo();
        int cantPag = r.nextInt(500);
        double peso = r.nextDouble();
        Libro l = new Libro(titulo, cantPag, peso, a);
        /* mostrar que libro es */
        System.out.println(l.toString());
        /* preguntar por la pos */
        System.out.print("en que estante? ");
        int numEst = e.nextInt();
        System.out.print("en que pos? ");
        int numPos = e.nextInt();
        /* agregarlo en la pos y en caso de que sea pos invalida informa */
        System.out.println(est.agregarPorPos(l, numEst, numPos));
        
        /* SACAR UN LIBRO POR SU TITULO */
        System.out.println("");
        System.out.println("");
        System.out.println("SACAR UN LIBRO POR SU TITULO");
        String unTitu = e.next();
        System.out.println(est.sacarLibro(unTitu));
        
        /* MOSTRAR LOS MAXIMOS */
        System.out.println("");
        System.out.println("");
        System.out.println("MAXIMOS");
        System.out.println("libro mas paginas");
        System.out.println(est.libroMasPaginas());
        System.out.println("estante mas pesado");
        System.out.println(est.estanteMasPesado());
        
        System.out.println("");
        System.out.println("");
        System.out.println("SE IMPRIME LA NUEVA ESTANTERIA CON EL LIBRO AGREGADO Y EL SACADO");
        System.out.println(est.toString());
    }
    
}
