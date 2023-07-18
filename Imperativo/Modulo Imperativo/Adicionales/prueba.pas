{ un programa que lee numeros random y los guarda en un vector de manera ordenada
y luego imprime el vector ordenado }


program prueba;

const
dimF = 50;

type

vector = array [1..dimF] of integer;



{ no inserta bien el primer elemento ingresado }
procedure insertarOrdenado(var v: vector; var dL: integer; num: integer);
var
    i, j: integer;
begin
    i:= 1;

    if (dL < dimF) then begin

        while (i < dL) and (v[i] < num) do
            i:= i +1;

        for j:= dL downto i do
            v[j +1]:= v[j];

        v[i]:= num;
        dL:= dL +1;
    end;
end;

procedure cargarVector(var v: vector; var dL: integer);
var
    num: integer;
begin
    dL:= 0;
    writeln('leer numeros: ');
    readln(num);
    while (num <> 0) do begin
        insertarOrdenado(v, dL, num);
        readln(num);
    end;
end;



procedure imprimir(v: vector; dL: integer);
var
    i: integer;
begin
    for i:= 1 to dL do
        write(v[i], ', ');
end;



var
    v: vector;
    dL: integer;
BEGIN
    cargarVector(v, dL);
    imprimir(v, dL);
END.
