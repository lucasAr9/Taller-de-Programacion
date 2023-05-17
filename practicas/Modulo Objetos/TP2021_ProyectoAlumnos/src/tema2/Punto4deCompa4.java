/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Punto4deCompa4 {

    public static void main(String[] args) {

        int CANT_DIAS = 5, CANT_ENTREVISTAS = 10;
        String NOM_CORTE = "ZZZ", nom;
        
        Persona[][] inscripciones = new Persona[CANT_DIAS][CANT_ENTREVISTAS];
        
        int i = 0, dia, ent;
        System.out.print("  Nombre: ");
        nom = Lector.leerString();
        while (!nom.equals(NOM_CORTE) && (i < (CANT_DIAS * CANT_ENTREVISTAS))) {
            dia = i / CANT_ENTREVISTAS;
            ent = i % CANT_ENTREVISTAS;
            inscripciones[dia][ent] = new Persona();
            inscripciones[dia][ent].setNombre(nom);
            System.out.print("  DNI: ");
            inscripciones[dia][ent].setDNI(GeneradorAleatorio.generarInt(90900900));
            System.out.print("  Edad: ");
            inscripciones[dia][ent].setEdad(GeneradorAleatorio.generarInt(80));
            System.out.println();
            i++;
            System.out.print("  Nombre: ");
            nom = Lector.leerString();
        }
        
        for (int j = 0; j < i; j++) {
            dia = j / CANT_ENTREVISTAS;
            ent = j % CANT_ENTREVISTAS;
            System.out.println("  Para el dia: " + (dia + 1) + " posicion: " + (ent + 1) + " se entrevistara a " + inscripciones[dia][ent].getNombre());
            System.out.println();
        }
    }

}
