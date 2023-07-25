program ejer_9;


type
arbol = ^nodo;
nodo = record
    dato: String[20];
    hI: arbol;
    hD: arbol;
end;


procedure agregarOrdenado(var a: arbol; nombre: String);
begin
    if (a = nil) then begin
        new(a);
        a^.dato:= nombre;
        a^.hI:= nil;
        a^.hD:= nil;
    end
    else begin
        if (nombre < a^.dato) then
            agregarOrdenado(a^.hI, nombre);
        else
            agregarOrdenado(a^.hD, nombre);
    end;
end;

procedure cargar(var a: arbol);
var
    nombre: String;
begin
    write('nombre: '); readln(nombre);
    while (nombre <> 'zzz') do begin
        agregarOrdenado(a, nombre);
        write('nombre: '); readln(nombre);
    end;
end;


procedure buscar(a: arbol; nombre: String; var esta: boolean);
begin
    if (a = nil) then begin
        esta:= false;
    else begin
        if (a^.dato = nombre) then
            esta:= true;
        else begin
            if (nombre < a^.dato) then
                buscar(a^.hI, nombre, esta);
            else
                buscar(a^.hD, nombre, esta);
        end;
    end;
end;


var
    a: arbol;
    nombre: String;
    esta: boolean;
BEGIN
    cargar(a);

    esta:= false;
    nombre:= 'Hernan';
    buscar(a, nombre, esta);
END.
