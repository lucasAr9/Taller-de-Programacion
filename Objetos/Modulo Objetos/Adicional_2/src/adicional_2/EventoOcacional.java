/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicional_2;

public class EventoOcacional extends Recital {

    private String motivo;
    private String nombreContratante;
    private String dia;

    public EventoOcacional(String nomBand, int cantTemas, String motivo, String contratante, String dia) {
        super(nomBand, cantTemas);
        this.motivo = motivo;
        this.nombreContratante = contratante;
        this.dia = dia;
    }

    public String actuar() {
        String aux = "";

        switch (motivo) {
            case "a beneficencia":
                aux = aux + "Recuerden colaborar con " + nombreContratante;
                break;
            case "show de TV":
                aux = aux + "Saludos amigos televidentes.";
                break;
            case "show privado":
                aux = aux + "Un feliz cumpleaños para " + nombreContratante;
                break;
            default:
                break;
        }
        aux = aux + super.listaDeTemas();
        return aux;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getNombreContratante() {
        return nombreContratante;
    }

    public void setNombreContratante(String nombreContratante) {
        this.nombreContratante = nombreContratante;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    @Override
    public String toString() {
        return super.toString() + "El evento conciste en ---> " + "motivo: " + motivo
                + ", contratado por: " + nombreContratante + ", el dia: " + dia;
    }
}
