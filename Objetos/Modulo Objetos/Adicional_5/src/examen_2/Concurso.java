/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package examen_2;

/**
 *
 * @author Lucas Arrigoni
 */
public class Concurso {
    
    private Pareja[] p;
    private int n;
    private int nAct;
    
    public Concurso(int cantParejas) {
        this.n = cantParejas;
        p = new Pareja[this.n];
        nAct = 0;
    }
    
    public void agregarPareja(Pareja pareja) {
        p[nAct] = pareja;
        nAct++;
    }
    
    public String parejaMasDiferencia() {
        int max = -1;
        int numeroPareja = 0;
        
        for (int i = 0; i < nAct; i++) {
            if (max < p[i].obtenerDiferenciaEdad()) {
                max = p[i].obtenerDiferenciaEdad();
                numeroPareja = i;
            }
        }
        return p[numeroPareja].toString();
    }
}
