/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package resuelto_objetos_4;

import java.util.Random;

/**
 *
 * @author lucas.arrigoni
 */
public class Resuelto_objetos_4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Random r = new Random();
        
        Grado g = new Grado(5345342, "German", 30, "carrera");
        Doctorado d = new Doctorado(14343252, "Miguel", 8, "Licenciatura informatica", "UNLP");
        
        for (int i = 0; i < 30; i++) {
            int nota = r.nextInt(10);
            g.registrarMateria(i, nota, (i + 10));
        }
        
        for (int i = 0; i < 8; i++) {
            int nota = r.nextInt(10);
            d.registrarMateria(i, nota, (i + 10));
        }
        
        System.out.println(g.toString());
        System.out.println(g.alumnoGraduado());
        System.out.println(d.toString());
        System.out.println(d.alumnoGraduado());
    }
    
}
