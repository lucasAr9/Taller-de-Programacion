/*
    Escriba un programa que imprima en consola el factorial de todos los números
    entre 1 y 9. ¿Qué modificación debe hacer para imprimir el factorial de los
    números impares solamente?
 */
package tema1;

public class Punto2 {

    public static void main(String[] args) {

        int i, num = 9;

        while (num >= 0) {
            int res = 1;
            for (i = num; i > 1; i--) {
                res = res * i;
            }
            System.out.println("el resultado de " + num + "! es: " + res);
            num = num - 2;
        }
    }
}
