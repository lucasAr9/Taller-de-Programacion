/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

public class Triangulo extends Figura {

    private double ladoUno;
    private double ladoDos;
    private double ladoTres;

    /* constructor */
    public Triangulo(String cr, String cl, double ladoUno, double ladoDos, double ladoTres) {
        super(cr, cl);
        this.ladoUno = ladoUno;
        this.ladoDos = ladoDos;
        this.ladoTres = ladoTres;
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

    /* calcular el area del triangulo e imprimir el valor */
    @Override
    public double calcularArea() {
        double s = (ladoUno + ladoDos + ladoTres) / 2;
        return (Math.sqrt(s * (s - ladoUno) * (s - ladoDos) * (s - ladoTres)));
    }

    /* calcular el perimetro del triengulo e imprimir el valor */
    @Override
    public double calcularPerimetro() {
        return (ladoUno + ladoDos + ladoTres);
    }
    
    @Override
    public String toString() {
        return "Triangulo{" + super.toString() + "ladoUno=" + ladoUno + ", ladoDos="
                + ladoDos + ", ladoTres=" + ladoTres + '}';
    }
}
