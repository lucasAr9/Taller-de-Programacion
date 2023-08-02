/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package adicional_2;

/**
 *
 * @author luk
 */
public class Gira extends Recital {
    
    private String nombreGira;
    private int fechaActual;
    private int cantActual;
    private int cantFechas;
    private Fecha[] fechas;
    
    public Gira(String nombre, int cant, String nombreGira, int cantf) {
        super(nombre, cant);
        this.nombreGira = nombreGira;
        this.fechaActual = 0;
        this.cantActual = 0;
        this.cantFechas = cantf;
        this.fechas = new Fecha[this.cantFechas];
    }

    public void agregarFecha(Fecha f) {
        if (cantActual < cantFechas) {
            fechas[cantActual] = f;
            cantActual++;
        } else {
            System.out.println("Ya son mas cantidad de fechas que los indicados inicialmente");
        }
    }
    
    @Override
    public void actuar() {
        if (fechaActual <= cantActual) {
            System.out.println("Buenas noches " + fechas[fechaActual].getCiudad());
            System.out.println("Listado de temas: " + super.todosLosTemas());
            fechaActual++;
        } else {
            System.out.println("Ya estan todas las fechas tocados.");
        }
    }
    
    public String getNombreGira() {
        return nombreGira;
    }

    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }

    public int getFechaActual() {
        return fechaActual;
    }

    public void setFechaActual(int fechaActual) {
        this.fechaActual = fechaActual;
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
        for (int i = 0; i < this.cantFechas; i++) {
            aux = aux + ", " + this.fechas[i];
        }
        return "Gira{" + "nombreGira=" + nombreGira
                + ", fechaActual=" + fechaActual
                + ", cantFechas=" + cantFechas
                + "\nfechas= "+ aux + '}';
    }
}
