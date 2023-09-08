{ 
1. Una aerolínea dispone de un árbol binario de búsqueda con la información de sus
empleados. De cada empleado se conoce: Número de legajo, Dni, Categoría (1..20) y año de
ingreso a la empresa. El árbol se encuentra ordenado por número de legajo. Se solicita:

a. Implementar un módulo que reciba el árbol de empleados, número de legajo “A”,
número de legajo “B” y un número de categoría, y retorne un vector ordenado por
número de legajo. El vector debe contener el número de legajo y Dni de aquellos
empleados cuyo número de legajo se encuentra comprendido entre los números de
legajo recibidos (“A” y “B”, siendo “A” menor que “B”) y la categoría se corresponda con
la recibida por parámetro. Por norma de la empresa, cada categoría puede contar con
a lo sumo 250 empleados.

b. Implementar un módulo recursivo que reciba la información generada en “a” y retorne
el promedio de los números de Dni.
}
{ modifique el ejercicio para que en ves de que sea un vector de 250 que se genere, que 
sea una lista }

program adicional_1;

const
categoria = 20;
empleados = 250;

type
cantCategorias = 1..categoria;
cantEmpleados = 1..empleados;

empleado = record
    legajo: integer;
    dni: integer;
    cate: cantCategorias;
    anioIngreso: 2000..2021;
end;

arbol = ^nodo;
nodo = record
    dato: empleado;
    hI: arbol;
    hD: arbol;
end;

newEmple = record
    legajo: integer;
    dni: integer;
end;

vector = array [cantEmpleados] of newEmple;



{ carga del arbol }
procedure leer(var e: empleado);
begin
    e.legajo:= random(40) -1;
    if (e.legajo <> -1) then begin
        e.dni:= random(4000);
        e.cate:= random(10);
        e.anioIngreso:= random(40);
    end;
end;

procedure armarNodo(var abb: arbol; e: empleado);
begin
    if (abb = nil) then begin
        new(abb);
        abb^.dato:= e;
        abb^.hI:= nil;
        abb^.hD:= nil;
    end
    else
    if (e.legajo < abb^.dato.legajo) then
        armarNodo(abb^.hI, e)
    else
        armarNodo(abb^.hD, e);
end;

procedure cargar(var abb: arbol);
var
    e: empleado;
begin
    randomize;
    abb:= nil;
    leer(e);
    while (e.legajo <> -1) do begin
        armarNodo(abb, e);
        leer(e);
    end;
end;



{ generar un vector entre los legajos A y B de la categoria numCate }
procedure entreLegajos(var v: vector; var dL: integer; A, B, numCate: integer; abb: arbol);
begin
    if (abb <> nil) and (dL < empleados) then begin
      
        if (abb^.dato.legajo > A) then begin

            if (abb^.dato.legajo < B) then begin
			       entreLegajos(v, dL, A, B, numCate, abb^.hI);

                if (abb^.dato.cate = numCate) then begin
                    dL:= dL +1;
                    v[dL].legajo:= abb^.dato.legajo;
                    v[dL].dni:= abb^.dato.dni;
                end;

                entreLegajos(v, dL, A, B, numCate, abb^.hD);
            end
      		else
                entreLegajos(v, dL, A, B, numCate, abb^.hI);      
        end
        else
            entreLegajos(v, dL, A, B, numCate, abb^.hD);
    end;
end;



{ calcular el promeido de los DNI }
function suma(v: vector; dL: integer): real;
begin
    if (dL = 0) then
        suma:= 0
    else
        suma:= suma(v, dL -1) + v[dL].dni;
end;



procedure imprimir(abb: arbol);
begin
    if (abb <> nil) then begin
        imprimir(abb^.hI);
        writeln('');
        writeln('legajo: ', abb^.dato.legajo);
        writeln('DNI: ', abb^.dato.dni);
        writeln('de la categoria: ', abb^.dato.cate);
        imprimir(abb^.hD);
    end;
end;



procedure impirmirVec(v: vector; dL: integer);
var
    i: integer;
begin
    for i:= 1 to dL do begin
        writeln(v[i].legajo);
        writeln(v[i].dni);
    end;
end;



var
    abb: arbol;
    A, B, numCate: integer;
    v: vector;
    dL: integer;
    promedio: real;
BEGIN
    dL:= 0;

    cargar(abb);
    imprimir(abb);
    write('A: '); readln(A);
    write('B: '); readln(B);
    write('categoria: '); readln(numCate);
    entreLegajos(v, dL, A, B, numCate, abb);
    impirmirVec(v, dL);

    promedio:= suma(v, dL) / dL;
    writeln('el promedio de los DNI es: ', promedio:2:2);
END.
