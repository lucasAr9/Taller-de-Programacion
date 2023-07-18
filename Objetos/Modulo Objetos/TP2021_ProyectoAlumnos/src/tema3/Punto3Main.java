/*
3- B- Realizar un programa principal que instancie un entrenador, cargándole datos leídos
desde teclado. Pruebe el correcto funcionamiento de cada método implementado.
 */
package tema3;

import PaqueteLectura.Lector;

public class Punto3Main {

    public static void main(String[] args) {
        
        System.out.print("nombre: ");
        String nombre = Lector.leerString();
        System.out.print("sueldo: ");
        double sueldo = Lector.leerDouble();
        System.out.print("cantidad de partidos ganados: ");
        int partidosGan = Lector.leerInt();
        
        Punto3Clase entrenador = new Punto3Clase(nombre, sueldo, partidosGan);
        
        System.out.println(entrenador.calcularSueldoACobrar());
    }
    
}
