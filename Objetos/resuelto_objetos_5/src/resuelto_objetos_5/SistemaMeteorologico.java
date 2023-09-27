/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package resuelto_objetos_5;

/**
 *
 * @author lucas.arrigoni
 */
public class SistemaMeteorologico {

    private Estacion estacion;
    private int ultimosN;
    private double[][] temperaturas;

    public SistemaMeteorologico(Estacion e, int ultimosAnios) {
        this.estacion = e;
        this.ultimosN = ultimosAnios;
        this.temperaturas = new double[12][this.ultimosN];
    }

    public void registrar(int mes, int anio, double temp) {
        this.temperaturas[mes][anio] = temp;
    }

    public double devolverTemp(int mes, int anio) {
        return this.temperaturas[mes][anio];
    }

    public String mayorTemperatura() {
        double maxTemp = 0;
        int mes = 0;
        int anio = 0;
        for (int i = 0; i < 12; i++) {
            for (int j = 0; j < this.ultimosN; j++) {
                if (this.temperaturas[i][j] > maxTemp) {
                    maxTemp = this.temperaturas[i][j];
                    mes = i;
                    anio = j;
                }
            }
        }
        return "La mayor temperatura es de: " + maxTemp
                + " en le mes: " + mes
                + " del año: " + (anio + 1);
    }
    
    public String toString(String reporte) {
        String aux = "";
        double suma = 0;
        aux = aux + estacion.toString();

        if (reporte.equals("mes")) {
            for (int i = 0; i < 12; i++) {
                for (int j = 0; j < this.ultimosN; j++) {
                    suma += this.temperaturas[i][j];
                }
                aux = aux + " mes: " + (i + 1) + " tem: " + (suma / 12) + ";";
            }
            return aux;
        } else if (reporte.equals("anio")) {
            for (int j = 0; j < this.ultimosN; j++) {
                for (int i = 0; i < 12; i++) {
                    suma += this.temperaturas[i][j];
                }
                aux = aux + " año: " + (j) + " tem: " + (suma / this.ultimosN) + ";";
            }
            return aux;
        } else {
            return "Error, no se ingreso la opcion de mes o año para reportar.";
        }
    }
}
