{
Se lee informacion acerca de las ventas de productos realizadas en las 5 sucursales
de una empresa. Cada sucursal realizo a lo sumo 30 ventas. De cada venta se conoce
el codigo de producto, cantidad vendida y monto total de la venta. Las ventas de cada
sucursal se leen de manera consecutiva y ordenada por codigo de producto. La lectura
por cada sucursal finaliza al completar las 30 ventas o cuando se lee el codigo de
producto -1, el cual no se procesa. Implementar un programa para que a partir de la
informacion leida, resuelva los siguientes items.

1) Un modulo que ordene por insercion las ventas de las sucursales por cant ventas.

2) Un modulo que elimine en una pos determinada en cada sucursal.

3) Un modulo que elimine todas las iteraciones de un monto total pasado por parametro.

4) Un modulo que inserte 2 ventas de manera ordenada por cant ventas en cada sucursal.

4) Un modulo que busque un codigo de producto.

Utilizando la tecnica de merge acumulador segun corresponda, generar una lista que
contenga la cantidad total vendida para cada codigo de producto, ordenada por codigo
de producto.

a) Un mocudo que busque una venta por codigo de producto.

b) Un modulo que elimine una venta por codigo de producto.

c) Un modulo que elimine todas las (cantidad vendidas) segun un num pasado por parametro.

d) Realizar un modulo recursivo que reciba la lista generada en el punto merge y retorne
la cantidad de productos para los cuales la cantidad total vendida supera las 500 unidades.
}

program ejer3deNuevo;

const
veN = 30;
sucursal = 5;

type
cantVentas = 1..veN;
cantSucursales = 1..sucursal;

venta = record
    s: cantSucursales;
    codigo: integer;
    cantidadVendido: integer;
    montoTotal: real;
end;

{ vector de vectores que contiene las ventas }
vectorVentas = array [cantVentas] of venta;

dimLyVec = record
    dL: integer;
    vec: vectorVentas;
end;

vectorDeSucursales = array [cantSucursales] of dimLyVec;

{ lista para el merge de los vectores }
indiceMerge = array [cantSucursales] of integer;

mergeVenta = record
    codigo: integer;
    vendidoTotal: integer;
    montoTotalAcumulado: real;
end;

lista = ^nodo;
nodo = record
    dato: mergeVenta;
    sig: lista;
end;




procedure inicializar(var v: vectorDeSucursales);
var i: cantSucursales;
begin
    for i:= 1 to sucursal do
        v[i].dL:= 0;
end;

procedure leer(var v: venta; i, j: integer);
begin
    v.s:= i;
    v.codigo:= j;
    v.cantidadVendido:= random(50);
    v.montoTotal:= random(600);
end;

procedure agregarAlVec(var v: dimLyVec; vent: venta);
begin
    if (v.dL < veN) then begin
        v.dL:= v.dL + 1;
        v.vec[v.dL]:= vent;
    end
    else
        writeln('El vector esta lleno, no entro el codigo de venta numero: ', vent.codigo);
end;

procedure cargar(var v: vectorDeSucursales);
var
    i, j: integer;
    vent: venta;
begin
    randomize;
    for i:= 1 to sucursal do begin
        for j:= 1 to 30 do begin
            leer(vent, i, j);
            agregarAlVec(v[i], vent);
        end;
    end;
end;

procedure imp(v: dimLyVec);
var
    i: integer;
begin
    for i:= 1 to v.dL do begin
        writeln('**codigo: ', v.vec[i].codigo,
                '  cantidad de ventas: ', v.vec[i].cantidadVendido,
                '  monto total de la venta: ', v.vec[i].montoTotal:2:2);
    end;
end;

procedure imprimirVecSucursales(v: vectorDeSucursales);
var
    i: cantSucursales;
begin
    for i:= 1 to sucursal do begin
        writeln('');
        writeln('Sucursal: (', i, ') ****************************************************');
        imp(v[i]);
    end;
end;




procedure ordenar(var v: vectorVentas; dL: integer);
var
    i, j: integer;
    actual: venta;
begin
    for i:= 2 to dL do begin
        actual:= v[i];
        j:= i - 1;
        while (j > 0) and (v[j].cantidadVendido > actual.cantidadVendido) do begin
            v[j + 1]:= v[j];
            j:= j - 1;
        end;
        v[j + 1]:= actual;
    end;
end;

procedure ordenarInsercion(var ordIns: vectorDeSucursales);
var
    i: integer;
begin
    for i:= 1 to sucursal do
        ordenar(ordIns[i].vec, ordIns[i].dL);
end;




procedure eliminarTodos(var v: vectorVentas; var dL: integer; cantVen: integer);
var
    i, j: integer;
begin
    for i:= 1 to dL do begin
        if (v[i].cantidadVendido = cantVen) then begin
            dL:= dL - 1;
            for j:= i to dL do
                v[j]:= v[j + 1];
        end;
    end;
end;

procedure eliminarPorPos(var v: vectorVentas; var dL: integer; pos: integer);
var
    i: integer;
begin
    if (1 <= pos) and (pos <= dL) then begin
        dL:= dL - 1;
        for i:= pos to dL do
            v[i]:= v[i + 1];
    end;
end;

procedure insertar5codigos(var v: vectorVentas; var dL: integer; e: venta);
var
    i, j: integer;
begin
    i:= 1;

    if (dL < veN) then begin
        while (i <= dL) and (v[i].cantidadVendido < e.cantidadVendido) do
            i:= i + 1;

        for j:= dL downto i do
            v[i + 1]:= v[i];
        v[i]:= e;
        dL:= dL + 1;
    end;
end;

procedure buscarCodigo(v: vectorVentas; dL: integer; cod: integer);
var
    i: integer;
begin
    i:= 1;
    while (i <= dL) and (v[i].codigo <> cod) do
        i:= i + 1;

    if (i <= dL) and (v[i].codigo = cod) then begin
        writeln('se encontro con el -->');
        writeln('**codigo: ', v[i].codigo, ' sucursal: ', v[i].s,
                '  cantidad de ventas: ', v[i].cantidadVendido,
                '  monto total de la venta: ', v[i].montoTotal:2:2);
    end
    else
        writeln('no se encontro el codigo: ', cod);
end;

procedure procesarTodo(var v: vectorDeSucursales);
var
    eli, i: integer;
    e: venta;
begin
    randomize;

    eli:= 20; writeln('se eliminaran las cant de ventas: ', eli);
    for i:= 1 to sucursal do
        eliminarTodos(v[i].vec, v[i].dL, eli);

    eli:= 6; writeln('se eliminara la pos: ', eli);
    for i:= 1 to sucursal do
        eliminarPorPos(v[i].vec, v[i].dL, eli);

    writeln('se agregaran 2 codigos.');
    for i:= 1 to sucursal do begin
        e.s:= i;
        e.codigo:= random(20);
        e.cantidadVendido:= random(50);
        e.montoTotal:= random(600);
        writeln('**codigo: ', e.codigo, ' sucursal: ', e.s,
                '  cantidad de ventas: ', e.cantidadVendido,
                '  monto total de la venta: ', e.montoTotal:2:2);
        insertar5codigos(v[i].vec, v[i].dL, e);
    end;

    eli:= 12; writeln('se buscara el codigo: ', eli, ' en cada lista de sucursal.');
    for i:= 1 to sucursal do
        buscarCodigo(v[i].vec, v[i].dL, eli);
end;




procedure inicializarIndiceMerge(var indi: indiceMerge);
var i: cantSucursales;
begin
    for i:= 1 to sucursal do indi[i]:= 1;
end;

procedure armarNodo(var l, ultimo: lista; min, montoVen: integer; montoPre: real);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato.codigo:= min;
    nuevo^.dato.vendidoTotal:= montoVen;
    nuevo^.dato.montoTotalAcumulado:= montoPre;
    nuevo^.sig:= nil;

    if (l = nil) then
        l:= nuevo
    else
        ultimo^.sig:= nuevo;
    ultimo:= nuevo;
end;

procedure minimo(var v: vectorDeSucursales; var iMerge: indiceMerge;
                        var min, monVen: integer; var monPre: real);
var
    i: cantSucursales;
    pos: integer;
begin
    min:= 999;
    pos:= -1;
    monVen:= 0;
    monPre:= 0;

    for i:= 1 to sucursal do begin
        if (iMerge[i] <> v[i].dL) and (min > v[i].vec[iMerge[i]].codigo) then begin
            min:= v[i].vec[iMerge[i]].codigo;
            pos:= i;
        end;
    end;

    if (pos <> -1) then begin
        monVen:= v[pos].vec[iMerge[i]].cantidadVendido;
        monPre:= v[pos].vec[iMerge[i]].montoTotal;
        iMerge[pos]:= iMerge[pos] + 1;
    end;
end;

procedure merge(v: vectorDeSucursales; var l: lista);
var
    min, actual: integer;
    montoVenta, montoVentaTotal: integer;
    montoPrecio, montoPrecioTotal: real;
    iMerge: indiceMerge;
    ultimo: lista;
begin
    inicializarIndiceMerge(iMerge);
    l:= nil;
    minimo(v, iMerge, min, montoVenta, montoPrecio);

    while (min <> 999) do begin
        actual:= min;
        montoVentaTotal:= 0;
        montoPrecioTotal:= 0;
        while (min <> 999) and (min = actual) do begin
            montoVentaTotal:= montoVentaTotal + montoVenta;
            montoPrecioTotal:= montoPrecioTotal + montoPrecio;
            minimo(v, iMerge, min, montoVenta, montoPrecio);
        end;
        armarNodo(l, ultimo, actual, montoVentaTotal, montoPrecioTotal);
    end;
end;

procedure imprimirMerge(l: lista);
begin
    while (l <> nil) do begin
        writeln('**************codigo: ', l^.dato.codigo, ' total vendido: ',
                l^.dato.vendidoTotal, ' monto acumulado: ', l^.dato.montoTotalAcumulado:2:2);
        l:= l^.sig;
    end;
end;




procedure buscar(l: lista; cod: integer; var encontrado: boolean);
begin
    while (l <> nil) and (l^.dato.codigo < cod) do
        l:= l^.sig;

    if (l <> nil) and (l^.dato.codigo = cod) then
        encontrado:= true;
end;

procedure eliminarCod(var l: lista; cod: integer; var encontrado: boolean);
var
    anterior, actual: lista;
begin
    actual:= l;
    while (actual <> nil) and (actual^.dato.codigo < cod) do begin
        anterior:= actual;
        actual:= actual^.sig;
    end;

    if (actual <> nil) and (actual^.dato.codigo = cod) then begin
        if (actual = l) then
            l:= l^.sig
        else
            anterior^.sig:= actual^.sig;
        dispose(actual);
        encontrado:= true;
    end;
end;

procedure eliminarTodos(var l: lista; vend: integer; var encontrado: boolean);
var
    anterior, actual, aux: lista;
begin
    actual:= l;

    while (actual <> nil) do begin
        if (actual^.dato.vendidoTotal = vend) then begin
            aux:= actual;
            if (actual = l) then
                l:= l^.sig
            else
                anterior^.sig:= actual^.sig;
            actual:= actual^.sig;
            dispose(aux);
        end else begin
            anterior:= actual;
            actual:= actual^.sig;
        end;
    end;
end;





var
    v: vectorDeSucursales;
    ordIns: vectorDeSucursales;
    l: lista;
    codigo: integer; encontrado: boolean;
BEGIN
    cargar(v);
    writeln('');
    writeln(' ********************************************** ',
            'Se imprime el vector de sucursales con el vector de ventas y su dL',
            ' ***********************************************');
    imprimirVecSucursales(v);

    ordIns:= v;
    ordenarInsercion(ordIns);
    writeln('');
    writeln(' ********************************************** ',
            'Se imprime el vector de sucursales ordenado por cant de ventas',
            ' ***********************************************');
    imprimirVecSucursales(ordIns);

    { los modulos que hacen cambios sobre los vectores ordenados por insercion }
    writeln('');
    writeln('Se procesan todos los modulos de eliminar, insertar y buscar.');
    procesarTodo(ordIns);

    writeln('');
    writeln(' ********************************************** ',
            'Se imprime DE VUELTA el vector de sucursales con todo procesado',
            ' ***********************************************');
    imprimirVecSucursales(ordIns);

    merge(v, l);
    writeln('');
    writeln(' ********************************************** ',
            'Se imprime el merge agrupando el total de ventas y precio',
            ' ***********************************************');
    imprimirMerge(l);

    { los modulos que hacen cambios sobre el merge de ventas }
    writeln('');
    codigo:= 9; encontrado:= false;
    buscar(l, codigo, encontrado);
    if (encontrado = true) then
        writeln('El codigo se encontro')
    else
        writeln('NO se encontro');
    
    encontrado:= false;
    eliminarCod(l, codigo, encontrado);
    if (encontrado = true) then
        writeln('El codigo se elimino')
    else
        writeln('NO se encontro');

    codigo:= 100; encontrado:= false;
    eliminarTodos(l, codigo, encontrado);
    if (encontrado = true) then
        writeln('al menos un elemento encontrado con la cant vendida de: ', codigo)
    else
        writeln('NO se encontro ningun elemento con la cant vendida de: ', codigo);

    imprimirMerge(l);
END.

