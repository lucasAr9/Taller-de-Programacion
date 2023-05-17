/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejer2;

/**
 *
 * @author Lucas Arrigoni
 */
public class NomRandom {
    
    private String nombre;
    private int r;
    
    /* esto es para hacer que se implementen nombres random en vez de teclearlo */
    public void generadorRandom() {        
        /* genera un nombre aleatorio entre los 9 */
        r = (int)(Math.random() * 10);

        switch(r) {
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
    }    
    
    public String getNombre() {
        return nombre;
    }
}
