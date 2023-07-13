/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.p2_ejer1;

import java.util.Scanner;

/**
 *
 * @author luk
 */
public class P2_ejer1 {

    public static void main(String[] args) {
        Scanner e = new Scanner(System.in);
        
        System.out.print("Lado a: ");
        double a = e.nextInt();
        System.out.print("Lado b: ");
        double b = e.nextInt();
        System.out.print("Lado c: ");
        double c = e.nextInt();
        
        Triangulo tri = new Triangulo(a, b, c, "rojo", "verde");
        
        System.out.println("toString de Triangulo");
        System.out.println(tri.toString());
        System.out.println("calcular area");
        System.out.println(tri.calcularArea());
        System.out.println("calcular perimetro");
        System.out.println(tri.calcularPerimetro());
    }
}
