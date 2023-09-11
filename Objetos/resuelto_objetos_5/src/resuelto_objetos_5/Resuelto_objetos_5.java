/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package resuelto_objetos_5;

import java.util.Random;

/**
 *
 * @author lucas.arrigoni
 */
public class Resuelto_objetos_5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Random r = new Random();
        
        Estacion e = new Estacion("La Plata", 34.91, 57.95);
        SistemaMeteorologico sistema = new SistemaMeteorologico(e, 4);
        
        for (int i = 0; i < 12; i++) {
            for (int j = 0; j < 4; j++) {
                sistema.registrar(i, j, r.nextDouble(30));
            }
        }
        
        System.out.println("Mostrar la matriz con todas las temperaturas");
        for (int j = 0; j < 4; j++) {
            System.out.println("anio: " + (j + 1));
            for (int i = 0; i < 12; i++) {
                System.out.println("mes: " + (i + 1) + " temperatura: " + sistema.devolverTemp(i, j));
            }
        }
        
        System.out.println("La mayor temperatura registrada.");
        System.out.println(sistema.mayorTemperatura());
        
        System.out.println("Reporte total.");
        System.out.println(sistema.toString("anio"));
    }
    
}
