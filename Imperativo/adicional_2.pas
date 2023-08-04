program adicional_2;


const
numeroDia = 7;

type
cantDias = 1..numeroDia;

entrada = record
    dia: cantDias;
    codigoObra: integer;
    asiente: integer;
    monto: real;
end;

{lista para guardar en un vector segun el dia}
lista = ^nodo;
nodo = record
    dato: entrada;
    sig: lista;
end;

vector = array [cantDias] of lista;

{lista para contar las entradas}
cantEntradas = record
    codigoObra: integer;
    cant: integer;
end;

newLista = ^newNodo;
newNodo = record
    dato: cantEntradas;
    sig: newLista;
end;


{iniciar vector de listas en nil}
procedure iniciar(var v: vector);
var
    i: cantDias;
begin
    for i:= 1 to numeroDia do v[i]:= nil;
end;


{cargar datos en el vector}
procedure agregarOrdenado(var l: lista; e: entrada);
var
    nuevo, anterior, actual: lista;
begin
    new(nuevo);
    nuevo^.dato:= e;
    
    actual:= l;
    while (actual <> nil) and (actual^.dato.codigoObra < e.codigoObra) do begin
        anterior:= actual;
        actual:= actual^.sig;
    end;

    if (l = actual) then
        l:= nuevo
    else
        anterior^.sig:= nuevo;
    nuevo^.sig:= actual;
end;

procedure leer(var e: entrada);
begin
    write('dia: '); readln(e.dia);
end;

procedure cargar(var v: vector);
var
    e: entrada;
begin
    leer(e);
    while (e.codigoObra <> 0) do begin
        agregarOrdenado(v[e.dia], e);
        leer(e);
    end;
end;


{merge}
procedure agregarFinal(var l, ultimo: lista; actual, cant: integer);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato.codigoObra:= actual;
    nuevo^.dato.cant:= cant;
    nuevo^.dato.sig:= nil;

    if (l <> nil) then
        l:= nuevo
    else
        ultimo^.sig:= nuevo;
    ultimo:= nuevo;
end;

procedure minimo(var v: vector; var min: integer);
var
    i, pos: integer;
begin
    pos:= -1;
    min:= 999;
    for i:= 1 to numeroDia do begin
        if (v[i] <> nil) and (min > v[i]^.dato.codigoObra) then begin
            min:= v[i]^.dato.codigoObra;
            pos:= i;
        end;
    end;

    if (pos <> -1) then
        v[pos]:= v[i]^.sig;
end;

procedure merge(var v: vector; var l: lista);
var
    min, actual: integer;
    cant: integer;
    ultimo: lista;
begin
    l:= nil;
    minimo(v, min);
    while (min <> 999) do begin
        actual:= min;
        cant:= 0;
        while (min <> 999) and (actual = min) do begin
            cant:= cant + 1;
            minimo(v, min);
        end;
        agregarFinal(l, ultimo, actual, cant);
    end;
end;


{imprimir}
procedure imprimir(var l: lista);
begin
    if (l^.sig <> nil) then begin
        write('codigo: ', l^.dato.codigoObra);
        imprimir(l^.sig);
    end;
end;


{pp}
var
    v: vector;
    l: newLista;
BEGIN
    iniciar(v);
    cargar(v);
    merge(v, l);
    imprimir(l);
END.
