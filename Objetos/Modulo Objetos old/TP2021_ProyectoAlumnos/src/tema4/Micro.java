/*
4- A- Definir una clase para representar micros. Un micro conoce su patente, destino, hora salida, el estado de sus 20 asientos
(es decir si está o no ocupado) y la cantidad de asientos ocupados al momento. Lea detenidamente a) y b) y luego implemente.

a) Implemente un constructor que permita iniciar el micro con una patente, un destino y una hora de salida (recibidas por parámetro) y sin pasajeros.

b) Implemente métodos para:
i. devolver/modificar patente, destino y hora de salida
ii. devolver la cantidad de asientos ocupados
iii. devolver si el micro está lleno
iv. validar un número de asiento recibido como parámetro (es decir, devolver si está en rango o no)
v. devolver el estado de un nro. de asiento válido recibido como parámetro
vi. ocupar un nro. de asiento válido recibido como parámetro
vii. liberar un nro. de asiento válido recibido como parámetro
viii. devolver el nro. del primer asiento libre
 */
package tema4;

/* Punto4Clase seria el micro */
public class Micro {

    private String patente;
    private String destino;
    private String horaSalida;
    private int cantOcupados;
    private int nAsiento = 20;
    private boolean[] vecMicro;

    /* constructor */
    public Micro(String patente, String destino, String horaSalida) {
        this.patente = patente;
        this.destino = destino;
        this.horaSalida = horaSalida;
        this.cantOcupados = 0;
        this.vecMicro = new boolean[this.nAsiento];

        for (int i = 0; i < this.nAsiento; i++) {
            this.vecMicro[i] = false;
        }
    }

    /* get */
    public String getPatente() {
        return patente;
    }

    public String getDestino() {
        return destino;
    }

    public String getHoraSalida() {
        return horaSalida;
    }

    public int getCantOcupados() {
        return cantOcupados;
    }

    public int getNAsiento() {
        return nAsiento;
    }

    /* set */
    public void setPatente(String patente) {
        this.patente = patente;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public void setHoraSalida(String horaSalida) {
        this.horaSalida = horaSalida;
    }

    /* devolver la cantidad de asientos ocupados */
    public String cantAsientosOcu() {
        return "la cantidad de asientos ocupados es: " + cantOcupados;
    }

    /* devolver si el micro está lleno */
    public String siEstaLleno() {
        String aux = "";

        if (cantOcupados == nAsiento) {
            aux = aux + "el micro esta lleno";
        } else {
            aux = aux + "el micro NO esta lleno";
        }
        return aux;
    }

    /* validar un número de asiento recibido como parámetro (es decir, devolver si está en rango o no) */
    public boolean asientoOcupado(int numAsi) {
        boolean aux = false;
        if (numAsi - 1 < nAsiento) {
            aux = true;
        }
        return aux;
    }

    /* devolver el estado de un nro. de asiento válido recibido como parámetro */
    public boolean puedeSentarse(int numAsi) {
        boolean aux = false;
        if (vecMicro[numAsi] == false) {
            aux = true;
        }
        return aux;
    }

    /* ocupar un nro. de asiento válido recibido como parámetro */
    public void setVecMicroOcupar(int numAsi) {
        vecMicro[numAsi - 1] = true;
        cantOcupados++;
    }

    /* liberar un nro. de asiento válido recibido como parámetro */
    public void setVecMicroLiberar(int numAsi) {
        vecMicro[numAsi - 1] = false;
        cantOcupados--;
    }

    /* devolver el nro. del primer asiento libre */
    public String primerAsientoLibre() {
        int i = 0;

        while ((i < nAsiento) && (vecMicro[i] == true)) {
            i++;
        }
        return "el primer asiento desocupado es " + (i + 1);
    }

    @Override
    public String toString() {
        return "Micro{" + "patente=" + patente + ", destino=" + destino + ", horaSalida=" + horaSalida
                + ", cantOcupados=" + cantOcupados + ", nAsiento=" + nAsiento + '}';
    }

}
