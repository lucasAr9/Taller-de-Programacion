/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package resuelto_objetos_4;

/**
 *
 * @author lucas.arrigoni
 */
public class Doctorado extends Alumno {
    
    private String tituloUniversitario;
    private String universidadOrigen;
    
    public Doctorado(int dni, String nombre, int n, String titulo, String universidad) {
        super(dni, nombre, n);
        this.tituloUniversitario = titulo;
        this.universidadOrigen = universidad;
    }

    @Override
    public String toString() {
        return "Alumno de doctorado{" + super.toString() +
                " titulo universitario= " + tituloUniversitario +
                ", universidad origen= " + universidadOrigen + '}';
    }
}
