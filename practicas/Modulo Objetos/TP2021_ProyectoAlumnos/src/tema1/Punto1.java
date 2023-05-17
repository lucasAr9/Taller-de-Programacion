/*
    Escriba un programa que imprima en consola el factorial de un número N
    (ingresado por teclado, N > 0). Ejemplo: para N=5 debería imprimir 5! = 120
 */
package tema1;

import java.util.Scanner;

public class Punto1 {

    public static void main(String[] args) {

        Scanner e = new Scanner(System.in);
        
        System.out.print("un numero para factorear: ");
        int num = e.nextInt();
        int res = 1;

        for (int i = num; i > 1; i--) {
            res = res * i;
        }

        System.out.println("el resultado de " + num + "! es: " + res);
    }
}
