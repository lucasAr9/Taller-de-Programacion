/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

import PaqueteLectura.Lector;

public class Polimorfismo {

    public static void main(String[] args) {
        
        Figura[] figus = new Figura[3];//figus puede contener objetos instancia de cualquier subclase de Figura
        figus[0] = new Cuadrado(10, "Violeta", "Rosa");//posición 0 tiene un cuadrado   
        figus[1] = new Rectangulo(20, 10, "Azul", "Celeste");//posición 1 tiene un rectangulo
        figus[2] = new Cuadrado(30, "Rojo", "Naranja");//posición 2 tiene un cuadrado
        
        double tot = 0;
        int i; //calculo el area total
        for (i = 0; i < 3; i++) {
            tot = tot + figus[i].calcularArea();
            //Polimorfismo: los cuadrados, rectángulos, círculos, etc responden
            // al mensaje "calcularArea" pero de diferente manera
            //Binding dinámico: antes de la ejecución no se conoce qué tipo de objeto 
            //habrá en cada posición de figus. El código para responder al mensaje "calcularArea"
            //se determina en tiempo de ejecución.
        }
        System.out.println("Area total: " + tot);
        
        /* pedir datos de un Triangulo */
        System.out.println("lados del triangulo.");
        System.out.println("a: ");
        double a = Lector.leerDouble();
        System.out.println("b: ");
        double b = Lector.leerDouble();
        System.out.println("c: ");
        double c = Lector.leerDouble();
        System.out.println("color Relleno");
        String cr = Lector.leerString();
        System.out.println("color Linea");
        String cl = Lector.leerString();
        
        Triangulo calcularT = new Triangulo(cr, cl, a, b, c);
        
        System.out.println("el Area es: " + calcularT.calcularArea());
        System.out.println("el Perimetro es: " + calcularT.calcularPerimetro());
        
        /* pedir datos de un Circulo */
        System.out.println("radio: ");
        double radio = Lector.leerDouble();
        System.out.println("color Relleno");
        cr = Lector.leerString();
        System.out.println("color Linea");
        cl = Lector.leerString();
        
        Circulo calcularC = new Circulo(cr, cl, radio);
        
        System.out.println(calcularC.calcularArea());
        System.out.println(calcularC.calcularPerimetro());
        
        
        Cuadrado c1 = new Cuadrado(10,"Violeta","Rosa");
        Rectangulo r= new Rectangulo(20,10,"Azul","Celeste");
        
        Figura f1 = new Cuadrado(10,"Violeta","Rosa");
        Figura f2 = (Figura) c1;
        
        System.out.println(f1.toString());
        System.out.println(f2.toString());

    }
}
