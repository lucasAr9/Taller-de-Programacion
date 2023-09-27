/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package resuelto_objetos_4;

/**
 *
 * @author lucas.arrigoni
 */
public class Alumno {
    
    private int dni;
    private String nombre;
    private int n;
    private Materia[] m;
    
    public Alumno(int dni, String nombre, int n) {
        this.dni = dni;
        this.nombre = nombre;
        this.n = n;
        m = new Materia[this.n];
    }
    
    public void registrarMateria(int codigo, int nota, int fecha) {
        Materia mate = new Materia(nota, fecha);
        m[codigo] = mate;
    }
    
    public boolean alumnoGraduado() {
        double sumar = 0;
        for (int i = 0; i < this.n; i++) {
            if (m[i].getNota() < 5) {
                return false;
            } else {
                sumar += m[i].getNota();
            }
        }
        return (sumar / this.n) >= 4;
    }

    @Override
    public String toString() {
        String aux = "DNI: " + this.dni + " nombre: " + this.nombre + "(";
        for (int i = 0; i < this.n; i++) {
            aux = aux + "Materia: " + i + m[i].toString() + "; ";
        }
        aux = aux + ")";
        return aux;
    }
}
