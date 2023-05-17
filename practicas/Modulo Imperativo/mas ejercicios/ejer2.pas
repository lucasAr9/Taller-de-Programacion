{ 
Una empresa de logística ofrece 4 tipos de paquetes (1: encomienda común, 2: encomienda
express, 3: encomienda frágil, 4: certificado), y necesita procesar los envíos de sus clientes.
Para ello se dispone de un módulo “Envíos” que lee la información de los envíos realizados y
genera una estructura con código de paquete, código de localidad de destino, peso y precio del
paquete, agrupados por tipo de paquete. Por cada tipo de paquete, los envíos se encuentran
ordenados por código de localidad.

Se pide implementar un programa en Pascal que:
a) Invoque a un módulo que reciba la estructura de los envíos y utilizando la técnica de merge
o merge acumulador genere una lista ordenada que contenga código de localidad y el peso total
acumulado entre todos sus envíos. La lista debe estar ordenado por el precio total.

b) Implementar un módulo que reciba una localidad y elimine dicha localidad en la estructura
generada en el insico a).
y otro que reciba un precio y que elimine todos los elementos con el precio por debajo del
recibido inclusive.

NOTA: Para cada tipo de paquete puede haber más de un envío de la misma localidad.
No es necesario implementar la carga de la estructura que se dispone. Alcanza con declarar
el encabezado del procedimiento e invocarlo para que el programa compile satisfactoriamente.
}

program ejer2;

const
tipo = 4;

type
cantTiposPaq = 1..tipo;

envio = record
    tipoPaquete: cantTiposPaq;
    codigoPaquete: integer;
    codigoLocalidad: integer;
    precio: real;
    peso: real;
end;

{ agrupados por cant tipos paquete, ordenados por codigo localidad }
lista = ^nodo;
nodo = record
    dato: envio;
    sig: lista;
end;

vecDeTiposPaq = array [cantTiposPaq] of lista;

{ ordenados por el peso total de cada localidad }
acumulado = record
    localidad: integer;
    precioTotal: real;
end;

newLista = ^newNodo;
newNodo = record
    dato: acumulado;
    sig: newLista;
end;




procedure leer(var e: envio);
begin
    with e do begin
        tipoPaquete:= random(4) +1;
        codigoPaquete:= random(100);
        codigoLocalidad:= random(25);
        peso:= random(400);
        precio:= random(40900);
    end;
end;

procedure armarNodoLista(var l: lista; e: envio);
var
    nuevo, anterior, actual: lista;
begin
    new(nuevo);
    nuevo^.dato:= e;
    
    actual:= l;
    while (actual <> nil) and (actual^.dato.codigoLocalidad < e.codigoLocalidad) do begin
        anterior:= actual;
        actual:= actual^.sig;
    end;

    if (actual = l) then
        l:= nuevo
    else
        anterior^.sig:= nuevo;
    nuevo^.sig:= actual;
end;

procedure cargar(var v: vecDeTiposPaq);
var
    i: integer;
    e: envio;
begin
    randomize;
    for i:= 1 to 100 do begin
        leer(e);
        armarNodoLista(v[e.tipoPaquete], e);
    end;
end;

procedure inicializar(v: vecDeTiposPaq);
var i: cantTiposPaq;
begin
    for i:= 1 to tipo do
        v[i]:= nil;
end;

procedure imprimirVec(v: vecDeTiposPaq);
var
    i: cantTiposPaq;
begin
    for i:= 1 to tipo do begin
        writeln('');
        writeln('los del tipo de paquete ', i, '-------------------------------------------------');
        while (v[i] <> nil) do begin
            writeln('');
            writeln('codigo de paquete ', v[i]^.dato.codigoPaquete);
            writeln('codigo de localidad ', v[i]^.dato.codigoLocalidad);
            writeln('precio: ', v[i]^.dato.precio:2:2);
            writeln('peso: ', v[i]^.dato.peso:2:2);
            v[i]:= v[i]^.sig;
        end;
    end;
end;




procedure armarNodoNuevaLista(var l: newLista; a: integer; precio: real);
var
    nuevo, anterior, actual: newLista;
begin
    new(nuevo);
    nuevo^.dato.localidad:= a;
    nuevo^.dato.precioTotal:= precio;

    actual:= l;
    while (actual <> nil) and (actual^.dato.precioTotal < precio) do begin
        anterior:= actual;
        actual:= actual^.sig;
    end;

    if (actual = l) then
        l:= nuevo
    else
        anterior^.sig:= nuevo;
    nuevo^.sig:= actual;
end;

procedure minimo(var v: vecDeTiposPaq; var min: integer; var precio: real);
var
    i, pos: integer;
begin
    min:= 999;
    pos:= -1;
    precio:= 0;

    for i:= 1 to tipo do begin
        if (v[i] <> nil) and (v[i]^.dato.codigoLocalidad < min) then begin
            min:= v[i]^.dato.codigoLocalidad;
            pos:= i;
        end;
    end;

    if (pos <> -1) then begin
        precio:= v[pos]^.dato.precio;
        v[pos]:= v[pos]^.sig;
    end;
end;

procedure merge(v: vecDeTiposPaq; var newL: newLista);
var
    actual, min: integer;
    precio, precioTotal: real;
begin
    newL:= nil;

    minimo(v, min, precio);
    while (min <> 999) do begin
        actual:= min;
        precioTotal:= 0;
        while (min <> 999) and (actual = min) do begin
            precioTotal:= precioTotal + precio;
            minimo(v, min, precio);
        end;
        armarNodoNuevaLista(newL, actual, precioTotal);
    end;
end;

procedure imprimirMerge(l: newLista);
begin
    if (l <> nil) then begin
        writeln('');
        writeln('localidad: ', l^.dato.localidad);
        writeln('precio total: ', l^.dato.precioTotal:2:2);
        imprimirMerge(l^.sig);
    end;
end;




procedure eliminarLocalidad(var l: newLista; localidad: integer);
var
    anterior, actual: newLista;
begin
    actual:= l;

    while (actual <> nil) and (actual^.dato.localidad <> localidad) do begin
        anterior:= actual;
        actual:= actual^.sig;
    end;

    if (actual <> nil) and (actual^.dato.localidad = localidad) then begin
        if (actual = l) then
            l:= l^.sig
        else
            anterior^.sig:= actual^.sig;
        dispose(actual);
    end;
end;

procedure eliminarPrecios(var l: newLista; precioTotal: real);
var
    aux: newLista;
begin
    aux:= l;

    while (aux <> nil) and (aux^.dato.precioTotal < precioTotal) do
        aux:= aux^.sig;

    if (aux^.dato.precioTotal >= precioTotal) then
        l:= aux;
end;





var
    v: vecDeTiposPaq;
    newL: newLista;
    localidad: integer;
    precio: real;
BEGIN
    inicializar(v);
    cargar(v);
    writeln('');
    writeln('');
    writeln('se imprime el vector de listas agrupados por tipo de envio________________________');
    imprimirVec(v);

    merge(v, newL);
    writeln('');
    writeln('');
    writeln('se imprime la nuevca lista ordenado por precio total______________________________');
    imprimirMerge(newL);

    writeln('');
    write('que localidad queres eliminar: '); readln(localidad);
    eliminarLocalidad(newL, localidad);    

    writeln('');
    write('hasta que precio queres eliminar: '); readln(precio);
    eliminarPrecios(newL, precio);

    writeln('');
    writeln('');
    writeln('se imprime la lista con todo lo anterior mente eliminado__________________________');
    imprimirMerge(newL);
END.

