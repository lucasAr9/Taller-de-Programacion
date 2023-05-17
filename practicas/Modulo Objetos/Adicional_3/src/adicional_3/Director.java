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
public class Director extends Persona {
    
    private int antiguedad;
    
    public Director(String nom, int dni, int edad, int antiguedad) {
        super(nom, dni, edad);
        this.antiguedad = antiguedad;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    @Override
    public String toString() {
        return "Director{" + super.toString() + ", antiguedad: " + antiguedad + "}";
    }
}
