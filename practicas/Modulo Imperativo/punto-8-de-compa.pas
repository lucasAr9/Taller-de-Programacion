{
   8. Escribir un programa que:
	
	a. Implemente un módulo que lea números enteros y los almacene en un árbol
	binario de búsqueda. La lectura finaliza con el valor 0.
	
	b. Una vez generado el árbol, realice módulos independientes para:
	
		i. Obtener el número más grande.
	
		ii. Obtener el número más chico.
	
		iii. Obtener la cantidad de elementos.
	
		iv. Informar los números en orden creciente.
	
		v. Informar los números pares en orden decreciente.
}


program arboles;
type
	arbol = ^nodo; 
	nodo = record
		dato: integer;
		hi: arbol;
		hd: arbol;
	end;

{----------------------------------------------------------------------}
//a --> carga el arbol
procedure cargarArbol (var a: arbol; n: integer);
begin
	if (a = nil) then begin
		new(a);
		a^.dato := n; 
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else
		if (n < a^.dato) then
			cargarArbol(a^.hi,n)
		else if (n > a^.dato) then
			cargarArbol(a^.hd,n);
end;

{----------------------------------------------------------------------}
//b i --> busca el maximo y devuelve el puntero
function obtenerMax (a: arbol): arbol;
begin
	if (a = nil) then begin
		obtenerMax := a;
	end
	else
		if (a^.hd = nil) then begin
			obtenerMax := a
		end
		else
			obtenerMax := obtenerMax(a^.hd);
end;

//b ii --> busca el minimo y devuelve el puntero
function obtenerMin (a: arbol):arbol;
begin
	if (a = nil) then begin
		obtenerMin := a;
	end
	else
		if (a^.hi = nil) then begin
			obtenerMin := a;
		end
		else
			obtenerMin := obtenerMin(a^.hi);
end;

{----------------------------------------------------------------------}
//b iii --> suma todos los elementos del arbol
procedure total (a: arbol; var suma: integer);
begin
	if (a <> nil) then begin
		total(a^.hd,suma);
		suma := suma + 1;
		total(a^.hi,suma);
	end;
end;

{----------------------------------------------------------------------}
//b iv --> imprime todo el arbol en orden creciente
procedure imprimirCreciente (a: arbol);
begin
	if (a <> nil) then begin
		imprimirCreciente(a^.hi);
		writeln(a^.dato);
		imprimirCreciente(a^.hd);
	end;
end;

{----------------------------------------------------------------------}
//b v --> imprime los nros pares en orden decreciente
procedure imprimirParesDecreciente (a: arbol);
begin
	if ( (a <> nil) and ((a^.dato mod 2) = 0) ) then begin
		imprimirParesDecreciente(a^.hd);
		writeln(a^.dato);
		imprimirParesDecreciente(a^.hi);
	end;
end;

{ BUSCAR SIN UN ORDEN *PROCESO* devuelve puntero }
procedure buscar(abb: arbol; num: integer; var estoEs: arbol);
begin
    if (abb = nil) then
        estoEs:= nil
    else
    if (num = abb^.dato) then
        estoEs:= abb
    else begin
        buscar(abb^.hi, num, estoEs);
        if (estoEs = nil) then
            buscar(abb^.hd, num, estoEs);
    end;
end;

{----------------------------------------------------------------------}
//Programa Principal
var
	abb, max, min: arbol;
	num,suma: integer;
	aux: arbol;
begin
	abb := nil;
	suma := 0;
	writeln('Ingrese un numero: ');
	read(num);
	while (num <> 0) do begin
		cargarArbol (abb,num);
		writeln('Ingrese un numero: ');
		read(num);
	end;
	
	writeln();
	max:= obtenerMax(abb);
	writeln('El elemento maximo es: ',max^.dato);
	
	writeln();
	min:= obtenerMin(abb);
	writeln('El elemento minimo es: ',min^.dato);
	
	writeln();
	total(abb,suma);
	writeln('La cantidad de elementos del arbol es: ',suma);
	
	writeln();
	writeln('imprimir creciente todos.');
	imprimirCreciente(abb);
	
	writeln();
	writeln('imprimir decreciente los pares.');
	imprimirParesDecreciente(abb);


	writeln();
	writeln('numero para buscar.');
	readln(num);
	buscar(abb, num, aux);
	if (aux <> nil) then
		writeln('asi es, dio: ', aux^.dato)
	else
		writeln('esto dio nil');
end.

