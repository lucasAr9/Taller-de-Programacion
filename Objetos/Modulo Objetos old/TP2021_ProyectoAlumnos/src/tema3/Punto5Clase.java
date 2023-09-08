/*
5- A- Modifique el ejercicio 2-A. Ahora la balanza debe poder generar un resumen de compra más completo. Para eso agregue a la balanza
la característica resumen (String). Modifique los métodos:

- iniciarCompra para que además inicie el resumen en el String vacío.
- registrarProducto para que reciba un objeto Producto (que se caracteriza por peso en kg y descripción) y su precio por kg. La operación debe
realizar las actualizaciones en monto /cantidad de ítems y adicionar al resumen (string) la descripción y el monto pagado por este producto.
- devolverResumenDeCompra() para que retorne un String del siguiente estilo:
“Naranja 100 pesos – Banana 40 pesos – Lechuga 50 pesos – Total a pagar 190 pesos
por la compra de 3 productos” . La sección subrayada es el contenido de resumen.
 */
package tema3;
/* Punto5Clase seria la balanza */
public class Punto5Clase {
    
    private double monto;
    private int cantProductos;
    private String resumen;
    
    public void iniciarCompra() {
        this.monto = 0;
        this.cantProductos = 0;
        this.resumen = "";
    }
    
    public void registrarProducto(Producto p, double precioPorKg) {
        this.monto = this.monto + p.getPesoEnKg() * precioPorKg;
        this.cantProductos++;
        this.resumen = this.resumen + " - " + p.getDescripcion();
    }
    
    public String resumenDeCompra() {
        return "Total a pagar es: " + this.monto + " por la compra de " + this.cantProductos + " productos";
    }
    
    public String devolverResumenDeCompra() {
        return this.resumen;
    }
}
