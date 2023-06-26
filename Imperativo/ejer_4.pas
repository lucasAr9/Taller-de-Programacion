program ejer_4;


const
obraSoci = 5;


type
cantObraSocial: 1..obraSoci;

paciente = record
	dni: integer;
	codigo: integer;
	obraSocial: cantObraSocial;
	costoAbono: real;
end;

arbol = ^nodo;
nodo = record
	dato: paciente;
	hI: arbol;
	hD: arbol;
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

procedure agregarOrdenado(var abb: arbol; p: paciente);
begin
	if (abb = nil) then begin
		new(abb);
		abb^.dato:= p;
		abb^.hI:= nil;
		abb^.hD:= nil;
	end
	else
	if (p.dni < abb^.dato.dni) then
		agregarOrdenado(abb^.hI, p);
	else
		agregarOrdenado(abb^.hD, p);
	end;
end;


procedure cargar(var abb: arbol);
var
	p: paciente;
begin
	randomize;
	leer(p);
	// continuar
end;





var
	abb: arbol;
BEGIN
	cargar(abb);
END.
