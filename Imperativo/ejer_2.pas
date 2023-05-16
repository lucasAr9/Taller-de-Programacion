program ejer_2;

const
tipoEnvio = 4;

type
cantTipo = 1..tipoEnvio;

// datos de envios en un vector de tipos de paquete ordenados en listas por localidad
envio = record
    tipo: cantTipo;
    codigo: integer;
    localidad: integer;
    peso: real;
    precio: real;
end;

lista = ^nodoLista;
nodoLista = record
    datoL: envio;
    sig: lista;
end;

vector = array [cantTipo] of lista;

// nueva estructura con el merge acumulador aplicado
enviosAcumulados = record
    localidad: integer;
    peso: real;
end;

arbol = ^nodoArbol;
nodoArbol = record
    datoA: enviosAcumulados;
    hijoI: arbol;
    hijoD: arbol;
end;


procedure leer(var e: envio);
begin
    e.tipo:= random(4) + 1;
    e.codigo:= random(100);
    e.localidad:= random(10);
    e.peso:= random(200);
    e.precio:= random(300);
end;

procedure agregarOrdenadoLista(var l: lista; e: envio);
var
    anterior, actual, nuevo: lista;
begin
    new(nuevo);
    nuevo^.datoL:= e;

    actual:= l;
    while (actual <> nil) and (actual^.datoL.localidad <= nuevo^.datoL.localidad) then begin
        anterior:= actual;
        actual:= actual^.sig;
    end;

    if (l = actual) then
        l:= nuevo;
    else
        anterior^.sig:= nuevo;
    nuevo^.sig:= actual;
end;

procedure cargar(var v: vector);
var
    e: envio;
    i: integer;
begin
    randomize;
    for i:= 1 to 100 do begin
        leer(e);
        agregarOrdenadoLista(v[e.tipo], e);
    end;
end;



var
    v: vector;
    abb: arbol;
    cantMax: real;
BEGIN
    cargar(v);
    writeln('Imprimir el vector de listas');
    imprimirVectorListas(v);
END.
