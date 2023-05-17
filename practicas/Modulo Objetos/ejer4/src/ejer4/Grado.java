/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejer4;

/**
 *
 * @author Lucas Arrigoni
 */
public class Grado extends Alumno {
    
    private String carrera;
    
    public Grado(String carrera, String nombre, int dni) {
        super(nombre, dni, 30);
        this.carrera = carrera;
    }
    
        public String determinarAprobacion() {
        String aux = "";
        
        if ((super.calcPromedio() > 4) && (super.cantAprobadas() >= getCantMaterias() - 5)) {
            aux = aux + "Alumno graduado";
        } else {
            aux = aux + "Alumno NO se graduo";
        }
        return aux;
    }

    public String getCarrera() {
        return carrera;
    }

    @Override
    public String toString() {
        return "Grado{" + super.toString() + " en la carrera: " + carrera + '}';
    }
}
