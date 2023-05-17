/*
5-A- Definir una clase para representar flotas de micros. Una flota se caracteriza por conocer a los micros que la componen (a lo sumo 15).
Defina un constructor para crear una flota vacía (sin micros). Implemente métodos para:

i. devolver si la flota está completa (es decir, si tiene 15 micros o no).
ii. agregar a la flota un micro recibido como parámetro.
iii. eliminar de la flota el micro con patente igual a una recibida como parámetro, y retornar si la operación fue exitosa.
iv. buscar en la flota un micro con patente igual a una recibida como parámetro y retornarlo (en caso de no existir dicho micro, retornar null).
v. buscar en la flota un micro con destino igual a uno recibido como parámetro y retornarlo (en caso de no existir dicho micro, retornar null). 
 */
package tema4;

public class Flota {
    
    private int cantActual;
    private int cantMicros;
    private Micro[] flotaMicros;
    
    /* constructor */
    public Flota(int cantMicros) {
        this.cantActual = 0;
        this.cantMicros = cantMicros;
        flotaMicros = new Micro[this.cantMicros];
        
        for (int i = 0; i < this.cantMicros; i++) {
            flotaMicros[i] = null;
        }
    }

    /* devolver si la flota está completa (es decir, si tiene 15 micros o no). */
    public String siEstaLleno() {
        String aux = "";
        
        if (cantActual == cantMicros) {
            aux = aux + "la flota esta lleno";
        } else {
            aux = aux + "la flota NO esta lleno";
        }
        return aux;
    }
    
    /* agregar a la flota un micro recibido como parámetro. */
    public void agregarMicro(Micro m) {
        flotaMicros[cantActual] = m;
        cantActual++;
    }
    
    /* eliminar de la flota el micro con patente igual a una recibida como parámetro, y retornar si la operación fue exitosa. */
    public String eliminarMicro(String patente) {
        int i = 0;
        boolean esta = false;
        String aux = "";
        
        while ((i < cantActual) && !(esta)) {
            if (flotaMicros[i].getPatente().equals(patente)) {
                esta = true;
            } else {
                i++;
            }
        }
        if (esta) {
            flotaMicros[i] = null;
            cantActual--;
            aux = aux + "el micro fue encontrado y eliminado con exito.";
        } else {
            aux = aux + "el micro no se encontro.";
        }
        return aux;
    }
    
    /* buscar en la flota un micro con patente igual a una recibida como parámetro y retornarlo (en caso de no existir dicho micro, retornar null). */
    public String buscarPatente(String patente) {
        int i = 0;
        boolean esta = false;
        String aux = "";
        
        while ((i < cantActual) && !(esta)) {
            if (flotaMicros[i].getPatente().equals(patente)) {
                esta = true;
            } else {
                i++;
            }
        }
        if (esta) {
            aux = aux + flotaMicros[i].toString();
        } else {
            aux = aux + "no esta";
        }
        return aux;
    }
    
    /* buscar en la flota un micro con destino igual a uno recibido como parámetro y retornarlo (en caso de no existir dicho micro, retornar null). */
    public String buscarDestino(String destino) {
        int i = 0;
        boolean esta = false;
        String aux = "";
        
        while ((i < cantActual) && !(esta)) {
            if (flotaMicros[i].getDestino().equals(destino)) {
                esta = true;
            } else {
                i++;
            }
        }
        if (esta) {
            aux = aux + flotaMicros[i].toString();
        } else {
            aux = aux + "no esta";
        }
        return aux;
    }
    
    /* get */
    public int getCantActual() {
        return cantActual;
    }
    
    public int getCantMicros() {
        return cantMicros;
    }

    public Micro[] getFlotaMicros() {
        return flotaMicros;
    }
    
    /* set */
    public void setCantActual(int cantActual) {
        this.cantActual = cantActual;
    }
    
    public void setCantMicros(int cantMicros) {
        this.cantMicros = cantMicros;
    }

    public void setFlotaMicros(Micro[] flotaMicros) {
        this.flotaMicros = flotaMicros;
    }
}
