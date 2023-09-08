{ 
    Un cine posee la lista de películas que proyectará durante el mes de octubre. De cada
    película se conoce: código de película, código de género (1: acción, 2: aventura, 3: drama,
    4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado
    por las críticas. Implementar un programa que contenga:

    a. Un módulo que lea los datos de películas y los almacene ordenados por código de
    película y agrupados por código de género, en una estructura de datos adecuada. La
    lectura finaliza cuando se lee el código de película -1.
    
    b. Un módulo que reciba la estructura generada en el punto a y retorne una
    estructura de datos donde estén todas las películas almacenadas ordenadas por código de
    película.
}

program punto11;

const
genero = 8;

type
cantGenero = 1..genero;

pelicula = record
    codPeli: integer;
    codGen: integer;
    puntaje: real;
end;

lista = ^nodo;
nodo = record
    dato: pelicula;
    sig: lista;
end;

vecGenero = array [cantGenero] of lista;


procedure leerPeli(var p: pelicula);
begin
    write('codigo de genero: '); readln(p.codGen);
    if (p.codGen <> -1) then begin
        write('codigo de pelicula: '); readln(p.codPeli);
        write('puntaje: '); readln(p.puntaje);
    end;
end;

procedure agregarOrdenado(var l: lista; p: pelicula);
var
    nuevo, anterior, actual: lista;
begin
    new(nuevo);
    nuevo^.dato:= p;

    actual:= l;
    while (actual <> nil) and (p.codPeli > actual^.dato.codPeli) do begin
        anterior:= actual;
        actual:= actual^.sig;
    end;

    if (l = actual) then
        l:= nuevo
    else
        anterior^.sig:= nuevo;
    nuevo^.sig:= actual;
end;

procedure cargarPeliculas(var v: vecGenero);
var
    p: pelicula;
begin
    leerPeli(p);
    while (p.codGen <> -1) do begin
        agregarOrdenado(v[p.codGen], p);
        leerPeli(p);
    end;
end;



procedure inicializarVec(var v: vecGenero);
var i: cantGenero;
begin
    for i:= 1 to genero do v[i]:= nil;
end;

procedure imprimirListas(v: vecGenero);
var i: cantGenero;
begin
    for i:= 1 to genero do begin
        writeln('los del genero: ',i);
        if (v[i] <> nil) then begin
            while (v[i] <> nil) do begin
                writeln('codigo pelicula: ',v[i]^.dato.codPeli);
                writeln('puntaje: ',v[i]^.dato.puntaje:2:2);
                v[i]:= v[i]^.sig;
                writeln(' ');
            end;
        end
        else
            writeln('NO habia.');
        writeln('---');
    end;
end;

procedure imprimirMerge(newL: lista);
begin
    while (newL <> nil) do begin
        writeln('codigo pelicula: ',newL^.dato.codPeli);
        writeln('codigo genero: ',newL^.dato.codGen);
        writeln('puntaje: ',newL^.dato.puntaje:2:2);
        newL:= newL^.sig;
    end;
end;



procedure agregarAtras(var newL, ultimo: lista; p: pelicula);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato:= p;
    nuevo^.sig:= nil;

    if (newL = nil) then
        newL:= nuevo
    else
        ultimo^.sig:= nuevo;
    ultimo:= nuevo;
end;

procedure minimo(var v: vecGenero; var minPeli: pelicula);
var
    i, minIndice: integer;
begin
    minPeli.codPeli:= 999;
    minIndice:= -1;

    for i:= 1 to genero do begin
        if (v[i] <> nil) and (v[i]^.dato.codPeli <= minPeli.codPeli) then begin
            minPeli:= v[i]^.dato;
            minIndice:= i;
        end;
    end;

    if (minIndice <> -1) then
        v[minIndice]:= v[minIndice]^.sig;
end;

procedure merge(v: vecGenero; var newL: lista);
var
    minPeli: pelicula;
    ultimo: lista;
begin
    newL:= nil;
    minimo(v, minPeli);
    while (minPeli.codPeli <> 999) do begin
        agregarAtras(newL, ultimo, minPeli);
        minimo(v, minPeli);
    end;
end;





var
    v: vecGenero;
    newL: lista;
BEGIN
    inicializarVec(v);
    writeln(' ');
    writeln('cargar las peliculas agrupadas por genero.');
    cargarPeliculas(v);

    writeln(' ');
    writeln('implimir listas por separado.');
    imprimirListas(v);

    merge(v, newL);

    writeln(' ');
    writeln('implimir merge.');
    imprimirMerge(newL);
END.

