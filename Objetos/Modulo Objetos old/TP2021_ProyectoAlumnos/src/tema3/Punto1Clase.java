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
/* Punto1Clase seria el triangulo */
public class Punto1Clase {

    private double ladoUno;
    private double ladoDos;
    private double ladoTres;
    private String colorRelleno;
    private String colorLineas;

    /* constructor */
    public Punto1Clase(double ladoUno, double ladoDos, double ladoTres, String colorRelleno, String colorLinea) {
        this.ladoUno = ladoUno;
        this.ladoDos = ladoDos;
        this.ladoTres = ladoTres;
        this.colorRelleno = colorRelleno;
        this.colorLineas = colorLinea;
    }

    /* calcular el area del triangulo e imprimir el valor */
    public String CalcularArea() {
        double s = (ladoUno + ladoDos + ladoTres) / 2;
        double area = Math.sqrt(s * (s - ladoUno) * (s - ladoDos) * (s - ladoTres));
        return "el area del triangulo es: " + area + " cm^2";
    }

    /* calcular el perimetro del triengulo e imprimir el valor */
    public String CalcularPerimetro() {
        double perim = ladoUno + ladoDos + ladoTres;
        return "el perimetro del triangulo es: " + perim + " cm";
    }

    /* get */
    public double getLadoUno() {
        return ladoUno;
    }

    public double getLadoDos() {
        return ladoDos;
    }

    public double getLadoTres() {
        return ladoTres;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public String getColorLineas() {
        return colorLineas;
    }

    /* set */
    public void setLadoUno(double ladoUno) {
        this.ladoUno = ladoUno;
    }

    public void setLadoDos(double ladoDos) {
        this.ladoDos = ladoDos;
    }

    public void setLadoTres(double ladoTres) {
        this.ladoTres = ladoTres;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public void setColorLineas(String colorLineas) {
        this.colorLineas = colorLineas;
    }

    @Override
    public String toString() {
        return "Punto1Clase{" + "ladoUno=" + ladoUno + ", ladoDos=" + ladoDos + ", ladoTres=" + ladoTres
                + ", colorRelleno=" + colorRelleno + ", colorLineas=" + colorLineas + '}';
    }

}
