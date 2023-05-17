package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Punto4deCompa1 {

    public static void main(String[] args) {

        int fil = 5, col = 8;
        Persona[][] turnos = new Persona[fil][col];

        String nada = "no hay turno";
        for (int turno = 0; turno < fil; turno++) {
            for (int dia = 0; dia < col; dia++) {
                turnos[turno][dia] = new Persona(nada, 0, 0);
            }
        }

        int i = 0;

        String nombre;
        System.out.println("|----------Turnos para el Casting-----------|");
        System.out.print("Nombre:");
        nombre = GeneradorAleatorio.generarString(4);
        while ((!nombre.equals("ZZZ")) && (i < (40))) {
            turnos[i / 8][i % 8] = new Persona();
            turnos[i / 8][i % 8].setNombre(nombre);
            System.out.print("Edad:");
            turnos[i / 8][i % 8].setEdad(GeneradorAleatorio.generarInt(90));
            System.out.print("DNI:");
            turnos[i / 8][i % 8].setDNI(GeneradorAleatorio.generarInt(10000));
            System.out.println("|---------Turnos para el Casting-----------|");
            System.out.print("Nombre:");
            nombre = GeneradorAleatorio.generarString(4);
            i++;
        }
//         for (int x = 0; x < 40; x++){
//             System.out.println("El dia "+(x/8+1)+" turno "+(x%8+1)+" se entrevistara a : "+turnos[x/8][x%8].getNombre());
//         }   

        /* otra manera mas grafica de imprimir */
        for (int j = 0; j < col; j++) {
            for (i = 0; i < fil; i++) {
                System.out.print(turnos[i][j].getNombre() + "   ");
            }
            System.out.println("");
        }
    }
}
