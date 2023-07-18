/*
4- B- Realizar un programa principal que instancie un círculo, le cargue información leída
de teclado e informe en consola el perímetro y el área. 
 */
package tema3;

import PaqueteLectura.Lector;

public class Punto4Main {

    public static void main(String[] args) {
        
        double radio;
        
        System.out.println("radio: ");
        radio = Lector.leerDouble();
        
        System.out.println("color de relleno");
        String colorRelleno = Lector.leerString();
        System.out.println("color de lineas");
        String colorLinea = Lector.leerString();
        
        
        Punto4Clase calcular = new Punto4Clase(radio, colorRelleno, colorLinea);
        
        System.out.println(calcular.CalcularArea());
        System.out.println(calcular.CalcularPerimetro());
    }
    
}
