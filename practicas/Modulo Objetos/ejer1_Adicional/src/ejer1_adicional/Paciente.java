/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejer1_adicional;

import java.util.Random;

/**
 *
 * @author Lucas Arrigoni
 */
public class Paciente {

    Random r = new Random();
    
    private String nombre;
    private double ultimaDosis;
    private double ultimoNivelGluco;
    private int id;
    
    public Paciente() {
    }

    public Paciente(String nombre, double ultimaDosis, double ultimoFarmaco) {
        this.nombre = nombre;
        this.ultimaDosis = ultimaDosis;
        this.ultimoNivelGluco = ultimoFarmaco;
    }
    
    public void aplicarDosisPaciente(double dosis) {
        ultimaDosis = dosis;
        ultimoNivelGluco = ultimoNivelGluco - r.nextDouble();
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getUltimaDosis() {
        return ultimaDosis;
    }

    public void setUltimaDosis(double ultimaDosis) {
        this.ultimaDosis = ultimaDosis;
    }

    public double getUltimoNivelGluco() {
        return ultimoNivelGluco;
    }

    public void setUltimoNivelGluco(double ultimoFarmaco) {
        this.ultimoNivelGluco = ultimoFarmaco;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    @Override
    public String toString() {
        return "Paciente{" + "nombre: " + nombre + ", ultimaDosis: " + ultimaDosis
                + ", ultimoFarmaco: " + ultimoNivelGluco + " con id: " + id + '}';
    }
}
