/*
    1- Realice un programa que cree un objeto persona con datos leídos desde teclado. Luego
    muestre en consola la representación de ese objeto en formato String.
    Piense y responda: ¿Qué datos conforman el estado del objeto persona? ¿Cómo se
    implementan dichos datos? ¿Qué ocurre cuando se le envía un mensaje al objeto?

   2- Utilizando la clase Persona (ya implementada). Realice un programa que almacene en
    un vector 15 personas. La información de cada persona debe leerse de teclado. Luego de
    almacenar la información:
    - Informe la cantidad de personas mayores de 65 años.
    - Muestre la representación de la persona con menor DNI.
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Punto1y2 {

    public static void main(String[] args) {
        final int dimf = 15;

        String nombre;
        int dni, edad;

        GeneradorAleatorio.iniciar();
        Persona[] vPersonas = new Persona[dimf];

        // se carga el vector de personas
        for (int i = 0; i < dimf; i++) {
            System.out.println("Nombre: ");
            nombre = Lector.leerString();
            System.out.println("DNI: ");
            dni = GeneradorAleatorio.generarInt(99999999);
            System.out.println("Edad: ");
            edad = GeneradorAleatorio.generarInt(80);

//            Persona persona1 = new Persona(nombre, dni, edad);
//            vPersonas[i] = persona1;
            vPersonas[i] = new Persona(nombre, dni, edad);
        }

        //imprimo el vector
        for (int i = 0; i < dimf; i++) {
            System.out.println(vPersonas[i].toString());
        }

        //busco el dni minimo y cuento la cantidad de mayores de 65 años
        int cantMayores = 0, min = 999999999, indiceMin = -1;
        for (int i = 0; i < dimf; i++) {
            if (vPersonas[i].getEdad() > 65) {
                cantMayores++;
            }
            if (vPersonas[i].getDNI() < min) {
                min = vPersonas[i].getDNI();
                indiceMin = i;
            }
        }
        System.out.println("---- Informo ----");
        System.out.println("");
        System.out.println("La cantidad de personas mayores de 65 años son: " + cantMayores);
        System.out.println("La persona con menor DNI es: " + vPersonas[indiceMin].toString());
    }

}
