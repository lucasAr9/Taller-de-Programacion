{
    1. Modificar algoritmo de impression preOrden para que sume todos los nodos del arbol.
    2. Modifique 1. donde en vez de usar un procedimiento use una función.
}

program sumaFuncion;

type
arbol = ^nodo;
nodo = record
    dato: integer;
    hijoI: arbol;
    hijoD: arbol;
end;

function sumar(abb: arbol): integer;
begin
    if (abb <> nil) then
        sumar:= abb^.dato + sumar(abb^.hijoI) + sumar(abb^.hijoD)
    else
        sumar:= 0;
end;

procedure armarNodo(var abb: arbol; num: integer);
begin
    if (abb = nil) then begin
        new(abb);
        abb^.dato:= num;
        abb^.hijoI:= nil;
        abb^.hijoD:= nil;
    end
    else
        if (num < abb^.dato) then
            armarNodo(abb^.hijoI, num)
        else
            armarNodo(abb^.hijoD, num);
end;
procedure cargar(var abb: arbol);
var
    num: integer;
begin
    abb:= nil;
    randomize;
    num:= random(90) -1;
    while (num <> 0) do begin
        armarNodo(abb, num);
        num:= random(90) -1;
    end;
end;

procedure imprimir(abb: arbol);
begin
    if (abb <> nil) then begin
        imprimir(abb^.hijoI);
        write(abb^.dato, ', ');
        imprimir(abb^.hijoD);
    end;
end;

var
    abb: arbol;
BEGIN
    writeln(' ');
    writeln('cargar arbol.');
    cargar(abb);

    writeln(' ');
    imprimir(abb);

    writeln(' ');
    writeln('la suma de todo es: ', sumar(abb));
END.

