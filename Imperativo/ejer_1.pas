program ejer_1;

const
puesto = 10;

type
cantPuestos = 1..puesto;

// lista donde se guardan los datos de los clientes antes de ser procesados
fecha = record
    dia: 1..31;
    mes: 1..12;
    anio: 1990..2024;
end;

compras = record
    puesto: integer;
    codigo: integer;
    dni: integer;
    f: fecha;
    monto: real;
end;

lista = ^nodoLista;
nodoLista = record
    datoL: compras;
    sig: lista;
end;

vector = array [cantPuestos] of lista;

// arbol de los clientes con los datos de los montos acumulados
arbol = ^nodoArbol;
nodoArbol = record
    datoA: compraPorCliente;
    hijoI: arbol;
    hijoD: arbol;
end;

compraPorCliente = record
    dni: integer;
    monto: real;
end;


procedure inicializar(var v: vector);
var
    i: cantPuestos;
begin
    for i:= 1 to puesto do begin
        v[i]:= nil;
    end;
end;

procedure imprimirListas(l: lista);
begin
    while (l^.sig <> nil) do begin
        writeln('puesto: ', l^.datoL.puesto,
                ' codigo: ', l^.datoL.codigo,
                ' dni: ', l^.datoL.dni,
                ' fecha: ', l^.datoL.f.dia, '/', l^.datoL.f.mes, '/', l^.datoL.f.anio,
                ' monto: ', l^.datoL.monto:2:2);
        l:= l^.sig;
    end;
end;

procedure imprimirVectorListas(v: vector);
var
    i: cantPuestos;
begin
    for i:= 1 to puesto do begin
        writeln('');
        writeln('Puesto nro: ', i, '-------------------------------------------------');
        if (v[i] <> nil) then begin
            imprimirListas(v[i]);
        end
        else begin
            writeln('no hay.');
        end;
    end;
end;


procedure leer(var c: compras);
var
    mismoNum: integer;
begin
    c.puesto:= random(10) +1;
    mismoNum:= random(50);
    c.codigo:= mismoNum;
    c.dni:= mismoNum;
    c.f.dia:= random(30) +1;
    c.f.mes:= random(11) +1;
    c.f.anio:= random(20) +2000;
    c.monto:= random(35000);
end;

procedure agregarOrdenadoLista(var l: lista; c: compras);
var
    anterior, actual, nuevo: lista;
begin
    new(nuevo);
    nuevo^.datoL:= c;

    actual:= l;
    while (actual^.sig <> nil) and (actual^.datoL.codigo <= c.codigo) do begin
        anterior:= actual;
        actual:= actual^.sig;
    end;

    if (actual = l) then
        l:= nuevo
    else
        anterios^.sig:= nuevo;
    nuevo^.sig:= actual;
end;

procedure cargar(var v: vector);
var
    i: integer;
    l: lista;
begin
    randomize;
    for i:= 1 to 100 do begin
        leer(c);
        agregarOrdenadoLista(v[c.puesto], c);
    end;
end;


procedure agregarOrdenadoArbol(var abb: arbol; c: compras; montoTotal: real);
begin
    if (abb = nil) then begin
        new(abb);
        abb^.datoA.dni = c^.dni;
        abb^.datoA.monto = c^.monto;
        abb^.hijoI:= nil;
        abb^.hijoD:= nil;
    end
    else begin
        if (c^.monto < abb^.datoA.monto) then
            agregarOrdenadoArbol(abb^.hijoI, c, montoTotal)
        else
            agregarOrdenadoArbol(abb^.hijoD, c, montoTotal);
    end;
end;

// revisar la variable "min"
procedure minimo(var min: compras; var monto: real; var v: vector);
var
    i, pos: integer;
begin
    min:= 999;
    monto:= 0;
    pos:= -1;

    for i:= 1 to puesto do begin
        if (v[i] <> nil) and (v[i]^datoL.codigo <= min) then begin
            min:= v[i];
            pos:= i;
        end;
    end;

    if (pos <> -1) then begin
        monto:= v[pos]^datoL.monto;
        v[pos]:= v[pos]^sig;
    end;
end;

procedure merge(var abb: arbol; v: vector);
var
    actual, min: compras;
    montoTotal, monto: real;
begin
    minimo(min, monto, v);
    while (min <> 999) do begin
        actual:= min;
        montoTotal:= 0;
        while (min <> 999) and (actual = min) do begin
            montoTotal:= montoTotal + monto;
            minimo(min, monto, v);
        end;
        agregarOrdenadoArbol(abb, actual, montoTotal);
    end;
end;


procedure calcularCant(abb: arbol; var cant: integer; monto: real);
begin
    if (abb <> nil) then
        calcularCant(abb^.hijoI, cant, monto);
        calcularCant(abb^.hijoD, cant, monto);
        if (abb^.datoA.monto > monto) then
            cant:= cant + 1;
end;


var
    v: vector;
    abb: arbol;
    monto: real;
    cant: integer;
BEGIN
    abb:= nil;

    inicializar(v);
    cargar(v);
    writeln('');
    writeln('Se imprime el vector de listas.');
    imprimirVectorListas(v);

    merge(abb, v);
    writeln('Lista mergeadas');
    imprimirMerge(abb);

    monto:= 900;
    writeln('Calcular cant de clientes con monto total superior a: ', monto:2:2)
    cant:= 0;
    calcularCant(abb, cant, monto);
    writeln('La cant es: ', cant);
END.
