/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package resuelto_objetos_4;

/**
 *
 * @author lucas.arrigoni
 */
public class Grado extends Alumno {
    
    private String carrera;
    
    public Grado(int dni, String nombre, int n, String carrera) {
        super(dni, nombre, n);
        this.carrera = carrera;
    }

    @Override
    public String toString() {
        return "Alumno de grado{" + super.toString() +
                " carrera= " + carrera + '}';
    }
}
