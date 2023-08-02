/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package adicional_2;

/**
 *
 * @author luk
 */
public class EventoOcasional extends Recital {
    
    private String motivo; // beneficio, show de TV o show privado.
    private String nombrePersonaContrata;
    private String diaEvento;
    
    public EventoOcasional(String nombre, int cant, String motivo, String nombrePersona, String dia) {
        super(nombre, cant);
        this.motivo = motivo;
        this.nombrePersonaContrata = nombrePersona;
        this.diaEvento = dia;
    }

    @Override
    public void actuar() {
        if ("beneficio".equals(motivo)) {
            System.out.println("Recuerden colaborar con " + nombrePersonaContrata);
        } else if ("show de TV".equals(motivo)) {
            System.out.println("Saludos amigos televidentes.");
        } else if ("privado".equals(motivo)) {
            System.out.println("Un feliz cumpleaños para " + nombrePersonaContrata);
        }
        System.out.println(super.todosLosTemas());
    }
    
    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getNombrePersonaContrata() {
        return nombrePersonaContrata;
    }

    public void setNombrePersonaContrata(String nombrePersonaContrata) {
        this.nombrePersonaContrata = nombrePersonaContrata;
    }

    public String getDiaEvento() {
        return diaEvento;
    }

    public void setDiaEvento(String diaEvento) {
        this.diaEvento = diaEvento;
    }

    @Override
    public String toString() {
        return "EventoOcasional{" + super.toString() + "motivo=" + motivo + ", nombrePersonaContrata=" + nombrePersonaContrata + ", diaEvento=" + diaEvento + '}';
    }
}
