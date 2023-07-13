/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.p2_ejer2;

/**
 *
 * @author luk
 */
public class Balanza {
    private double monto;
    private int cantidad;
    private double peso;
    
    public Balanza() {}

    public double getMonto() {
        return monto;
    }

    public void setMonto(int monto) {
        this.monto = monto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public void iniciarCompra() {
        this.cantidad = 0;
        this.monto = 0;
    }

    public void registrarProducto(double peso, double precio) {
        this.monto = this.monto + precio;
        this.peso = this.peso + peso;
        this.cantidad = this.cantidad + 1;
    }
    
    public double devolverMontoAPagar() {
        return this.getMonto();
    }

    public String devolverResumenDeCompra() {
        return "Balanza{" + "monto=" + monto + ", cantidad=" + cantidad + ", peso=" + peso + '}';
    }
}
