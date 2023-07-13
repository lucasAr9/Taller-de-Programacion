/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.practica3_ejer1;

/**
 *
 * @author luk
 */
public abstract class Figura {
    private String colorRelleno;
    private String colorLinea;
    
    public Figura(String relleno, String linea) {
        colorRelleno = relleno;
        colorLinea = linea;
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

    @Override
    public String toString() {
        return "Figura{" + "colorRelleno=" + colorRelleno + ", colorLinea=" + colorLinea + '}';
    }
    
    public abstract double calcularArea();
    
    public abstract double calcularPerimetro();
}
