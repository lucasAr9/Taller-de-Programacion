{
4. Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de
la información de los autos en venta. Implementar un programa que:

a. Genere un árbol binario de búsqueda ordenado por patente identificatoria del auto en
venta. Cada nodo del árbol debe contener patente, año de fabricación (2010..2018), la
marca y el modelo.

b. Contenga un módulo que recibe el árbol generado en a) y una marca y devuelva la
cantidad de autos de dicha marca que posee la agencia. Mostrar el resultado.

c. Contenga un módulo que reciba el árbol generado en a) y retorne una estructura con la
información de los autos agrupados por año de fabricación.

d. Contenga un módulo que reciba el árbol generado en a) y una patente y devuelva el
año de fabricación del auto con dicha patente. Mostrar el resultado.
}

program adicional_4;

const
priFabricacion = 2010;
fabricacion = 2018;

type
anioFabricacion = priFabricacion..fabricacion;

auto = record
    patente: integer;
    marca: String;
    modelo: anioFabricacion;
end;

arbol = ^nodo;
nodo = record
    dato: auto;
    hI: arbol;
    hD: arbol;
end;

lista = ^nodoLista;
nodoLista = record
    dato: auto;
    sig: lista;
end;

vector = array [anioFabricacion] of lista;




{ leer los datos de los autos generados random y un generador de marcas random }
procedure generarMarcaRandom(var marc: String);
var num: integer;
begin
    num:= random(5);
    case num of
        0: marc:= 'Lambo';
        1: marc:= 'Peugeot';
        2: marc:= 'Fiat';
        3: marc:= 'Honda';
        4: marc:= 'Audi';
        5: marc:= 'Ferrari';
    end;
end;
procedure leer(var au: auto);
var
    marc: String;
begin
    au.patente:= random(100);
    generarMarcaRandom(marc);
    au.marca:= marc;
    au.modelo:= random(8) + 2010;
end;

{ crear el nodo y enganchar al siguiente }
procedure armarNodo(var abb: arbol; au: auto);
begin
    if (abb = nil) then begin
        new(abb);
        abb^.dato:= au;
        abb^.hI:= nil;
        abb^.hD:= nil;
    end
    else
        if (au.patente < abb^.dato.patente) then
            armarNodo(abb^.hI, au)
        else
            armarNodo(abb^.hD, au);
end;

{ cargar el arbol con los autos }
procedure cargar(var abb: arbol);
var
    au: auto;
begin
    randomize;
    leer(au);
    while (au.patente <> 0) do begin
        armarNodo(abb, au);
        leer(au);
    end;
end;

{ imprimir el arbol por niveles }
procedure imprimirArbol(abb: arbol);
begin
    if (abb <> nil) then begin
        imprimirArbol(abb^.hI);
        writeln('');
        writeln('patente: ', abb^.dato.patente);
        writeln('marca: ', abb^.dato.marca);
        writeln('modelo: ', abb^.dato.modelo);
        imprimirArbol(abb^.hD);
    end;
end;




{ calcular cuantos autos de tal marca apatecen en el arbol }
procedure cantAutosPorMarca(abb: arbol; marca: String; var cant: integer);
begin
    if (abb <> nil) then begin

        cantAutosPorMarca(abb^.hI, marca, cant);

        if (abb^.dato.marca = marca) then
            cant:= cant +1;

        cantAutosPorMarca(abb^.hD, marca, cant);
    end;
end;




{ inicializar el vector que agrupa los autos por modelo }
procedure inicializar(var v: vector);
var i: anioFabricacion;
begin
    for i:= priFabricacion to fabricacion do
        v[i]:= nil;
end;

{ agregar adelante los elementos en las listas del vector agrupando por modelo }
procedure agregarAdelante(var l: lista; au: auto);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato:= au;
    nuevo^.sig:= l;
    l:= nuevo;
end;

{ generar una nueva estructura de datos agrupando los auUtos por modelo }
procedure agruparPorAnioFabricacion(abb: arbol; var v: vector);
begin
    if (abb <> nil) then begin
        agruparPorAnioFabricacion(abb^.hD, v);
        agregarAdelante(v[abb^.dato.modelo], abb^.dato);
        agruparPorAnioFabricacion(abb^.hI, v);
    end;
end;

{ imprimir el vector que agrupa los autos por modelo }
procedure imprimirVectorAnioFabricacion(v: vector);
var i: anioFabricacion;
begin
    for i:= priFabricacion to fabricacion do begin
        writeln('');
        writeln('');
        writeln('--------> los del modelo: ', i);
        while (v[i] <> nil) do begin
            writeln('');
            writeln('patente: ', v[i]^.dato.patente);
            writeln('marca: ', v[i]^.dato.marca);
            v[i]:= v[i]^.sig;
        end;
    end;
end;




{ buscar el modelo de una patente }
function buscar(abb: arbol; patente: integer): arbol;
begin
    if (abb = nil) then
        buscar:= nil
    else begin
        if (patente = abb^.dato.patente) then
            buscar:= abb
        else begin
            if (patente < abb^.dato.patente) then
                buscar:= buscar(abb^.hI, patente)
            else
                buscar:= buscar(abb^.hD, patente);
        end;
    end;
end;





var
    abb: arbol;
    v: vector;
    marca: String;
    patente: integer;
    patenteEncontrada: arbol;
    cantPorMarc: integer;
BEGIN
    { a }
    cargar(abb);
    writeln('');
    writeln('imprimir el arbol en orden________________________________________________');
    imprimirArbol(abb);
    { b }
    writeln('');
    write('una marca de auto para contar cuantos autos de esa marca hay: ');
    readln(marca);
    cantPorMarc:= 0;
    cantAutosPorMarca(abb, marca, cantPorMarc);
    writeln('la cantidad de autos de dicha marca es: ', cantPorMarc);
    { c }
    inicializar(v);
    agruparPorAnioFabricacion(abb, v);
    writeln('');
    writeln('imprimir el vector con las agrupaciones por modelo________________________');
    imprimirVectorAnioFabricacion(v);
    { d }
    writeln('');
    write('una patente para buecar: ');
    readln(patente);
    patenteEncontrada:= buscar(abb, patente);
    writeln('el modelo de ', patente, ' es ', patenteEncontrada^.dato.modelo, ' marca ',
            patenteEncontrada^.dato.marca, '. ');
END.
