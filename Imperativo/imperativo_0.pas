program imperativo;


const
numeroSucursal = 5;
numeroVenta = 250;

type
cantSucursal = 1..numeroSucursal;
cantVentas = 1..numeroVenta;

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


procedure cargar();


procedure agregarFinal();
var

begin

end;

procedure minimo();
var

begin

end;

procedure merge(var v: vector; var l: lista);
var
	min, actual: integer;
	cant, cantTotal, monto, montoTotal: real;
begin
	l:= nil;
	minimo();
	while (min <> 999)
end;


var
	v: vector;
	l: lista;
BEGIN
	cargar(v);
	merge(v, l);
END.
