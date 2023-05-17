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
public class Beta extends Grupo {
    
    public Beta(int cantPaciente) {
        super(cantPaciente);
    }
    
    public void aplicarDosisBeta(double dosis) {
        for (int i = 0; i < super.getCantActual(); i++) {
            if (super.retornarGlucosaPaciente(i) >= 2.5) {
                super.aplicarDosis(dosis, i);
            }
        }
    }
    
    @Override
    public String toString() {
        return "Grupo Beta {" + super.toString() + '}';
    }
}
