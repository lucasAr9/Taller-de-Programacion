/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicional_1;

/**
 *
 * @author Lucas Arrigoni
 */
public class Investigador {
    
    private String nomYape;
    private final int categoria;
    private final String especialidad;
    private final Subsidio[] sub;
    private int subActual;
    
    public Investigador(String nomYape, int categoria, String especialidad) {
        this.nomYape = nomYape;
        this.categoria = categoria;
        this.especialidad = especialidad;
        sub = new Subsidio[5];
    }
    
    public void agregarSubsidio(Subsidio sub) {
        this.sub[subActual] = sub;
        subActual++;
    }
    
    public double totalDelSub() {
        double total = 0;
        
        for (int i = 0; i < subActual; i++) {
            total = total + sub[i].getMonto();
        }
        return total;
    }
    
    public void otorgarTodos() {
        for (int i = 0; i < subActual; i++) {
            sub[i].setOtorgado(true);
        }
    }
    
    public double calcularTotalOtorgados() {
        double total = 0;
        for (int i = 0; i < subActual; i++) {
            if (sub[i].isOtorgado()) {
                total = total + sub[i].getMonto();
            }
        }
        return total;
    }

    public String getNomYape() {
        return nomYape;
    }

    public void setNomYape(String nomYape) {
        this.nomYape = nomYape;
    }

    public int getSubActual() {
        return subActual;
    }

    public void setSubActual(int subActual) {
        this.subActual = subActual;
    }
    
    @Override
    public String toString() {
        return "Nombre: " + nomYape + " categoria: " + categoria + " total de sus subsidios: "
                + calcularTotalOtorgados();
    }
}
