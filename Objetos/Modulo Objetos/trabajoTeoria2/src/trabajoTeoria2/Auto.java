/* 
un objeto auto
 */
package trabajoTeoria2;

public class Auto {

    private int patente;
    private String dueño;

    public Auto(int patente, String dueño) {
        this.patente = patente;
        this.dueño = dueño;
    }

    /* get */
    public int getPatente() {
        return patente;
    }

    public String getDueño() {
        return dueño;
    }

    /* set */
    public void setPatente(int patente) {
        this.patente = patente;
    }

    public void setDueño(String dueño) {
        this.dueño = dueño;
    }

    @Override
    public String toString() {
        return "Patente: " + patente + " Dueño: " + dueño;
    }

}
