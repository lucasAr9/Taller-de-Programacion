/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.practica3_ejer1;

/**
 *
 * @author luk
 */
public class Triangulo extends Figura {
    private double a;
    private double b;
    private double c;
    
    public Triangulo(String relleno, String linea, double a, double b, double c) {
        super(relleno, linea);
        this.a = a;
        this.b = b;
        this.c = c;
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

    @Override
    public String toString() {
        return "Triangulo{" + super.toString() + "a=" + a + ", b=" + b + ", c=" + c + '}';
    }
    
    @Override
    public double calcularArea() {
        double s = (a + b + c) / 2;
        double area = Math.sqrt(s * (s - a) * (s - b) * (s - c));
        return area;
    }
    
    @Override
    public double calcularPerimetro() {
        return a + b + c;
    }
}
