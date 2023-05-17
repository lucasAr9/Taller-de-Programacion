/*
3- A- Modele e implemente las clases para el siguiente problema. Una garita de seguridad
quiere identificar los distintos tipos de personas que entran a un barrio cerrado. Al barrio
pueden entrar personas, que se caracterizan por su nombre, DNI y edad. Además pueden
entrar trabajadores, estos son personas que se caracterizan además por la tarea que
realizan en el predio.
Implemente constructores, getters y setters para las clases. Además tanto las personas
como los trabajadores deben responder al mensaje toString(). A continuación se
ejemplifica la representación a retornar por cada uno:

- Personas: “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años”
- Trabajadores: “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años. Soy Corta
césped.”

B- Genere un programa que instancie una persona y un trabajador con datos leídos de
   teclado y muestre la representación de cada uno en consola. 
 */
package tema5_3;

import PaqueteLectura.Lector;

public class Punto3 {

    public static void main(String[] args) {
        
        System.out.println("nombre de la Persona:");
        String nombre = Lector.leerString();
        System.out.println("DNI de la Persona:");
        int DNI = Lector.leerInt();
        System.out.println("edad de la Persona:");
        int edad = Lector.leerInt();
        
        Persona p = new Persona(nombre, DNI, edad);
        
        System.out.println("nombre del Trabajador:");
        String nombre2 = Lector.leerString();
        System.out.println("DNI del Trabajador:");
        int DNI2 = Lector.leerInt();
        System.out.println("edad del Trabajador:");
        int edad2 = Lector.leerInt();
        System.out.println("rubro del Trabajador");
        String rubro = Lector.leerString();
        
        Trabajador t = new Trabajador(nombre2, DNI2, edad2, rubro);
        
        System.out.println("persona -->" + p.toString());
        System.out.println("trabajador -->" + t.toString());
    }
}
