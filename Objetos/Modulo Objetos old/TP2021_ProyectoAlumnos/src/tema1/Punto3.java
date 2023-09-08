/*
    Escriba un programa que lea las alturas de los 15 jugadores de un equipo de
    básquet y las almacene en un vector. Luego informe:
    - la altura promedio
    - la cantidad de jugadores con altura por encima del promedio
    NOTA: Dispone de un esqueleto para este programa en Ej03Jugadores.java
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;

public class Punto3 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();

        int dimF = 15;
        double[] alturas = new double[dimF];

        int i, cant = 0;
        double suma = 0;
        for (i = 0; i < dimF; i++) {
            alturas[i] = GeneradorAleatorio.generarDouble(2);
            cant = cant + 1;
            suma = suma + alturas[i];
            System.out.println("");
            System.out.println("jugador n°" + (i + 1) + " con altura: " + alturas[i]);
        }
        System.out.println("");

        double promedio = suma / cant;
        System.out.println("el promedio es: " + promedio);

        System.out.println("");
        System.out.println("los que superan el promedio son.");
        for (i = 0; i < dimF; i++) {
            if (alturas[i] > promedio) {
                System.out.println("el jugador " + (i + 1) + " con " + alturas[i]);
            }
        }
    }
}
