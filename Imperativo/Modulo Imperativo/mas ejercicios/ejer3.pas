{
a) Utilizando la tecnica de merge acumulador segun corresponda, generar una lista que
contenga la cantidad total vendida para cada codigo de producto, ordenada por codigoProd.

b) Realizar un modulo recursivo que reciba la lista generada en el punto a) y retorne la
cantidad de productos para los cuales la cantidad total vendida supera las 500 unidades.

c) Realizar un modulo que busque un elemento por codigo de producto.

e) Realizar un modulo que elimine en bloque desde x hasta y, antes de a) en cada lista
de las 5 sucursales.
}


program ejer3;

const
sucursal = 5;

type
cantSucursales = 1..sucursal;

venta = record
    codigo: integer;
    cantVentas: integer;
    montoVentas: real;
    s: cantSucursales;
end;

lista = ^nodo;
nodo = record
    dato: venta;
    sig: lista;
end;

vecSucursal = array [cantSucursales] of lista;

{ para el merge de las ventas de las sucursales }
ventaMerge = record
    codigo: integer;
    cantTotal: integer;
end;

listaMerge = ^nodoMerge;
nodoMerge = record
    dato: ventaMerge;
    sig: listaMerge;
end;



{ CARGA DE LOS DATOS E IMPRIMIR ORDENADO }
procedure inicializar(var v: vecSucursal);
var i: cantSucursales;
begin
    for i:= 1 to sucursal do
        v[i]:= nil;
end;

procedure leer(var vent: venta);
begin
    vent.codigo:= random(40);
    vent.s:= random(5) + 1;
    vent.cantVentas:= random(50);
    vent.montoVentas:= random(30300);
end;

procedure armarNodo(var l: lista; vent: venta);
var
    nuevo, anterior, actual: lista;
begin
    new(nuevo);
    nuevo^.dato:= vent;

    actual:= l;
    while (actual <> nil) and (actual^.dato.codigo < vent.codigo) do begin
        anterior:= actual;
        actual:= actual^.sig;
    end;

    if (l = actual) then
        l:= nuevo
    else
        anterior^.sig:= nuevo;
    nuevo^.sig:= actual;
end;

procedure cargar(var v: vecSucursal);
var
    i: integer;
    vent: venta;
begin
    randomize;
    for i:= 1 to 100 do begin
        leer(vent);
        armarNodo(v[vent.s], vent);
    end;
end;

procedure imp(vent: venta);
begin
    writeln('');
    writeln('codigo: ', vent.codigo);
    writeln('cantidad de ventas: ', vent.cantVentas);
    writeln('monto total de la venta: ', vent.montoVentas:2:2);
end;

procedure imprimirVec(v: vecSucursal);
var
    i: cantSucursales;
begin
    for i:= 1 to sucursal do begin
        writeln('');
        writeln('sucursal: ', i, ' <-----------------------');
        while (v[i] <> nil) do begin
            imp(v[i]^.dato);
            v[i]:= v[i]^.sig;
        end;
    end;
end;



{ MERGE ACUMULADOR DE LAS VENTAS POR CODIGO }
procedure armarNodoMerge(var l, ultimo: listaMerge; actual: integer; total: integer);
var
    nuevo: listaMerge;
begin
    new(nuevo);
    nuevo^.dato.codigo:= actual;
    nuevo^.dato.cantTotal:= total;
    nuevo^.sig:= nil;

    if (l = nil) then
        l:= nuevo
    else
        ultimo^.sig:= nuevo;
    ultimo:= nuevo;
end;

procedure minimo(var v: vecSucursal; var min: integer; var monto: integer);
var
    i, pos: integer;
begin
    pos:= -1;
    min:= 999;
    monto:= 0;

    for i:= 1 to sucursal do begin
        if (v[i] <> nil) and (v[i]^.dato.codigo < min) then begin
            min:= v[i]^.dato.codigo;
            pos:= i;
        end;
    end;

    if (pos <> -1) then begin
        monto:= v[pos]^.dato.cantVentas;
        v[pos]:= v[pos]^.sig;
    end;
end;

procedure merge(var newL: listaMerge; v: vecSucursal);
var
    min, actual: integer;
    monto, total: integer;
    ultimo: listaMerge;
begin
    newL:= nil;

    minimo(v, min, monto);
    while (min <> 999) do begin
        actual:= min;
        total:= 0;
        while (min <> 999) and (actual = min) do begin
            total:= total + monto;
            minimo(v, min, monto);
        end;
        armarNodoMerge(newL, ultimo, actual, total);
    end;
end;

procedure imprimirMerge(l: listaMerge);
begin
    while (l <> nil) do begin
        writeln('');
        writeln('codigo: ', l^.dato.codigo);
        writeln('cantidad total: ', l^.dato.cantTotal);
        l:= l^.sig;
    end;
end;



{ CALCULAR LOS QUE SUPERAN LAS 100 UNIDADES VENDIDAS }
procedure contar500(l: listaMerge; var cant: integer);
begin
    if (l <> nil) then begin
        if (l^.dato.cantTotal >= 100) then
            cant:= cant + 1;
        contar500(l^.sig, cant);
    end;
end;



{ BUSCAR UN ELEMENTO POR CODIGO DE PRODUCTO }
procedure buscar(l: listaMerge; num: integer);
begin
    while (l <> nil) and (l^.dato.codigo < num) do begin
        l:= l^.sig;
    end;

    if (l^.dato.codigo = num) then begin
        writeln('codigo: ', l^.dato.codigo);
        writeln('con cant total: ', l^.dato.cantTotal);
    end
    else
        writeln('no existe s');
end;



{ ELIMINAR EN LAS LISTAS DE LAS SUCURSALES DESDE A HADTA B }
procedure eliminarBloque(var v: vecSucursal; a, b: integer);
var
    primero, ultimo, aux: lista;
    i: cantSucursales;
begin
    for i:= 1 to sucursal do begin
        primero:= v[i];
        while (primero <> nil) and (primero^.dato.codigo <= a) do
            primero:= primero^.sig;

        ultimo:= primero;
        while (ultimo <> nil) and (ultimo^.dato.codigo <= b) do begin
            aux:= ultimo;
            ultimo:= ultimo^.sig;
            dispose(aux);
        end;

        primero^.sig:= ultimo;
    end;
end;




var
    v: vecSucursal;
    newL: listaMerge;
    num, cont: integer;
    a, b: integer;
BEGIN
    inicializar(v);
    cargar(v);
    writeln('');
    writeln('');
    writeln('______________Se imprime el vector de sucursales con sus ventas______________');
    imprimirVec(v);

    merge(newL, v);
    writeln('');
    writeln('');
    writeln('________________________Se imprime la lista mergeada_________________________');
    imprimirMerge(newL);

    writeln(''); cont:= 0;
    contar500(newL, cont);
    writeln('la cantidad que superan los 100 productos son proceso: ', cont);

    writeln('');
    num:= random(40);
    writeln('numero a buscar: ', num);
    buscar(newL, num);

    writeln('');
    a:= random(10);
    b:= random(30) + 10;
    writeln('desde ', a, ' hasta ', b);
    eliminarBloque(v, a, b);
    writeln('Se imprime el nuevo vector de sucursales con las listas eliminadas de a
    hasta b.');
    imprimirVec(v);
END.

