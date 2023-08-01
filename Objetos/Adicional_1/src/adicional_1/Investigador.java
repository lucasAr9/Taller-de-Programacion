/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Adicional_1;

/**
 *
 * @author luk
 */
public class Investigador {

    private String nombre;
    private String apellido;
    private int categoria;
    private String especialidad;
    private int cantActual;
    private int cantSubs;
    private Subsidio[] subsidios;

    public Investigador(String nombre, String apellido, int categoria, String especialidad) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.categoria = categoria;
        this.especialidad = especialidad;
        this.cantActual = 0;
        this.cantSubs = 5;
        this.subsidios = new Subsidio[this.cantSubs];
    }

    public void agregarSubsidio(Subsidio s) {
        if (this.cantActual < this.cantSubs) {
            this.subsidios[this.cantActual] = s;
            this.cantActual++;
        }
    }

    public double dineroTotalSubs() {
        double cant = 0;
        for (int i = 0; i < this.cantActual; i++) {
            cant += this.subsidios[i].getMontoPedido();
        }
        return cant;
    }
    
    public void otorgarTodos() {
        for (int i = 0; i < this.cantActual; i++) {
            this.otorgar(i);
        }
    }
    
    public void otorgar(int i) {
        if (i < this.cantActual) {
            this.subsidios[i].setOtorgado(true);
        }
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public int getCantActual() {
        return cantActual;
    }

    public void setCantActual(int cantActual) {
        this.cantActual = cantActual;
    }

    public int getCantSubs() {
        return cantSubs;
    }

    public void setCantSubs(int cantSubs) {
        this.cantSubs = cantSubs;
    }

    public String todosSubsidios() {
        String aux = "";
        for (int i = 0; i < this.cantActual; i++) {
            aux = aux + "\n" + this.subsidios[i].toString();
        }
        return aux;
    }

    @Override
    public String toString() {
        return "Investigador{" + "nombre=" + nombre
                + ", apellido=" + apellido
                + ", categoria=" + categoria
                + ", especialidad=" + especialidad
                + ", subsidios: \n" + this.todosSubsidios() + '}';
    }
}
