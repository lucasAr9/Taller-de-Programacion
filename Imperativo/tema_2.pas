program tema_2;


const
dimF = 200;


type
cantDias = 1..31;

pedido = record
	cliente: integer;
	dia: cantDias;
	cantCombos: integer;
	monto: real;
end;

lista = ^nodoL;
nodoL = record
	datoL: pedido;
	sig: lista;
end;

arbol = ^nodoA;
nodoA = record
	datoA: lista;
	hI: arbol;
	hD: arbol;
end;


{cargar los datos}
procedure leer(var p: pedido);
begin
	p.cliente:= random(200);
	if (p.cliente <> 0) then begin
		p.dia:= random(31) + 1;
		p.cantCombos:= random(20) + 1;
		p.monto:= random(3000) + 100.50;
	end;
end;

procedure agregarAdelante(var l: lista; p: pedido);
var
	nuevo: lista;
begin
	new(nuevo);
	nuevo^.datoL:= p;
	nuevo^.sig:= l;
	l:= nuevo;
end;

procedure agregarOrdenado(var abb: arbol; p: pedido);
begin
	if (abb = nil) then begin
		new(abb);
		agregarAdelante(abb^.datoA, p);
		abb^.hI:= nil;
		abb^.hD:= nil;
	end
	else begin
		if (abb^.datoA^.datoL.cliente = p.cliente) then
			agregarAdelante(abb^.datoA, p)
		else if (p.cliente < abb^.datoA^.datoL.cliente) then
			agregarOrdenado(abb^.hI, p)
		else
			agregarOrdenado(abb^.hD, p);
	end;
end;

procedure cargar(var abb: arbol);
var
	p: pedido;
begin
	leer(p);
	while (p.cliente <> 0) do begin
		agregarOrdenado(abb, p);
		leer(p);
	end;
end;


{}
procedure pedidosDelCliente(abb: arbol; var l: lista; cliente: integer);
begin
	if (abb = nil) then
		l:= nil
	else if (cliente = abb^.datoA^.datoL.cliente) then
		l:= abb^.datoA
	else if (cliente < abb^.datoA^.datoL.cliente) then
		pedidosDelCliente(abb^.hI, l, cliente)
	else
		pedidosDelCliente(abb^.hD, l, cliente);
end;


{}
procedure montoTotalPedidosCliente(l: lista; var monto: real);
begin
	while (l^.sig <> nil) do begin
		monto:= monto + l^.datoL.monto;
		l:= l^.sig;
	end;
end;


{pp}
var
	abb: arbol;
	l: lista;
	cliente: integer;
	monto: real;
BEGIN
	abb:= nil;
	l:= nil;
	cargar(abb);

	cliente:= 50;
	pedidosDelCliente(abb, l, cliente);
	
	monto:= 0;
	montoTotalPedidosCliente(l, monto);
END.
