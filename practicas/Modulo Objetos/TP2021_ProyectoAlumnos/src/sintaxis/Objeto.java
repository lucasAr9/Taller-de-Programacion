/*
    Unos ejemplos de operaciones con objetos.
 */
package sintaxis;

public class Objeto {

    public static void main(String[] args) {
        Auto a1, a2;

        a1 = new Auto();
        a1.setDueño("Majo");
        a1.setPatente(2323);

        a2 = new Auto();
        a2.setDueño("Majo");
        a2.setPatente(2323);

        System.out.println("Referencias iguales? " + (a1 == a2));
        System.out.println("Estado interno igual? " + (a1.equals(a2)));
        System.out.println("");
        System.out.println("Dueño igual? " + (a1.getDueño().equals(a2.getDueño())));
        System.out.println("Patente igual? " + (a1.getPatente() == a2.getPatente()));
        System.out.println("");

        /* aca asignamos referencias, no los valores de dentro del objeto */
        System.out.println("asignamos a1 = a2.");
        a1 = a2;
        /* copiamos la referencia de a2 en a1 (la referencia del objeto a1 queda sin referencia, por ende, se pierde) */
        System.out.println("Referencias iguales? " + (a1 == a2));
        System.out.println("");

        a1.setDueño("Micaela");
        System.out.println("Representacion de a2 " + a2);
        System.out.println("Representacion de a1 " + a1);
    }
}
