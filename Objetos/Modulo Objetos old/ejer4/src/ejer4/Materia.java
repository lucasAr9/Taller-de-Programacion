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
public class Materia {
    
    private int codigo;
    private int nota;
    private boolean aprobado;
    private int mes;
    private int anio;

    public Materia(int codigo) {
        this.codigo = codigo;
        aprobado = false;
    }

    /* getters */
    public int getCodigo() {
        return codigo;
    }

    public int getNota() {
        return nota;
    }

    public boolean isAprobado() {
        return aprobado;
    }

    public String getFechaAprobacion() {
        return mes + "/" + anio;
    }

    /* setters */
    public void setNota(int nota) {
        this.nota = nota;
        if (this.nota > 4) {
            aprobado = true;
        }
    }

    public void setFechaAprobacion(int mes, int anio) {
        this.mes = mes;
        this.anio = anio;
    }

    @Override
    public String toString() {
        return "codigo: " + codigo + ", nota: " + nota + ", aprobado: "
                + aprobado + ", fecha de aprobacion: " + getFechaAprobacion() + '}';
    }
}
