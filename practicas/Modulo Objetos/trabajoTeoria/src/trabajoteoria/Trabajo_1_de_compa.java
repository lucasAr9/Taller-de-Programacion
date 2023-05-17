/*
Realice un programa que genere aleatoriamente números (patentes) hasta el 0. Por
cada una debe informar en consola si el auto tiene o no permitido el paso (solo pasan los
autos con patentes de números pares).
*/

package trabajoteoria;

import PaqueteLectura.GeneradorAleatorio;

public class Trabajo_1_de_compa {
    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        int patente, esPar;
        
        patente = GeneradorAleatorio.generarInt(100);
        
        while(patente != 0){
            esPar = patente % 2;
            
            if (esPar != 0) System.out.println("no: " + patente);
            
            if (esPar == 0) System.out.println("si puede: " + patente);
            
            patente=GeneradorAleatorio.generarInt(100);
        }
    }
}

