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
    datoA = cliente;
    hijoI: arbol;
    hijoD: arbol;
end;

compraPorCliente = record
    dni: integer;
    monto: real;
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

procedure agregarOrdenado(var l: lista; c: compras);
var
    anterior, actual, nuevo = lista;
begin
    new(nuevo);
    nuevo^datoL:= c;

    actual:= l;
    while (actual^.sig <> nil) and (actual^.datoL.codigo <= c.codigo) do begin
        anterior:= actual;
        actual:= actual^.sig;
    end;

    if (actual = l) then
        l:= nuevl;
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
    for i:= 0 to 10 do
        leer(c)
        agregarOrdenado(v[c.puesto], c)
    end;
end;



var

BEGIN
    
END;
