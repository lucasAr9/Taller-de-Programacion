program ejer_4;


const
cantObraSocial = 5;


type
rangoObraSocial: 1..cantObraSocial;

paciente = record
	dni: integer;
	codigo: integer;
	obraSocial: rangoObraSocial;
	costoAbono: real;
end;

arbol = ^nodo;
nodo = record
	dato: paciente;
	hI: arbol;
	hD: arbol;
end;


lista = ^nodo;
nodo = record
	dato: paciente;
	sig: lista;
end;


procedure leer(var p: paciente);
var
	mismo: integer;
begin
	mismo:= random(5000);
	p.dni:= mismo;
	p.codigo:= mismo;
	p.obraSocial:= random(5) + 1;
	p.costoAbono:= random(5000);
end;

procedure agregarOrdenadoArbol(var abb: arbol; p: paciente);
begin
	if (abb = nil) then begin
		new(abb);
		abb^.dato:= p;
		abb^.hI:= nil;
		abb^.hD:= nil;
	end
	else
	if (p.dni < abb^.dato.dni) then
		agregarOrdenadoArbol(abb^.hI, p);
	else
		agregarOrdenadoArbol(abb^.hD, p);
	end;
end;


procedure cargar(var abb: arbol);
var
	p: paciente;
begin
	randomize;
	leer(p);
	while (p.codigo <> 0) do begin
		agregarOrdenadoArbol(abb, p);
		leer(p);
	end;
end;


procedure agregarFinalLista(var l, ultimo: lista; p: paciente);
var
	nuevo: lista;
begin
	new(nuevo);
	nuevo^.dato:= p;
	nuevo^.sig: nil;

	if (l = nil) then
		l:= nuevo;
	else
		ultimo^.sig:= nuevo;
	ultimo:= nuevo;
end;

procedure pacientesDeOsde(var l: lista; abb:arbol; desde, hasta: integer);
var
	ultimo: lista;
begin


// este recorre todo el arbol, tengo que hacer que corte antes ya que el arbol esta ordenado.


	if (abb <> nil) and (abb^.dato.codigo < hasta) then begin
		pacientesDeOsde(abb^.hI);
		if (abb^.dato.obraSocial = 3) and (abb^.dato.codigo > desde) then
			agregarFinalLista(l, ultimo, abb^.dato);
		pacientesDeOsde(abb^.hD);
	end;
end;


procedure aumentarAbono(abb: arbol; monto: real);
begin
	if (abb <> nil) then begin
		aumentarAbono(abb^.hI, monto);
		abb^.dato.costoAbono:= abb^.dato.costoAbono + monto;
		aumentarAbono(abb^.hD, monto);
	end;
end;


var
	abb: arbol;
	l: lista;
	desde, hasta: integer;
	monto: real;
BEGIN
	abb:= nil;
	cargar(abb);
	
	imprimirABB(abb);

	l:= nil;
	desde:= 23230;
	hasta:= 40400;
	pacientesDeOsde(l, abb, desde, hasta);

	monto:= 100;
	aumentarAbono(abb, monto);

	imprimirABB(abb);
END.
