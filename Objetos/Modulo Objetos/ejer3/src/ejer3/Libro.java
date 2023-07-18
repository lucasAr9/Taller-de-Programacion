/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejer3;

/**
 *
 * @author Lucas Arrigoni
 */
public class Libro {
    
    private String titulo;
    private int cantPag;
    private double peso;
    private Autor a;

    public Libro(String titulo, int cantPag, double peso, Autor a) {
        this.titulo = titulo;
        this.cantPag = cantPag;
        this.peso = peso;
        this.a = a;
    }

    public String getTitulo() {
        return titulo;
    }

    public int getCantPag() {
        return cantPag;
    }

    public double getPeso() {
        return peso;
    }

    public Autor getA() {
        return a;
    }

    @Override
    public String toString() {
        return "Libro{" + "titulo: " + titulo + ", cantPag: "
                + cantPag + ", peso: " + peso + " " + a.toString() + '}';
    }
}
