/*
3- A- Definir una clase para representar entrenadores de un club de fútbol. Un entrenador
se caracteriza por su nombre, sueldo básico y la cantidad de campeonatos ganados.
▪ Defina métodos para obtener/modificar el valor de cada atributo.
▪ Defina el método calcularSueldoACobrar que calcula y devuelve el sueldo a cobrar por
el entrenador. El sueldo se compone del sueldo básico, al cual se le adiciona un plus por
campeonatos ganados (5000$ si ha ganado entre 1 y 4 campeonatos; $30.000 si ha
ganado entre 5 y 10 campeonatos; 50.000$ si ha ganado más de 10 campeonatos).

 */
package tema3;
/* Punto3Clase seria la clase Entrenador */
public class Punto3Clase {

    private String nombre;
    private double sueldoBasico;
    private int cantPartGanados;

    /* constructor */
    public Punto3Clase(String nombre, double sueldoBasico, int cantPartGanados) {
        this.nombre = nombre;
        this.sueldoBasico = sueldoBasico;
        this.cantPartGanados = cantPartGanados;
    }
    
    /* calcular cuanto es en sueldo que cobra despues de calcular la cant de partidos ganados */
    public String calcularSueldoACobrar() {
        String aux = "";
        
        if (cantPartGanados <= 4) {
            aux = "el sueldo a cobrar es: " + (sueldoBasico + 5000);
        }
        if ((cantPartGanados >= 5) && (cantPartGanados < 10)) {
            aux = "el sueldo a cobrar es: " + (sueldoBasico + 30000);
        }
        if (cantPartGanados >= 10) {
            aux = "el sueldo a cobrar es: " + (sueldoBasico + 50000);
        }
        return aux;
    }
    
    /* get */
    public String getNombre() {
        return nombre;
    }

    public double getSueldo() {
        return sueldoBasico;
    }

    public int getCantPartGanados() {
        return cantPartGanados;
    }

    /* set */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setSueldo(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }

    public void setCantPartGanados(int cantPartGanados) {
        this.cantPartGanados = cantPartGanados;
    }
    
}
