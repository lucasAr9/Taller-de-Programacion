{
	4. Escribir un programa que:
	
	a. Implemente un módulo que genere una lista a partir de la lectura de números
	enteros. La lectura finaliza con el número -1.
	
	b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.
	
	c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.
	
	d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado
	se encuentra en la lista o falso en caso contrario
}


program listaRecursiva;
type
	lista = ^nodo;
	nodo = record
		dato: integer;
		sig: lista;
	end;

{----------------------------------------------------------------------}
//a
procedure agregarAdelante(var l: lista; n: integer);
var
	aux: lista;
begin
	new(aux);
	aux^.dato := n;
	aux^.sig:= l;
	l:= aux;
end;

procedure leerNumeros(var l: lista);
var
	num: integer;
begin
	Randomize;
	//num := random(30);
	readln(num);
	while (num <> -1) do begin
		agregarAdelante(l,num);
		//num:= random(30);
		readln(num);
	end;
end;

{----------------------------------------------------------------------}
//b
procedure devolverMin(l: lista; var min: integer);
begin
	if (l <> nil) then begin
		if (l^.dato < min) then 
			min := l^.dato;
		l:= l^.sig;
		devolverMin(l,min);
	end;
end;
//c
procedure devolverMax(l: lista; var max: integer);
begin
	if (l <> nil) then begin
		if (l^.dato > max) then
			max := l^.dato;
		l:= l^.sig;
		devolverMax(l,max);
	end;
end;

{----------------------------------------------------------------------}
//d
function buscarElemento (l:lista; x: integer):boolean;
begin
	if (l = nil) then
		buscarElemento := false
	else
		if (l <> nil) and (l^.dato <> x) then begin
			l:= l^.sig;
			buscarElemento := buscarElemento (l,x);
		end;
	if (l^.dato = x) then
		buscarElemento:= true;
		
end;

{----------------------------------------------------------------------}

var
	
	l: lista;
	min, max: integer;
	buscar: boolean;
begin
	l:= nil;
	min:= 999;
	max:= -99;
	leerNumeros(l);
	devolverMin (l,min);
	writeln('el elemento minimo es: ',min);
	devolverMax(l,max);
	writeln('El elemento maximo es: ',max);
	buscar := buscarElemento(l,5);
	writeln(buscar);
end.

