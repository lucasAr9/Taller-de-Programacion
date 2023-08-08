program adicional_3;


const
numeroOficina = 300;

type
cantOficina = 1..numeroOficina;

oficina = record
    codigo: integer;
    dni: integer;
    expensas: real;
end;

vector = array [cantOficina] of oficina;


{cargar datos}
procedure leer(var o: oficina);
begin
    write('codigo: '); readln(o.codigo);
    if (o.codigo <> -1) then begin
        write('DNI: '); readln(o.dni);
        write('expensas: '); readln(o.expensas);
    end;
end;

procedure cargar(var v: vector; var dL: integer);
var
    o: oficina;
begin
    leer(o);
    while (dL <= numeroOficina) and (o.codigo <> -1) do begin
        dL:= dL + 1;
        v[dL]:= o;
        leer(o);
    end;
end;


{ordenar vector por insercion}
procedure ordenarInsercion(var v: vector; var dL: integer);
var
    i, j: integer;
    actual: oficina;
begin
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


{busqueda binaria}
procedure busquedaBinaria(v: vector; dL: integer; codigo: integer);
var
    primero, ultimo, medio: integer;
begin
    primero:= 1; ultimo:= dL;
    medio:= (primero + ultimo) div 2;

    while (primero <= ultimo) and (v[medio].codigo <> codigo) do begin
        if (codigo < v[medio].codigo) then
            ultimo:= medio - 1;
        else
            primero:= medio + 1;
        medio:= (primero + ultimo) div 2;
    end;

    if (primero <= ultimo) and (v[medio].codigo = codigo) then begin
        writeln('el dni del propietario es: ', v[medio].dni);
    end
    else
        writeln('no se encontro el codigo proporcionado.');
    end;
end;


{pp}
var
    v: vector;
    dL, codigo: integer;
BEGIN
    dL:= 0;
    codigo:= 34;
    cargar(v, dL);
    ordenarInsercion(v, dL);
    busquedaBinaria(v, dL, codigo);
END.
