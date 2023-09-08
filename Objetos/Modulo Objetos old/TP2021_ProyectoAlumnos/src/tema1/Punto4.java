/*
    Escriba un programa que defina una matriz de enteros de tamaño 10x10.
    Inicialice la matriz con números aleatorios entre 0 y 200.
    Luego realice las siguientes operaciones:
    - Mostrar el contenido de la matriz en consola.
    - Calcular e informar la suma de todos los elementos almacenados entre las
    filas 2 y 9 y las columnas 0 y 3
    - Generar un vector de 10 posiciones donde cada posición i contiene la suma
    de los elementos de la columna i de la matriz.
    - Lea un valor entero e indique si se encuentra o no en la matriz. En caso de
    encontrarse indique su ubicación (fila y columna) en caso contrario
    imprima “No se encontró el elemento”.
    NOTA: Dispone de un esqueleto para este programa en Ej04Matrices.java
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Punto4 {

    public static void main(String[] args) {

        GeneradorAleatorio.iniciar();

        int fil = 10, col = 10;
        int[][] tabla = new int[fil][col];

        /* generar la matriz con numeros aleatorios. */
        int i, j;
        for (i = 0; i < fil; i++) {
            for (j = 0; j < col; j++) {
                tabla[i][j] = GeneradorAleatorio.generarInt(10);
            }
        }
        /* imprimir la tabla */
        System.out.println("imprime toda la tabla/matriz");
        for (i = 0; i < fil; i++) {
            for (j = 0; j < col; j++) {
                System.out.print(tabla[i][j] + " | ");
            }
            System.out.println("");
        }

        
        /* la suma de todos los elementos entre fila 2 y 9 y la columna 0 y 3 */
        int suma = 0;
        System.out.println("");
        System.out.println("sumar todos los elementos entre fila 2 y 9 y la columna 0 y 3.");
        for (i = 2; i <= 9; i++) {
            for (j = 0; j <= 3; j++) {
                suma = suma + tabla[i][j];
            }
        }
        System.out.println("la suma es: " + suma);

        
        /* un vector de 10 posiciones donde cada posición i contiene la suma de los elementos de la columna i de la matriz */
        int dimF = 10;
        int[] vector = new int[dimF];
        /* contar columnas y agregar al vector de 10 */
        for (j = 0; j < col; j++) {
            int sumaCol = 0;
            for (i = 0; i < fil; i++) {
                sumaCol = sumaCol + tabla[i][j];
            }
            vector[j] = sumaCol;
        }
        /* imprimir vector con las sumas de las columnas */
        System.out.println("");
        for (i = 0; i < dimF; i++) {
            System.out.println("pos: " + i + " con la suma: " + vector[i]);
        }

        
        /* encontrar un numero en la matriz */
        System.out.println("");
        System.out.print("un numero para buscar en la matriz: ");
        int num = Lector.leerInt();

        boolean encontrar = false;
        int filaPos = -1, colPos = -1;

        i = 0;
        while ((!encontrar) && (i < fil)) {
            j = 0;
            while ((!encontrar) && (j < col)) {
                if (tabla[i][j] == num) {
                    encontrar = true;
                    filaPos = i;
                    colPos = j;
                }
                j++;
            }
            i++;
        }
        System.out.println("");
        if (encontrar) {
            System.out.println("el numero se encontro en la pos --> fila: " + filaPos + " columna: " + colPos);
        } else {
            System.out.println("el numero no se encontro.");
        }

    }
}
