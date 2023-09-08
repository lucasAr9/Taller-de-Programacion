program ejer_2;


const
numero_genero = 8;


type
cant_generos = 1..numero_genero;

pelicula = record
    codigo_pelicula: integer;
    codigo_genero: cant_generos;
    puntaje_promedio: real;
end;

lista = ^nodo;
nodo = record
    dato: pelicula;
    sig: lista;
end;

vector = array [cant_generos] of lista;
vector_generos = array [cant_generos] of pelicula;

procedure leer(var p: pelicula);
begin
    p.codigo_pelicula:= random(100);
    p.codigo_genero:= random(8) + 1;
    p.puntaje_promedio:= random(500);
end;

procedure agregarFinal(var l: lista; p: pelicula);
var
    nuevo, actual: lista;
begin
    new(nuevo);
    nuevo^.dato:= p;
    nuevo^.sig:= nil;

    if (l <> nil) then begin
        actual:= l;
        while (actual^.sig <> nil) do
            actual:= actual^.sig;
        actual^.sig:= nuevo;
    end
    else
        l:= nuevo;
    end;
end;

procedure cargar(var v: vector;);
var
    p: pelicula;
    i: integer;
begin
    randomize;
    leer(p);
    for i:= 1 to 100 do begin
        agregarFinal(v[p.codigo_genero], p);
        leer(p);
    end;
end;


procedure inicializar(var v: vector);
var
    i: integer;
begin
    for i:= 1 to numero_genero do v[i]:= nil;
end;


procedure calcularMaximo(l: lista; var max: pelicula);
begin
    if (l <> nil) then begin
        while (l^.sig <> nil) do begin
            if (l^.dato.puntaje_promedio > max.puntaje_promedio) then
                max:= l^.dato;
            l:= l^.sig;
        end;
    end;
end;

procedure calcularMayorPuntaje(v: vector; var v_genero: vector_generos);
var
    i: integer;
    max: pelicula;
begin
    for i:= 1 to numero_genero do begin
        max.codigo_pelicula:= 0;
        max.codigo_genero:= i;
        max.puntaje_promedio:= 0;
        calcularMaximo(v[i], max);
        v_genero[i]:= max;
    end;
end;


procedure ordenarInsercion(var v: vector_generos);
var
    i, j: integer;
    actual: pelicula;
begin
    for i:= 2 to numero_genero do begin
        actual:= v[i];
        j:= i - 1;
        while (j > 0) and (v[j]^.puntaje_promedio > actual^.puntaje_promedio) do begin
            v[j + 1]:= v[j];
            j:= j - 1;
        end;
        v[j + 1]:= actual;
    end;
end;


var
    v: vector;
    v_genero: vector_generos;
BEGIN
    inicializar(v);
    cargar(v);
    calcularMayorPuntaje(v, v_genero);
    ordenarInsercion(v_genero);
END.
