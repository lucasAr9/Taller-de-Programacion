/*
6- Se dispone de la clase Partido (ya implementada en la carpeta tema2). Un objeto
partido representa un encuentro entre dos equipos (local y visitante). Un objeto partido
puede crearse sin valores iniciales o enviando en el mensaje de creación el nombre del
equipo local, el nombre del visitante, la cantidad de goles del local y del visitante (en ese
orden). Un objeto partido sabe responder a los siguientes mensajes:

Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en el
campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga informar:

- La cantidad de partidos que ganó River.
- El total de goles que realizó Boca jugando de local.
- El porcentaje de partidos finalizados con empate. 
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Punto6 {

    public static void main(String[] args) {

        GeneradorAleatorio.iniciar();

        int dimF = 10;
        Partido[] vector = new Partido[dimF];

        int dL = 0;
        String local, visitante = "nn";
        int golLocal, golVisitante;

        System.out.print("visitante: ");
        visitante = Lector.leerString();
        while ((dL < dimF) && (visitante != "zzz")) {
            System.out.print("local: ");
            local = Lector.leerString(); /* b: boca; r: river; i: independiente; rm: real madrid */

            golLocal = GeneradorAleatorio.generarInt(5);
            golVisitante = GeneradorAleatorio.generarInt(5);
            System.out.println("se agregaron los goles.");
            System.out.println("");

            vector[dL] = new Partido(local, visitante, golLocal, golVisitante);
            dL = dL + 1;

            System.out.print("visitante: ");
            visitante = Lector.leerString();
        }

        /*
        - El porcentaje de partidos finalizados con empate. 
        - La cantidad de partidos que ganó River.
        - El total de goles que realizó Boca jugando de local.
         */
        int i;
        int cantGanoRiver = 0, totalGolesBocaLocal = 0;
        int cantPartidosTotal = 0, partidosEmpatados = 0;
        for (i = 0; i < dL; i++) {
            System.out.println("partido " + i);
            System.out.println(vector[i].getLocal() + " goles: " + vector[i].getGolesLocal());
            System.out.println(vector[i].getVisitante() + " goles: " + vector[i].getGolesVisitante());

            /* contar todos los partidos que se jugaros */
            cantPartidosTotal = cantPartidosTotal + 1;
            /* contar los partidos que se empataron */
            if (vector[i].hayEmpate()) {
                partidosEmpatados = partidosEmpatados + 1;
            }
            /* contar los partidos que gano river */
            if (vector[i].getGanador().equals("r")) {
                cantGanoRiver = cantGanoRiver + 1;
            }
            /* contar el total de goles que hizo boca de local */
            if (vector[i].getLocal().equals("b")) {
                totalGolesBocaLocal = totalGolesBocaLocal + vector[i].getGolesLocal();
            }
        }
            
            System.out.println("");
            System.out.println("datos...");
            System.out.println("el porsentaje de partidos empatados es de: " + (partidosEmpatados * 100) / cantPartidosTotal + "%");
            System.out.println("la cantidad de partidos que gano river es: " + cantGanoRiver);
            System.out.println("la cantidad de goles totales que hizo boca de local es: " + totalGolesBocaLocal);
            System.out.println("");
    }

}
