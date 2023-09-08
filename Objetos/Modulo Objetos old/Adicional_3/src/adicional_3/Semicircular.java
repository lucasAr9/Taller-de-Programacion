/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicional_3;

/**
 *
 * @author Lucas Arrigoni
 */
public class Semicircular extends Coro {
    
    private Alumno[] semi;
    private int coristaActual;
    
    public Semicircular(String nom, Director dir, int cant) {
        super(nom, dir, cant);
        semi = new Alumno[cant];
        this.coristaActual = 0;
    }

    @Override
    public void agregarCorista(Alumno a) {
        semi[coristaActual] = a;
        coristaActual++;
    }

    @Override
    public String toString() {
        String aux = "";
        aux = super.toString() + "\n";
        
        for (int i = 0; i < coristaActual; i++) {
            aux = aux + semi[i].toString() + " ";
        }
        return aux;
    }
}
