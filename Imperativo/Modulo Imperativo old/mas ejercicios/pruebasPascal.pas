
program pruebasPascal;

var
    num: integer;
    resul: real;
BEGIN
    num:= 35;
    resul:= num mod 10;
    writeln('el resultado de hacer ', num, ' mod 10 es: ', resul:2:2);
    resul:= num div 10;
    writeln('el resultado de hacer ', num, ' div 10 es: ', resul:2:2);
    resul:= num / 10;
    writeln('el resultado de hacer ', num, ' / 10 es: ', resul:2:2);

    resul:= num mod 2;
    writeln('el resultado de ', num, ' mod 2 es: ', resul:2:2);
    resul:= num div 2;
    writeln('el resultado de ', num, ' div 2 es: ', resul:2:2);
    resul:= num / 2;
    writeln('el resultado de ', num, ' / 2 es: ', resul:2:2);
END.

