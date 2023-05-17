/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejer5;

/**
 *
 * @author Lucas Arrigoni
 */
public abstract class Grupo {
    
    private int cantPaciente;
    private int cantActual;
    private Paciente[] p;

    public Grupo(int cantPaciente) {
        this.cantPaciente = cantPaciente;
        this.cantActual = 0;
        p = new Paciente[this.cantPaciente];
        
        for (int i = 0; i < this.cantPaciente; i++) {
            p[i] = null;
        }
    }
    
    public String agregarPaciente(Paciente pac) {
        String aux = "";
        
        if (cantActual <= cantPaciente) {
            p[cantActual] = pac;
            cantActual++;
            aux = aux + "agregado con exito. su ID es: " + (cantActual + 1);
        } else {
            aux = aux + "NO hay lugar.";
        }
        return aux;
    }
    
    /* retornar paciente comprobando el ID */
    public String retornarPaciente(int id) {
        String aux = "";
        
        if ((id - 1 <= cantActual) && (p[id] != null)) {
            aux = aux + p[id].toString();
        } else {
            aux = aux + "paciente con ID invalido";
        }
        return aux;
    }
    
    /* retornar glucosa de paciente por sin comprobar ID */
    public double retornarGlucosaPaciente(int id) {
        return p[id].getUltimoValorGlucosa();
    }
    
    public void aplicarDosis(double dosis, int id) {
        p[id].aplicarDosis(dosis);
    }

    public int getCantPaciente() {
        return cantPaciente;
    }
    
    public int getCantActual() {
        return cantActual;
    }

    @Override
    public String toString() {
        String aux = "cantidad de paciente actual: " + cantActual + "\n";
        
        for (int i = 0; i < cantActual; i++) {
           aux = aux + p[i].toString() + "\n";
        }
        return aux;
    }
}
