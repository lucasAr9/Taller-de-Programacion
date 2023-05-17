{
5. Escribir un programa que:
	
	a. Implemente un módulo que genere un vector de 20 números enteros.	
	b. Implemente un módulo recursivo que devuelva el máximo valor del vector.
	c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos
	en el vector.
}


program vectorRecursivo;
const
	dimf = 20;
type
	vNum = array [1..dimf] of integer;

{----------------------------------------------------------------------}
//a
procedure cargarVector (var v: vNum);
var
	i, n: integer;
begin
	Randomize;
	for i:= 1 to dimf do begin
		n := random(80-20)+20;
		v[i]:= n;
	end;
end;

{----------------------------------------------------------------------}
//b
procedure devolverMax (v: vNum; var max: integer; i: integer);
begin
	if (i <= dimf) then begin
		if (v[i] > max) then
			max:= v[i];
		devolverMax(v,max,i +1);
	end;
end;

{----------------------------------------------------------------------}
//c
procedure devolverSuma (v: vNum; var suma: integer; i: integer);
begin
	if (i <= dimf) then begin
		suma := suma + v[i];
		devolverSuma(v,suma,i +1);
	end;
end;

{----------------------------------------------------------------------}

var
	v: vNum;
	i,j,max,suma: integer;
begin
	max:= -9999;
	j:= 1;
	cargarVector(v);
	for i:= 1 to dimf do begin
		writeln('Elemento ',i,' = ',v[i]);
	end;
	writeln('--------------------------------------------------------');
	devolverMax(v,max,j);
	writeln('El maximo es: ',max);
	writeln('--------------------------------------------------------');
	j:= 1;
	devolverSuma(v,suma,j);
	writeln('La suma total de todos los elementos es: ',suma);
end.

