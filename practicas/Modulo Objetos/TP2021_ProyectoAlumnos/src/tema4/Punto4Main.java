/*
4- B- Realice un programa que cree un micro con patente “ABC123”, destino “Mar del Plata” y
hora de salida 5:00. Cargue pasajeros al micro de la siguiente manera. Leer nros. de
asientos desde teclado que corresponden a pedidos de personas. La lectura finaliza cuando
se ingresa el nro. de asiento -1 o cuando se llenó el micro. Para cada nro. de asiento leído
debe: validar el nro; en caso que esté libre, ocuparlo e informar a la persona el éxito de la
operación; en caso que esté ocupado informar a la persona la situación y mostrar el nro.
del primer asiento libre. Al finalizar, informe la cantidad de asientos ocupados del micro. 
 */
package tema4;

import PaqueteLectura.Lector;

public class Punto4Main {

    public static void main(String[] args) {

        Micro micro = new Micro("ABC123", "Mar del Plate", "5:00hs");

        int numAsiento;
        System.out.println("Leer los numeros de asiento que quieren los pasajeros.");

        System.out.println("num asiento: ");
        numAsiento = Lector.leerInt();
        while ((micro.getCantOcupados() < micro.getNAsiento()) && (numAsiento != - 1)) {
            if (micro.asientoOcupado(numAsiento)) {
                if (micro.puedeSentarse(numAsiento)) {
                    System.out.println("Puede sentarse.");
                    micro.setVecMicroOcupar(numAsiento);
                } else {
                    System.out.println("El asiento esta ocupado. Puede ocupar: " + micro.primerAsientoLibre());
                }
            } else {
                System.out.println("El asiento no existe. Puede ocupar: " + micro.primerAsientoLibre());
            }
            System.out.println("num asiento: ");
            numAsiento = Lector.leerInt();
        }
        
        System.out.println("la cant de asientos ocupados es: " + micro.getCantOcupados());
    }
}
