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
public class Pareja {
    
    private Participante[] p;
    private int numeroP;
    
    public Pareja() {
        p = new Participante[2];
        numeroP = 0;
    }
    
    public void agregarParticipante(Participante part) {
        p[numeroP] = part;
        numeroP++;
    }
    
    public int obtenerDiferenciaEdad() {
        int resta = p[0].getEdad() - p[1].getEdad();
        if (resta < 0) {
            resta = resta * (-1);
        }
        return resta;
    }

    @Override
    public String toString() {
        return "Pareja: " + p[0].toString() + "\n y " + p[1].toString();
    }
}
