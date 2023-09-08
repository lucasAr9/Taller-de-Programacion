program adicional_4;


const
numeroAnio = 2018;

type
cantAnios = 2010..numeroAnio;

auto = record
    patente: String;
    anioFabricacion: cantAnios;
    marca: String;
    modelo: String;
end;

arbol = ^nodo;
nodo = record
    dato: auto;
    hI: arbol;
    hD: arbol;
end;

lista = ^nodoL;
nodoL = record
    dato: auto;
    sig: lista;
end;

vector = array [cantAnios] of lista;


{cargar arbol}
procedure leer(var a: auto);
begin
    write('patente: '); readln(a.patente);
    if (a.patente <> 0) then begin
        write('anio fabricacion: '); readln(a.anioFabricacion);
        write('marca: '); readln(a.marca);
        write('modelo: '); readln(a.modelo);
    end;
end;

procedure agregarOrdenado(var abb: arbol; a: auto);
begin
    if (abb = nil) then begin
        new(abb);
        abb^.dato:= a;
        abb^.hI:= nil;
        abb^.hD:= nil;
    end
    else
        if (a.patente < abb^.dato.patente) then
            agregarOrdenado(abb^.hI, a);
        else
            agregarOrdenado(abb^.hD, a);
    end;
end;

procedure cargar(var abb: arbol);
var
    a: auto;
begin
    abb:= nil;
    leer(a);
    while (a.codigo <> 0) do begin
        agregarOrdenado(abb, a);
        leer(a);
    end;
end;


{contar cant de autos de una marca}
procedure contarMarca(abb: arbol; marca: String; var contar: integer);
begin
    if (abb <> nil) then
        contarMarca(abb^.hI, marca, contar);
        if (abb^.dato.marca = marca) then
            contar:= contar + 1;
        contarMarca(abb^.hD, marca, contar);
    end;
end;


{agrupar autos por anio de fabricacion}
procedure iniciar(var v: vector);
var i: integer;
begin for i:= 1 to numeroAnio do v[i]:= nil; end;

procedure agregarFinal(var l: lista; a: auto);
var
    nuevo, actual: lista;
begin
    new(nuevo);
    nuevo^.dato:= a;
    nuevo^.sig:= nil;

    if (l <> nil) then begin
        actual:= l;
        while (actual^.sig <> nil) do
            actual:= actual^.sig;
        actual^.sig:= nuevo;
    end
    else
        l:= nuevo;
    end;
end;

procedure agregarAdelante(var l: lista; a: auto);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato:= a;
    nuevo^.sig:= l;
    l:= nuevo;
end;

procedure agrupar(abb: arbol; var v: vector);
begin
    if (abb <> nil) then
        contarMarca(abb^.hI, marca, contar);
        agregarFinal(v[abb^.dato.anioFabricacion], abb^.dato);
        contarMarca(abb^.hD, marca, contar);
    end;
end;


{buscar un elemento en el arbol}
function buscar(abb: arbol; patente: String): integer;
begin
    if (abb = nil) then
        busar:= 0
    else begin
        if (abb^.dato.patente = patente) then
            buscar:= abb^.dato.patente
        else begin
            if (patente < abb^.dato.patente)
                buscar(abb^.hI, patente)
            else
                buscar(abb^.hD, patente);
        end;
    end;
end;


{pp}
var
    abb: arbol;
    v: vector;
    contar: integer;
BEGIN
    cargar(abb);

    contar:= 0;
    contarMarca(abb, 'Audi', contar);

    iniciar(v);
    agrupar(abb, v);

    writeln('Patente: ', buscar(abb, 'asf235'));
END.
