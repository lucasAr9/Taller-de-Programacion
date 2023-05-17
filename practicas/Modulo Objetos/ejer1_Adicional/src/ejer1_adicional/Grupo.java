/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejer1_adicional;

/**
 *
 * @author Lucas Arrigoni
 */
public abstract class Grupo {
    
    private int cantPac;
    private int cantActual;
    private Paciente[] vec;
    
    public void crearGrupo(int cantPac) {
        this.cantPac = cantPac;
        cantActual = 0;
        vec = new Paciente[this.cantPac];
        for (int i = 0; i < this.cantPac; i++) {
            Paciente p = new Paciente();
            vec[i] = p;
        }
    }
    
    public String agregarPaciente(Paciente p) {
        vec[cantActual] = p;
        cantActual++;
        
        return "paciente agregado con el id: " + cantActual;
    }
    
    public Paciente obtenerPaciente(int id) {
        return vec[id - 1];
    }

    public void aplicarDosis(double dosis, int id) {
        vec[id].aplicarDosisPaciente(dosis);
    }
    
    public int getCantActual() {
        return cantActual;
    }

    public void setCantActual(int cantActual) {
        this.cantActual = cantActual;
    }

    @Override
    public String toString() {
        String aux = "";
        aux = " cantPac: " + cantPac + "\n";
        for (int i = 0; i < cantActual; i++) {
            aux = aux + vec[i].toString() + "\n";
        }
        return aux;
    }
}
