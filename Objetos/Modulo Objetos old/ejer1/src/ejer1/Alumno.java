/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejer1;

/**
 *
 * @author Lucas Arrigoni
 */
public class Alumno {
    
    private final int dni;
    private final String nombre;
    private final int cantMaterias;
    private int cantActual;
    private Materia[] vecMaterias;
    private boolean tesis;
    
    public Alumno(int dni, String nombre, int cant) {
        this.dni = dni;
        this.nombre = nombre;
        this.cantMaterias = cant;
        this.cantActual = 0;
        vecMaterias = new Materia[cantMaterias];
        tesis = false;
        
        for (int i = 0; i < cantMaterias; i++) {
            vecMaterias[i] = new Materia();
        }
    }

    public void agregarMateria(Materia m) {
        if (cantActual <= cantMaterias) {
            vecMaterias[cantActual] = m;
        }
        cantActual++;
    }
    
    public void aprobarTesis() {
        tesis = true;
    }

    public int getCantMaterias() {
        return cantMaterias;
    }
    
    public boolean siSeGraduo() {
        boolean aux = false;
        int i = 0;
        if (tesis) {
            while ((i <= cantMaterias) && (vecMaterias[i].getNota() >= 4)) {
                i++;
            }
            if (i >= (cantMaterias - 3)) {
                aux = true;
            }
        }
        return aux;
    }
    
    @Override
    public String toString() {
        String aux = "";
        aux = aux + "Alumno " + "dni: " + dni + ", nombre: " + nombre +
                ", cantidad de Materias: " + cantMaterias + "\n";
        
        for (int i = 0; i < cantMaterias; i++) {
            aux = aux + vecMaterias[i].toString();
        }
        return aux;
    }
    
}
