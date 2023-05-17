{ modulos para sacar el factoreal de un numero }
// modulo con java
{ 
        System.out.print("un numero para factorear: ");
        int num = Lector.leerInt();
        int res = 1;

        for (int i = num; i > 1; i--)
            res = res * i;

        System.out.println("el resultado de " + num + "! es: " + res);
}
// con pascal
procedure factoreal(num: integer);
var
    i, res: integer;
begin
    res:= 1;
    for i:= num downto 1 do
        res:= res * i;

    writeln('el resultado de ', num, '! es: ', res);
end;




{ modulo para sacar la potencia de manera iterativa }
procedure potenciaA(num, n: integer);
var
    i, pot: integer;
begin
    if (n = 0) then
        pot:= 1
    else begin
        pot:= 1;
        for i:= 1 to n do
            pot:= pot * num;
    end;

    writeln('el resultado de la potencia es: ', pot);
end;
{ modulos para sacar la potencia de matera recursiva }
// con proceso
procedure potenciaB(num, n: integer; var pot: integer);
begin
    if (n = 0) then
        pot:= 1
    else begin
        potenciaB(num, (n-1), pot);
        pot:= pot * num;
    end;
end;
// con funcion
function potenciaC(num, n: integer): integer;
begin
    if (n = 0) then
        potenciaC:= 1
    else
        potenciaC:= num * potenciaC(num, n-1);
end;





var
    num, n: integer;
BEGIN
    write('numero para factorear y sacar potencia: '); readln(num);
    write('la potencia de? '); readln(n);
    factoreal(num);

    potenciaA(num, n);

    writeln('el resultado de la potencia es: ', potenciaC(num, n));
END.

