/*
1- A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String).
El triángulo debe saber:
▪ Devolver/modificar el valor de cada uno de sus atributos (métodos get# y set#)
▪ Calcular el área y devolverla (método calcularArea)
▪ Calcular el perímetro y devolverlo (método calcularPerimetro)

Area = raiz( s(s - a) (s - b) (s - c) )
s = a+b+c/2
La función raíz cuadrada es Math.sqrt(#)

B- Realizar un programa principal que instancie un triángulo, le cargue información leída
desde teclado e informe en consola el perímetro y el área. 
 */
package tema3;

import PaqueteLectura.Lector;

public class Punto1Main {

    public static void main(String[] args) {
        
        double a, b, c;
        
        System.out.println("a: ");
        a = Lector.leerDouble();
        System.out.println("b: ");
        b = Lector.leerDouble();
        System.out.println("c: ");
        c = Lector.leerDouble();
        
        System.out.println("color de relleno");
        String colorRelleno = Lector.leerString();
        System.out.println("color de lineas");
        String colorLinea = Lector.leerString();
        
        
        Punto1Clase calcular = new Punto1Clase(a, b, c, colorRelleno, colorLinea);
        
        System.out.println(calcular.CalcularArea());
        System.out.println(calcular.CalcularPerimetro());
    }
    
}
