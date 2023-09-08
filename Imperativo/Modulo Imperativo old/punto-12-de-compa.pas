{
	12. Implementar un programa que procese la información de las ventas de productos de una
	librería que tiene 4 sucursales. De cada venta se lee fecha de venta, código del producto
	vendido, código de sucursal y cantidad vendida. El ingreso de las ventas finaliza cuando se
	lee el código de sucursal 0.
	Implementar un programa que:
	
	a. Almacene las ventas ordenadas por código de producto y agrupados por sucursal,
	en una estructura de datos adecuada.
	
	b. Contenga un módulo que reciba la estructura generada en el punto a y retorne
	una estructura donde esté acumulada la cantidad total vendida para cada código de
	producto.
}


program venta_libreria;
const
	df = 4;
type
	rango = 1..df;
	rFecha = record
		dia: 1..31;
		mes: 1..12;
		anio: 2019..2021;
	end;
	
	rVenta = record
		fecha: rFecha;
		codigo: integer;
		sucursal: integer;
		cantidad: integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: rVenta;
		sig: lista;
	end;
	
	vecVentas = array [rango] of lista;
{----------------------------------------------------------------------}
// zona de carga e impresion de los datos de la venta
procedure leerFecha (var f: rFecha);
begin
	writeln('Ingrese la fecha: (d/m/a) ');
	f.dia:= random(32);
	f.mes:= random(13);
	f.anio:= random(21);
end;	

procedure leerVenta (var ven: rVenta );
begin
	Randomize;
	// writeln('Sucursal: ');
	ven.sucursal:= random(10);
	if (ven.sucursal <> 0) then begin
		leerFecha(ven.fecha);
		// writeln('Codigo: ');
		ven.codigo := random(10);
		// writeln('Cantidad: ');
		ven.cantidad := random(200);
	end;
end;

procedure insertarOrd (var l: lista; vent: rVenta);
var
	nue, ant, act: lista;
begin
	new(nue);
	nue^.dato:= vent;
	ant:=l;
	act:=l;
	while (act <> nil) and (act^.dato.codigo < vent.codigo) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (ant = act) then 
		l:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;

procedure cargarVentas (var v: vecVentas);
var
	ven: rVenta;
begin
	leerVenta(ven);
	while (ven.sucursal <> 0) do begin
		insertarOrd(v[ven.sucursal],ven);
		leerVenta(ven);
	end;
end;	
	
procedure imprimir (v: vecVentas);
var
	i: integer;
	l:lista;
begin
	for i:= 1 to df do begin
		writeln('---Venta sucursal ',i,'---');
		l:= v[i];
		while (l <> nil) do begin
			write('Fecha: ', l^.dato.fecha.dia);
			write('/', l^.dato.fecha.mes);
			write('/', l^.dato.fecha.anio);
			writeln();
			writeln('Codigo: ', l^.dato.codigo);
			writeln('Cantidad: ', l^.dato.cantidad);
			writeln('----------------------------------------------');
			// l:= l^.sig;
		end;
	end;
end;
	
{----------------------------------------------------------------------}
//zona de codigos pertenecientes al merge de lista
{b. Contenga un módulo que reciba la estructura generada en el punto a y retorne
	una estructura donde esté acumulada la cantidad total vendida para cada código de
	producto.}

procedure agregarAtras (var l, ult: lista; min: rVenta);
var
	nue: lista;
begin
	writeln('agregar atras');
	new(nue);
	nue^.dato:= min;
	nue^.sig:= nil;
	if (l <> nil) then 
		ult^.sig:= nue
	else
		l:= nue;
	ult:= nue;
end;

procedure buscarMinimo(var punteros: vecVentas; var min: rVenta);
var
	indiceMin, i: integer;
begin
	writeln('Busco minimo');
	min.sucursal:= 999;
	indiceMin := -1;
	for i:= 1 to df do begin
		if (punteros[i] <> nil) then begin
			if (punteros[i]^.dato.sucursal < min.sucursal) then begin
				indiceMin:= i;
				min.sucursal:= punteros[i]^.dato.sucursal;
			end;
		end;
	end;
	if (indiceMin <> -1) then begin
		min.cantidad := punteros[indiceMin]^.dato.cantidad;
		punteros[indiceMin] := punteros[indiceMin]^.sig;
	end;
end;

procedure merge (punt: vecVentas; var lNueva: lista);
var
	actual, min: rVenta;
	ult: lista;
begin
	writeln('merge');
	lNueva:= nil;
	buscarMinimo(punt, min );
	while (min.sucursal <> 999) do begin
		actual.sucursal := min.sucursal;
		actual.cantidad := 0;
		while (min.sucursal <> 999) and (min.sucursal = actual.sucursal) do begin
			actual.cantidad := actual.cantidad + min.cantidad;
			buscarMinimo(punt,min);
		end;
		writeln('Total--> Codigo: ',actual.sucursal);
		writeln('Cantidad: ',actual.cantidad);
		writeln('----------------------------------------------------');
		agregarAtras(lNueva,ult,actual);
	end;
end;

{----------------------------------------------------------------------}
var
	v: vecVentas;
	listaNueva: lista;
begin
	writeln('---Carga de las ventas---');
	cargarVentas(v);
	imprimir(v);
	
	writeln();
	merge(v, listaNueva);

	writeln('---Se imprime la nueva lista---');
	while (listaNueva <> nil) do begin
		writeln('sucursal: ', listaNueva^.dato.sucursal);
		writeln('Cantidad: ', listaNueva^.dato.cantidad);
		listaNueva:= listaNueva^.sig;
	end;
end.


{ lo modifico para que en vez de el total por cada codigo de producto, sea el total de cada sucursal }