/*
Demo que crea objetos Libro invocando a los constructores definidos. Tema 4.
 */
package tema4;

public class Demo01ConstructoresLibro {

    public static void main(String[] args) {
        
        Libro lib = new Libro(new Autor("Herbert Schildt", "Buen tipo"), "Mcgraw-Hill", "esto no es nada", 2014, "978-0071809252", 21.72);
        
        System.out.println(lib.toString());
        
        System.out.println("Precio del libro1: " + lib.getPrecio());
        System.out.println("Año edición del libro1: " + lib.getAñoEdicion());
    }

}
