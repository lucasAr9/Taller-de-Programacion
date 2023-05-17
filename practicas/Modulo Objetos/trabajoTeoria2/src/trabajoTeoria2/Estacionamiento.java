/* 
Utilizando la clase Auto dada por la cátedra.

1- Provea un constructor para iniciar los autos a partir de nombre de dueño y patente.

2- Definir una clase para representar Estacionamientos. Un estacionamiento conoce su nombre, dirección, hora de apertura
y hora de cierre, y almacena para cada número de piso (1..N) y número de plaza (1..M), el auto que ocupa dicho lugar.

a) Provea getters/setters adecuados.

b) Implemente un constructor que reciba nombre y dirección, e inicie el estacionamiento con hora de apertura “8:00”, hora de cierre “21:00”,
y para 5 pisos y 10 plazas por piso. El estacionamiento inicialmente no tiene autos.

c) Implemente un segundo constructor que reciba nombre, dirección, hora de apertura, hora de cierre, el número de pisos (N) y
el número de plazas por piso (M) e inicie el estacionamiento con los datos recibidos, y sin autos.

d) Implemente métodos para:

- Dado un auto A, un número de piso X y un número de plaza Y, registrar al auto en el estacionamiento en el lugar X,Y.
Suponga que X, Y son válidos y que el lugar está desocupado.

- Dada una patente, obtener un String que contenga el número de piso y plaza donde está dicho auto.
En caso de no encontrarse, retornar el mensaje “Auto Inexistente”.

- Obtener un String con la representación del estacionamiento.
Ejemplo: “Piso 1 Plaza 1: libre Piso 1 Plaza 2: representación del auto … Piso 2 Plaza 1: libre … etc”

 */
package trabajoTeoria2;

public class Estacionamiento {

    private String nombre;
    private String direccion;
    private String hApertura;
    private String hCierre;
    private int nPiso;
    private int nPlaza;
    private Auto[][] lugar;
    
    /* crear el estacionamiento */
    public Estacionamiento(String nombre, String direccion, String hApertura, String hCierre, int nPiso, int nPlaza) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.hApertura = hApertura;
        this.hCierre = hCierre;
        this.nPiso = nPiso;
        this.nPlaza = nPlaza;
        
        this.lugar = new Auto[this.nPiso][this.nPlaza];
        for (int i = 0; i < this.nPiso; i++) {
            for (int j = 0; j < this.nPlaza; j++) {
                this.lugar[i][j] = null;
            }
        }

    }

    /* get */
    public String getNombre() {
        return nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public String gethApertura() {
        return hApertura;
    }

    public String gethCierre() {
        return hCierre;
    }

    public int getnPiso() {
        return nPiso;
    }

    public int getnPlaza() {
        return nPlaza;
    }

    /* set */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void sethApertura(String hApertura) {
        this.hApertura = hApertura;
    }

    public void sethCierre(String hCierre) {
        this.hCierre = hCierre;
    }

    public void setnPiso(int nPiso) {
        this.nPiso = nPiso;
    }

    public void setnPlaza(int nPlaza) {
        this.nPlaza = nPlaza;
    }
    
    /* cargar los autos en el estacinamientos */
    public void CargarAuto(Auto au, int piso, int plaza) {
        this.lugar[piso - 1][plaza - 1] = au;
    }
    
    /* verificar si la patente ingresada esta en el estacionamiento */
    public String getEstaAuto(int patente) {
        int piso = 0, plaza = 0;
        boolean esta = false;
        String aux = "";
        
        while ((piso < this.nPiso) && (!esta)) {
            plaza = 0;
            while ((!esta) && (piso < this.nPiso)) {
                if ((this.lugar[piso][plaza] != null) && (this.lugar[piso][plaza].getPatente() == patente)) {
                    esta = true;
                } else {
                    plaza++;
                }
            }
            if (!esta) {
                piso++;
            }
        }
        if (esta) {
            aux = "la patente esta en el piso: " + piso + " plaza: " + plaza;
        } else {
            aux = "el auto no existe.";
        }
        return aux;
    }

    @Override
    public String toString() {
        String aux = "";
        
        for (int i = 0; i < this.nPiso; i++) {
            for (int j = 0; j < this.nPlaza; j++) {
                if (this.lugar[i][j] == null) {
                    aux = aux + "piso: " + i + " plaza: " + j + " esta libre." + "\n";
                } else {
                    aux = aux + "piso: " + i + " plaza: " + j + " esta: " + this.lugar[i][j].toString() + "\n";
                }
            }
        }
        return aux;
    }

}
