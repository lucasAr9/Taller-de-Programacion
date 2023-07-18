/*
6- Escriba un programa que simule el ingreso de personas a un banco. Cada
persona que ingresa indica la operación que desea realizar (0: “cobro de cheque” 1:
“depósito/ extracción en cuenta” 2: “pago de impuestos o servicios” 3: “cobro de
jubilación” 4: “cobro de planes”). La recepción de personas culmina cuando un
empleado ingresa la operación 5 (cierre del banco). Informar la cantidad de
personas atendidas por cada operación y la operación más solicitada. 
*/
package tema1;

import PaqueteLectura.Lector;

public class Punto6 {

    public static void main(String[] args) {
        
        int dimF = 5;
        int[] operacion = new int[dimF];
        
        int numOp = -1;
        for (numOp = 0; numOp < dimF; numOp++) {
            operacion[numOp] = 0;
        }
        
        System.out.print("operacion: ");
        numOp = Lector.leerInt();
        while (numOp != 5) {
            operacion[numOp] = operacion[numOp] + 1;
            
            System.out.print("operacion: ");
            numOp = Lector.leerInt();
        }
        
        System.out.println("");
        int max = -1, opMax = -1;
        for (numOp = 0; numOp < dimF; numOp++) {
            System.out.println("los de la operacion " + numOp + " son: " + operacion[numOp]);
            if (max < operacion[numOp]) {
                max = operacion[numOp];
                opMax = numOp;
            }
        }
        System.out.println("");
        System.out.println("los de la operacion " + opMax + " fueron mas solicitadas.");
    }

}
