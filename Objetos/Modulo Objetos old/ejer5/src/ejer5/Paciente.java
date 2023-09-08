/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejer5;

/**
 *
 * @author Lucas Arrigoni
 */
public class Paciente {
    
    private String nombre;
    private double ultimaDosisDeFarmaco;
    private double ultimoValorGlucosa;
    
    public Paciente() {
        
    }

    public Paciente(String nombre, double ultimoValorGlucosa, double ultimaDosisDeFarmaco) {
        this.nombre = nombre;
        this.ultimaDosisDeFarmaco = ultimaDosisDeFarmaco;
        this.ultimoValorGlucosa = ultimoValorGlucosa;
    }
    
    public void aplicarDosis(double dosis) {
        ultimaDosisDeFarmaco = dosis;
        double disminuir = Math.random();
        ultimoValorGlucosa = ultimoValorGlucosa - disminuir;
    }

    public String getNombre() {
        return nombre;
    }

    public double getUltimoValorGlucosa() {
        return ultimoValorGlucosa;
    }

    public double getUltimaDosisDeFarmaco() {
        return ultimaDosisDeFarmaco;
    }

    @Override
    public String toString() {
        return "Paciente" + " con nombre: " + nombre
                + ", ultimo valor de glucosa: " + ultimoValorGlucosa
                + ", ultima dosis de farmaco aplicada: " + ultimaDosisDeFarmaco;
    }
}
