/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package Adicional_1;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author luk
 */
public class Adicional_1 {

    public static void main(String[] args) {
        Proyecto p = new Proyecto("atomo", 343434);
        
        String nombreDir = GeneradorAleatorio.generarString(5);
        String apellidoDir = GeneradorAleatorio.generarString(5);
        p.setNombreDirector(nombreDir);
        p.setApellidoDirector(apellidoDir);
        
        for (int i = 0; i < 60; i++) {
            String nombreInv = GeneradorAleatorio.generarString(5);
            String apellidoInv = GeneradorAleatorio.generarString(5);
            int categoria = i;
            String especialidad = GeneradorAleatorio.generarString(5);
            
            Investigador inv = new Investigador(nombreInv, apellidoInv, categoria, especialidad);
            p.agregarInvestigador(inv);
        }
        
        System.out.println(p.toString());
    }
}
