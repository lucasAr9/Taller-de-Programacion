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
public abstract class Persona {
    
    private String nombre;
    private int dni;
    private int edad;
    
    public Persona(String nom, int dni, int edad) {
        this.nombre = nom;
        this.dni = dni;
        this.edad = edad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String toString() {
        return " nombre: " + nombre + ", dni:" + dni + ", edad: " + edad + '}';
    }
}
