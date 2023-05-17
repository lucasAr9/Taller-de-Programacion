{ 
    Una feria municipal tiene 20 puestos de venta y necesita procesar las compras de sus
    clientes. Para ello se dispone de un módulo “Compras” que lee la información de las
    compras realizadas en los puestos de venta y genera una estructura con código de
    cliente, dni de cliente, fecha y monto de la compra, agrupados por puesto de venta.

    Para cada puesto de venta, los clientes se encuentran ordenados por código de compra.
    
    Se pide implementar un programa en Pascal que: 
    a) Invoque a un módulo que reciba la estructura de las compras y utilizando la técnica
    de merge o merge acumulador genere una lista ordenado que contenga el dni de cliente
    y monto total acumulado entre todas sus compras.
    la lista debe estar ordenado por el monto total.

    a.1) Buscar una compra con un codigo pasado por parametro.
    a.2) Agregar una compra con su monto de manera ordenada.
    a.3) Eliminar una compra con un codigo pasado por parametro.
    a.3) Eliminar todas las compras con un monto pasado por parametro.
    a.4) calcular el codigo mas chico.
    a.5) calcular el codigo mas grande.

    b) Implementar un módulo recursivo que reciba la estructura generada en a) y retorne
    la cantidad de clientes con monto total superior a un valor que se recibe como
    parámetro. NOTA: Cada puesto puede realizar más de una venta al mismo cliente.
    No es necesario implementar la carga de la estructura que se dispone.
    Alcanza con declarar el encabezado del procedimiento e invocarlo para que el
    programa compile satisfactoriamente.
}

program ejer1deNue;

const
puesto = 20;

type
cantPuestos = 1..puesto;

fecha = record
    dia: 1..30;
    mes: 1..12;
    anio: 2020..2022;
end;

{ compra inicial }
compra = record
    puestoDeVenta: cantPuestos;
    codigoComp: integer;
    dniCliente: longInt;
    f: fecha;
    montoCompra: real;
end;

listaCompra = ^nodo;
nodo = record
    dato: compra;
    sig: listaCompra;
end;

vecCompras = array [cantPuestos] of listaCompra;

{ compras mergeadas }
compraMergeada = record
    montoTotal: real;
    codigoComp: integer;
end;

listaMerge = ^nodoMerge;
nodoMerge = record
    dato: compraMergeada;
    sig: listaMerge;
end;




procedure inicializar(var v: vecCompras);
var i: cantPuestos;
begin
    for i:= 1 to puesto do v[i]:= nil;
end;

procedure leer(var c: compra);
begin
    c.puestoDeVenta:= random(20) + 1;
    c.codigoComp:= random(70) + 1;
    c.dniCliente:= random(60600);
    c.f.dia:= random(30) + 1;
    c.f.mes:= random(12) + 1;
    c.f.anio:= random(2) + 2020;
    c.montoCompra:= random(200) + 500;
end;

procedure armarNodo(var l: listaCompra; c: compra);
var
    nuevo, anterior, actual: listaCompra;
begin
    new(nuevo);
    nuevo^.dato:= c;
    
    actual:= l;
    while (actual <> nil) and (actual^.dato.codigoComp < nuevo^.dato.codigoComp) do begin
        anterior:= actual;
        actual:= actual^.sig;
    end;

    if (actual = l) then
        l:= nuevo
    else
        anterior^.sig:= nuevo;
    nuevo^.sig:= actual;
end;

procedure cargar(var v: vecCompras);
var
    c: compra;
    i: integer;
begin
    randomize;
    for i:= 1 to 150 do begin
        leer(c);
        armarNodo(v[c.puestoDeVenta], c);
    end;
end;

procedure imprimirVec(v: vecCompras);
var
    i: cantPuestos;
begin
    for i:= 1 to puesto do begin
        writeln('');
        writeln('Puesto: ', i, '---------------------------------------');
        while (v[i] <> nil) do begin
            writeln('*Codigo de la compra: ', v[i]^.dato.codigoComp, ' DNI del cliente: ',
            v[i]^.dato.dniCliente, ' fecha: ', v[i]^.dato.f.dia,'/',v[i]^.dato.f.mes,
            '/',v[i]^.dato.f.anio, ' monto: ', v[i]^.dato.montoCompra:2:2);
            v[i]:= v[i]^.sig;
        end;
    end;
end;




procedure armarNodoNewL(var newL: listaMerge; min: integer; montoTotal: real);
var
    nuevo, anterior, actual: listaMerge;
begin
    new(nuevo);
    nuevo^.dato.montoTotal:= montoTotal;
    nuevo^.dato.codigoComp:= min;

    actual:= newL;
    while (actual <> nil) and (actual^.dato.montoTotal < nuevo^.dato.montoTotal) do begin
        anterior:= actual;
        actual:= actual^.sig;
    end;

    if (newL = actual) then
        newL:= nuevo
    else
        anterior^.sig:= nuevo;
    nuevo^.sig:= actual;
end;

procedure minimo(var v: vecCompras; var minCod: integer; var monto: real);
var
    i: cantPuestos; pos: integer;
begin
    minCod:= 999;
    monto:= 0;
    pos:= -1;

    for i:= 1 to puesto do begin
        if (v[i] <> nil) and (v[i]^.dato.codigoComp <= minCod) then begin
            minCod:= v[i]^.dato.codigoComp;
            pos:= i;
        end;
    end;

    if (pos <> -1) then begin
        monto:= v[pos]^.dato.montoCompra;
        v[pos]:= v[pos]^.sig;
    end;
end;

procedure merge(v: vecCompras; var newL: listaMerge);
var
    monto, montoTotal: real;
    minCod, minActual: integer;
begin
    newL:= nil;

    minimo(v, minCod, monto);
    while (minCod <> 999) do begin
        minActual:= minCod;
        montoTotal:= 0;
        while (minCod <> 999) and (minCod = minActual) do begin
            montoTotal:= montoTotal + monto;
            minimo(v, minCod, monto);
        end;
        armarNodoNewL(newL, minActual, montoTotal);
    end;
end;

procedure imprimirMerge(newL: listaMerge);
begin
    while (newL <> nil) do begin
        writeln('*codigo de compra: ', newL^.dato.codigoComp,
                ' monto total: ', newL^.dato.montoTotal:2:2);
        newL:= newL^.sig;
    end;
end;




function buscar(cod: integer; l: listaMerge): listaMerge;
begin
    while (l <> nil) and (cod <> l^.dato.codigoComp) do
        l:= l^.sig;
    
    if (l <> nil) and (cod = l^.dato.codigoComp) then
        buscar:= l
    else
        buscar:= nil;
end;




procedure eliminar(l: listaMerge; cod: integer; var encontrado: boolean);
var
    anterior, actual: listaMerge;
begin
    actual:= l;
    while (actual <> nil) and (actual^.dato.codigoComp <> cod) do begin
        anterior:= actual;
        actual:= actual^.sig;
    end;

    if (actual <> nil) and (actual^.dato.codigoComp = cod) then begin
        if (actual = l) then
            l:= l^.sig
        else
            anterior^.sig:= actual^.sig;
        dispose(actual);
        encontrado:= true;
    end;
end;




procedure eliminarTodos(var l: listaMerge; monto: real; encontrado: boolean);
var
    anterior, actual, aux: listaMerge;
begin
    actual:= l;
    while (actual <> nil) do begin
        if (actual^.dato.montoTotal = monto) then begin
            aux:= actual;
            if (actual = l) then
                l:= l^.sig
            else
                anterior^.sig:= actual^.sig;
            actual:= actual^.sig;
            dispose(aux);
            encontrado:= true;
        end
        else begin
            anterior:= actual;
            actual:= actual^.sig;
        end;
    end;
end;




procedure calcularExtemos(l: listaMerge; var max, min: integer);
begin
    while (l <> nil) do begin
        if (max < l^.dato.codigoComp) then
            max:= l^.dato.codigoComp;
        if (min > l^.dato.codigoComp) then
            min:= l^.dato.codigoComp;
        l:= l^.sig;
    end;
end;




var
    v: vecCompras;
    newL: listaMerge;

    cod: integer; encontrado: boolean; monto: real;
    max, min: integer;
BEGIN
    inicializar(v);
    cargar(v);
    writeln('');
    writeln('');
    writeln('**************************************************************');
    writeln('*se imprime el vector de listas agrupadas por puesto de venta*');
    writeln('**************************************************************');
    imprimirVec(v);

    merge(v, newL);
    writeln('');
    writeln('');
    writeln('**************************************************************');
    writeln('*----------------se imprime la lista mergeada----------------*');
    writeln('**************************************************************');
    imprimirMerge(newL);


    writeln('');
    writeln('');
    cod:= 20;
    writeln('*BUSCAR* el codigo: ', cod);
    if (buscar(cod, newL) <> nil) then
        writeln('Se encontro el codigo: ', cod, '.')
    else
        writeln('No se encontro.');

    writeln('');
    cod:= 3; monto:= 980;
    writeln('*AGREGAR* la compra con codigo: ', cod, ' y monto: ', monto:2:2);
    armarNodoNewL(newL, cod, monto);

    writeln('');
    cod:= 20; encontrado:= false;
    writeln('*ELIMINAR* el codigo: ', cod);
    eliminar(newL, cod, encontrado);
    if (encontrado = true) then
        writeln('Se elimino el codigo: ', cod)
    else
        writeln('No se encontro el codigo: ', cod);

    writeln('');
    monto:= 1000; encontrado:= false;
    writeln('*ELIMINAR* todos los montos de: ', monto:2:2);
    eliminarTodos(newL, monto, encontrado);
    if (encontrado = true) then
        writeln('Se elimino al menos un monto de: ', monto:2:2)
    else
        writeln('NO se elimino ningun monto de: ', monto:2:2);

    writeln('');
    max:= -1; min:= 90;
    calcularExtemos(newL, max, min);
    writeln('El codigo maximo es: ', max, '. El codigo minimo es: ', min);

    writeln('');
    writeln('');
    writeln('**************************************************************');
    writeln('*----------------se imprime la lista mergeada----------------*');
    writeln('**************************************************************');
    imprimirMerge(newL);
END.

