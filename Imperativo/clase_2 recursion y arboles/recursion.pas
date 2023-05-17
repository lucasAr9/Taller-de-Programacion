{ 
    1. Realice un programa que lea 7 valores enteros. Genere una lista donde los elementos se inserten adelante.
    Al finalizar implemente un modulo recursivo que imprima los valores de la lista.

    2.Realice un programa que lea números hasta leer el valor 0 e imprima sus dígitos en el orden en que aparecen
    en el número. Ejemplo si se lee el valor 256, se debe imprimir 2  5  6.
}

program recursion;

const
dimF = 7;

type
lista = ^nodo;
nodo = record
    dato: integer;
    sig: lista;
end;

{ punto 1 }
// procedure imprimir(l: lista);
// begin
//     if (l <> nil) then begin
//         writeln(l^.dato);
//         imprimir(l^.sig);
//     end;
// end;
// procedure agregarAdelante(var l: lista; num: integer);
// var
//     nuevo: lista;
// begin
//     new(nuevo);
//     nuevo^.dato:= num;
//     nuevo^.sig:= l;
//     l:= nuevo;
// end;
// procedure cargar(var l: lista);
// var
//     i, num: integer;
// begin
//     l:= nil;
//     readln(num);
//     for i:= 1 to dimF do begin
//         agregarAdelante(l, num);
//         readln(num);
//     end;
// end;

{ punto 2 }
procedure descomponer(num: integer);
var
    dig: integer;
begin
    if (num <> 0) then begin
        dig:= num mod 10;
        descomponer(num div 10);
        writeln(dig,', ');
    end;
end;
procedure leerNum();
var
    num: integer;
begin
    write('un numero: '); readln(num);
    if (num <> 0) then begin
        descomponer(num);
        leerNum();
    end;
end;



// var
    // l: lista;
BEGIN
    // writeln('cargar numeros.');
    // cargar(l);
    // writeln('imprimir.');
    // imprimir(l);

    leerNum();
END.

