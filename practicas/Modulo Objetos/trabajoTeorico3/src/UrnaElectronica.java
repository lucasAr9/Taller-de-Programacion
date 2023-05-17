/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

public abstract class UrnaElectronica { // superclase, abstracta
    private int numero;
    private int votosB; // votos en blanco
    
    
    public UrnaElectronica(int unNumero){
        setNumero(unNumero);
        setVoto(0); // ó votosB = 0; --> iniciar la urna sin votos
    }
    
    public int getNumero(){
        return numero;
    }
    
    public int getVotosBlanco(){
        return votosB;
    }
    
    public void setNumero(int unNumero){
        numero = unNumero;
    }
    
    private void setVoto(int unVoto){ 
        // "privado" para que no se pueda modificar los votos en blanco desde el exterior
        // dejarlo como "public" sería inadecuado para este ejercicio
        votosB = unVoto;
    }
    
    public void votarEnBlanco(){
         votosB++; // ó votosB = votosB + 1;
    } 
    
    // métodos abstractos 
    public abstract int calcularGanador();
    public abstract int calcularTotalVotos();
}
