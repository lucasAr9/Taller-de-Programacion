program adicional_5;


const
numeroSucursal = 5;

type
cantSucursal = 1..numeroSucursal;

asistencia = record
    sucursal: cantSucursal;
    codigo: integer;
    dni: integer;
    fecha: String[20];
    minutos: integer;
end;

lista = ^nodo;
nodo = record
    dato: asistencia;
    sig: lista;
end;

vector = array [cantSucursal] of lista;

asistenciaAcumulada = record
    dni: integer;
    cant: integer;
    minutos: integer;
end;

newLista = ^newNodo;
newNodo = record
    dato: asistenciaAcumulada;
    sig: newLista;
end;

{cargar}
procedure agregarOrdenado(var l: lista; a: asistencia);
var
    nuevo, actual, anterior: lista;
begin
    new(nuevo);
    nuevo^.dato: a;
    actual:= l;
    while (actual <> nil) and (actual.codigo < a.codigo) do begin
        anterior:= actual;
        actual:= actual^.sig;
    end;
    if (l = actual) then
        l:= nuevo
    else
        anterior^.sig:= nuevo;
    nuevo^.sig:= actual;
end;

procedure leer(var a: asistencia);
begin
    write('codigo: '); readln(a.codigo);
    if (a.codigo <> -1) then begin
        write('sucursal: '); readln(a.sucursal);
        write('dni: '); readln(a.dni);
        write('fecha: '); readln(a.fecha);
        write('minutos: '); readln(a.minutos);
    end;
end;

procedure cargar(var v: vector);
var
    a: asistencia;
begin
    leer(a);
    while (a.codigo <> -1) do begin
        agregarOrdenado(v[a.sucursal], a);
        leer(a);
    end;
end;


{merge}
procedure agregarFinal(var l: newLista; actual: integer; cant, minutos: integer);
var
    nuevo, actual: newLista;
begin
    new(nuevo);
    nuevo^.dato.dni:= actual;
    nuevo^.dato.cant:= cant;
    nuevo^.dato.minutos:= minutos;
    
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

procedure minimo(var l: newLista; actual: integer; minutosTotal: integer);
var
    i, pos: integer;
begin
    pos:= -1;
    min:= 999;

    for i:= 1 to numeroSucursal do begin
        if (v[i] <> nil) and (min > v[i]^.dato.codigo) then begin
            min:= v[i]^.dato.dni;
            pos:= i;
        end;
    end;
    if (pos <> -1) then begin
        minutosTotal:= v[pos]^.dato.minutos;
        v[pos]:= v[pos]^.sig;
    end;
end;

procedure merge(var v: vector; var l: newLista);
var
    min, actual: integer;
    cant, cantTotal, minutos, minutosTotal: integer;
begin
    l:= nil;
    minimo(v, min, minutos);
    while (min <> 999) do begin
        actual:= min;
        cantTotal:= 0;
        minutosTotal:= 0;
        while (min <> 999) and (actual = min) do begin
            cantTotal:= cantTotal + 1;
            minutosTotal:= minutosTotal + minutos;
            minimo(v, min, minutos);
        end;
        agregarFinal(l, actual, cantTotal, minutosTotal);
    end;
end;



var
    v: vector;
    l: newLista;
BEGIN
    cargar(v);
    merge(v, l);
END.
