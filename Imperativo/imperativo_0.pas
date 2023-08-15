program imperativo;


const
numeroSucursal = 5;

type
cantSucursal = 1..numeroSucursal;

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

vector = array [cantSucursal] of lista;


{cargar datos}
procedure cargar(var v: vector);
begin end;

{merge acumulador}
procedure agregarFinal(var l, ultimo: lista; actual: integer; cant: integer; monto: real);
var
	nuevo: lista;
begin
	new(nuevo);
	nuevo^.dato.codigo:= actual;
	nuevo^.dato.cantidad:= cant;
	nuevo^.dato.monto:= monto;
	nuevo^.sig:= nil;
	
	if (l = nil) then
		l:= nuevo
	else
		ultimo^.sig:= nuevo;
	ultimo:= nuevo;
end;

procedure minimo(var v: vector; var min: integer; var cant: integer; var monto: real);
var
	i, pos: integer;
begin
	min:= 999;
	pos:= -1;
	for i:= 1 to numeroSucursal do begin
		if (v[i] <> nil) and (v[i]^.dato.codigo < min) then begin
			min:= v[i]^.dato.codigo;
			pos:= i;
		end;
	end;
	if (pos <> -1) then begin
		cant:= v[pos]^.dato.cantidad;
		monto:= v[pos]^.dato.monto;
		v[pos]:= v[pos]^.sig;
	end;
end;

procedure merge(var v: vector; var l: lista);
var
	min, actual: integer;
	cant, cantTotal: integer;
	monto, montoTotal: real;
	ultimo: lista;
begin
	l:= nil;
	minimo(v, min, cant, monto);
	while (min <> 999) do begin
		actual:= min;
		cantTotal:= 0;
		montoTotal:= 0;
		while (min <> 999) and (actual = min) do begin
			cantTotal:= cantTotal + cant;
			montoTotal:= montoTotal + monto;
			minimo(v, min, cant, monto);
		end;
		agregarFinal(l, ultimo, actual, cantTotal, montoTotal);
	end;
end;


{pp}
var
	ve: vector;
	l: lista;
BEGIN
	cargar(ve);
	merge(ve, l);
END.
