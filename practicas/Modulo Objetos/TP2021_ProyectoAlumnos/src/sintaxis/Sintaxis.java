package sintaxis;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class Sintaxis {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar(); //inicializar el generador aleatorio.
        
//        zona de variables
        String nombre = "el pepe";
        char caracter = 'c';
        int entero = 999;
        double real = 999.90;        
        boolean buleano = true;
        
//        un vector de 10 posiciones que va de 0 a 9.
        int [] vector = new int [10];
        
//        matriz
        //generar las dimendiones de las filas y las columnas de la matriz.
        int dimF = 3, dimC = 4;
        //declarar la matriz
        int [][] matriz = new int [dimF][dimC];
        //llenar una matriz
        int i, j;
        for (i = 0; i < dimF; i++) {
            for (j = 0; j < dimC; j++) {
                matriz[i][j] = GeneradorAleatorio.generarInt(10);
            }
        }
        //imprimir la matriz
        System.out.println("imprimir matriz");
        for (i = 0; i < dimF; i++) {
            for (j = 0; j < dimC; j++) {
                System.out.println(matriz[i][j]);
            }
        }

        //hace que el usuario teclee valores desde teclado
        String nombre2 = Lector.leerString();
        int entero2 = Lector.leerInt();
        double real2 = Lector.leerDouble();
        boolean buleano2 = Lector.leerBoolean();
        
        //guarda valores aleatorios en las variables
        String nombre3 = GeneradorAleatorio.generarString(4);
        int entero3 = GeneradorAleatorio.generarInt(10);
        double real3 = GeneradorAleatorio.generarDouble(10);
        //imprime en pantalla valores aleatorios
        System.out.println(GeneradorAleatorio.generarString(4));
        System.out.println(GeneradorAleatorio.generarInt(10));
        System.out.println(GeneradorAleatorio.generarDouble(10));

        System.out.println("hola amigo");

//        comando (if + tab) crea ua estructura if
//        comando (for + tab) crea una estructura for
//        comando (wh + tab) crea una estructura while
//        comando (do + tab) crea una estructura repeat until
//        comando (sout + tab) crea un imprimir

//        +, -, *, /(div), %(mod), +(concatenar)
//        raiz ---> Math.sqrt(#) donde # es lo que va dentro de la raiz.
//        la constante PI es Math.PI

//        ==(igual), !=(distinto), =(asignacion :=)

//        &&(and), ||(or), !(not)

//        i++(suma uno), i--(resta uno)


//        sobre OBJETOS -----------------------------------------------------------------------------------------------------
        String algo1 = new String("hola");
        String algo2 = new String("hola");
        /* en strings ya lo tiene implementado, pero esto es un ejemplo de comparacion de
        objetos */
        
        System.out.println(algo1 == algo2);
        /* esto da falso ya que los dos son punteros y apuntan a direcciones diferentes
        aunque tengan lo mismo en lo apuntado */
        
        algo1.equals(algo2);
        /* esto si da verdadero ya que lo apuntado es lo mismo, o sea, "hola" */
        
        
        /* 
            Se declara la CLASE del objeto, ejemplo un auto, y dentro de esa clase (auto)
            puedo crear varios autos que son OBJETOS de CLASE auto.
            Un objeto se crea a partir de una clase (el objeto es instancia de una clase).
            Para que hablemos de un objeto tiene que cumplir con:
        
            *Tiene ATRIBUTOS
            --> Es el *estado interno* del objeto. Sus caracteristicas, datos y atributos
                que caracterizan al objeto declarado.
                Esto se implementa a traves de variables de instancia. Ej: marca, patente,
                color, kilometraje, modelo.
        
            *Tiene METODOS
            --> Es el conjunto de acciones, servicios a los que sabe responder o
                *comportamientos* propios del objeto declarado.
                Esto se implementa a traves de metodos de instancia que operan sobre
                el estado interno. Ej: encender, acelerar, frenar, doblar
        */
    }
}
