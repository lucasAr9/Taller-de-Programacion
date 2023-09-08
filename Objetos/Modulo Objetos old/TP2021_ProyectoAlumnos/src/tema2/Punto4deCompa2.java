package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Punto4deCompa2 {

    public static void main(String[] args) {

        Persona[][] castings = new Persona[5][8];    //CREO EL CASTING
        int turnos = 0, dias = 0;

        System.out.print("Nombre: ");
        String nombre = GeneradorAleatorio.generarString(4);
        while (!(nombre.equals("ZZZ")) && (dias < 5)) {
            System.out.print("DNI: ");
            int DNI = GeneradorAleatorio.generarInt(90900900);
            System.out.print("Edad: ");
            int edad = GeneradorAleatorio.generarInt(80);

            Persona x = new Persona(nombre, DNI, edad);
            castings[dias][turnos] = x;

            turnos++;
            if (turnos == 8) {
                turnos = 0;
                dias++;
            }
            if (dias < 5) {
                System.out.print("Nombre: ");
                nombre = GeneradorAleatorio.generarString(4);
            }
        }

        //IMPRIMIR PERSONAS
        int diasMax = dias, turnoMax = turnos; //GUARDO EL MAXIMO DE LA MATRIZ
        dias = 0;
        turnos = 0;
        while (dias <= diasMax) {
            if (dias < diasMax) {
                System.out.println("Dia " + (dias + 1) + ", turno " + (turnos + 1) + ": " + castings[dias][turnos].getNombre());
                turnos++;
                if (turnos == 8) {
                    turnos = 0;
                    dias++;
                }
            } else {
                if (turnos < turnoMax) {
                    System.out.println("Dia " + (dias + 1) + ", turno " + (turnos + 1) + ": " + castings[dias][turnos].getNombre());
                    turnos++;
                } else {
                    dias++;
                }
            }
        }
    }
}
