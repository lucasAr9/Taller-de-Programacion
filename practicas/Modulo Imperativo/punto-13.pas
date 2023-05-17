{ 
    Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una lista con las
    entradas vendidas. Se desea procesar la información de una semana.
    Implementar un programa que:
    
    a. Genere 7 listas con las entradas vendidas para cada día. De cada entrada se lee día (de 1
    a 7), código de la obra, asiento y monto. La lectura finaliza con el código de obra igual a 0.
    Las listas deben estar ordenadas por código de obra de forma ascendente.
    
    b. Genere una nueva lista que totalice la cantidad de entradas vendidas por obra. Esta lista
    debe estar ordenada por código de obra de forma ascendente.
}

program punto13;

const
dia = 7;

type
cantDias = 1..dia;

entradas = record
    codObra: integer;
    numDia: cantDias;
    asiento: integer;
    monto: real;
end;

lista = ^nodo;
nodo = record
    dato: entradas;
    sig: lista;
end;

vecEntradas = array [cantDias] of lista;


{ cargar las entradas ordenadas por codigo de obra y agrupadas por dia }
procedure leerEntrada(var e: entradas);
begin
    writeln();
    writeln();
    write('codigo de obra: '); readln(e.codObra);
    if (e.codObra <> 0) then begin
        write('dia cargado.'); e.numDia:= random(8);
        write('asiento cargado.'); e.asiento:= random(100);
        write('monto cargado.'); e.monto:= random(900);
    end;
end;

procedure agregarOrdenado(var l: lista; e: entradas);
var
    nuevo, anterior, actual: lista;
begin
    new(nuevo);
    nuevo^.dato:= e;
    
    actual:= l;
    while (actual <> nil) and (actual^.dato.codObra < e.codObra) do begin
        anterior:= actual;
        actual:= actual^.sig;
    end;

    if (l = actual) then
        l:= nuevo
    else
        anterior^.sig:= nuevo;
    nuevo^.sig:= actual;
end;

procedure cargarListas(var v: vecEntradas);
var
    e: entradas;
begin
    randomize;
    leerEntrada(e);
    while (e.codObra <> 0) do begin
        agregarOrdenado(v[e.numDia], e);
        leerEntrada(e);
    end;
end;


{ un modulo para inicializar el vector de los dias }
procedure inicializarVec(var v: vecEntradas);
var i: cantDias;
begin
    for i:= 1 to dia do v[i]:= nil;
end;
{ un modulo para imprimir todas las obras agrupadas por dia }
procedure imprimirListas(v: vecEntradas);
var i: cantDias;
begin
    writeln('');
    for i:= 1 to dia do begin
        writeln('---> los del dia: ',i);
        if (v[i] <> nil) then begin
            while (v[i] <> nil) do begin
                writeln('codigo de obra: ', v[i]^.dato.codObra);
                writeln('asiento: ', v[i]^.dato.asiento);
                writeln('monto: ', v[i]^.dato.monto:2:2);
                v[i]:= v[i]^.sig;
            end;
            writeln('----------');
            writeln();
        end
        else begin
            writeln('NO hubo.');
            writeln('----------');
            writeln();
        end;
    end;
end;
{ un modulo para imprimir el merge de las listas  }
procedure imprimirMerge(newL: lista);
begin
    while (newL <> nil) do begin
        writeln('la obra: ', newL^.dato.codObra);
        writeln('monto total: ', newL^.dato.monto:2:2);
        newL:= newL^.sig;
    end;
end;


{ armar el merge para una nueva lista que totalice la cantidad de entradas vendidas por obra }
procedure agregarAtras(var l, ultimo: lista; actual: integer; montoTotal: real);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato.codObra:= actual;
    nuevo^.dato.monto:= montoTotal;
    nuevo^.sig:= nil;

    if (l = nil) then
        l:= nuevo
    else
        ultimo^.sig:= nuevo;
    ultimo:= nuevo;
end;

procedure minimo(var min: integer; var monto: real; var v: vecEntradas);
var
    i, minIndice: integer;
begin
    min:= 999;
    monto:= 0;
    minIndice:= -1;

    for i:= 1 to dia do begin
        if (v[i] <> nil) and (v[i]^.dato.codObra <= min) then begin
            min:= v[i]^.dato.codObra;
            minIndice:= i;
        end;
    end;

    if (minIndice <> -1) then begin
        monto:= v[minIndice]^.dato.monto;
        v[minIndice]:= v[minIndice]^.sig;
    end;
end;

procedure merge(var newL: lista; v: vecEntradas);
var
    actual, min: integer;
    montoTotal, monto: real;
    ultimo: lista;
begin
    newL:= nil;

    minimo(min, monto, v);
    while (min <> 999) do begin
        actual:= min;
        montoTotal:= 0;
        while (min <> 999) and (actual = min) do begin
            montoTotal:= montoTotal + monto;
            minimo(min, monto, v);
        end;
        agregarAtras(newL, ultimo, actual, montoTotal);
    end;
end;






var
    vecEnt: vecEntradas;
    newL: lista;
BEGIN
    inicializarVec(vecEnt);

    writeln();
    writeln('cargar los datos de las entradas.');
    cargarListas(vecEnt);

    merge(newL, vecEnt);

    writeln();
    writeln('listas agrupadas por dia.');
    imprimirListas(vecEnt);

    writeln();
    writeln('lista con los montos totales de cada obra.');
    imprimirMerge(newL);
END.

