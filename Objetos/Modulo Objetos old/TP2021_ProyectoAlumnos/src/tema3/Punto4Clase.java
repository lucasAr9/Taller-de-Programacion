/*
4- A- Generar una clase para representar círculos. Los círculos se caracterizan por su radio
(double), el color de relleno (String) y el color de línea (String). El círculo debe saber:
▪ Devolver/modificar el valor de cada uno de sus atributos (get# y set#)
▪ Calcular el área y devolverla. (método calcularArea)
▪ Calcular el perímetro y devolverlo. (método calcularPerimetro)
NOTA: la constante PI es Math.PI
 */
package tema3;
/* Punto4Clase seria el circulo */
public class Punto4Clase {
    
    private double radio;
    private String colorRelleno;
    private String colorLinea;

    public Punto4Clase(double radio, String colorRelleno, String colorLinea) {
        this.radio = radio;
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
    }
    
    public String CalcularArea() {
        double area = Math.PI * radio * radio;
        return "el area del circulo es: " + area + " cm^2";
    }
    
    public String CalcularPerimetro() {
        double perim = (2 * Math.PI) * radio;
        return "el perimetro del circulo es: " + perim + " cm";
    }
    
    /* get */
    public double getRadio() {
        return radio;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    /* set */
    public void setRadio(double radio) {
        this.radio = radio;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
}
