/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejer2;

/**
 *
 * @author Lucas Arrigoni
 */
public class GrupoAlfa extends Paciente {

    private final int cantP;
    private int cantActual;
    private Paciente [] p;
    
    public GrupoAlfa(int cantP) {
        this.cantP = cantP;
        cantActual = 0;
        p = new Paciente[this.cantP];
    }
    
    public String agregarPaciente(String nombre) {
        p[cantActual].setNombre(nombre);
        
        double ultimo = (int)(Math.random() * 10);
        p[cantActual].setUltimaGlucosa(ultimo);
        
        p[cantActual].setUltimaDosisFarmaco(0);
        
        String aux = "Su ID es: " + (cantActual + 1);
        cantActual++;
        
        return aux;
    }
    
    public String obtenerPaciente(int id) {
        return "nombre: " + p[id].getNombre() + "glucosa: " + p[id].getUltimaGlucosa() +
                "ultima dosis de farmaco: " + p[id].getUltimaDosisFarmaco();
    }
    
    @Override
    public void aplicarElFarmaco(double d) {
        for (int i = 0; i < cantActual; i++) {
            p[i].aplicarDosis(this, d);
        }
    }
    
    /* para obtener la cantidad de pacientes en el grupo */
    public int getCantP() {
        return cantP;
    }

    /* para obtener la cantidad actual de pacientes en el vector */
    public int getCantActual() {
        return cantActual;
    }
        
    @Override
    public String toString() {
        String aux = "";
        for (int i = 0; i < cantP; i++) {
            aux = aux + "ID: " + (i+1) + p[i].toString();
        }
        return aux;
    }
}
