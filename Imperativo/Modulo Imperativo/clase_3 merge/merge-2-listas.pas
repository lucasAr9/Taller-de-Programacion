{ un programa que une dos listas }

program merge;

type
lista = ^nodo;
nodo = record
    dato: integer;
    sig: lista;
end;


{ merge para unir dos listas }
procedure agregarAtras(var l, ultimo: lista; num: integer);
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

procedure minimo(var l, l2: lista; var min: integer);
begin
    min:= -1;
    if (l <> nil) and (l2 <> nil) then begin
        if (l^.dato <= l2^.dato) then begin
            min:= l^.dato;
            l:= l^.sig;
        end
        else begin
            min:= l2^.dato;
            l2:= l2^.sig;
        end;
    end
    else
    if (l <> nil) and (l2 = nil) then begin
        min:= l^.dato;
        l:= l^.sig;
    end
    else
    if (l = nil) and (l2 <> nil) then begin
        min:= l2^.dato;
        l2:= l2^.sig;
    end;
end;

procedure merge(l, l2: lista; var newL: lista);
var
    min: integer;
    ultimo: lista;
begin
    newL:= nil;
    minimo(l, l2, min);
    while (min <> -1) do begin
        agregarAtras(newL, ultimo, min);
        minimo(l, l2, min);
    end;
end;


{ cargar las listas }
procedure cargarOrdenado(var l: lista; num: integer);
var
    nuevo, anterior, actual: lista;
begin
    new(nuevo);
    nuevo^.dato:= num;

    actual:= l;
    while (actual <> nil) and (num > actual^.dato) do begin
        anterior:= actual;
        actual:= actual^.sig;
    end;

    if (actual = l) then
        l:= nuevo
    else
        anterior^.sig:= nuevo;
    nuevo^.sig:= actual;
end;

procedure cargar(var l: lista);
var
    num: integer;
begin
    l:= nil;
    readln(num);
    while (num <> -1) do begin
        cargarOrdenado(l, num);
        readln(num);
    end;
end;

{ imprimir la nueva lista mergeada }
procedure imrpimirMerge(newL: lista);
begin
    while (newL <> nil) do begin
        write(newL^.dato,', ');
        newL:= newL^.sig;
    end;
end;




var
    l, l2, newL: lista;
BEGIN
    writeln('');
    writeln('cargar primer lista en orden.');
    cargar(l);
    writeln('');
    writeln('cargar segunda lista en orden.');
    cargar(l2);

    writeln('');
    writeln('listas unidas.');
    merge(l, l2, newL);
    imrpimirMerge(newL);
END.

