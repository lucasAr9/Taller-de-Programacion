program nombrePrograma;


type
producto = record
    codigo: integer;
    cantidad: integer;
    monto: real;
    fecha: String[10];
end;

lista = ^nodoL;
nodoL = record
    dato: producto;
    sig: lista;
end;

productoTotal = record
    codigo: integer;
    montoTotal: real;
end;

arbol = ^nodoA;
nodoA = record
    dato: productoTotal;
    hI: arbol;
    hD: arbol;
end;


{cargar datos en lista}
procedure cargar(var l: lista); // se dispone
begin
end;


{contar monto total por producto en un arbol binario de busqueda}
procedure agregarOrdenado(var abb: arbol; dato: productoTotal);
begin
    if (abb = nil) then begin
        new(abb);
        abb^.dato:= dato;
        abb^.hI:= nil;
        abb^.hD:= nil;
    end
    else begin
        if (abb^.dato.codigo = dato.codigo) then
            abb^.dato.montoTotal:= dato.montoTotal
        else begin
            if (abb^.dato.codigo > dato.codigo)
                agregarOrdenado(abb^.hI, dato)
            else
                agregarOrdenado(abb^.hD, dato);
        end;
    end
end;

procedure cargarArbol(var abb: arbol; l: lista);
var
    p: productoTotal;
begin
    while (l^.sig <> nil) do begin
        p.codigo:= l^.dato.codigo;
        p.montoTotal:= l^.dato.monto;
        agregarOrdenado(abb, p);
        l:= l^.sig;
    end;
end;


{suma de todos los montos vendidos para los codigos de producto mayores al codigo por parametro}
procedure sumar(abb: arbol; cod: integer; var monto: real);
begin
    
end;


var
    l: lista;
    abb: arbol;
    codigo: integer;
    monto: real;
BEGIN
    cargar(l);
    cargarArbol(abb, l);

    codigo:= 218;
    monto:= 0;
    sumar(abb, codigo, monto);
    writeln('el monto total es: ', monto);
END.
