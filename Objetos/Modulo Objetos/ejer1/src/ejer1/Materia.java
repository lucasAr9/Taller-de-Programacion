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
public class Materia {
    
    private boolean aprobado;
    private String nombre;
    private double nota;
    private Fecha f;
    
    public Materia() {
        this.aprobado = false;
    }

    public Materia(String nombre, double nota, Fecha f) {
        this.nombre = nombre;
        this.nota = nota;
        this.f = f;
        
        if (nota >= 6) {
            aprobado = true;
        }
    }
    
    public double getNota() {
        return nota;
    }

    @Override
    public String toString() {
        return "Materia{" + "nombre: " + nombre + ", nota: " + nota +
                ", fecha: " + f.toString() + "}\n";
    }

}
