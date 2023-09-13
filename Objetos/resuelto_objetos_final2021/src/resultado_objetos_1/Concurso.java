/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package resultado_objetos_1;

/**
 *
 * @author lucas.arrigoni
 */
public class Concurso {
    
    private int actual;
    private int n;
    private Pareja[] parejas;
    
    public Concurso(int n) {
        this.actual = 0;
        this.n = n;
        parejas = new Pareja[this.n];
    }
    
    public void agregarPareja(Pareja p) {
        if (this.actual < this.n) {
            this.parejas[this.actual] = p;
            actual++;
        } else {
            System.out.println("No se puede ingresar mas parejas al concurso.");
        }
    }
    
    public int diferenciaEdad(int parejaN) {
        return parejas[parejaN].diferenciaEdad();
    }
    
    public int parejaMasDiferenciaEdad() {
        int max = 0;
        int maxPareja = 0;
        for (int i = 0; i < this.actual; i++) {
            if (max < this.parejas[i].diferenciaEdad()) {
                max = this.parejas[i].diferenciaEdad();
                maxPareja = i;
            }
        }
        return maxPareja;
    }

    @Override
    public String toString() {
        String aux = "";
        for (int i = 0; i < this.actual; i++) {
            aux = aux + parejas[i].toString() + "\n";
        }
        return aux;
    }
}
