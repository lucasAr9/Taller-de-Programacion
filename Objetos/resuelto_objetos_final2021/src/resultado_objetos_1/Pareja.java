/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package resultado_objetos_1;

/**
 *
 * @author lucas.arrigoni
 */
public class Pareja {
    
    private int actual;
    private int n;
    private Participante[] participantes;
    private String estilo;
    
    public Pareja(int n, String estilo) {
        this.actual = 0;
        this.n = n;
        this.participantes = new Participante[n];
        this.estilo = estilo;
    }
    
    public void agregarParticipante(Participante p) {
        if (this.actual < this.n) {
            this.participantes[this.actual] = p;
            this.actual++;
        } else {
            System.out.println("No se pueden ingresar mas participantes a esta pareja.");
        }
    }
    
    public int diferenciaEdad() {
        if (participantes[0].getEdad() == participantes[1].getEdad()) {
            return 0;
        } else if (participantes[0].getEdad() < participantes[1].getEdad()) {
            return participantes[1].getEdad() - participantes[0].getEdad();
        } else {
            return participantes[0].getEdad() - participantes[1].getEdad();
        }
    }

    @Override
    public String toString() {
        String aux = "";
        for (int i = 0; i < this.actual; i++) {
            aux = aux + participantes[i].toString() + "\n";
        }
        return aux;
    }
}
