/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5_3;

public class Trabajador extends Persona {
    
    private String rubro;
    
    /* constructor del Trabajador que instancia a la Persona */
    public Trabajador(String nombre, int DNI, int edad, String rubro) {
        super(nombre, DNI, edad);
        this.rubro = rubro;
    }

    public String getRubro() {
        return rubro;
    }

    public void setRubro(String rubro) {
        this.rubro = rubro;
    }

    @Override
    public String toString() {
        return "Trabajador{" + super.toString() + "rubro=" + rubro + '}';
    }
}
