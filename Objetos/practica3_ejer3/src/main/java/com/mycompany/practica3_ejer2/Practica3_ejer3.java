/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.practica3_ejer2;

import java.util.Scanner;

/**
 *
 * @author luk
 */
public class Practica3_ejer3 {

    public static void main(String[] args) {
        Persona p = new Persona("juan", 23424, 43);
        Trabajador t = new Trabajador("german", 6546, 65, "cocina");
        
        System.out.println(p.toString());
        System.out.println(t.toString());
    }
}
