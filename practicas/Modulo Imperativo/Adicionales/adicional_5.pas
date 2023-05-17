{ 
5. Una cadena de gimnasios que tiene 5 sucursales necesita procesar las asistencias de los
clientes. Implementar un programa con:

a. Un módulo que lea la información de las asistencias realizadas en las sucursales y
genere una estructura con código de cliente, dni de cliente, fecha y cantidad de
minutos que asistió a la sucursal, agrupados por sucursal. Para cada sucursal, los
clientes deben estar ordenados por código de cliente. De cada asistencia se lee: código
de sucursal (1..5), dni del cliente, código del cliente, fecha y cantidad de minutos que
asistió. La lectura finaliza con el código de cliente -1, el cual no se procesa.

b. Un módulo que reciba la estructura generada en a) y utilizando la técnica de merge o
merge acumulador genere un árbol ordenado por dni que contenga el dni de cliente y
la cantidad total de veces que asistió a las sucursales del gimnasio.
}

program adicional_5;

const
sucursal = 5;

type
cantSuc = 1..sucursal;

fecha = record
    dia: 1..30;
    mes: 1..12;
end;

asistencia = record
    sucur: cantSuc;
    codigo: integer;
    dni: integer;
    f: fecha;
    minutos: integer;
end;

{ para ordenar los clientes por codigo y agrupados por sucursal en el vector }
lista = ^nodoLista;
nodoLista = record
    dato: asistencia;
    sig: lista;
end;

vector = array [cantSuc] of lista;

{ para el merge que se genera un arbol con la cant de asistencias de un cliente }
cliente = record
    dni: integer;
    cantTotal: integer;
end;

arbol = ^nodoArbol;
nodoArbol = record
    dato: cliente;
    hI: arbol;
    hD: arbol
end;




{ inicializar el vector de listas }
procedure inicializar(var v: vector);
var i: cantSuc;
begin
    for i:= 1 to sucursal do
        v[i]:= nil;
end;

{ generar la informacion de las asistencias de manera random }
procedure leer(var a: asistencia);
var
    mismoDNICod: integer;
begin
    mismoDNICod:= random(25);
    a.codigo:= mismoDNICod; { ya que la misma persona siempre tiene el mismo DNI y codigo }
    a.sucur:= random(5) +1;
    a.dni:= mismoDNICod;
    a.f.dia:= random(29) +1;
    a.f.mes:= random(11) +1;
    a.minutos:= random(90) +1;
end;

{ agregar los nodos a la lista ordenando por codigo }
procedure armarNodo(var l: lista; asis: asistencia);
var
    nuevo, anterior, actual: lista;
begin
    new(nuevo);
    nuevo^.dato:= asis;

    actual:= l;
    while (actual <> nil) and (asis.codigo > actual^.dato.codigo) do begin
        anterior:= actual;
        actual:= actual^.sig;
    end;

    if (l = actual) then
        l:= nuevo
    else
        anterior^.sig:= nuevo;
    nuevo^.sig:= actual;
end;

{ cargar los datos agrupando por sucursal }
procedure cargar(var v: vector);
var
    i: integer;
    asis: asistencia;
begin
    randomize;
    for i:= 1 to 100 do begin
        leer(asis);
        armarNodo(v[asis.sucur], asis);
    end;
end;

{ umprimir el vector de sucursales }
procedure imprimirVec(v: vector);
var i: cantSuc;
begin
    for i:= 1 to sucursal do begin
        writeln('');
        writeln('');
        writeln('----> de la sucursal: ', i);
        while (v[i] <> nil) do begin
            writeln('');
            writeln('codigo: ', v[i]^.dato.codigo);
            writeln('DNI: ', v[i]^.dato.dni);
            writeln('fecha: ', v[i]^.dato.f.dia, '/', v[i]^.dato.f.mes);
            writeln('minutos: ', v[i]^.dato.minutos);
            v[i]:= v[i]^.sig;
        end;
    end;
end;




{ agregar las asistencias de un cliente en un arbol }
procedure agregarEnArbol(var abb: arbol; dni: integer; cant: integer);
begin
    if (abb = nil) then begin
        new(abb);
        abb^.dato.dni:= dni;
        abb^.dato.cantTotal:= cant;
        abb^.hI:= nil;
        abb^.hD:= nil;
    end
    else begin
        if (dni < abb^.dato.dni) then
            agregarEnArbol(abb^.hI, dni, cant)
        else
            agregarEnArbol(abb^.hD, dni, cant);
    end;
end;

{ calcular el codigo minimo }
procedure minimo(var min: integer; var v: vector);
var
    pos: integer;
    i: cantSuc;
begin
    min:= 999;
    pos:= -1;

    for i:= 1 to sucursal do begin
        if (v[i] <> nil) and (v[i]^.dato.codigo < min) then begin
            min:= v[i]^.dato.codigo;
            pos:= i;
        end;
    end;

    if (pos <> -1) then
        v[pos]:= v[pos]^.sig;
end;

{ un merge con corte de control para acumular asistencias por cliente }
procedure merge(var abb: arbol; v: vector);
var
    min, minActual: integer;
    cantTotal: integer;
begin
    abb:= nil;

    minimo(min, v);
    while (min <> 999) do begin
        minActual:= min;
        cantTotal:= 0;
        while (min <> 999) and (minActual = min) do begin
            cantTotal:= cantTotal +1;
            minimo(min, v);
        end;
        agregarEnArbol(abb, minActual, cantTotal);
    end;
end;

{ imprimir el arbol que cuenta las asistencias }
procedure imprimirArbol(abb: arbol);
begin
    writeln('');
    if (abb <> nil) then begin
        imprimirArbol(abb^.hI);
        writeln('DNI: ', abb^.dato.dni);
        writeln('cant de asistencias: ', abb^.dato.cantTotal);
        imprimirArbol(abb^.hD);
    end;
end;





var
    v: vector;
    abb: arbol;
BEGIN
    inicializar(v);
    cargar(v);
    writeln('');
    writeln('se imprime el vector de listas agrupadas por sucursal_____________________');
    imprimirVec(v);

    merge(abb, v);
    writeln('');
    writeln('se imprime el arbol con la cant de asistencias por cliente________________');
    imprimirArbol(abb);
END.
