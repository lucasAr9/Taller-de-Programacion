/*
5- Un edificio de oficinas está conformado por 8 pisos y 4 oficinas por piso. Realice
un programa que permita informar la cantidad de personas que concurrieron a
cada oficina de cada piso. Para esto, simule la llegada de personas al edificio de la
siguiente manera: a cada persona se le pide el nro. de piso y nro. de oficina a la cual
quiere concurrir. La llegada de personas finaliza al indicar un nro. de piso 9. Al
finalizar la llegada de personas, informe lo pedido. 
 */
package tema1;

import PaqueteLectura.Lector;

public class Punto5 {

    public static void main(String[] args) {

//        GeneradorAleatorio.iniciar();
        int fil = 8, col = 4;
        int[][] matriz = new int[fil][col];

        /* inicializar pisos y oficinas en 0 personas */
        int piso = 0, oficina = 0;
        for (piso = 0; piso < fil; piso++) {
            for (oficina = 0; oficina < col; oficina++) {
                matriz[piso][oficina] = 0;
            }
        }

        /* ingresan las personas al edificio e ir contando */
        System.out.print("piso: ");
        piso = Lector.leerInt();
        while (piso != 9) {
            System.out.print("oficina: ");
            oficina = Lector.leerInt();
            
            matriz[piso - 1][oficina - 1]++ ;

            System.out.print("piso: ");
            piso = Lector.leerInt();
        }

        /* informar cuantas personas hay en cada oficina */
        System.out.println("imprime toda la matriz");
        for (piso = fil; piso >= 0; piso--) {
            for (oficina = col; oficina >= 0; oficina--) {
                System.out.print(matriz[piso][oficina] + " | ");
            }
            System.out.println("");
        }
    }

}
