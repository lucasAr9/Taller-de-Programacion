/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejer1_adicional;

import java.util.Random;
/**
 *
 * @author Lucas Arrigoni
 */
public class RandomNom {
    
    Random rand = new Random();
    
    private String nombre;
    
    public String generarNombre() {
        int r = rand.nextInt(6);
        
        switch(r) {
            case 0: nombre = "el Pepe";
                break;
            case 1: nombre = "Niko";
                break;
            case 2: nombre = "Hernan";
                break;
            case 3: nombre = "Pepito";
                break;
            case 4: nombre = "Jorge";
                break;
            case 5: nombre = "Panadero";
                break;
        }
        return nombre;
    }
}
