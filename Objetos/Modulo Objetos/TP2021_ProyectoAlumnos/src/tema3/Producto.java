/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

public class Producto {

    private double pesoEnKg;
    private String descripcion;

    /* constructor */
    public Producto(double pesoEnKg, String descripcion) {
        this.pesoEnKg = pesoEnKg;
        this.descripcion = descripcion;
    }

    public Producto() {

    }

    /* get */
    public double getPesoEnKg() {
        return pesoEnKg;
    }
    
    public String getDescripcion() {
        return descripcion;
    }

    /* get */
    public void setPesoEnKg(double precioEnKg) {
        this.pesoEnKg = precioEnKg;
    }
    
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
