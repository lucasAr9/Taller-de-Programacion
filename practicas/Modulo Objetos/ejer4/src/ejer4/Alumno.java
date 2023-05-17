/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejer4;

/**
 *
 * @author Lucas Arrigoni
 */
public abstract class Alumno {
    
    private String nombre;
    private int dni;
    private Materia[] m;
    private int cantMaterias;
    
    public Alumno(String nombre, int dni, int cantMaterias) {
        this.nombre = nombre;
        this.dni = dni;
        this.cantMaterias = cantMaterias;
        m = new Materia[this.cantMaterias];
        for (int i = 0; i < this.cantMaterias; i++) {
            m[i] = new Materia(i);
        }
    }
    
    public void cargarMateria(int codigo, int nota, int mes, int anio) {
        m[codigo].setNota(nota);
        m[codigo].setFechaAprobacion(mes, anio);
    }
    
    public double calcPromedio() {
        double sumar = 0;
                
        for (int i = 0; i < cantMaterias; i++) {
            sumar = sumar + m[i].getNota();
        }
        double promedio = sumar / cantMaterias;
        return promedio;
    }
    
    public int cantAprobadas() {
        int cantAprobadas = 0;
        
        for (int i = 0; i < cantMaterias; i++) {
            if (m[i].getNota() >= 4) {
                cantAprobadas++;
            }
        }
        return cantAprobadas;
    }

    public int getCantMaterias() {
        return cantMaterias;
    }

    @Override
    public String toString() {
        String aux = "";
        
        aux = aux + "Alumno{" + "nombre: " + nombre + ", dni: " + dni
                + " con las materias --------------------------------------------------- \n";
        
        for (int i = 0; i < cantMaterias; i++) {
            aux = aux + m[i].toString() + "\n";
        }
        return aux;
    }
}
