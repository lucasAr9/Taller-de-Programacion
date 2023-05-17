//imprimir una matriz graficamente
//imprimir el contenido de una columna sola y el de una fila sola
//sumar los elementos de una fila sola
package sintaxis;

//import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class operacionesMatrices {
    
    public static void main (String[] args){
        GeneradorAleatorio.iniciar();
        
        int dimF = 3, dimC = 4;
        int i, j;
        
        int [][] tabla = new int [dimF][dimC];
        /* generar el vector con numeros aleatorios. */
        for (i = 0; i < dimF; i++) {
            for (j = 0; j < dimC; j++) {
                tabla[i][j] = GeneradorAleatorio.generarInt(10);
            }
        }
        
        /* imprimir la tabla graficamente */
        System.out.println("imprime toda la tabla/matriz");
        for (i = 0; i < dimF; i++) {
            for (j = 0; j < dimC; j++) {
                System.out.print(tabla[i][j] + " | ");
            }
            System.out.println();
        }
        
        /* imprimir solo la segunda fila */
        System.out.println();
        System.out.println("imprime solo la fila 2");
        for (j = 0; j < dimC; j++) {
            System.out.println(tabla[1][j]);
        }
        
        /* imprimir solo la segunda columna */
        System.out.println();
        System.out.println("imprime solo la columna 2");
        for (i = 0; i < dimF; i++) {
            System.out.println(tabla[i][1]);
        }
        
        /* sumar todo lo de la columna 2 */
        int suma = 0;
        System.out.println();
        System.out.println("suma toda la columna 2.");
        for (i = 0; i < dimF; i++) {
            suma = suma + tabla[i][1];
        }
        System.out.println("la suma de la columna 2 es: " + suma);
    }
}

