/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejer1;

/**
 *
 * @author Lucas Arrigoni
 */
public class GeneraRandom {
    
    private int r;

    private String nombre;
    private int dni;
    private int materia;
    
    private String titulo;
    private String uni;
    
    private int dia;
    private int mes;
    private int anio;
    private int nota;
    private String nombreM;
    
    /* esto es para hacer que se implementen nombres random en vez de teclearlo */
    public void generadorRandom() {        
        /* genera un nombre aleatorio entre los 9 */
        r = (int)(Math.random() * 10);

        switch(r) {
            case 0: nombre = "NikoPe";
                break;
            case 1: nombre = "el Pepe";
                break;
            case 2: nombre = "Jose";
                break;
            case 3: nombre = "German";
                break;
            case 4: nombre = "Hernesto";
                break;
            case 5: nombre = "Mica";
                break;
            case 6: nombre = "Juan";
                break;
            case 7: nombre = "Franka";
                break;
            case 8: nombre = "Anita";
                break;
            case 9: nombre = "Maria";
                break;
        }

        /* genera un dni aleatorio */
        dni = (int)(Math.random() * 1000000000);

        /* genera la cant de materias aleatoria */
        materia = (int)(Math.random() * 10);
        
        /* genera un titulo aleatorio entre los 9 */
        r = (int)(Math.random() * 10);

        switch(r) {
            case 0: titulo = "agronomo";
                    uni = "de ingenieria";
                break;
            case 1: titulo = "informatico";
                    uni = "de informatica";
                break;
            case 2: titulo = "ingeniero";
                    uni = "de ingenieria";
                break;
            case 3: titulo = "filosofo";
                    uni = "de humanidades";
                break;
            case 4: titulo = "abogado";
                    uni = "de abogacia";
                break;
            case 5: titulo = "astronomo";
                    uni = "de ciencia";
                break;
            case 6: titulo = "educacion ficica";
                    uni = "de humanidades";
                break;
            case 7: titulo = "quimica";
                    uni = "de ciencia";
                break;
            case 8: titulo = "sistemas";
                    uni = "de informatica";
                break;
            case 9: titulo = "en pancho";
                    uni = "de los panchos";
                break;
        }
    }
    
    public void generarRandomMateria() {
        dia = (int)(Math.random() * 10);
        mes = (int)((Math.random() * 10) + 5);
        anio = (int)(Math.random() * 10000);
        nota = (int)((Math.random() * 10) + 1);
        
        r = (int)(Math.random() * 10);

        switch(r) {
            case 0: nombreM = "matematicas";
                break;
            case 1: nombreM = "algebra";
                break;
            case 2: nombreM = "quimica";
                break;
            case 3: nombreM = "filosofia 1 y 2";
                break;
            case 4: nombreM = "acustica";
                break;
            case 5: nombreM = "pintura y diseño";
                break;
            case 6: nombreM = "partes del cuerpo 1";
                break;
            case 7: nombreM = "anatomia 3";
                break;
            case 8: nombreM = "epidemiologia y pandemia 3";
                break;
            case 9: nombreM = "taller de programacion 17";
                break;
        }
    }

    /* para devolver los valores de un Doctorado o uno de Grado */
    public String getNombre() {
        return nombre;
    }

    public int getDni() {
        return dni;
    }

    public int getMateria() {
        return materia;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getUni() {
        return uni;
    }
    
    /* para devolver los valores de una materia */
    public int getDia() {
        return dia;
    }

    public int getMes() {
        return mes;
    }

    public int getAnio() {
        return anio;
    }

    public int getNota() {
        return nota;
    }

    public String getNombreM() {
        return nombreM;
    }
    
}
