/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5_2;

public class Jugador extends Empleado {

    private int partJugados;
    private int golesAnotados;

    public Jugador(String nom, double sueldo, int partJugados, int golesAnotados) {
        super(nom, sueldo);
        this.partJugados = partJugados;
        this.golesAnotados = golesAnotados;
    }

    public int getPartJugados() {
        return partJugados;
    }

    public void setPartJugados(int partJugados) {
        this.partJugados = partJugados;
    }

    public int getGolesAnotados() {
        return golesAnotados;
    }

    public void setGolesAnotados(int golesAnotados) {
        this.golesAnotados = golesAnotados;
    }

    @Override
    public String toString() {
        return "Jugador{" + super.toString() + "partJugados=" + partJugados
                + ", golesAnotados=" + golesAnotados + '}';
    }

    @Override
    public double calcularSueldoACobrar() {
        double promedio = partJugados / golesAnotados;
        double aux = super.getSueldo();
        
        if (promedio > 0.5) {
            aux = aux + super.getSueldo();
        }
        return aux;
    }
}
