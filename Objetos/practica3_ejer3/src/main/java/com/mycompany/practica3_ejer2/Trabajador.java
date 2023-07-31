/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.practica3_ejer2;

/**
 *
 * @author luk
 */
public class Trabajador extends Persona {
    private String tarea;
    
    public Trabajador(String nombre, int dni, int edad, String tarea) {
        super(nombre, dni, edad);
        this.tarea = tarea;
    }

    public String getTarea() {
        return tarea;
    }

    public void setTarea(String tarea) {
        this.tarea = tarea;
    }

    @Override
    public String toString() {
        return "Trabajador{" + super.toString() + "tarea=" + tarea + '}';
    }    
}
