{ 
2. Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una lista con
las entradas vendidas. Se desea procesar la información de una semana. Se pide:

a. Generar 7 listas con las entradas vendidas para cada día. De cada entrada se lee día
(de 1 a 7), código de la obra, asiento, monto. La lectura finaliza con el código de obra
igual a 0. Las listas deben estar ordenadas por código de obra de forma ascendente.

b. Generar una nueva lista que totalice la cantidad de entradas vendidas por obra. Esta
lista debe estar ordenada por código de obra de forma ascendente.

c. Realice un módulo recursivo que informe el contenido de la lista generada en b)
}

program adicional_2;

const
dia = 7;

type
cantDias = 1..dia;

{ entradas ordenadas por codigo de obra en lista y agrupadas por dia en array }
entrada = record
    diaFuncion: cantDias;
    codigo: integer;
    asiento: 1..500;
    monto: real;
end;

lista = ^nodo;
nodo = record
    dato: entrada;
    sig: lista;
end;

vecDias = array [cantDias] of lista;

{ para acumular los montos de las obras }
montoPorObra = record
    codigo: integer;
    cantEntradas: integer;
    montoTotal: real;
end;

listaMontos = ^nodo2;
nodo2 = record
    dato: montoPorObra;
    sig: listaMontos;
end;



{ cargar las entradas ordenadas por codigo de obra en lista y agrupadas por dia en array }
procedure leer(var e: entrada);
begin
    e.codigo:= random(100);
    if (e.codigo <> 0) then begin
        e.diaFuncion:= random(7);
        e.asiento:= random(500);
        e.monto:= random(1000);
    end;
end;

procedure armarNodo(var l: lista; e: entrada);
var
    anterior, actual, nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato:= e;

    actual:= l;
    while (actual <> nil) and (actual^.dato.codigo < e.codigo) do begin
        anterior:= actual;
        actual:= actual^.sig;
    end;

    if (l = actual) then
        l:= nuevo
    else
        anterior^.sig:= nuevo;
    nuevo^.sig:= actual;
end;

procedure cargar(var v: vecDias);
var
    e: entrada;
begin
    randomize;
    leer(e);
    while (e.codigo <> 0) do begin
        armarNodo(v[e.diaFuncion], e);
        leer(e);
    end;
end;



{ inicializar el vector de listas por dia }
procedure inicializar(var v: vecDias);
var i: cantDias;
begin
    for i:= 1 to dia do
        v[i]:= nil;
end;



{ contar la cantidad de entradas de una misma obra y su monto }
procedure agregarAtras(var l, ultimo: listaMontos; actual: integer; cant: integer; monto: real);
var
    nuevo: listaMontos;
begin
    new(nuevo);
    nuevo^.dato.codigo:= actual;
    nuevo^.dato.cantEntradas:= cant;
    nuevo^.dato.montoTotal:= monto;

    if (l = nil) then
        l:= nuevo
    else
        ultimo^.sig:= nuevo;
    ultimo:= nuevo;
end;

procedure minimo(var min: integer; var monto: real; var v: vecDias);
var
    i, pos: integer;
begin
    min:= 999;
    monto:= 0;
    pos:= -1;

    for i:= 1 to dia do begin
        if (v[i] <> nil) and (v[i]^.dato.codigo < min) then begin
            min:= v[i]^.dato.codigo;
            pos:= i;
        end;
    end;

    if (pos <> -1) then begin
        monto:= v[pos]^.dato.monto;
        v[pos]:= v[pos]^.sig;
    end;
end;

procedure merge(v: vecDias; var l: listaMontos);
var
    minCod, actualCod: integer;
    montoTotal, monto: real;
    cantEntradas: integer;
    ultimo: listaMontos;
begin
    l:= nil;

    minimo(minCod, monto, v);
    while (minCod <> 999) do begin
        actualCod:= minCod;
        montoTotal:= 0;
        cantEntradas:= 0;
        while (minCod <> 999) and (actualCod = minCod) do begin
            montoTotal:= montoTotal + monto;
            cantEntradas:= cantEntradas +1;
            minimo(minCod, monto, v);
        end;
        AgregarAtras(l, ultimo, actualCod, cantEntradas, montoTotal);
    end;
end;



{ imprimir la lista con los montos acumulados }
procedure imprimir(l: listaMontos);
begin
    if (l <> nil) then begin
        writeln('');
        writeln('el codigo: ', l^.dato.codigo);
        writeln('candidad entradas: ', l^.dato.cantEntradas);
        writeln('con un monto total de: ', l^.dato.montoTotal:2:2);
        imprimir(l^.sig);
    end;
end;



procedure imprimirVec(v: vecDias);
var
    i: integer;
begin
    for i:= 1 to dia do begin
        while (v[i] <> nil) do begin
            writeln('');
            writeln('el codigo: ', v[i]^.dato.codigo);
            writeln('dia: ', v[i]^.dato.diaFuncion);
            writeln('asiento: ', v[i]^.dato.asiento);
            writeln('con un monto de: ', v[i]^.dato.monto:2:2);
            v[i]:= v[i]^.sig;
        end;
    end;
end;



var
    v: vecDias;
    l: listaMontos;
BEGIN
    inicializar(v);
    cargar(v);
    imprimirVec(v);
    merge(v, l);
    writeln('merge ----------------------------------------------------------------');
    imprimir(l);
END.
