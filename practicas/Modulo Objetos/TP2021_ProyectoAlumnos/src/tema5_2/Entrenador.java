/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5_2;

public class Entrenador extends Empleado {

    private int cantCampGanados;
    
    public Entrenador(String nom, double sueldo, int cantCampGanados) {
        super(nom, sueldo);
        this.cantCampGanados = cantCampGanados;
    }

    public int getCantCampGanados() {
        return cantCampGanados;
    }

    public void setCantCampGanados(int cantCampGanados) {
        this.cantCampGanados = cantCampGanados;
    }

    @Override
    public String toString() {
        return "Entrenador{" + super.toString() + "cantCampGanados=" + cantCampGanados + '}';
    }
    
    @Override
    public double calcularSueldoACobrar() {
        if (this.cantCampGanados < 1)
            return getSueldo();
        else
            if (this.cantCampGanados < 5)
                return (getSueldo() + 5000);
        else
            if (this.cantCampGanados < 11)
                return (getSueldo() + 30000);
        else
            return (getSueldo() + 50000);
  }
}
