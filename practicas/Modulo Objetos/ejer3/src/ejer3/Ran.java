/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejer3;

import java.util.Random;

/**
 *
 * @author Lucas Arrigoni
 */
public class Ran {
    
    private String nombre;
    
    Random r = new Random();
    
    public Ran() {
    }
    
    public String generarNombres() {
        int num = r.nextInt(10);
        
        switch(num) {
            case 0: nombre = "NikoPe";
                break;
            case 1: nombre = "el Pepe";
                break;
            case 2: nombre = "Jose";
                break;
            case 3: nombre = "German";
                break;
            case 4: nombre = "Hernesto";
                break;
            case 5: nombre = "Mica";
                break;
            case 6: nombre = "Juan";
                break;
            case 7: nombre = "Franka";
                break;
            case 8: nombre = "Anita";
                break;
            case 9: nombre = "Maria";
                break;
        }
        return nombre;
    }
    
    public String generarBio() {
        int num = r.nextInt(5);
        
        switch(num) {
            case 0: nombre = "un muy buen tipo, un crack, se merece lo mejor";
                break;
            case 1: nombre = "otro cualquiera que nadie recuerda y a nadie le importa";
                break;
            case 2: nombre = "este no se que mierda hace pero tiene un nombre gracioso";
                break;
            case 3: nombre = "un random de la vida que a nadie mas que su mama le importa";
                break;
            case 4: nombre = "random nivel mil, este si que no lo conoce ni su mama";
                break;
        }
        return nombre;
    }
    
    public String generarTitulo() {
        int num = r.nextInt(7);
        
        switch(num) {
            case 0: nombre = "piratas del caribe, ahre";
                break;
            case 1: nombre = "the lord of the rings";
                break;
            case 2: nombre = "ñarña";
                break;
            case 3: nombre = "Alicia en ningun lado";
                break;
            case 4: nombre = "Rohan y dios";
                break;
            case 5: nombre = "rapido y hambriento";
                break;
            case 6: nombre = "resident evil";
                break;
        }
        return nombre;
    }
}
