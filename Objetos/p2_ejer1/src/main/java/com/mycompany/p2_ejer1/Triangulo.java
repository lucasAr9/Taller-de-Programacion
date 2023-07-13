/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.p2_ejer1;

/**
 *
 * @author luk
 */
public class Triangulo {

    private double a;
    private double b;
    private double c;

    private String colorRelleno;
    private String colorLinea;

    public Triangulo(double a, double lado_2, double lado_3,
            String colorRelleno, String colorLinea) {
        this.a = a;
        this.b = lado_2;
        this.c = lado_3;
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
    }

    public double getA() {
        return a;
    }

    public void setA(double a) {
        this.a = a;
    }

    public double getB() {
        return b;
    }

    public void setB(double b) {
        this.b = b;
    }

    public double getC() {
        return c;
    }

    public void setC(double c) {
        this.c = c;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }

    public double calcularArea() {
        double s = (a + b + c) / 2;
        double area = Math.sqrt(s * (s - a) * (s - b) * (s - c));
        return area;
    }
    
    public double calcularPerimetro(){
        return a + b + c;
    }
    
    @Override
    public String toString() {
        return "Triangulo{" + "lado_1=" + a + ", lado_2=" + b + ", lado_3=" + c + ", colorRelleno=" + colorRelleno + ", colorLinea=" + colorLinea + '}';
    }
}
