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
public class Estanteria {
    
    private int fil = 0;
    private int col = 0;
    private final int cantEst;
    private final int cantLib;
    private Libro[][] estanteria;
    
    public Estanteria(int cantEst, int cantLib) {
        this.cantEst = cantEst;
        this.cantLib = cantLib;
        estanteria = new Libro[cantEst][cantLib];
        for (int i = 0; i < this.cantEst; i++) {
            for (int j = 0; j < this.cantLib; j++) {
                estanteria[i][j] = null;
            }
        }
    }

    public String agregarLibro(Libro l) {
        String aux = "";
        fil = 0;
        col = 0;
        
        while ((fil < cantEst -1) & (estanteria[fil][col] != null)) {
            if (col < cantLib -1) {
                col++;
            } else {
                col = 0;
                fil++;
            }
        }
        if ((fil < cantEst -1) & (estanteria[fil][col] == null)) {
            estanteria[fil][col] = l;
            aux = aux + "agregado con exito.";
        } else {
            aux = aux + "no hay mas lugar --------------------------------------";
        }
        return aux;
    }
    
    public String agregarPorPos(Libro l, int est, int pos) {
        String aux = "";
        if (estanteria[est][pos] == null) {
            estanteria[est][pos] = l;
            aux = aux + "agregado con exito.";
        } else {
            aux = aux + "no hay mas lugar --------------------------------------";
        }
        return aux;
    }
    
    public String sacarLibro(String titulo) {
        fil = 0;
        col = 0;
        /* solo saca la primer ocurrencia del libro */
        while ((fil < cantEst -1) & !(estanteria[fil][col].getTitulo().equals(titulo))) {
            if (col < cantLib -1) {
                col++;
            } else {
                col = 0;
                fil++;
            }
        }
        String aux = "";
        if ((fil < cantEst -1) & (estanteria[fil][col].getTitulo().equals(titulo))) {
            aux = aux + estanteria[fil][col].toString();
            estanteria[fil][col] = null;
        } else {
            aux = aux + "no se encontro el libro.";
        }
        return aux;
    }
    
    public String libroMasPaginas() {
        int max = 0;
        Libro maxLib = null;
        for (int i = 0; i < cantEst; i++) {
            for (int j = 0; j < cantLib; j++) {
                if (estanteria[i][j] != null) {
                    if (estanteria[i][j].getPeso() > max) {
                        max = estanteria[i][j].getCantPag();
                        maxLib = estanteria[i][j];
                    }
                }
            }
        }
        return maxLib.toString();
    }
    
    public String estanteMasPesado() {
        double maxEst = 0;
        for (int i = 0; i < cantEst; i++) {
            
            double maxActual = 0;
            for (int j = 0; j < cantLib; j++) {
                if (estanteria[i][j] != null) {
                    maxActual = maxActual + estanteria[i][j].getPeso();
                }
            }
            
            if (maxActual > maxEst) {
                maxEst = maxActual;
            }
        }
        return "el estante mas pesado es: " + maxEst;
    }
    
    public int getCantEst() {
        return cantEst;
    }

    public int getCantLib() {
        return cantLib;
    }

    public String toString() {
        String aux = "";
        for (int i = 0; i < cantEst; i++) {
            for (int j = 0; j < cantLib; j++) {
                if (estanteria[i][j] != null) {
                    aux = aux + "fil: " + i + " col: " + j + " "
                            + estanteria[i][j].toString() + "\n";
                }
            }
        }
        return aux;
    }
}
