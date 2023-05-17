/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejer1;

/**
 *
 * @author Lucas Arrigoni
 */
public class Grado extends Alumno {
    
    private final String carrera;
    
    public Grado(int dni, String nombre, int cant, String carrera) {
        super(dni, nombre, cant);
        this.carrera = carrera;
    }

    @Override
    public String toString() {
        return "Grado{" + super.toString() + " y carrera: " + carrera + '}';
    }
    
}
