program ejer_12;


const
numeroSucursal = 4;

type
cantSucursales = 1..numeroSucursal;

venta = record
    fecha: String[20];
    codigoProducto: integer;
    codigoSucursal: cantSucursales;
    cantVendida: integer;
end;

lista = ^nodo;

nodo = record
    dato: venta;
    sig: lista;
end;

vector = array [cantSucursales] of lista;

ventaAcumulada = record
    codigoProducto: integer;
    ventasTotales: integer;
end;

newLista = ^newNodo;

newNodo = record
    dato: ventaAcumulada;
    sig: newLista;
end;


{cargar datos}
procedure agregarOrdenado(var l: lista; ven: venta);
var
    nuevo, actual, anterior: lista;
begin
    new(nuevo);
    nuevo^.dato:= ven;

    actual:= l;
    while (actual^.sig <> nil) and (ven.codigoProducto < actual^.dato.codigoProducto) do begin
        anterior:= actual;
        actual:= actual^.sig;
    end;

    if (actual = l) then begin
        l:= nuevo
    else
        anterior^.sig:= nuevo;
    nuevo^.sig:= actual;
end;

procedure leer(var ven: venta);
begin
    write('codigo producto: '); readln(ven.codigoProducto);
    if (ven.codigoProducto <> 0) then begin
        write('codigo Sucursal: '); readln(ven.codigoSucursal);
        write('fecha: '); readln(ven.fecha);
        write('cantidad vendida: '); readln(ven.cantVendida);
    end;
end;

procedure cargar(var v: vector);
var
    ven: venta;
begin
    leer(ven);
    while (ven.codigoProducto <> 0) do begin
        agregarOrdenado(v[codigoSucursal], ven);
        leer(ven);
    end;
end;


{merge acumulador}
procedure agregarFinal(var l, ultimo: newLista; actual: integer; monto: integer);
var
    nuevo: newLista;
begin
    new(nuevo);
    nuevo^.dato.codigoProducto:= actual;
    nuevo^.dato.ventasTotales:= monto;
    nuevo^.sig:= nil;

    if (l = nil) then
        l:= nuevo
    else
        ultimo^.sig:= nuevo;
    ultimo:= nuevo;
end;

procedure minimo(var v: vector; var min: integer; var monto: integer);
var
    i, pos: integer;
begin
    pos:= -1;
    min:= 999;

    for i:= 1 to numeroSucursal do begin
        if (v[i] <> nil) and (min >= v[i]^.dato.codigoProducto) then begin
            min:= v[i]^.dato.codigoProducto;
            pos:= i;
        end;
    end;

    if (pos <> -1) then begin
        monto:= v[pos]^.dato.cantVendida;
        v[pos]:= v[pos]^.sig;
    end;
end;

procedure merge(v: vector; var l: newLista);
var
    min, actual: integer;
    monto, montoTotal: integer;
    ultimo: newLista;
begin
    l:= nil;
    minimo(v, min, monto);
    while (min <> 999) do begin
        actual:= min;
        montoTotal:= 0;
        while (min <> 999) and (actual = min) do begin
            montoTotal:= montoTotal + monto;
            minimo(v, min, monto);
        end;
        agregarFinal(l, ultimo, actual, montoTotal);
    end;
end;


{inicializar}
procedure inicializar(var v: vector);
var
    i: integer;
begin
    for i:= 1 to numeroSucursal do v[i]:= nil;
end;


{pp}
var
    v: vector;
    l: newLista;
BEGIN
    inicializar(v);
    cargar(v);
    merge(v, l);
END.
