/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicional_2;

//import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Adicional_2 {
    
    public static void main(String[] args) {
        
        /* evento ocacional */
        System.out.print("nombre de la banda: ");
        String nomBand = Lector.leerString();
        System.out.print("cantidad de temas: ");
        int cantTemas = Lector.leerInt();
        System.out.print("nombre del contratante: ");
        String contratante = Lector.leerString();
        System.out.print("motivo del evento: ");
        String motivo = Lector.leerString();
        System.out.print("dia del evento: ");
        String dia = Lector.leerString();
        
        EventoOcacional evento = new EventoOcacional(nomBand, cantTemas, motivo, contratante, dia);
        
        System.out.println("");
        /* cargar los nombres de los temas */
        String tema;
        System.out.print("tema: ");
        tema = Lector.leerString();
        while (!tema.equals("nada")) {
            System.out.println(evento.agregarTema(tema));
            System.out.print("tema: ");
            tema = Lector.leerString();
        }
        System.out.println("");
        
        System.out.println("");
        System.out.println(evento.toString());
        System.out.println("");
        System.out.println("");
        
        int avanzar;
        System.out.println("comenzo el show.");
        avanzar = Lector.leerInt();
        while (avanzar != 0) {
            System.out.println(evento.actuar());
            avanzar = Lector.leerInt();
        }
        
        avanzar = Lector.leerInt();
        while (avanzar != 0) {
            Recital r = (Recital) evento;
            System.out.println(r.actuar());
            avanzar = Lector.leerInt();
        }
        
        
        /* una gira */
        System.out.print("nombre de la banda: ");
        String nom = Lector.leerString();
        System.out.print("cantidad de temas: ");
        int cant = Lector.leerInt();
        System.out.print("nombre de la gira: ");
        String gira = Lector.leerString();
        System.out.print("cantidad de fechas: ");
        int cantF = Lector.leerInt();
        
        Gira g = new Gira(nom, cant, gira, cantF);
        
        /* agregar las fechas */
        String fechaDia;
        System.out.print("ciudad: ");
        String fechaCiudad = Lector.leerString();
        
        while (!fechaCiudad.equals("nada")) {
            System.out.print("dia: ");
            fechaDia = Lector.leerString();
            
            Fecha f = new Fecha(fechaCiudad, fechaDia);
            System.out.println(g.agregarFecha(f));
            
            System.out.print("ciudad: ");
            fechaCiudad = Lector.leerString();
        }
        System.out.println("");
        System.out.println("");
        System.out.println(g.toString());
        System.out.println("");
        System.out.println("");
        
        int avanzar2;
        System.out.println("comenzo el show.");
        avanzar2 = Lector.leerInt();
        while (avanzar2 != 0) {
            System.out.println(g.actuar());
            avanzar2 = Lector.leerInt();
        }
    }
}
