/*
5- B- Realice las modificaciones necesarias en el programa principal solicitado en 2-B para
corroborar el funcionamiento de la balanza.

NOTA: dispone en la carpeta tema 3 de la clase Producto ya implementada.
Para adicionar la información del producto recibido al resumen use concatenación de
Strings (operación +).
 */
package tema3;

import PaqueteLectura.Lector;

public class Punto5Main {

    public static void main(String[] args) {

        double pesoProd = -1, precioPorKg;
        String descripcion;
        Punto5Clase compra = new Punto5Clase();
        compra.iniciarCompra();
        
        System.out.print("peso del producto: ");
        pesoProd = Lector.leerDouble();
        while (pesoProd != 0) {
            System.out.print("descripcion: ");
            descripcion = Lector.leerString();
            
            System.out.print("precio por kg: ");
            precioPorKg = Lector.leerDouble();
            
            compra.registrarProducto(new Producto(pesoProd, descripcion), precioPorKg);
            
            System.out.print("peso del producto: ");
            pesoProd = Lector.leerDouble();
        }
        
        System.out.println(compra.resumenDeCompra());
        System.out.println(compra.devolverResumenDeCompra());
    }
    
}
