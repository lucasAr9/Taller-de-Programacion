program nombrePrograma;


type
venta = record
    codigo: integer;
    fecha: String[20];
    cantVendida: integer;
    monto: real;
end;

lista = ^nodoL;
nodoL = record
    dato: venta;
    sig: lista;
end;

ventaConTotal = record
    codigo: integer;
    montoTotal: real;
end;

arbol = ^nodoA;
nodoA = record
    dato: ventaConTotal;
    hI: arbol;
    hD: arbol;
end;


procedure cargar(var l: lista);
begin
    // se dispone;
end;


{generar un arbol binado de busqueda ordenado por codigo de producto sumando los montos totales por codigo de producto}
procedure agregarOrdenado(var abb: arbol; v: venta);
begin
    if (abb = nil) then begin
        new (abb);
        abb^.dato.codigo:= v.codigo;
        abb^.dato.montoTotal:= v.monto;
        abb^.hI:= nil;
        abb^.hD:= nil;
    end
    else
        if (abb^.dato.codigo = v.codigo) then
            abb^.dato.montoTotal:= v.monto;
        else begin
            if (v.codigo < abb^.dato.codigo) then
                agregarOrdenado(abb^.hI, v);
            else
                agregarOrdenado(abb^.hD, v);
        end;
    end;
end;

procedure ventaConMontosTotales(l: lista; var abb: arbol);
begin
    while (l^.sig <> nil) do begin
        agregarOrdenado(abb, l^.dato);
        l:= l^.sig;
    end;
end;


{sumar todos los montos de los codigos superiores al recibido por parametro}
procedure sumarTodosLosMontosPorCodigo();
begin

end;


{pp}
var
    l: lista;
    abb: arbol;
    cod: integer;
    montoTotal: real;
BEGIN
    cargar(l);
    ventaConMontosTotales(l, abb);
    sumarTodosLosMontosPorCodigo(abb, cod, montoTotal);
    writeln('El monto total para los codigos mayores a (', cod, ') es: ' montoTotal);
END.
