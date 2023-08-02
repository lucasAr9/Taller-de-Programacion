/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package adicional_2;

/**
 *
 * @author luk
 */
public class Recital {
    
    private String nombreBanda;
    private int temaActual;
    private int cantActual;
    private int cantTemas;
    private String[] temas;
    
    public Recital(String nombre, int cant) {
        this.nombreBanda = nombre;
        this.temaActual = 0;
        this.cantActual = 0;
        this.cantTemas = cant;
        this.temas = new String[this.cantTemas];
    }

    public void agregarTema(String nombre) {
        if (cantActual < cantTemas) {
            temas[cantActual] = nombre;
            cantActual++;
        } else {
            System.out.println("Ya son mas cantidad de temas que los indicados inicialmente.");
        }
    }

    public void actuar() {
        if (temaActual <= cantActual) {
            System.out.println("Y ahora tocaremos... " + temas[temaActual]);
            temaActual++;
        } else {
            System.out.println("Ya estan todos los temas tocados.");
        }
    }
    
    public String getNombreBanda() {
        return nombreBanda;
    }

    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }

    public int getCantTemas() {
        return cantTemas;
    }

    public void setCantTemas(int cantTemas) {
        this.cantTemas = cantTemas;
    }

    public String todosLosTemas() {
        String aux = "";
        for (int i = 0; i < cantActual; i++) {
            aux = aux + ", " + this.temas[i];
        }
        return aux;
    }
    
    @Override
    public String toString() {
        return "Recital{" + "nombreBanda=" + nombreBanda
                + ", cantidad temas=" + cantTemas
                + "\ntemas= " + this.todosLosTemas() + '}';
    }
}
