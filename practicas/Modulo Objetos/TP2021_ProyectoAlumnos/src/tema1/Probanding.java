/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import java.util.Scanner;
/**
 *
 * @author Lucas Arrigoni
 */
public class Probanding {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
                
        Scanner entrada = new Scanner(System.in);
        
        System.out.print("valor a:");
        int a = entrada.nextInt();
        System.out.print("valor b:");
        int b = entrada.nextInt();
        System.out.print("valor c:");
        int c = entrada.nextInt();

        /* determinante para saber si se puede hacer la cuenta si la raiz da mayor que 0 */
        double determinante = Math.pow(b, 2) - (4 * a * c);

        if (determinante > 0) {
            double x1 = ((b * (-1)) + Math.sqrt(determinante)) / (2 * a);
            double x2 = ((b * (-1)) - Math.sqrt(determinante)) / (2 * a);
            System.out.println("x1 = " + x1 + "; x2 = " + x2 + ";");

        } else {
            System.out.println("el determinante es negativo y no se puede terminar la operacion.");
        }
    }
    
}
