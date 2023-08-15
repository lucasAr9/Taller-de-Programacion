program imperativo_3;


type
venta = record
	codigo: integer;
	cant: integer;
end;

arbol = ^nodo;
nodo = record
	dato: venta;
	hI: arbol;
	hD: arbol;
end;


{cargar datos}
procedure leer(var v: venta);
begin
	write('codigo: '); readln(v.codigo);
	if (v.codigo <> -1) then
		write('cantidad: '); readln(v.cant);
end;

procedure agregarOrdenado(var abb: arbol; v: venta);
begin
	if (abb = nil) then begin
		new(abb);
		abb^.dato:= v;
		abb^.hI:= nil;
		abb^.hD:= nil;
	end
	else begin
		if (v.codigo < abb^.dato.codigo) then
			agregarOrdenado(abb^.hI, v)
		else
			agregarOrdenado(abb^.hD, v);
	end;
end;

procedure cargar(var abb: arbol);
var
	v: venta;
begin
	leer(v);
	while (v.codigo <> -1) do begin
		agregarOrdenado(abb, v);
		leer(v);
	end;
end;


{contar la cantidad de los codigos mayores al parametro}
procedure contar(abb: arbol; cod: integer; var cant: integer);
begin
	if (abb <> nil) then begin
		if (cod < abb^.dato.codigo) then
			contar(abb^.hD, cod, cant);
		cant:= cant + abb^.dato.cant;
		contar(abb^.hD, cod, cant);
	end;
end;


{pp}
var
	abb: arbol;
	cod, cant: integer;
BEGIN
	cargar(abb);
	cant:= 0;
	contar(abb, cod, cant);
	writeln('la cantidad de ventas de los codigos mayores a: ', cod, ' es: ', cant);
END.
