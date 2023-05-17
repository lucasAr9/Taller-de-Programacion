/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejer2;

/**
 *
 * @author Lucas Arrigoni
 */
public abstract class Paciente {
    
    private String nombre;
    private double ultimaGlucosa;
    private double ultimaDosisFarmaco;
    
    public void aplicarDosis(Paciente p, double d) {
        double disminuir = Math.random();
        
        p.setUltimaDosisFarmaco(d);
        p.setUltimaGlucosa(disminuir);
    }

    /* metodo para aplicar el farmaco de manera abstracta ya que
    es distinto en alfa y beta*/
    public abstract void aplicarElFarmaco(double d);

    /* para obtener el nombre del paciente */
    public String getNombre() {
        return nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    /* para setear y obtener el ultimo resultado de clucosa */
    public double getUltimaGlucosa() {
        return ultimaGlucosa;
    }

    public void setUltimaGlucosa(double ultimaGlucosa) {
        this.ultimaGlucosa = ultimaGlucosa;
    }

    /* para setear y obtener la ultima dosis de farmaco aplicada */
    public double getUltimaDosisFarmaco() {
        return ultimaDosisFarmaco;
    }

    public void setUltimaDosisFarmaco(double ultimaDosisFarmaco) {
        this.ultimaDosisFarmaco = ultimaDosisFarmaco;
    }

    public String toString() {
        return "Paciente{" + "nombre: " + nombre + ", ultimaGlucosa: "
                + ultimaGlucosa + ", ultimaDosisFarmaco: " + ultimaDosisFarmaco + '}';
    }
}
