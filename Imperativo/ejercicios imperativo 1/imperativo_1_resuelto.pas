program imperativo_1;

const
numeroPuesto = 20;

type
cantPuestos = 1..numeroPuesto;

compra = record
    codigo: integer;
    dni: integer;
    fecha: String[20];
    monto: real;
    puesto: cantPuestos;
end;

lista = ^nodo;
nodo = record
    dato: compra;
    sig: lista;
end;

vector = array [cantPuestos] of lista;

compraAcumulada = record
    dni: integer;
    montoTotal: real;
end;

arbol = ^nodoA;
nodoA = record
    dato: compraAcumulada;
    hI: arbol;
    hD: arbol;
end;


procedure cargar(var v: vector);
begin
    // se dispone
end;


{merge}
procedure agregarOrdenado(dni: integer; monto: real; var abb: arbol);
begin
    if (abb = nil) then begin
        new(abb);
        abb^.dato.dni:= dni;
        abb^.dato.montoTotal:= monto;
        abb^.hI:= nil;
        abb^.hD:= nil;
    end
    else begin
        if (monto < abb^.dato.montoTotal) then
            agregarOrdenado(dni, monto, abb^.hI)
        else
            agregarOrdenado(dni, monto, abb^.hD);
    end;
end;

procedure minimo(var min, minDNI: integer; var monto: real; var v: vector);
var
    i, pos: integer;
begin
    min:= 999;
    pos:= -1;

    for i:= 1 to numeroPuesto do begin
        if (v[i] <> nil) and (min > v[i]^.dato.codigo) then begin
            min:= v[i]^.dato.codigo;
            minDNI:= v[i]^.dato.dni;
            pos:= i;
        end;
    end;

    if (pos <> -1) then begin
        monto:= v[pos]^.dato.mondo;
        v[pos]:= v[i]^.sig;
    end;
end;

procedure merge(v: vector; var abb: arbol);
var
    min, actual: integer;
    minDNI, actualDNI; integer;
    monto, montoTotal: real;
begin
    abb:= nil;
    minimo(min, minDNI, monto, v);
    while (min <> 999) do begin
        actual:= min;
        actualDNI:= minDNI;
        montoTotal:= 0;
        while (min <> 999) and (min = actual) do begin
            montoTotal:= montoTotal + monto;
            minimo(min, minDNI, monto, v);
        end;
        agregarOrdenado(actualDNI, montoTotal, abb);
    end;
end;


{calcular la cantidad de clientes con monto total superior a x}
procedure cantClientesMontoSuperior(abb: arbol; monto: real; var cant: integer);
begin
    if (abb <> nil) then begin
        if (monto < abb^.dato.monto) then begin
            cantClientesMontoSuperior(abb^.hI, monto, cant)
        else
            cantClientesMontoSuperior(abb^.hD, monto, cant);
        end;
        cant:= cant + 1;
    end;
end;


{pp}
var
    v: vector;
    abb: arbol;
    monto: real;
    cant: integer;
BEGIN
    cargar(v);
    merge(v, abb);
    monto:= 500;
    cant:= 0;
    cantClientesMontoSuperior(abb, monto, cant);
END.
