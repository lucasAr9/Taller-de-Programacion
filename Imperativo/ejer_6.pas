program ejer_6;

const
numeroPuesto = 20;

type
cantPuestos: 1..numeroPuesto;

compra = record
    puesto: cantPuestos;
    dni: integer;
    fecha: String[20];
    monto: real;
end;

lista = ^nodoL;
nodoL = record
    dato: compra;
    sig: lista;
end;

vector = array [cantPuestos] of lista;

comprasAcumuladas = record
    dni: integer;
    monto: real;
end;

arbol = ^nodoA;
nodoA = record
    dato: comprasAcumuladas;
    hI: arbol;
    hD: arbol;
end;


procedure inicializar(var v: vector);
var i: cantPuestos;
begin
    for i:= 1 to numeroPuesto do v[i]:= nil;
end;


procedure leer(var c: compra);
begin
    write('dni: '); read(c.dni);
    if (c.dni <> 999) then begin
        write('puesto: '); read(c.puesto);
        write('fecha: '); read(c.fecha);
        write('monto: '); read(c.monto);
    end;
end;

procedure agregarOrdenadoLista(var l: lista; c: compra);
var
    nuevo, actual, anterior: lista;
begin
    new(nuevo);
    nuevo^.dato:= c;

    actual:= l;
    while (actual <> nil) and (actual^.dato.dni < c.dni) do begin
        anterior:= actual;
        actual:= actual^.sig;
    end;

    if (l = actual) then
        l:= nuevo
    else
        anterior^.sig:= nuevo;
    nuevo^.sig:= actual;
end;

procedure cargar(var v: vector);
var
    c: compra;
begin
    leer(c);
    while (c.dni <> 999) do begin
        agregarOrdenadoLista(v[c.puesto], c);
        leer(c);
    end;
end;


procedure agregarOrdenadoArbol(var abb: arbol; dni: integer; monto: real);
begin
    if (abb <> nil) then begin
        new(abb);
        abb^.dato.dni:= dni;
        abb^.dato.monto:= monto;
        abb^.hI:= nil;
        abb^.hD:= nil;
    end
    else
        if (dni < abb^.dato.dni) then
            agregarOrdenadoArbol(abb^.hI, dni, monto);
        else
            agregarOrdenadoArbol(abb^.hD, dni, monto);
    end;
end;

procedure minimo(var v: vector; var min: integer; var monto: real);
var
    i, pos: integer;
begin
    pos:= -1;
    min:= 999;

    for i:= 1 to numeroPuesto do begin
        if (v[i] <> nil) and (v[i]^.dato.dni < min) then begin
            min:= v[i]^.dato.dni;
            pos:= i;
        end;
    end;

    if (pos <> -1) then begin
        monto:= v[pos]^.dato.monto;
        v[pos]:= v[pos]^.sig;
    end;
end;

procedure merge(var abb: arbol; v: vector);
var
    min, actual: integer;
    monto, montoTotal: real;
begin
    abb:= nil;

    minimo(v, min, monto);
    while (min <> 999) do begin
        montoTotal:= 0;
        while (min <> 999) and (min = actual) do begin
            montoTotal:= montoTotal + monto;
            minimo(v, min, monto);
        end;
        agregarOrdenadoArbol(abb, actual, montoTotal);
    end;
end;


var
    v: vector;
    abb: arbol;
BEGIN
    inicializar(v);
    cargar(v);
    merge(abb, v);
END.
