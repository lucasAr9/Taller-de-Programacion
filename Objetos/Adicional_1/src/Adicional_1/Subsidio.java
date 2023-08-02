/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Adicional_1;

/**
 *
 * @author luk
 */
public class Subsidio {
    
    private double montoPedido;
    private String motivo;
    private boolean otorgado;
    
    public Subsidio(double monto, String motivo) {
        this.montoPedido = monto;
        this.motivo = motivo;
        this.otorgado = false;
    }

    public double getMontoPedido() {
        return montoPedido;
    }

    public void setMontoPedido(double montoPedido) {
        this.montoPedido = montoPedido;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public boolean isOtorgado() {
        return otorgado;
    }

    public void setOtorgado(boolean otorgado) {
        this.otorgado = otorgado;
    }

    @Override
    public String toString() {
        return "Subsidio{" + "montoPedido=" + montoPedido
                + ", motivo=" + motivo
                + ", otorgado=" + otorgado + '}';
    }
}
