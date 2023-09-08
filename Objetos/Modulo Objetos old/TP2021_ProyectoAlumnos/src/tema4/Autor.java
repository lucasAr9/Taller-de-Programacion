/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

public class Autor {
    
    private String nombre;
    private String biografia;

    /* constructor */
    public Autor(String nombre, String biografia) {
        this.nombre = nombre;
        this.biografia = biografia;
    }
    
    public Autor() {
        
    }
    
    /* get */
    public String getNombre() {
        return nombre;
    }

    public String getBiografia() {
        return biografia;
    }

    /* set */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

    @Override
    public String toString() {
        return "Autor{" + "nombre=" + nombre + ", biografia=" + biografia + '}';
    }
}
