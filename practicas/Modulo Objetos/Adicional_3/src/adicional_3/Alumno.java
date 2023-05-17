/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicional_3;

/**
 *
 * @author Lucas Arrigoni
 */
public class Alumno extends Persona {
    
    private int tono;
    
    public Alumno(String nom, int dni, int edad, int tono) {
        super(nom, dni, edad);
        this.tono = tono;
    }

    public int getTono() {
        return tono;
    }

    public void setTono(int tono) {
        this.tono = tono;
    }

    @Override
    public String toString() {
        return "Alumno{" + super.toString() + ", tono: " + tono + "}";
    }
}
