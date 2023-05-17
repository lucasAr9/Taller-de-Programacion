/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

public class Circulo extends Figura {
    
        private double radio;

    public Circulo(String cr, String cl, double radio) {
        super(cr, cl);
        this.radio = radio;
    }
    
    /* get */
    public double getRadio() {
        return radio;
    }

    /* set */
    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    @Override
    public double calcularArea() {
        return (Math.PI * radio * radio);
    }
    
    @Override
    public double calcularPerimetro() {
        return ((2 * Math.PI) * radio);
    }

    @Override
    public String toString() {
        return "Circulo{" + super.toString() + "radio=" + radio + '}';
    }
}
