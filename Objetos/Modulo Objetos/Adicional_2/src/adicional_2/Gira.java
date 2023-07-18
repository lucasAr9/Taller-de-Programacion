/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicional_2;

public class Gira extends Recital {
    
    private String nombre;
    private int cantFechas;
    private Fecha[] fechasDeGira;
    private int fechaN;
    private int actual;
    
    public Gira(String nomBand, int cantTemas, String nombre, int cantF) {
        super(nomBand, cantTemas);
        this.nombre = nombre;
        this.cantFechas = cantF;
        fechasDeGira = new Fecha[cantFechas];
        fechaN = 0;
        actual = 0;
    }
    
    public String agregarFecha(Fecha f) {
        String aux = "";
        
        if (fechaN < cantFechas) {
            fechasDeGira[fechaN] = f;
            fechaN++;
            aux = aux + "agregado.";
        } else {
            aux = aux + "ya esta llena la lista de fechas.";
        }
        return aux;
    }
    
    public String actuar() {
        String aux = "";
        
        if (actual < cantFechas) {
            aux = aux + "Buenas noches " + fechasDeGira[actual].getCiudad();
            aux = aux + super.listaDeTemas();
            actual++;
        } else {
            aux = aux + "Se termino la Gira.";
        }
        return aux;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantFechas() {
        return cantFechas;
    }

    public void setCantFechas(int cantFechas) {
        this.cantFechas = cantFechas;
    }
    
    @Override
    public String toString() {
        String aux = "";
        aux = aux + super.toString() + "La gira con el nombre de ---> " + nombre;
        aux = aux + "\n";
        
        for (int i = 0; i < cantFechas; i++) {
            aux = aux + "en " + fechasDeGira[i].getCiudad() + ", el dia " + fechasDeGira[i].getDia();
            aux = aux + "\n";
        }
        aux = aux + "\n";
        return aux;
    }
}
