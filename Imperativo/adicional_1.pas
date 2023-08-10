program adicional_1;


const
maxPorCategoria = 250;
numeroCategoria = 20;

type
cantMaxPorCategoria = 1..maxPorCategoria;
cantCategoria = 1..numeroCategoria;

empleado = record
    legajo: integer;
    dni: integer;
    categoria: cantCategoria;
    anioIngreso: integer;
end;

arbol = ^nodo;
nodo = record
    dato: empleado;
    hI: arbol;
    hD: arbol;
end;

vector = array [cantMaxPorCategoria] of empleado;


{cargar datos en el arbol}
procedure agregarOrdenado(var abb: arbol; e: empleado);
begin
    if (abb = nil) then begin
        new(abb);
        abb^.dato:= e;
        abb^.hI:= nil;
        abb^.hD:= nil;
    end
    else
        if (e.legajo < abb^.dato.legajo) then
            agregarOrdenado(abb^.hI, e);
        else
            agregarOrdenado(abb^.hD, e);
        end;
    end;
end;

procedure leer(var e: empleado);
begin
    write(''); readln(...);
end;

procedure cargar(var abb: arbol);
var
    e: empleado;
begin
    leer(e);
    while (e.legajo <> 0) do begin
        agregarOrdenado(abb, e);
        leer(e);
    end
end;


{empleados entre legajos "A" y "B" de la categoria "c"}
procedure entreLegajos(abb: arbol; var v: vector; var dL: integer; A, B, c: integer);
begin
    if (abb <> nil) then begin
        if (abb^.dato.legajo > A) then begin
            if (abb^.dato.legajo < B) then begin
                entreLegajos(abb^.hI, v, dL, A, B, c);
                if (abb^.dato.categoria = c) then begin
                    if (dL <= maxPorCategoria) then begin
                        dL:= dL + 1;
                        v[dL]:= abb^.dato;
                    end;
                end;
                entreLegajos(abb^.hD, v, dL, A, B, c);
            end
            else
                entreLegajos(abb^.hI, v, dL, A, B, c);
            end;
        end
        else
            entreLegajos(abb^.hD, v, dL, A, B, c);
        end;
    end;
end;


{promedio de los numeros de dni}
procedure promedio(v: vector; i, dL: integer): real;
begin
    if(i <= dL)then
        promedio:= v[i].legajo / dL + promedio(v, i+1, dL);
end;


var
    abb: arbol;
    v: vector;
    i, dL: cantMaxPorCategoria;
    A, B, c: integer;
    promedio: real;
BEGIN
    i:= 1; dL:= 0;
    cargar(abb);
    entreLegajos(abb, v, dL, A, B, c);
    writeln('el promedio de los DNI es: ', promedio(v, i, dL));
END.
