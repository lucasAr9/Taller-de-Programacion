/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package adicional_2;

/**
 *
 * @author luk
 */
public class Fecha {

    private int dia;
    private int mes;
    private int anio;
    private String ciudad;

    public Fecha(int dia, int mes, int anio, String ciudad) {
        this.dia = dia;
        this.mes = mes;
        this.anio = anio;
        this.ciudad = ciudad;
    }
    
    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    public int getMes() {
        return mes;
    }

    public void setMes(int mes) {
        this.mes = mes;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    @Override
    public String toString() {
        return "Fecha{" + "dia=" + dia + ", mes=" + mes + ", anio=" + anio + ", ciudad=" + ciudad + '}';
    }
}
