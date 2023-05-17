/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejer3;

/**
 *
 * @author Lucas Arrigoni
 */
public class Autor {
    
    private String nombre;
    private String biografia;
    
    public Autor(String nom, String bio) {
        this.nombre = nom;
        this.biografia = bio;
    }

    public String getNombre() {
        return nombre;
    }

    public String getBiografia() {
        return biografia;
    }

    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

    @Override
    public String toString() {
        return "Autor{" + "nombre: " + nombre + ", biografia: " + biografia + '}';
    }
}
