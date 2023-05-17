/*
2- B- Genere un programa principal que cree una balanza e inicie una compra. Lea
información desde teclado correspondiente a los ítems comprados (peso en kg y precio
por kg) hasta que se ingresa uno con peso 0. Registre cada producto en la balanza. Al
finalizar, informe el resumen de la compra. 
 */
package tema3;

import PaqueteLectura.Lector;

public class Punto2Main {

    public static void main(String[] args) {
        
        double pesoProd, precioPorKg;
        Punto2Clase compra = new Punto2Clase();
        compra.iniciarCompra();
        
        System.out.print("peso del producto: ");
        pesoProd = Lector.leerDouble();
        while (pesoProd != 0) {
            System.out.print("precio por kg: ");
            precioPorKg = Lector.leerDouble();
            
            compra.registrarProducto(pesoProd, precioPorKg);
            
            System.out.print("peso del producto: ");
            pesoProd = Lector.leerDouble();
        }
        
        System.out.println(compra.resumenDeCompra());
    }
    
}
