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
                ' mondo: ', l^.datoL.mondo:2:2)
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
        end else
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
    for i:= 1 to 100 do begin
        leer(c)
        agregarOrdenadoLista(v[c.puesto], c)
    end;
end;


procedure agregarOrdenadoArbol(params);
begin
    
end;

procedure minimo(params);
begin
    
end;

procedure merge(params);
begin
    
end;


var
    v: vector;
    abb: arbol;
    mondo: real;
    cant: integer;
BEGIN
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
END;
