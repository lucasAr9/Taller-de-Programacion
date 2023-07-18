/*
Utilizando la clase Auto dada por la cátedra. Un objeto auto se crea sin valores
iniciales. Un objeto auto responde a los siguientes mensajes:

Modifique el ejercicio 2 para almacenar en la estructura de datos el auto que ocupa cada plaza.

b) A partir de la estructura de autos, informar para cada número de piso y número de
plaza ocupado, la representación del auto que la ocupa. 

 */
package trabajoteoria;

import PaqueteLectura.GeneradorAleatorio;

public class Trabajo_3_de_compa {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();

        int fil = 5, col = 10;
        int piso, plaza;

        Auto[][] estacionamiento = new Auto[fil][col];
        
        for (piso = 0; piso < fil; piso++) {
            for (plaza = 0; plaza < col; plaza++) {
                estacionamiento[piso][plaza] = null;
            }
        }
        
        int patente = GeneradorAleatorio.generarInt(10);
        while (patente != 0) {
            String dueño = GeneradorAleatorio.generarString(7);
            
            piso = GeneradorAleatorio.generarInt(5);
            plaza = GeneradorAleatorio.generarInt(10);
                
            boolean entro = false;
            while (entro) {
                if (estacionamiento[piso][plaza] != null) {
                    estacionamiento[piso][plaza] = new Auto();
                    estacionamiento[piso][plaza].setPatente(patente);
                    estacionamiento[piso][plaza].setDueño(dueño);
                    entro = true;
                } else {
                    piso = GeneradorAleatorio.generarInt(5);
                    plaza = GeneradorAleatorio.generarInt(10);
                }
                System.out.println("Patente " + patente + " con dueño " + dueño + " fue asignada a la plaza " + plaza + " del piso " + piso);
                patente = GeneradorAleatorio.generarInt(10);
            }
        }

        /* informar el piso mas ocupado */
        int numPiso = 0, pisoMasOcupado = -1;

        /* imprimir la matriz ordenada para corroborar los datos */
        System.out.println("");
        System.out.println("imprimir el estacionamiento completo.");
        for (piso = 0; piso < fil; piso++) {
            int contarPlazaOcu = 0;
            System.out.print("piso: " + piso + "    ");

            for (plaza = 0; plaza < col; plaza++) {
                System.out.print(estacionamiento[piso][plaza] + "  |  ");

                if (estacionamiento[piso][plaza] != null) {
                    contarPlazaOcu = contarPlazaOcu + 1;
                }
            }

            if (contarPlazaOcu > pisoMasOcupado) {
                pisoMasOcupado = contarPlazaOcu;
                numPiso = piso;
            }
            System.out.println("");
            System.out.println("");
        }

        /* calcular la cantidad de autos en cada piso y sacar un maximo */
        System.out.println("");
        if (numPiso == 0) {
            System.out.println("el piso mas ocupado es la planta baja.");
        } else {
            System.out.println("el piso mas ocupado es: " + numPiso);
        }
        System.out.println("");
    }
}
