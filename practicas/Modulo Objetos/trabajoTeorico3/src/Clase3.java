/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import PaqueteLectura.Lector;
public class Clase3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        /*
        I)  Realice un programa que instancie una urna electoral para la mesa “203” con 5
        listas y una urna de referéndum para la mesa “203”. Luego, lea DNIs de personas que
        llegan a votar a la mesa, hasta que se ingresa el DNI 0 (el cual no debe procesarse).
        Cada persona vota en ambas urnas de la siguiente manera. Para la urna electoral,
        la persona ingresa un nro. “N”: si “N” corresponde a  una lista válida se debe votar
        por la lista “N” y en caso contrario se debe votar en blanco.
        Para la urna de referéndum, la persona ingresa un número “M”: si “M” es positivo 
        se debe votar a favor, si es negativo se debe votar en contra, y si
        es 0 debe votar en blanco.
         */

        Electoral urnaElectoral = new Electoral(203,5);
        Referendum urnaDeReferendum = new Referendum(203);

        System.out.println("Ingrese su DNI: ");
        int dni = Lector.leerInt();

        while (dni != 0) {
            System.out.println("Ingrese su voto para la urna electoral: ");
            int votoElectoral = Lector.leerInt();
            if (urnaElectoral.validarNumeroDeLista(votoElectoral)) {// validamos la lista a votar
                urnaElectoral.votarPorLista(votoElectoral);
            } else {
                urnaElectoral.votarEnBlanco();
            }

            System.out.println("Ingrese su voto para la urna de referendum: ");
            int votoReferendum = Lector.leerInt();
            if (votoReferendum > 0) {
                urnaDeReferendum.incrementarVotosAfavor();
            } else {
                if (votoReferendum < 0) {
                    urnaDeReferendum.incrementarVotosEnContra();
                } else {
                    urnaDeReferendum.votarEnBlanco();
                }
            }

            System.out.println("Ingrese su DNI: ");
            dni = Lector.leerInt();
        }

        /* .  Al finalizar  la  votación,  calcular  la  opción  ganadora  en  ambas 
        urnas  y  mostrar  el  resultado  en  consola. Además mostrar para cada urna
        el porcentaje de votos que obtuvo la opción ganadora respecto al total de votos.
        */
        int ganadorElectoral = urnaElectoral.calcularGanador();
        System.out.println("La opcion ganadora en la urna electoral es la lista " +
                ganadorElectoral + " con un porcentaje de votos respecto del total de "
                + ((double) urnaElectoral.devolverVotosPorLista(ganadorElectoral) /
                        urnaElectoral.calcularTotalVotos()) * 100 + "%.");

        System.out.print("La opcion ganadora en la urna de referendum es ");
        int ganadorRef = urnaDeReferendum.calcularGanador(); 
        int totalRef = urnaDeReferendum.calcularTotalVotos();
        if (ganadorRef == 1) {
            System.out.println("a favor, con un porcentaje de votos respecto del total de "
                    + ((double) urnaDeReferendum.getAfavor() / totalRef ) * 100 + "%.");
        } else {
            if (ganadorRef== 0) {
                System.out.println("en contra, con un porcentaje de votos respecto del total de "
                        + ((double) urnaDeReferendum.getEnContra() / totalRef) * 100 + "%.");
            } else {
                System.out.println("hubo empate");
            }
        }

    }

}
