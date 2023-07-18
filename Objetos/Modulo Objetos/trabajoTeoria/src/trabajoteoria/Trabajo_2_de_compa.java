/*
a) Realice un nuevo programa considerando que ahora el estacionamiento está
dividido en 5 pisos y cada piso tiene 10 plazas. Por cada patente generada, debe
ingresar por teclado el número de piso y número de plaza donde debe estacionar el
auto, debiendo marcar ese lugar como ocupado en una estructura de datos adecuada.
Nota: considere que el lugar ingresado (número de piso, número de plaza) está
desocupado y dichos números son válidos.

b) Informe cuál es el piso más ocupado.

 */
package trabajoteoria;

import PaqueteLectura.GeneradorAleatorio;

public class Trabajo_2_de_compa {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();

        int fil = 5, col = 10;
        int[][] matriz = new int[fil][col];

        int i, j;
        for (i = 0; i < fil; i++) {
            for (j = 0; j < col; j++) {
                matriz[i][j] = 0;
            }
        }

        /* un generador de patente aleatorio */
        int patente, piso, plaza;

        System.out.println("generar patentes aleatorio");
        do {
            patente = GeneradorAleatorio.generarInt(50);
            System.out.println("nuva patente: " + patente);

            boolean entro = false;
            piso = GeneradorAleatorio.generarInt(5);
            plaza = GeneradorAleatorio.generarInt(10);
            while (!entro) {
                if (matriz[piso][plaza] == 0) {
                    matriz[piso][plaza] = patente;
                    entro = true;
                } else {
                    piso = GeneradorAleatorio.generarInt(5);
                    plaza = GeneradorAleatorio.generarInt(10);
                }
            }
        } while (patente != 0);

        /* informar el piso mas ocupado */
        int numPiso = 0, pisoMasOcupado = -1;

        /* imprimir la matriz ordenada para corroborar los datos */
        System.out.println("");
        System.out.println("imprimir el estacionamiento completo.");
        for (i = 0; i < fil; i++) {
            int contarPlazaOcu = 0;
            System.out.print("piso: " + i + "    ");

            for (j = 0; j < col; j++) {
                System.out.print("pate: " + matriz[i][j] + "  |  ");

                if (matriz[i][j] != 0) {
                    contarPlazaOcu = contarPlazaOcu + 1;
                }
            }

            if (contarPlazaOcu > pisoMasOcupado) {
                pisoMasOcupado = contarPlazaOcu;
                numPiso = i;
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
