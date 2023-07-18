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
public class Alfa extends Grupo {
    
    public Alfa() {
        super.crearGrupo(10);
    }
    
    public void aplicarFarmaco(double dosis) {
        for (int i = 0; i < super.getCantActual(); i++) {
            super.aplicarDosis(dosis, i);
        }
    }

    @Override
    public String toString() {
        return "Grupo Alfa{" + super.toString() + '}';
    }
}
