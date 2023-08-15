program imperativo_4;


type
cantDias = 1..31;
compra = record
	codigo: integer;
	dia: cantDias;
	cantProductos: integer;
	monto: real;
end;

lista = ^nodoLista;
nodoLista = record
	datoL: compra;
	sig: lista;
end;

arbol = ^nodoArbol;
nodoArbol = record
	dato: lista;
	hI: arbol;
	hD: arbol;
end;


{cargar los datos en el arbol de listas (arbil ordenado por codigo) (lista contiene las compras)}
procedure leer (var c: compra);
begin
	c.cantProductos:= random(50);
	if (c.cantProductos <> 0) then begin
		c.codigo:= 1 + random(99);
		c.monto:= 150.80 + random(8000);
		c.dia:= 1 + random(31);
	end;
end;

procedure agregarAdelante(var l: lista; c: compra);
var
	nuevo: lista;
begin
	new(nuevo);
	nuevo^.datoL:= c;
	nuevo^.sig:= l;
	l:= nuevo;
end;

procedure agregarOrdenado(var abb: arbol; c: compra);
begin
	if (abb = nil) then begin
		new(abb);
		agregarAdelante(abb^.dato, c);
		abb^.hI:= nil;
		abb^.hD:= nil;
	end
	else begin
		if (c.codigo = abb^.dato^.datoL.codigo) then
			agregarAdelante(abb^.dato, c)
		else if (c.codigo < abb^.dato^.datoL.codigo) then
			agregarOrdenado(abb^.hI, c)
		else if (c.codigo > abb^.dato^.datoL.codigo) then
			agregarOrdenado(abb^.hD, c)
	end;
end;

procedure cargar(var abb: arbol);
var
	c: compra;
begin
	abb:= nil;
	randomize;
	leer(c);
	while (c.cantProductos <> 0) do begin
		agregarOrdenado(abb, c);
		leer(c);
	end;
end;


{retornar la lista de compras de un cliente determinado por parametro}
procedure retornarComprasCliente(abb: arbol; var l: lista; var cod: integer);
begin
	if (abb <> nil) then
		l:= nil
	else if (cod = abb^.dato^.datoL.codigo) then
		l:= abb^.dato
	else if (cod < abb^.dato^.datoL.codigo) then
		retornarComprasCliente(abb^.hI, l, cod)
	else
		retornarComprasCliente(abb^.hD, l, cod);
end;


{retornar el monto de la compra con mas productos de la lista de compras de un cliente}
procedure montoDeMayoeCantProductos(l: lista; var monto: real; var cant: integer);
begin
	cant:= 0;
	while (l <> nil) do begin
		if (l^.datoL.cantProductos > cant) then begin
			cant:= l^.datoL.cantProductos;
			monto:= l^.datoL.monto;
		end;
		l:= l^.sig;
	end;
end;


{imprimir}
procedure imprimirLista(l: lista);
begin
	while (l <> nil) do begin
		writeln('codigo: ', l^.datoL.codigo, ' dia: ', l^.datoL.dia, ' cant: ', l^.datoL.cantProductos, ' mondo: ', l^.datoL.monto:2:2);
		l:= l^.sig;
	end;
end;

procedure imprimirArbol(abb: arbol);
begin
	if (abb <> nil) then begin
		imprimirArbol(abb^.hI);
		imprimirLista(abb^.dato);
		imprimirArbol(abb^.hD);
	end;
end;


{pp}
var
	abb: arbol;
	l: lista;
	monto: real;
	cant, cod: integer;
BEGIN
	l:= nil;
	writeln('hola 1');
	cargar(abb);
	writeln('hola 2');
	imprimirArbol(abb);
	
	writeln('hola 3');
	
	retornarComprasCliente(abb, l, cod);
	imprimirLista(l);
	
	montoDeMayoeCantProductos(l, monto, cant);
	writeln('El monto con la mayor cantidad de compras es: (', monto:2:2, ') con la cantidad de: (', cant, ')');
END.
