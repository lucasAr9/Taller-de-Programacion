/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

public class Referendum extends UrnaElectronica {  //subclase que hereda de UrnaElectronica

    private int votosF; // votos a favor
    private int votosC; // votos en contra

    /* inciso a */
    public Referendum(int U) {
        super(U); // 1era línea: invocamos al constructor de la superclase
        this.votosF = 0;
        this.votosC = 0;
    }

    public int getAfavor() {
        return votosF;
    }

    public int getEnContra() {
        return votosC;
    }

//    no son adecuados para este ejercicio
//    public void setAfavor(int unVotoF) {
//        votosF = unVotoF;
//    }
//
//    public void setEnContra(int unVotoC) {
//        votosC = unVotoC;
//    }
    public void incrementarVotosAfavor() {
        this.votosF++;
    }

    public void incrementarVotosEnContra() {
        this.votosC++;
    }

    @Override
    public int calcularGanador() {
        if (this.votosF > this.votosC) {
            return 1;
        } else {
            if (this.votosC > this.votosF) {
                return 0;
            }
        }
        return -1;
//   La otra opción:
//       int resultado; 
//       if (votosF == votosC){
//          resultado=-1; //Empate
//       }
//       else if (votosC > votosF){
//          resultado=0;  //Gano en contra
//       }
//       else resultado= 1; //Gano a favor
//       return resultado;
    }

    
    @Override
    public int calcularTotalVotos() {
        return super.getVotosBlanco() + this.getAfavor() + this.getEnContra();
        // ó también:  return this.votosF+this.votosC+this.getVotosBlanco();
    }

}
