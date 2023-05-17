/*
3- Realice un programa que instancie un estacionamiento llamado “ABC”, ubicado en
“12 e/ 45 y 46”, con apertura a las “6:00” y cierre a las “22:00”. Este estacionamiento
tendrá 3 pisos y 3 plazas por piso.
Registre 6 autos en el estacionamiento (ingresando patente, dueño, piso y plaza por
teclado). Asuma que el lugar ingresado está desocupado y es válido.
Luego, muestre la representación String del estacionamiento en consola.
Para finalizar, lea una patente por teclado e informe si dicho auto se encuentra en el
estacionamiento o no. En caso de encontrarse, la información a imprimir es el piso y
plaza que ocupa.
 */

 /* no funciona el ultimo corroborar si hay una patente en el estacionamiendo */

package trabajoTeoria2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class TrabajoDeEstacionamientos {
    
    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        
        /* crear el estacionamiento */
        int fil = 3, col = 3;
        Estacionamiento est = new Estacionamiento("estacionamiento el pepe", "23 e 8 y 10", "10:00", "23:00", fil, col);
        
        /* cargar los autos en el estacionamiento */
        String dueño; int patente;
        int piso, plaza;
        
        for (int i = 0; i < col; i++) {
            patente = GeneradorAleatorio.generarInt(9000);
            dueño = GeneradorAleatorio.generarString(4);
            System.out.println("");
            System.out.println("ingreso un auto. su lugar?");
            System.out.print("que piso: ");
            piso = Lector.leerInt();
            System.out.print("que plaza: ");
            plaza = Lector.leerInt();
            
            est.CargarAuto(new Auto(patente, dueño), piso, plaza);
        }
        
        System.out.println("estacionamiento.");
        System.out.println(est.toString());
        
        System.out.println("");
        System.out.println("ingrese una patente para saber si esta: ");
        System.out.println(est.getEstaAuto(Lector.leerInt()));
    }
    
}
