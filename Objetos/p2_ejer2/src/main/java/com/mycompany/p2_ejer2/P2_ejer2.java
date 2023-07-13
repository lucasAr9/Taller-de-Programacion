/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.p2_ejer2;

import java.util.Scanner;

/**
 *
 * @author luk
 */
public class P2_ejer2 {

    public static void main(String[] args) {
        Scanner e = new Scanner(System.in);
        
        System.out.println("precio: ");
        double precio = e.nextDouble();
        
        Balanza b = new Balanza();
        b.iniciarCompra();
        
        while (precio != 0) {
            System.out.println("peso: ");
            double peso = e.nextDouble();
            
            b.registrarProducto(peso, precio);
            
            System.out.println("precio: ");
            precio = e.nextDouble();
        }
        
        System.out.println(b.devolverMontoAPagar());
        System.out.println(b.devolverResumenDeCompra());
    }
}
