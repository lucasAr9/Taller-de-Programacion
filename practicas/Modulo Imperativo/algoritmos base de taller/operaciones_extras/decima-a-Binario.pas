{
	un procedimiento recursivo que escribe el equivalente en binario de un número decimal.
}

program binarios;

{ calcular los 0 y 1 de un numero decimal }
procedure decimalBinario(num, bin, dig: integer);
var
	i: integer;
begin
	if (num <> 0) then begin
		dig:= num div 2;
 	    i:= num;
		num:= dig;
		decimalBinario(num, bin, dig);
        bin:= 10 * bin + (i mod 2);
        write(i mod 2);
	end;
end;



var
	num, dig, bin: integer;
begin
	dig:= 0; bin:= 0;
	write('Ingrese un numero: '); readln(num);
	while (num <> 0) do begin
		decimalBinario(num, bin, dig);
		writeln(' ');
		write('Ingrese un numero: '); readln(num);
	end;
end.

