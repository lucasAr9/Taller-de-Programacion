program nombrePrograma;

const
numeroSucursal = 5;

type
cantSucursales = 1..numeroSucursal;

venta = record
    codigo: integer;
    cantidad: integer;
    monto: real;
end;

lista = ^nodo;
nodo = record
    dato: venta;
    sig: lista;
end;

vector = array [cantSucursales] of lista;


// se dispone
procedure cargar(var v);
begin
end;


// merge de listas
procedure agregarFinal(var l: lista; cod: integer; monto: real);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato.codigo:= cod;
    nuevo^.dato.monto:= monto;
    nuevo^.sig:= nil;

    if (l = nil) then
        l:= nuevo
    else
        ultimo^.sig:= nuevo;
    ultimo:= nuevo;
end;

procedure minimo(var v: vector; var min: integer; var monto: real);
var
    i, pos: integer;
begin
    min:= 999;
    pos:= -1;

    for i:= 0 to numeroSucursal do begin
        if (v[i] <> nil) and (min > v[i]^.dato.codigo) then begin
            min:= v[i]^.dato.codigo;
            pos:= i;
        end;
    end;

    if (pos <> -1) then begin
        monto:= v[pos]^.dato.monto;
        v[pos]:= v[i]^.sig;
    end;
end;

procedure merge(var v: vector; var l: lista);
var
    min, actual: integer;
    monto, montoTotal: real;
    ultimo: lista;
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


var
    v: vector;
    l: lista;
BEGIN
    cargar(v);
    merge(v, l);
END.
