/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

public class Electoral extends UrnaElectronica {  //subclase que hereda de UrnaElectronica
    private int cantidadL;    /** cantidad de listas **/
    private int[] contadorV;    /** contador de votos para cada lista **/          
    
    // constructor
    public Electoral(int U,int L){
        super(U); // 1era línea: invocamos al constructor de la superclase
        this.cantidadL = L;
        
        this.contadorV = new int[L];
        for (int i=0; i< cantidadL; i++)
            this.contadorV [i] =0;   
    }
    
    public int getCantidad(){
        return cantidadL;
    }
    
    public boolean validarNumeroDeLista(int n) {
        return (n >= 0) && (n < this.cantidadL);
    }
    
    public void votarPorLista(int numLista) {
        this.contadorV[numLista]++;
    } 
    
    
    public int devolverVotosPorLista(int numeroLista) {
        return this.contadorV[numeroLista];
    }
    
    @Override
    public  int calcularGanador(){
        int max=-1; int listaMax=0;
        for(int i=0; i < cantidadL; i++){
            if (contadorV[i] > max){
                max= contadorV[i];
                listaMax= i;
           }
        }
        return listaMax;
    }
    
    @Override
    public int calcularTotalVotos() {
        int votosTotales = 0; // ó iniciarlo con getVotosBlanco() y lo sacamos del return
        for (int i = 0; i < this.cantidadL; i++) {
            votosTotales += this.contadorV[i];
        }
        return votosTotales + super.getVotosBlanco();
    }
}
