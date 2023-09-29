program nombrePrograma;


const
numero_obra = 5;

type
cant_obras = 1.. numero_obra;

paciente = record
    dni: integer;
    cod: integer;
    obra_social: cant_obras;
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
procedure leer();
begin

end;

procedure agregarOrdenado();
begin

end;

procedure cargar(var abb: arbol);
var

begin

end;


{los pacientes de osde entre a y b}
procedure los_de_osde(abb: arbol; codigo, a, b: integer; var l: lista);
begin

end;


{aumentar el costo abonado por sesion de todos los pacientes}
procedure aumentar_costo();
begin

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
