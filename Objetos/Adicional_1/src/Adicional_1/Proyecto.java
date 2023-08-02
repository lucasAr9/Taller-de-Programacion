/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Adicional_1;

/**
 *
 * @author luk
 */
public class Proyecto {

    private String nombreProyecto;
    private int codigo;
    private String nombreDirector;
    private String apellidoDirector;
    private int cantActual;
    private int cantInv;
    private Investigador[] investigadores;

    public Proyecto(String nombreP, int codigo) {
        this.nombreProyecto = nombreP;
        this.codigo = codigo;
        this.cantActual = 0;
        this.cantInv = 50;
        this.investigadores = new Investigador[this.cantInv];
    }

    public void agregarInvestigador(Investigador i) {
        if (this.cantActual < this.cantInv) {
            this.investigadores[this.cantActual] = i;
            this.cantActual++;
        } else {
            System.out.println("No se pueden agregar mas de 50 investigadores.");
        }
    }
    
    public double dineroTotalOtorgado() {
        double cant = 0;
        for (int i = 0; i < this.cantActual; i++) {
            cant += this.investigadores[i].dineroTotalSubs();
        }
        return cant;
    }
    
    public int cantDeSubsidios(String apellido) {
        int i = 0;
        while ((i <= this.cantActual) && (!this.investigadores[i].getApellido().equals(apellido))) {
            i++;
        }
        
        if (this.investigadores[i].getApellido().equals(apellido)) {
            return this.investigadores[i].getCantActual();
        }
        return 0;
    }

    public void otorgarSubsA(String apellido) {
        int i = 0;
        while ((i <= this.cantActual) && (!this.investigadores[i].getApellido().equals(apellido))) {
            i++;
        }
        
        if (this.investigadores[i].getApellido().equals(apellido)) {
            this.investigadores[i].otorgarTodos();
        }
    }
    
    public String getNombreProyecto() {
        return nombreProyecto;
    }

    public void setNombreProyecto(String nombreProyecto) {
        this.nombreProyecto = nombreProyecto;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombreDirector() {
        return nombreDirector;
    }

    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }

    public String getApellidoDirector() {
        return apellidoDirector;
    }

    public void setApellidoDirector(String apellidoDirector) {
        this.apellidoDirector = apellidoDirector;
    }

    public int getCantActual() {
        return cantActual;
    }

    public void setCantActual(int cantActual) {
        this.cantActual = cantActual;
    }

    public int getCantInv() {
        return cantInv;
    }

    public void setCantInv(int cantInv) {
        this.cantInv = cantInv;
    }

    public String todosInvestigadores() {
        String aux = "";
        for (int i = 0; i < this.cantActual; i++) {
            aux = aux + "\n" + this.investigadores[i].toString();
        }
        return aux;
    }

    @Override
    public String toString() {
        return "Proyecto{"
                + "nombreProyecto=" + nombreProyecto
                + ", codigo=" + codigo
                + ", nombreDirector=" + nombreDirector
                + ", apellidoDirector=" + apellidoDirector
                + ", cantInv=" + cantInv
                + ", investigadores: \n" + this.todosInvestigadores() + '}';
    }
}
