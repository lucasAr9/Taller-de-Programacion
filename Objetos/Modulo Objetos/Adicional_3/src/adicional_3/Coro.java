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
public abstract class Coro {

    private String nombreCoro;
    private Director dir;
    private int cantCoristas;

    public Coro(String nom, Director dir, int cantCoristas) {
        this.nombreCoro = nom;
        this.dir = dir;
        this.cantCoristas = cantCoristas;
    }

    public abstract void agregarCorista(Alumno a);
    
    public String getNombreCoro() {
        return nombreCoro;
    }

    public void setNombreCoro(String nombreCoro) {
        this.nombreCoro = nombreCoro;
    }

    public int getCantCoristas() {
        return cantCoristas;
    }

    public void setCantCoristas(int cantCoristas) {
        this.cantCoristas = cantCoristas;
    }
    
    public String toString() {
        return "Coro{" + " nombreCoro: " + nombreCoro + ", dir: "
                + dir.toString() + '}';
    }
}
