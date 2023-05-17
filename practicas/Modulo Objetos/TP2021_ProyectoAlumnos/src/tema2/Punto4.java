/*
    4- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
    cada día se entrevistarán a 8 personas en distinto turno.
    a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
    nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
    personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
    siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
    40 cupos de casting.
    Una vez finalizada la inscripción:
    b) Informar para cada día y turno el nombre de la persona a entrevistar.
    NOTA: utilizar la clase Persona y pensar en la estructura de datos a utilizar. 
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
//import PaqueteLectura.Lector;

public class Punto4 {

    public static void main(String[] args) {

        GeneradorAleatorio.iniciar();

        int fil = 8, col = 5; /* los dias son las columnas */
        Persona[][] entrevistados = new Persona[fil][col];
        
        int turno = 0, dia = 0;
        String nada = "no hay";
        for (dia = 0; dia < col; dia++) {
            for (turno = 0; turno < fil; turno++) {
                entrevistados[turno][dia] = new Persona(nada, 0, 0);
            }
        }

        String nombre = " ";
        int DNI, edad;
//        int i = 0;
        turno = 0; dia = 0;
        
        System.out.print("nombre: ");
        nombre = GeneradorAleatorio.generarString(4);
        while  ((dia < col) && !(nombre.equals("zzz"))) {
//        while ((i < fil * col) && !(nombre.equals("zzz"))) {
//            dia = i / fil;
//            turno = i % fil;
            
            System.out.print("DNI asignado.");
            DNI = GeneradorAleatorio.generarInt(90900900);
            System.out.print("edad asignada.");
            edad = GeneradorAleatorio.generarInt(80);
            System.out.println("");
            
            entrevistados[turno][dia] = new Persona(nombre, DNI, edad);
            
            turno++;
            if (turno == fil) {
                turno = 0;
                dia++;
            }
            
//            i++;
            if (dia < col) {
                System.out.print("nombre: ");
                nombre = GeneradorAleatorio.generarString(4);
            }
        }

        System.out.println("");
        for (turno = 0; turno < fil; turno++) {
            for (dia = 0; dia < col; dia++) {
                System.out.print(entrevistados[turno][dia].getNombre() + "   ");
            }
            System.out.println("");
        }
    }

}
