program nombrePrograma;


const
numero_obra = 5;

type
cant_obras = 1.. numero_obra;

paciente = record
    dni: integer;
    cod: integer;
    obra_social: cant_obras;
    monto: real;
end;

arbol = ^nodoA;
nodoA = record
    dato: paciente;
    hI: arbol;
    hD: arbol;
end;

lista = ^nodoL;
nodoL = record
    dato: paciente;
    sig: lista;
end;


{leer informacion de los pacientes}
procedure leer(var p: paciente);
begin
    write('dni: '); readln(p.dni);
    if (p.dni <> -1) then begin
        write('codigo: '); readln(p.cod);
        write('obra social: '); readln(p.obra_social);
        write('monto: '); readln(p.monto);
    end;
end;

procedure agregarOrdenado(var abb: arbol; p: paciente);
begin
    if (abb = nil) then begin
        new(abb);
        abb^.dato:= p;
        abb^.hI:= nil;
        abb^.hD:= nil;
    end
    else begin
        if (p.dni < abb^.dato.dni) then
            agregarOrdenado(abb^.hI, p);
        else
            agregarOrdenado(abb^.hD, p);
    end;
end;

procedure cargar(var abb: arbol);
var
    p: paciente;
begin
    leer(p);
    while (p.dni <> -1) do begin
        agregarOrdenado(abb, p);
        leer(p);
    end;
end;


{los pacientes de osde entre a y b}
procedure agregarAtras(var l: lista; p: paciente);
var
    actual, nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato:= p;
    nuevo^.sig:= nil;

    if (l <> nil) then begin
        actual:= l;
        while (actual <> nil) do
            actual:= actual^.sig;
        actual^.sig:= nuevo;
    end
    else
        l:= nuevo;
end;

procedure los_de_osde(abb: arbol; codigo, a, b: integer; var l: lista);
begin
    if (abb <> nil) then begin
        if (a < abb^.dato.dni) then begin
            if (b > abb^.dato.dni) then begin
                los_de_osde(abb^.hI, codigo, a, b, l);
                if (abb^.dato.obra_social = codigo) then
                    agregarAtras(l, abb^.dato);
                los_de_osde(abb^.hD, codigo, a, b, l);
            end
            else
                los_de_osde(abb^.hI, codigo, a, b, l);
            end;
        end
        else
            los_de_osde(abb^.hD, codigo, a, b, l);
        end;
    end;
end;


{aumentar el costo abonado por sesion de todos los pacientes}
procedure aumentar_costo(var abb: arbol; monto: real);
begin
    if (abb <> nil) then begin
        aumentar_costo(abb^.hI, monto);
        abb^.dato.monto:= abb^.dato.monto + monto;
        aumentar_costo(abb^.hD, monto);
    end;
end;


{pp}
var
    abb: arbol;
    l: lista:
    codigo: integer;
    a, b: integer;
    monto: real;
BEGIN
    cargar(abb);
    codigo:= 3;
    a:= 40234;
    b:= 50234;
    los_de_osde(abb, codigo, a, b, l);
    monto:= 400;
    aumentar_costo(abb, monto);
END.
