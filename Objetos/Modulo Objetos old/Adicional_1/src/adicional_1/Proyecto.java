/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicional_1;

/**
 * aca en github quiero lo que hice en la class main
 * @author Lucas Arrigoni
 */
public class Proyecto {
    
    private String nombre;
    private int codigo;
    private String director;
    private final Investigador[] inv;
    private int invActuales;
    
    public Proyecto(String nombre, int codigo) {
        this.nombre = nombre;
        this.codigo = codigo;
        inv = new Investigador[50];
        invActuales = 0;
    }
    
    public void agregarInvestigador(Investigador inv) {
        this.inv[invActuales] = inv;
        invActuales++;
    }
    
    public void agregarSubInvestigador(String nombre, Subsidio s) {
        int i = 0;
        
        while (!inv[i].getNomYape().equals(nombre)) {
            i++;
        }
        
        if (inv[i].getNomYape().equals(nombre)) {
            inv[i].agregarSubsidio(s);
        }
    }
    
    public double dineroTotalOtorgado() {
        double total = 0;
        
        for (int i = 0; i < invActuales; i++) {
            total = total + inv[i].totalDelSub();
        }
        return total;
    }
    
    public int cantDeSubsidios(String nombre) {
        int i = 0;
        int cant = 0;
        while (!inv[i].getNomYape().equals(nombre)) {
            i++;
        }
        
        if (inv[i].getNomYape().equals(nombre)) {
            cant = cant + inv[i].getSubActual();
        }
        return cant;
    }
    
    public void otorgarTodosSubs(String nombre) {
        int i = 0;
        while (!inv[i].getNomYape().equals(nombre)) {
            i++;
        }
        
        if (inv[i].getNomYape().equals(nombre)) {
            inv[i].otorgarTodos();
        }
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public int getInvActuales() {
        return invActuales;
    }

    public void setInvActuales(int invActuales) {
        this.invActuales = invActuales;
    }
    
    @Override
    public String toString() {
        String aux = "";
        
        aux = aux + "Nombre Proyecto" + nombre + " caodigo: " + codigo + " derector "
                + director + " total dinero otorgado " + dineroTotalOtorgado() + "\n";
        
        for (int i = 0; i < invActuales; i++) {
            aux = aux + inv[i].toString();
        }
        return aux;
    }
}
