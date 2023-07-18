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
public class Doctorado extends Alumno {
    
    private String titulo;
    private String uniOrigen;

    public Doctorado(String titulo, String uniOrigen, String nombre, int dni) {
        super(nombre, dni, 8);
        this.titulo = titulo;
        this.uniOrigen = uniOrigen;
    }
    
    public String determinarAprobacion() {
        String aux = "";
        
        if ((super.calcPromedio() > 4) && (super.cantAprobadas() >= getCantMaterias() - 2)) {
            aux = aux + "Alumno graduado";
        } else {
            aux = aux + "Alumno NO se graduo";
        }
        return aux;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getUniOrigen() {
        return uniOrigen;
    }

    @Override
    public String toString() {
        return "Doctorado{" + super.toString() + " con titulo: " + titulo
                + " y universidad de origen: " + uniOrigen + '}';
    }
}
