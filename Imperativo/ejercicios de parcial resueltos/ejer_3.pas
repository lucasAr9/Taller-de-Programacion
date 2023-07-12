program ejer_3;

const
sucursal = 5;
dimF = 100;

type
cantSucursales = 1..sucursal;
cantVentas = 1..dimF;

producto = record
	codigo: integer;
	cantidad: integer;
	monto: real;
end;

vectorProductos = array [cantVentas] of producto;
vector = array [cantSucursales] of vectorProductos;
vectorDL = array [cantSucursales] of integer;

lista = ^nodo;
nodo = record
	dato: producto;
	sig: lista;
end;


// Cargar los datos en un vector de vectores.
procedure leer(var p: producto);
begin
	p.codigo:= random(100) -1;
	p.cantidad:= random(100);
	p.monto:= random(500);
end;

procedure ordenarSeleccion(var v: vectorProductos; dimL: integer);
var
	i, j: integer;
	actual: producto;
begin
	for i:= 2 to dimL do begin
		actual:= v[i];
		j:= i -1;
		while (j > 0) and (v[j].codigo > actual.codigo) do begin
			v[j +1]:= v[j];
			j:= j -1;
		end;
		v[j +1]:= actual;
	end;
end;

procedure cargar(var v: vector; var vDL: vectorDL);
var
	p: producto;
	i: cantSucursales;
begin
	randomize;
	for i:= 1 to sucursal do begin
		leer(p);
		while (p.codigo <> -1) and (vDL[i] <= dimF) do begin
			vDL[i]:= vDL[i] + 1;
			v[i][vDL[i]]:= p;
			leer(p);
		end;
		ordenarSeleccion(v[i], vDL[i]);
	end;
end;

procedure inicializarVec(var v: vector; var vDL: vectorDL);
var
	i: cantSucursales;
	j: cantVentas;
begin
	for i:= 1 to sucursal do begin
		vDL[i]:= 0;
		for j:= 1 to dimF do begin
			v[i][j].codigo:= 0;
			v[i][j].cantidad:= 0;
			v[i][j].monto:= 0;
		end;
	end;
end;

procedure imprimir(v: vector; vDL: vectorDL);
var
	i: cantSucursales;
	j: cantVentas;
begin
	for i:= 1 to sucursal do begin
		writeln('----------------------------------------------', i, '----------------------------------------------');
		for j:= 1 to vDL[i] do begin
			writeln('Codigo: ', v[i][j].codigo, ' ');
		end;
		writeln();
	end;
end;


// Hacer merge acumulador de los vectores generando una lista.
procedure minimo(var min, monto: integer; var v: vector; var vDLActual, vDL: vectorDL);
var
	i, pos: integer;
begin
	pos:= -1;
	min:= 999;
	monto:= 0;
	
	for i:= 1 to sucursal do begin
		if (vDLActual[i] <= vDL[i]) and (min > v[i][vDLActual[i]].codigo) then begin
			min:= v[i][vDLActual[i]].codigo;
			pos:= i;
		end;
	end;
	
	if (pos <> -1) then begin
		monto:= v[pos][vDLActual[i]].cantidad;
		vDLActual[pos]:= vDLActual[pos] + 1;
	end;
end;

procedure agregarFinal(var l, ultimo: lista; actual, montoTotal: integer);
var
	nuevo: lista;
begin
	new(nuevo);
	nuevo^.dato.codigo:= actual;
	nuevo^.dato.cantidad:= montoTotal;
	nuevo^.sig:= nil;
	
	if (l = nil) then
		l:= nuevo
	else
		ultimo^.sig:= nuevo;
	ultimo:= nuevo;
end;

procedure merge(v: vector; vDL: vectorDL; var l: lista);
var
	actual, min: integer;
	montoTotal, monto: integer;
	vDLActual: vectorDL; i: integer;
	ultimo: lista;
begin
	l:= nil;
	ultimo:= nil;
	
	for i:= 1 to sucursal do
		vDLActual[i]:= 0;

	minimo(min, monto, v, vDLActual, vDL);
	while (min <> 999) do begin
		actual:= min;
		montoTotal:= 0;
		while (min <> 999) and (actual = min) do begin
			montoTotal:= montoTotal + monto;
			minimo(min, monto, v, vDLActual, vDL);
		end;
		agregarFinal(l, ultimo, actual, montoTotal);
	end;
end;


procedure calcularCant(l: lista; var cant: integer; max: integer);
begin
	if (l <> nil) then begin
		if (l^.dato.cantidad >= max) then
			cant:= cant + 1;
		l:= l^.sig;
	end;
end;


var
	v: vector;
	vDL: vectorDL;
	l: lista;
	cant, max: integer;
BEGIN
	inicializarVec(v, vDL);
	cargar(v, vDL);
	imprimir(v, vDL);
	merge(v, vDL, l);
	cant:= 0;
	max:= 500;
	calcularCant(l, cant, max);
	writeln('La cantidad de productos vendidos con cantMaxima 500 es: ', cant);
END.
