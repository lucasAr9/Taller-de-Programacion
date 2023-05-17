package tema2;

import PaqueteLectura.Lector;

public class Punto4deCompa3 {

    public static void main(String[] args) {
        int DIMF = 5;//dias
        int DIMC = 8;//turnos
        Persona mPersonas[][] = new Persona[DIMF][DIMC];
        int dimF = 0;//dim logica filas
        int dimC = 0;//dim logica columna de ultima fila cargada(por carga secuencial)
        String nombre;
        int dni;
        int edad;
        //lectura
        System.out.println(">>>Nombre: ");
        nombre = Lector.leerString();
        while ((dimF < DIMF) && (!nombre.equals("zzz"))) {
            dimC = 0;
            while ((dimC < DIMC) && (!nombre.equals("zzz"))) {
                System.out.println(">>DNI: ");
                dni = Lector.leerInt();
                System.out.println(">>Edad: ");
                edad = Lector.leerInt();
                //fin lectura
                mPersonas[dimF][dimC] = new Persona(nombre, dni, edad);//carga de dato
                dimC++;
                //nueva lectura
                System.out.println(">>>Nombre: ");
                nombre = Lector.leerString();
            }
            dimF++;
        }
        //b) Informar para cada día y turno el nombre de la persona a entrevistar.
        int i, j;
        for (i = 0; i < (dimF - 1); i++) {//recorro hasta la ultima fila sin incluir
            for (j = 0; j < DIMC; j++) {
                System.out.println("Persona de dia " + i + " turno " + j + " es: " + mPersonas[i][j].getNombre());
            }
        }
        //i me queda dimF-1
        for (j = 0; j < dimC; j++) { //recorro las culumnas de la ultima fila
            System.out.println("Persona de dia " + i + " turno " + j + " es: " + mPersonas[i][j].getNombre());
        }
    }
}
