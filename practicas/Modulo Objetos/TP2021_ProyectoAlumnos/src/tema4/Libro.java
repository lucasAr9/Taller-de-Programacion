/*
Clase Libro a la cual se agregaron constructores. Tema 4.
 */
package tema4;

public class Libro {

    private Autor a;
    private String titulo;
    private String editorial;
    private int añoEdicion;
    private String ISBN;
    private double precio;

    /* constructores */
    public Libro(Autor a, String unTitulo, String unaEditorial, int unAñoEdicion, String unISBN, double unPrecio) {
        this.a = a;
        titulo = unTitulo;
        editorial = unaEditorial;
        añoEdicion = unAñoEdicion;
        ISBN = unISBN;
        precio = unPrecio;
    }

    public Libro() {

    }

    /* get */
    public Autor getA() {
        return a;
    }
    
    public String getTitulo() {
        return titulo;
    }

    public String getEditorial() {
        return editorial;
    }

    public int getAñoEdicion() {
        return añoEdicion;
    }

    public String getISBN() {
        return ISBN;
    }

    public double getPrecio() {
        return precio;
    }

    /* set */
    public void setA(Autor a) {
        this.a = a;
    }
    
    public void setTitulo(String unTitulo) {
        titulo = unTitulo;
    }

    public void setEditorial(String unaEditorial) {
        editorial = unaEditorial;
    }

    public void setAñoEdicion(int unAño) {
        añoEdicion = unAño;
    }

    public void setISBN(String unISBN) {
        ISBN = unISBN;
    }

    public void setPrecio(double unPrecio) {
        precio = unPrecio;
    }

    @Override
    public String toString() {
        String aux;
        aux = titulo + " por " + a + " - " + añoEdicion + " - " + " ISBN: " + ISBN;
        return (aux);
    }

}
