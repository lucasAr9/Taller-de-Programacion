program ejer_1;


const
numeroOficina = 300;


type
cantOficinas = 1..numeroOficina;

oficinas = record
    codigo: integer;
    dniPropietario: integer;
    valorExpensa: real;
end;

vector = array [cantOficinas] of oficinas;


procedure leer(var o: oficina);
begin
    o.codigo:= random(300) - 1;
    if (o.codigo <> -1) then begin
        o.dniPropietario:= random(5000);
        o.valorExpensa:= random(300);
    end;
end;

procedure cargar(var v: vector; var dL: integer);
var
    o: oficina;
begin
    randomize;
    leer(o);
    while (dL <= numeroOficina) and (o.codigo <> -1) do begin
        dL:= dL + 1;
        v[dL]:= o;
        leer(o);
    end;
end;


procedure ordenarInsercion(var v: vector; dL: integer);
var
    i, j: integer;
    actual: o;
begin
    actual:= nil;
    for i:= 2 to dL do begin
        actual:= v[i];
        j:= i - 1;
        while (j > 0) and (v[j].codigo > actual.codigo) do begin
            v[j + 1]:= v[j];
            j:= j - 1;
        end;
        v[j + 1]:= actual;
    end;
end;




var
    v: vector;
    dL: integer;
BEGIN
    dL:= 0;
    cargar(v, dL);
    imprimir(v, dL);
    ordenarInsercion(v, dL);
    imprimir(v, dL);
END.
