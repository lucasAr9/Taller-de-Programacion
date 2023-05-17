{ 
Escribir un programa que:
    a. Implemente un módulo que genere una lista a partir de la lectura de números
    enteros. La lectura finaliza con el número -1.
    b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.
    c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.
    d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado
    se encuentra en la lista o falso en caso contrario.
}

program punto4;

type
lista = ^nodo;
nodo = record
    dato: integer;
    sig: lista;
end;

procedure calcularMin(l: lista; var min: integer);
begin
    if (l <> nil) then begin
        if (l^.dato < min) then
            min:= l^.dato;
        calcularMin(l^.sig, min);
    end;
end;
procedure calcularMax(l: lista; var max: integer);
begin
    if (l <> nil) then begin
        if (l^.dato > max) then
            max:= l^.dato;
        calcularMax(l^.sig, max);
    end;    
end;

function buscarUnNumero(l: lista; num: integer): boolean;
begin
    if (l = nil) then
        buscarUnNumero:= false
    else
    if (l^.dato = num) then
        buscarUnNumero:= true;
    else
    if (l <> nil) and (l^.dato <> num) then
        buscarUnNumero:= buscarUnNumero(l^.sig, num)
end;

procedure armarNodo(var l, ultimo: lista; num: integer);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato:= num;
    nuevo^.sig:= nil;

    if (l = nil) then
        l:= nuevo
    else
        ultimo^.sig:= nuevo;
    ultimo:= nuevo;
end;
procedure cargar(var l: lista);
var
    ultimo: lista;
    num: integer;
begin
    l:= nil;
    writeln('cargar numeros.'); readln(num);
    while (num <> -1) do begin
        armarNodo(l, ultimo, num);
        readln(num);
    end;
end;


var
    l: lista;
    num, min, max: integer;
BEGIN
    min:= 9999; max:= -1;

    writeln(' ');
    cargar(l);

    writeln(' ');
    calcularMin(l, min);
    calcularMax(l, max);
    writeln('el numero minimo es: ', min);
    writeln('el numero maximo es: ', max);

    writeln(' ');
    write('un numero para buscar: '); readln(num);
    if ( buscarUnNumero(l, num) ) then
        writeln('el numero se encontro con exito.')
    else
        writeln('nope. el numero no se encontro.');
END.

