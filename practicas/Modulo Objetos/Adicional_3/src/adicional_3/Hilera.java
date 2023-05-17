/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicional_3;

/**
 *
 * @author Lucas Arrigoni
 */
public class Hilera extends Coro {
    
    private Alumno[][] hilera;
    private int fil;
    private int col;
    private int filActual;
    private int colActual;
    
    public Hilera(String nom, Director dir, int fil, int col) {
        super(nom, dir, fil * col);
        this.fil = fil;
        this.col = col;
        hilera = new Alumno [fil][col];
        filActual = 0;
        colActual = 0;
    }
    
    @Override
    public void agregarCorista(Alumno a) {
        hilera[filActual][colActual] = a;

        colActual++;
        if (colActual == col) {
            colActual = 0;
            filActual++;
        }
    }
    
    @Override
    public String toString() {
        String aux = "";
        aux = super.toString() + "\n";
        
        for (int i = 0; i < fil; i++) {
            
            for (int j = 0; j < col; j++) {
                aux = aux + hilera[i][j].toString() + " ";
            }
            aux = aux + "\n";
        }
        return aux;
    }
}
