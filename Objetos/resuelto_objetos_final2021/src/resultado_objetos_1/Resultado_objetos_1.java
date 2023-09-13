/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package resultado_objetos_1;

import java.util.Random;

/**
 *
 * @author lucas.arrigoni
 */
public class Resultado_objetos_1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Random r = new Random();
        Concurso c = new Concurso(4);
        
        for (int i = 0; i < 5; i++) {
            Participante p1 = new Participante(i, "nombre", r.nextInt(40));
            Participante p2 = new Participante(i + 10, "nombre", r.nextInt(40));
            Pareja pareja = new Pareja(2, ("estilo " + i));
            pareja.agregarParticipante(p1);
            pareja.agregarParticipante(p2);
            c.agregarPareja(pareja);
        }
        
        System.out.println("");
        System.out.println(c.diferenciaEdad(1));
        System.out.println("");
        System.out.println(c.parejaMasDiferenciaEdad());
        System.out.println("");
        System.out.println(c.toString());
    }
    
}
