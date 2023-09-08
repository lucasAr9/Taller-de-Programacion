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
public class Doctorado extends Alumno {
    
    private final String titulo;
    private final String univerOrigen;
    
    public Doctorado(int dni, String nombre, int cant, String titulo, String uni) {
        super(dni, nombre, cant);
        this.titulo = titulo;
        this.univerOrigen = uni;
    }

    @Override
    public String toString() {
        return "Doctorado{" + super.toString() + ", " + "titulo: " + titulo +
                ", univercidad: " + univerOrigen + '}';
    }
    
}
