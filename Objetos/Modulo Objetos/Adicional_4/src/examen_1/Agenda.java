/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package examen_1;

/**
 *
 * @author Lucas Arrigoni
 */
public class Agenda {
    
    private int dia;
    private int turno;
    private int diaActual;
    private int turnoActual;
    private Paciente[][] p;
    
    public Agenda() {
        dia = 5;
        turno = 6;
        diaActual = 0;
        turnoActual = 0;
        p = new Paciente[turno][dia];
    }
    
    public String agregarPaciente(Paciente pac, int d) {
        String aux = "";
        
        while (p[turnoActual][d] != null) {
            turnoActual++;
        }
        
        if (turnoActual <= turno) {
            p[turnoActual][d] = pac;            
            aux = aux + "se agrego el turno el dia: " + (d) +
                "en el turno numero: " + (turnoActual +1);
        } else {
            aux = aux + "el dia esta todo ocupado.";
        }
        
        return aux;
    }
    
    public String liberarTurno(String nombre) {
        String aux = "";
        
        for (int j = 0; j < turno; j++) {
            for (int i = 0; i < dia; i++) {
                if ((p[j][i] != null) & (p[j][i].getNombre().equals(nombre))) {
                    p[j][i] = null;
                    aux = aux + "se quito el dia: " + i + " en el turno: " + j;
                }
            }
        }
        return aux;
    }

    @Override
    public String toString() {
        String aux = "";
        for (int i = 0; i < turno; i++) {
            for (int j = 0; j < dia; j++) {
                aux = aux + p[i][j].toString();
            }
            aux = aux + "\n";
        }
        return aux;
    }
}
