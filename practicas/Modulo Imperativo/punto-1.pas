{ 
1.  El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de las expensas
    de dichas oficinas.
    Implementar un programa modularizado que:
    
    a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De
    cada oficina se ingresa el código de identificación, DNI del propietario y valor de la expensa.
    La lectura finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
    b. Ordene el vector, aplicando el método de inserción, por código de identificación de la oficina.
    c. Ordene el vector, aplicando el método de selección, por código de identificación de la oficina.
}

program punto1;

const
dimF = 100;

type
cantOficinas = 1..dimF;

oficina = record
    codigo: cantOficinas;
    DNIprop: integer;
    expensas: real;
end;

vector = array [cantOficinas] of oficina;

procedure ordenarInsercion(var v: vector; dL: integer);
var
    i, j: integer;
    actual: oficina;
begin
    for i:= 2 to dL do begin
        actual:= v[i];
        j:= i -1;
        while (j > 0) and (v[j].codigo > actual.codigo) do begin
            v[j +1]:= v[j];
            j:= j -1;
        end;
        v[j +1]:= actual;
    end;
end;

procedure ordenarSeleccion(var v: vector; dL: integer);
var
    i, j, p: integer;
    aux: oficina;
begin
    for i:= 1 to dL -1 do begin
        p:= i;
        for j:= i+1 to dimF do begin
            if v[j] < v[p] then
                p:= j;
        end;
        aux:= v[p];
        v[p]:= v[i];
        v[i]:= aux;
    end;
end;

procedure leerOficina(var o: oficina);
begin
    o.codigo:= random(100);
    o.DNIprop:= random(1000);
    o.expensas:= random(500);
end;
procedure cargar(var v: vector; var dL: integer);
var
    o: oficina;
begin
    dL:= 0;
    randomize;
    leerOficina(o);
    while (dL <= dimF) and (o.codigo <> -1) do begin
        dL:= dL +1;
        v[dL]:= o;
        leerOficina(o);
    end;
end;


var
    v: vector;
    dL: integer;
BEGIN
    cargar(v, dL);
    ordenarInsercion(v, dL);
    ordenarSeleccion(v, dL);
END.

