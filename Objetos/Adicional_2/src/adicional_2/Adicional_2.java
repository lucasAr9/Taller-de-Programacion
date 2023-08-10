/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package adicional_2;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author luk
 */
public class Adicional_2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        EventoOcasional evento1 = new EventoOcasional("evem1", 10, "show de TV", "Juan", "10/10/2010");
        evento1.actuar();
        evento1.actuar();
        evento1.actuar();
        
        Gira gira1 = new Gira("gira1", 12, "unaGiraATR", 6);
        for (int i = 0; i < 12; i++) {
            String nombre = GeneradorAleatorio.generarString(6);
            gira1.agregarTema(nombre);
        }
        for (int i = 0; i < 6; i++) {
            int dia = GeneradorAleatorio.generarInt(30);
            int mes = GeneradorAleatorio.generarInt(12);
            int anio = GeneradorAleatorio.generarInt(2020) + 2000;
            String ciudad = GeneradorAleatorio.generarString(6);
            Fecha f = new Fecha(dia, mes, anio, ciudad);
            gira1.agregarFecha(f);
        }
        gira1.actuar();
        gira1.actuar();
        gira1.actuar();
    }
    
}
