program ejer_10;


type
alumno = record
    legajo: integer;
    apellido: String[20];
    nombre: String[20];
    dni: integer;
    ingreso: integer;
end;

arbol = ^nodo;
nodo = record
    dato: alumno;
    hI: arbol;
    hD: arbol;
end;


procedure agregarOrdenado(var abb: arbol; alu: alumno);
begin
    if (abb = nil) then begin
        new(abb);
        abb^.dato:= alu;
        abb^.hI: nil;
        abb^.hD: nil;
    else
    end begin
        if (alu.legajo < abb^.dato.legajo) then
            agregarOrdenado(abb^.hI, alu);
        else
            agregarOrdenado(abb^.hD, alu);
    end;
end;

procedure leer(var alu: alumno);
begin
    write('legajo: '); readln(alu.legajo);
    if (alu.legajo <> 0) then begin
        write('apellido: '); readln(alu.apellido);
        write('nombre: '); readln(alu.nombre);
        write('dni: '); readln(alu.dni);
        write('ingreso: '); readln(alu.ingreso);
    end;
end;

procedure cargar(var abb: arbol);
var
    alu: alumno;
begin
    leer(alu);
    while (alu.legajo <> 0) do begin
        agregarOrdenado(abb, alu);
        leer(alu);
    end;
end;


procedure entreLegajos(abb: arbol; legajo1: integer; legajo2: integer);
begin
    if (abb <> nil) then begin
        if (legajo1 < abb^.dato.legajo) then begin
            if (legajo2 > abb^.dato.legajo) then begin
                entreLegajos(abb^.hI, legajo1, legajo2);
                writeln(abb^.dato.legajo);
                entreLegajos(abb^.hD, legajo1, legajo2);
            else
                entreLegajos(abb^.hI, legajo1, legajo2);
            end;
        else
            entreLegajos(abb^.hD, legajo1, legajo2);
        end;
    end;
end;


var
    abb: arbol;
    legajo1, legajo2: integer;
BEGIN
    cargar(abb);
    entreLegajos(abb, legajo1, legajo2);
END.
