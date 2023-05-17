/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clase2.poo;

/**
 *
 * @author Victoria
 */
public class Estacionamiento {
    
    //ESTADO
    private String nombre; 
    private String direccion; 
    private String horaApertura;
    private String horaCierre;
    private int DIMF; //dim. fisica de filas
    private int DIMC; //dim. fisica de columnas
    private Auto [][] matriz;
    
    //CONSTRUCTORES
    
    /*
    b)	Implemente un constructor que reciba nombre y dirección, 
    e inicie el estacionamiento con hora de apertura 
    “8:00”, hora de cierre “21:00”, y para 5 pisos y 10
    plazas por piso. 
    El estacionamiento inicialmente no tiene autos. 
    */
    
    public Estacionamiento(String nombre, String direccion){
        this.iniciar(nombre, direccion, "8:00", "21:00", 5, 10);
    }
    
    
    /*
    c)	Implemente un segundo constructor que reciba nombre, 
    dirección,  hora de apertura, hora de cierre, 
    el número de pisos (N)  y el número de plazas por piso (M) 
    e inicie el  estacionamiento con los datos recibidos, 
    y sin autos. 
    */
    
    public Estacionamiento(String nombre, String direccion, String horaApertura, String horaCierre, int N, int M){
       this.iniciar(nombre, direccion, horaApertura, horaCierre, N, M);
    }
    

    //METODOS
    private void iniciar(String nombre, String direccion, String horaApertura, String horaCierre, int N, int M){
        this.nombre = nombre; 
        this.direccion = direccion;
        this.horaApertura =  horaApertura;
        this.horaCierre = horaCierre;
        this.DIMF = N;
        this.DIMC = M;
        this.matriz = new Auto[this.DIMF][ this.DIMC];
        for(int i=0; i< this.DIMF;i++)
            for(int j=0; j< this.DIMC; j++)
                matriz[i][j]=null;
    
    } 

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getHoraApertura() {
        return horaApertura;
    }

    public void setHoraApertura(String horaApertura) {
        this.horaApertura = horaApertura;
    }

    public String getHoraCierre() {
        return horaCierre;
    }

    public void setHoraCierre(String horaCierre) {
        this.horaCierre = horaCierre;
    }

    public int getDIMF() {
        return DIMF;
    }

    public int getDIMC() {
        return DIMC;
    }
    
    /*	Dado un auto A, un número de piso X y un número de plaza Y, 
   registrar al auto en el estacionamiento en el lugar X,Y. 
   Suponga que X, Y son válidos y que el lugar está desocupado.*/
    
    public void registrar(Auto a, int X, int Y){
      matriz[X-1][Y-1] = a;   //X  1..Cant Pisos
                              //Y  1..Cant Plazas
    }
    
    /*
    Dada una patente, obtener un String que contenga
    el número de piso y plaza donde está dicho auto. 
    En caso de no encontrarse, retornar el mensaje
    “Auto Inexistente”.
     */
    
    public String buscarAutoPorPatente(int p){
        String aux; 
        boolean encontre=false;
        int i=0,j=0;
        while ((i<DIMF) && (!encontre)){
            //Recorro la fila
            j=0;
            while ((j<DIMC)&&(!encontre)){
               //i,j
               if ((matriz[i][j]!= null)&&(matriz[i][j].getPatente() == p)){
                  encontre= true;
               }
               else{
                 j++;
               }
            }
            if (! encontre) i++;        
        }
        if (encontre){
          aux= "Piso " + (i+1) + "Plaza" + (j+1);
        }
        else
          aux = "Auto inexistente";
        return aux;
    }
    
    /*
    Obtener un String con la representación del estacionamiento.
    Ejemplo: “Piso 1 Plaza 1: libre Piso 1 
    Plaza 2: representación del auto … 
    Piso 2 Plaza 1: libre … etc”
    */
    public String toString(){
        
        String aux= "";
         for(int i=0; i< this.DIMF;i++){
            for(int j=0; j< this.DIMC; j++){
               //i,j 
               aux= aux + "Piso " + (i+1)+ " Plaza "+(j+1);
               if (matriz[i][j]==null){
                   aux = aux + ": libre \n";
               }
               else{
                   aux = aux + ":" + matriz[i][j].toString() + "\n";
               }
            }
         }
         return aux;
                
    }
    
}
