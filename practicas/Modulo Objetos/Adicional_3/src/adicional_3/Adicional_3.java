/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicional_3;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
/**
 *
 * @author Lucas Arrigoni
 */
public class Adicional_3 {

    public static void main(String[] args) {
        
        int i;
        int cantCoros = 2;
        Coro [] coros = new Coro [cantCoros];
        
        for (i = 0; i < cantCoros; i++) {
            /* detos del coro */
            System.out.println("");
            System.out.print("nombre del Coro: ");
            String nombre = Lector.leerString();
        
            /* datos del director */
            System.out.println("");
            System.out.print("director: ");
            String nombreDir = Lector.leerString();
            int edadDir = GeneradorAleatorio.generarInt(80);
            int dniDir = GeneradorAleatorio.generarInt(60600600);
            int antiguedadDir = GeneradorAleatorio.generarInt(20);
        
            Director dir = new Director(nombreDir, edadDir, dniDir, antiguedadDir);
        
            System.out.println("");
            System.out.print("formacion del coro: ");
            String formacion = Lector.leerString();
            if (formacion.equals("semi")) {
                System.out.print("cantidad de coristas: ");
                int cantCoristas = Lector.leerInt();
                Semicircular semi = new Semicircular(nombre, dir, cantCoristas);
                coros[i] = semi;
            } else
                if (formacion.equals("hilera")) {
                    System.out.print("flilas: ");
                    int fil = Lector.leerInt();
                    System.out.print("columnas: ");
                    int col = Lector.leerInt();
                    Hilera hile = new Hilera(nombre, dir, fil, col);
                    coros[i] = hile;
                }
        }

        int j;
        for (i = 0; i < cantCoros; i++) {
            for (j = 0; j < coros[i].getCantCoristas(); j++) {
                String nomAlu = GeneradorAleatorio.generarString(5);
                int dniAlu = GeneradorAleatorio.generarInt(60600600);
                int edadAlu = GeneradorAleatorio.generarInt(40);
                int tono = GeneradorAleatorio.generarInt(10);
                Alumno a = new Alumno(nomAlu, dniAlu, edadAlu, tono);
                coros[i].agregarCorista(a);
            }
        }
        
        for (i = 0; i < cantCoros; i++) {
            System.out.println("");
            System.out.println("");
            System.out.println(coros[i].toString());
        }
    }
}
