program ejer_11;


const
generoNumero = 8;

type
cantGenero = 1..generoNumero;

pelicula = record
    codigoPeli: integer;
    codigoGen: cantGenero;
    puntaje: real;
end;

lista = ^nodo;
nodo = record
    dato: pelicula;
    sig: lista;
end;

vector = array [cantGenero] of lista;


{agregar en lista}
procedure agregarFinal(var l, ultimo: lista; p: pelicula);
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


{cargar datos}
procedure leer(var p: pelicula);
begin
    write('codigo pelicula: ') readln(p.codigoPeli);
    if (p.codigoPeli <> -1) then begin
        write('codigo genero: ') readln(p.codigoGen);
        write('puntaje: ') readln(p.puntaje);
    end;
end;

procedure cargar(var v: vector);
var
    p: pelicula;
    ultimo: vector;
begin
    iniciar(ultimo);
    leer(p);
    while (p.codigoPeli <> -1) do begin
        agregarFinal(v[codigoGen], ultimo[codigoGen], p);
        leer(p);
    end;
end;


{merge}
procedure minimo(var v: vector; var min: pelicula);
var
    i, pos: integer;
begin
    min:= 999;
    pos:= -1;

    for i:= 1 to generoNumero do begin
        if (v[i].codigoPeli < min) then begin
            min:= v[i].codigoPeli;
            pos:= i;
        end;
    end;

    if (pos <> -1) then
        v[pos]:= v[pos]^.sig;
end;

procedure merge(v: vector; var l: lista);
var
    min: pelicula;
    ultimo: lista;
begin
    minimo(v, min);
    while (min <> 999) do begin
        agregarFinal(l, ultimo, min);
        minimo(v, min);
    end;
end;


{iniciar}
procedure iniciar(var v: vector);
var
    i: integer;
begin
    for i:= 1 to generoNumero do v[i]:= nil;
end;


{pp}
var
    v: vector;
    l: lista;
BEGIN
    iniciar(v);
    cargar(v);
    merge(v, l);
END.
