{ 
    1. Realice un módulo que genere y devuelva un arreglo de enteros. La carga del arreglo debe realizarse hasta que se lee el
    número 0 o se hayan leído 20 números.

    2. Realice un módulo que reciba un arreglo e imprima todo su contenido.

    3. Realice un módulo que reciba un arreglo y un valor num, y de ser possible elimine del arreglo el valor num.

    4. Realice un módulo que genere una lista de enteros de manera aleatoria hasta leer el número 15. Se sugiere que la función
    ramdom genere números entre 0 y 15. Los elementos deben quedar almacenados en la lista en el mismo orden en que fueron leídos.
}

program ejer1;

const
dimF = 30;

type
tamanio = 1..dimF;

vector = array [tamanio] of integer;

lista = ^nodo;
nodo = record
    dato: integer;
    sig: lista;
end;

// Punto 1. Un modulo que genere y devuelva un arreglo de enteros hasta leer el 0 o llegar a 20.
procedure cargar(var v: vector; var dL: integer);
var
    num: integer;
begin
    dL:= 0;
    randomize;
    num:= random(50);
    while ( (dL < dimF) and (num <> 0) ) do begin
        dL:= dL +1;
        v[dL]:= num;
        if (dL < dimF) then
            num:= random(50);
    end;
end;

// Punto 2. Un modulo que imprime un vector.
procedure imprimir(v: vector; dL: integer);
var
    i: integer;
begin
    writeln(' ');
    for i:= 1 to dL do begin
        write(v[i],', ');
    end;
    writeln(' ');
end;

// Punto 3. Un modulo que elimine un numero del vector.
procedure eliminar(var v: vector; var dL: integer);
var
    i, pos, num: integer;
begin
    pos:= 0;

    write('un numero para eliminar: '); readln(num);

    while ( (pos <= dL) and (v[pos] <> num) ) do
        pos:= pos +1;

    if ( (pos <= dL) and (v[pos] = num) ) then begin
        dL:= dL -1;
        for i:= pos to dL do
            v[i]:= v[i +1];

        writeln('El numero se elimino.');
    end
    else
        writeln('No se encontro el numero.');
end;

// Punto 4. Generar una lista con numeros random.
procedure armarNodo(var l: lista; var ultimo: lista; num: integer);
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
procedure cargarLista(var l: lista);
var
    ultimo: lista;
    num: integer;
begin
    l:= nil;
    randomize;
    num:= abs( random(50) );
    while (num <> 0) do begin
        armarNodo(l, ultimo, num);
        num:= abs( random(50) );
    end;
end;

procedure imprimirLista(l: lista);
begin
    while (l <> nil) do begin
        write(l^.dato,', ');
        l:= l^.sig;
    end;
end;

var
    v: vector;
    l: lista;
    dL: integer;
BEGIN
    cargar(v, dL);
    imprimir(v, dL);
    eliminar(v, dL);
    imprimir(v, dL);
    writeln(' ');
    writeln('comienzo de la lista.');
    cargarLista(l);
    imprimirLista(l);
END.

