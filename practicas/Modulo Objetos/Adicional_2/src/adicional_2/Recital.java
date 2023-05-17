/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicional_2;

public class Recital {

    private String nombreBanda;
    private String[] listaTemas;
    private int cantTemas;
    private int temaN;
    private int actual;

    public Recital(String nombreBanda, int cantTemas) {
        this.nombreBanda = nombreBanda;
        this.cantTemas = cantTemas;
        listaTemas = new String[cantTemas];
        temaN = 0;
        actual = 0;
    }
    
    public String agregarTema(String nombre) {
        String aux = "";
        
        if (temaN < cantTemas) {
            listaTemas[temaN] = nombre;
            temaN++;
            aux = aux + "agregado.";
        } else {
            aux = aux + "ya esta llena la lista de temas.";
        }
        return aux;
    }
    
    public String actuar() {
        String aux = "";

        if (actual < cantTemas) {
            aux = aux + "y ahora tocamos: " + listaTemas[actual];
            actual++;
        } else {
            aux = aux + "se termino el show.";
        }
        return aux;
    }
    
    public String listaDeTemas() {
        String aux = "";
        aux = aux + "\n";
        aux = aux + "Lista de temas: \n";
        
        for (int i = 0; i < cantTemas; i++) {
            aux = aux + listaTemas[i];
            aux = aux + "\n";
        }
        return aux;
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

    public void setUltimoTema(int cantTemas) {
        this.cantTemas = cantTemas;
    }

    public String toString() {
        String aux = "";
        int i = 0;
        aux = aux + "El nombre de la Banda es: " + nombreBanda + ", tocan: " + cantTemas + " temas.\n";
        aux = aux + "\n";
        aux = aux + "Lista de temas: \n";
        
        for (i = 0; i < cantTemas; i++) {
            aux = aux + listaTemas[i];
            aux = aux + "\n";
        }
        aux = aux + "\n";
        return aux;
    }
}
