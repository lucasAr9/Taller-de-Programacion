/*
5- B- Genere un programa que cree una flota vacía. Cargue micros (sin pasajeros) a la flota con información leída desde teclado (hasta que se
ingresa la patente “ZZZ000” o hasta completar la flota). Luego lea una patente y elimine de la flota el micro con esa patente; busque el micro
con dicha patente para comprobar que ya no está en la flota. Para finalizar, lea un destino e informe la patente del micro que va a dicho destino.
 */
package tema4;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Punto5Main {

    public static void main(String[] args) {
        
        int cantM = 15;
        Flota f = new Flota(cantM);
        
        String patente = "aaa000";
        String destino, horaSalida;

        System.out.print("patente del micro: ");
//        patente = Lector.leerString();
        patente = GeneradorAleatorio.generarString(4);
        
        while ((f.getCantActual() < f.getCantMicros()) && !(patente.equals("zzz000"))) {
            System.out.println("destino y hora asignados.");
            destino = GeneradorAleatorio.generarString(4);
            horaSalida = GeneradorAleatorio.generarString(4);
            
            f.agregarMicro(new Micro(patente, destino, horaSalida));
            
            System.out.print("patente del micro: ");
//            patente = Lector.leerString();
            patente = GeneradorAleatorio.generarString(4);
        }
        
        System.out.println("");
        System.out.println("una patente para eliminar de la flota");
        String patEli = Lector.leerString();
        System.out.println(f.eliminarMicro(patEli));
        
        System.out.println("");
        System.out.println("una patente para comprobar que esta");
        String patBuscar = Lector.leerString();
        System.out.println(f.buscarPatente(patBuscar));
        
        System.out.println("");
        System.out.println("un destino para comprobar que esta");
        String destComprobar = Lector.leerString();
        System.out.println(f.buscarDestino(destComprobar));
        
        System.out.println(f.siEstaLleno());
        
        /* imprimir la flota de micros */
        System.out.println("");
        System.out.println("la flota de micros como quedo");
        for (int i = 0; i < cantM; i++) {
            if (f.getFlotaMicros()[i] != null) {
                System.out.println("micro n: " + (i + 1) + " " + f.getFlotaMicros()[i]);
            }
        }
    }
}
