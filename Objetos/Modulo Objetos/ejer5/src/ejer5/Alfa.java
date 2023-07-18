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
public class Alfa extends Grupo {
    
    public Alfa(int cantPaciente) {
        super(cantPaciente);
    }
    
    public void aplicarDosisAlfa(double dosis) {
        for (int i = 0; i < super.getCantActual(); i++) {
            super.aplicarDosis(dosis, i);
        }
    }

    @Override
    public String toString() {
        return "Grupo Alfa {" + super.toString() + '}';
    }
}
