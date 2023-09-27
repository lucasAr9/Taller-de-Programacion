/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package resuelto_objetos_4;

/**
 *
 * @author lucas.arrigoni
 */
public class Materia {
    
    private double nota;
    private int fechaAprobacion;
    
    public Materia(double nota, int fecha) {
        this.nota = nota;
        this.fechaAprobacion = fecha;
    }

    public double getNota() {
        return nota;
    }

    public void setNota(double nota) {
        this.nota = nota;
    }

    public int getFechaAprobacion() {
        return fechaAprobacion;
    }

    public void setFechaAprobacion(int fechaAprobacion) {
        this.fechaAprobacion = fechaAprobacion;
    }

    @Override
    public String toString() {
        return " nota: " + nota + ", fecha aprobacion: " + fechaAprobacion;
    }
}
