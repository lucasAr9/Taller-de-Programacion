/*
    5- Realice un programa que cargue un vector con 10 strings leídos desde teclado. El vector
    generado tiene un mensaje escondido que se forma a partir de la primera letra de cada
    string. Muestre el mensaje escondido en consola.
    NOTA: La primera letra de un string se obtiene enviándole el mensaje charAt(0) al objeto
    string. Probar con: humo oso lejos ala menos usado nene de ocho ! Debería imprimir:
    holamundo!
 */
package tema2;

import PaqueteLectura.Lector;

public class Punto5 {

    public static void main(String[] args) {
        
        int dimF = 10;
        String[] vector = new String[dimF];
        
        String palabra;
        int i;
        for (i = 0; i < dimF; i++) {
            System.out.print("palabra: ");
            palabra = Lector.leerString();
            vector[i] = palabra;
        }
        
        System.out.print("la palabra era. -->");
        for (i = 0; i < dimF; i++) {
            System.out.print(vector[i].charAt(0));
        }
    }

}
