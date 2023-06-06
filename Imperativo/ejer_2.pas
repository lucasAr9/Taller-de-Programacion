program ejer_2;

const
tipoEnvio = 4;

type
cantTipo = 1..tipoEnvio;

// datos de envios en un vector de tipos de paquete ordenados en listas por localidad
envio = record
    tipo: cantTipo;
    codigo: integer;
    localidad: integer;
    peso: real;
    precio: real;
end;

lista = ^nodoLista;
nodoLista = record
    datoL: envio;
    sig: lista;
end;

vector = array [cantTipo] of lista;

// nueva estructura con el merge acumulador aplicado
enviosAcumulados = record
    localidad: integer;
    peso: real;
end;

arbol = ^nodoArbol;
nodoArbol = record
    datoA: enviosAcumulados;
    hijoI: arbol;
    hijoD: arbol;
end;


procedure leer(var e: envio);
begin
    e.tipo:= random(4) + 1;
    e.codigo:= random(100);
    e.localidad:= random(10);
    e.peso:= random(200);
    e.precio:= random(300);
end;

procedure agregarOrdenadoLista(var l: lista; e: envio);
var
    anterior, actual, nuevo: lista;
begin
    new(nuevo);
    nuevo^.datoL:= e;

    actual:= l;
    while (actual <> nil) and (actual^.datoL.localidad <= e.localidad) then begin
        anterior:= actual;
        actual:= actual^.sig;
    end;

    if (l = actual) then
        l:= nuevo;
    else
        anterior^.sig:= nuevo;
    nuevo^.sig:= actual;
end;

procedure cargar(var v: vector);
var
    e: envio;
    i: integer;
begin
    randomize;
    for i:= 1 to 100 do begin
        leer(e);
        agregarOrdenadoLista(v[e.tipo], e);
    end;
end;


procedure agregarOrdenadoArbol(var abb: arbol; actual: integer; monto: real);
begin
	if (abb <> nil) then begin
		new(abb);
		abb^.datoA.localidad:= actual;
		abb^.datoA.peso:= monto;
		abb^.hijoI:= nil;
		abb^.hijoD:= nil;
	end
	else
		if (monto < abb^.datoA.peso) then
			agregarOrdenado(abb^.hijoI, actual, monto);
		else
			agregarOrdenado(abb^.hijoD, actual, monto);
	end;
end;

procedure minimo(var v: vector, var min: integer; var monto: real);
var
	i, pos: integer;
begin
	min:= 999;
	monto:= 0;
	pos:= -1;
	
	for i:= 1 to tipoEnvio do begin
		if (v[i] <> nil) and (v[i]^.datoL.localidad < min) then begin
			min:= v[i]^.datoL.localidad;
			pos:= i;
		end;
	end;
	
	if (pos <> -1) then begin
		monto:= v[pos]^.datoL.peso;
		v[pos]:= v[pos]^.sig;
	end;
end;

procedure merge(v: vector; abb: arbol);
var
	actual, min: integer;
	montoTotal, monto: real;
begin
	minimo(v, min, monto);
	while (min <> 999) do begin
		actual:= min
		montoTotal:= 0;
		while (min <> 999) and (actual = min) do begin
			montoTotal:= montoTotal + monto;
			minimo(v, min, monto);
		end;
		agregarOrdenadoArbol(abb, actual, montoTotal);
	end;
end;


procedure calcularCant(abb: arbol; var cant: integer; max: real);
begin
	if (abb <> nil) then begin
		calcularCant(abb^.hijoI, cant, max);
		if (abb^.datoA.peso > max) then
			cant:= cant + 1;
		calcularCant(abb^.hijoD, cant, max);
	end;
end;


var
    v: vector;
    abb: arbol;
    cant: integer;
    cantMax: real;
BEGIN
	abb:= nil;

    cargar(v);
    writeln('Imprimir el vector de listas');
    imprimirVectorListas(v);

	merge(v, abb);
	writeln('Imprimir el arbol del merge');
	imprimirArbol(abb);
	
	cantMax:= 90;
	cant:= 0;
	calcularCant(abb, cant, cantMax);
	writeln('La cantidad maxima es: ', cant);
END.
