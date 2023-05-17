{ 
Implementar un programa que procese la información de los participantes a un concurso de preguntas y respuestas (como máximo 20).
De cada participante se lee el código de participante y su edad. El ingreso de los participantes finaliza cuando se lee el código -1.

a. Almacenar la información que se lee en un vector. 
b. Mostrar la información almacenada.
c. Ordenar el vector de participantes por edad.
d. Mostrar el vector ordenado.
e. Eliminar del vector ordenado los participantes con edades entre 20 y 22. 
f. Mostrar el vector resultante.
g. Generar una lista ordenada de menor a mayor con los participantes que quedaron el el vector después de realizar el inciso e.
}

program ejer1;

const
dimF = 30;

type
tamanio = 1..dimF;

participante = record
    codigo: integer;
    edad: integer;
end;

vector = array [tamanio] of participante;

lista = ^nodo;
nodo = record
    dato: participante;
    sig: lista;
end;

procedure leerParticipante(var p: participante);
begin
    p.codigo:= random(50);
    if (p.codigo <> 0) then
        p.edad:= random(40);
end;
procedure cargar(var v: vector; var dL: integer);
var
    p: participante;
begin
    dL:= 0;
    randomize;
    leerParticipante(p);
    while ( (dL < dimF) and (p.codigo <> -1) ) do begin
        dL:= dL +1;
        v[dL]:= p;
        leerParticipante(p);
    end;
end;

procedure ordenarInsercionEdades(var v: vector; var dL: integer);
var
    i, j: integer;
    actual: participante;
begin
    for i:= 2 to dL do begin
        actual:= v[i];
        j:= i -1;
        while ( (j > 0) and (v[j].edad > actual.edad) ) do begin
            v[j +1]:= v[j];
            j:= j -1;
        end;
        v[j +1]:= actual;
    end;
end;

// Para eliminar el bloque tengo que implementar el siguiente algoritmo, esto funciona si el vector esta ordenado.
procedure eliminar20a22(var v: vector; var dL: integer);
var
    i, pos, cant: integer;
begin
    cant:= 0;
    i:= 1;

    { buscar al primer participante de 20 años o mas }
    while ( (i <= dL) and (v[i].edad < 20) ) do
        i:= i +1;

    pos:= i;
    { buscar el ultimo participante de 22 años y quedarme con el que le sigue para ir acomodando el que siga despues de 22 años }
    while ( (i <= dL) and (v[i].edad <= 22) ) do
        i:= i +1;

    { vamos a eliminar a todos los participantes entre las posiciones entre el primero y el ultimo de entre 20 y 22 años del vector }
    cant:= i - pos;
    for i:= (pos + cant) to dL do begin
        v[i - cant]:= v[i];
    end;
    dL:= dL - cant;

    writeln('La cantidad de participantes eliminados son: ', cant);
end;

procedure armarNodo(var l: lista; var ultimo: lista; p: participante);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato:= p;
    nuevo^.sig:= nil;

    if (l = nil) then
        l:= nuevo
    else
        ultimo^.sig:= nuevo;
    ultimo:= nuevo;
end;
procedure cargarLista(var l: lista; v: vector; dL: integer);
var
    i: integer;
    ultimo: lista;
begin
    l:= nil;
    for i:= 1 to dL do
        armarNodo(l, ultimo, v[i]);
end;

procedure imprimirVector(v: vector; dL: integer);
var
    i: integer;
begin
    for i:= 1 to dL do begin
        writeln('Participante ',i,'.','   Codigo: ',v[i].codigo,'  Edad: ',v[i].edad);
    end;
end;

procedure imprimirLista(l: lista);
var
    i: integer;
begin
    i:= 1;
    while (l <> nil) do begin
        writeln('Participante ',i,'.','   Codigo: ',l^.dato.codigo,'  Edad: ',l^.dato.edad);
        l:= l^.sig;
        i:= i +1;
    end;
end;


var
    v: vector;
    l: lista;
    dL: integer;
BEGIN
    cargar(v, dL);
    writeln(' ');
    writeln('cargar el vector');
    imprimirVector(v, dL);
    writeln(' ');

    ordenarInsercionEdades(v, dL);
    writeln(' ');
    writeln('el vector se ordeno por insercion y por orden de edad.');
    imprimirVector(v, dL);
    writeln(' ');
    
    writeln(' ');
    eliminar20a22(v, dL);
    writeln('el vector con los entre 20 y 22 eliminados.');
    imprimirVector(v, dL);
    writeln(' ');

    cargarLista(l, v, dL);
    writeln(' ');
    writeln('Lista generada despues de eliminar los entre 20 y 22.');
    imprimirLista(l);
    writeln(' ');
END.

