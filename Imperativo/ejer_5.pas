program ejer_5;


const
numeroVacuna = 4;

type
cantVacunas = 1..numeroVacuna;

entrega = record
    vacuna: cantVacunas;
    dosis: integer;
    fecha: string[20];
    ciudad: string[20];
end;

acumulador = record
    ciudad: String[20];
    cantDosis: integer;
end;

arbol = ^nodoA;
nodoA = record
    datoA: acumulador;
    hI: arbol;
    hD: arbol;
end;

lista = ^nodo;
nodo = record
    dato: entrega;
    sig: lista;
end;

vector = array [cantVacunas] of lista;


function ciudad(num: integer): string;
begin
    case num of
        0: ciudad:= 'La plata';
        1: ciudad:= 'Mar del plata';
        2: ciudad:= 'Bs. As.';
        3: ciudad:= 'San clemente';
        4: ciudad:= 'Santa Fe';
        5: ciudad:= 'Tierra del fuego';
    end;
end;

procedure leer(var e: entrega);
begin
    e.vacuna:= random(4) + 1;
    e.dosis:= random(5);
    e.fecha:= 'una fecha';
    e.ciudad:= ciudad(random(6));
end;

procedure agregarOrdenadoLista(var l: lista; e: entrega);
var
    nuevo, anterior, actual: lista;
begin
    new(nuevo);
    nuevo^.dato:= e;

    actual:= l;
    while (actual <> nil) and (actual^.dato.ciudad < e.ciudad) do begin
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
    e: entrega;
begin
    randomize;
    for i:= 1 to 100 do begin
        leer(e);
        agregarOrdenadoLista(v[e.vacuna], e);
    end;
end;


procedure agregarOrdenadoArbol(var abb: arbol; actual: String; montoTotal: integer);
begin
    if (abb <> nil) then begin
        new(abb);
        abb^.dato.ciudad:= actual;
        abb^.dato.cantDosis:= montoTotal;
    end
    else
        if (abb^.dato.cantDosis > montoTotal) then
            agregarOrdenadoArbol(abb^.hI, actual, montoTotal)
        else
            agregarOrdenadoArbol(abb^.hD, actual, montoTotal);
    end;
end;

procedure minimo(var min: String; var monto: integer; var v: vector);
var
    i, pos: integer;
begin
    min:= 'zzz';
    pos:= -1;

    for i:= 1 to numeroVacuna do begin
        if (v[i] <> nil) and (v[i]^.dato.ciudad < min) then begin
            min:= v[i]^.dato.ciudad;
            pos:= i;
        end;
    end;
    if (pos <> -1) then begin
        monto:= v[pos]^.dato.dosis;
        v[pos]:= v[pos]^.sig;
    end;
end;

procedure merge(var abb: arbol; v: vector);
var
    min, actual: String;
    monto, montoTotal: integer;
begin
    abb:= nil;

    minimo(min, monto, v);
    while (min <> 'zzz') do begin
        actual:= min;
        montoTotal:= 0;
        while (min <> 'zzz') and (min = actual) do begin
            montoTotal:= montoTotal + monto;
            minimo(min, monto, v);
        end;
        agregarOrdenadoArbol(abb, actual, montoTotal);
    end;
end;


procedure cantMinima(var cant: integer; min: integer; abb: arbol);
begin
    if (abb <> nil) then begin
        cantMinima(cant, min, abb^.hI);
        if (abb^.dato.cantDosis > min) then
            cant:= cant + 1;
        cantMinima(cant, min, abb^.hD);
    end;
end;


var
    v: vector;
    abb: arbol;
    cant, min: integer;
BEGIN
    cargar(v);
    merge(abb, v);

    cant:= 0;
    min:= 500;
    cantMinima(cant, min, abb);
    writeln('La cantidad que tiene menos de (', min, ') es: ', cant);
END.
