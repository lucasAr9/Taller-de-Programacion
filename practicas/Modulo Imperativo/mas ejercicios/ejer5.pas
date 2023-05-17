{ 
a. Las entregas se agrupan por tipo de vacuna (1..4) y ordenadas por nom ciudad.

b. Un modulo que recibe como parametro tipo de vacuna, una ciudad y un año y
eliminar las ocurencias de esa ciudad en ese tipo de vacuna.

d. Reciba la estructura que almacena las entregas y, usando la tecnica de merge
acumulador, genere un abb (ordenado por cantidad de dosis) que contenga para cada
ciudad de destino, la cantidad total de dosis entregadas.
"Mergear las entregas y ordenarlas por cantDosis guardando todos sus campos"

b. Implementar un modulo recursivo que reciba la estructura generada en d) y retorne
la cantidad de ciudades cuya cantidad de dosis entregadas es menor a un valos que
recibe como parametro.
}

program ejer5;

const
tipoN = 4;

type
cantTipos = 1..tipoN;

fecha = record
    dia: 1..30;
    mes: 1..12;
    anio: 2020..2022;
end;

entrega = record
    tipo: cantTipos;
    cantDosis: integer;
    f: fecha;
    nomCiudad: String;
end;

lista = ^nodo;
nodo = record
    dato: entrega;
    sig: lista;
end;

vecEntrega = array [cantTipos] of lista;

contadorDeDosis = record
    nomCiudad: String;
    cantDosis: integer;
end;

arbol = ^nodoArbol;
nodoArbol = record
    hI: arbol;
    hD: arbol;
    dato: contadorDeDosis;
end;




procedure inicializar(var v: vecEntrega);
var i: cantTipos;
begin
    for i:= 1 to tipoN do v[i]:= nil;
end;

procedure leerRandom(var e: entrega);
var num: integer; nombreCiu: String;
begin
    num:= random(6);
    case num of
        0: nombreCiu:= 'La plata';
        1: nombreCiu:= 'Mar del plata';
        2: nombreCiu:= 'Bs. As.';
        3: nombreCiu:= 'San clemente';
        4: nombreCiu:= 'Santa Fe';
        5: nombreCiu:= 'Tierra del fuego';
    end;
    e.tipo:= random(4) + 1;
    e.nomCiudad:= nombreCiu;
    e.f.dia:= random(30) + 1;
    e.f.mes:= random(12) + 1;
    e.f.anio:= random(2) + 2020;
    e.cantDosis:= random(200) + 500;
end;

procedure armarNodo(var l: lista; e: entrega);
var
    nuevo, anterior, actual: lista;
begin
    new(nuevo);
    nuevo^.dato:= e;

    actual:= l;
    while (actual <> nil) and (actual^.dato.nomCiudad < nuevo^.dato.nomCiudad) do begin
        anterior:= actual;
        actual:= actual^.sig;
    end;

    if (actual = l) then
        l:= nuevo
    else
        anterior^.sig:= nuevo;
    nuevo^.sig:= actual;
end;

procedure cargar(var v: vecEntrega);
var
    i: integer;
    e: entrega;
begin
    randomize;
    for i:= 1 to 150 do begin
        leerRandom(e);
        armarNodo(v[e.tipo], e);
    end;
end;

procedure imp(l: lista);
begin
    while (l <> nil) do begin
        writeln('*Ciudad: ', l^.dato.nomCiudad,
                ' Fecha: ', l^.dato.f.dia, '/', l^.dato.f.mes, '/', l^.dato.f.anio,
                ' Cantidad de dosis: ', l^.dato.cantDosis);
        l:= l^.sig;
    end;
end;
procedure imprimir(v: vecEntrega);
var i: cantTipos;
begin
    for i:= 1 to tipoN do begin
        writeln('');
        writeln('');
        writeln('---> tipo de vacuna: ', i);
        imp(v[i]);
    end;
end;




function eliminarCiudad(var l: lista; ciudad: String): boolean;
var
    anterior, actual: lista;
begin
    actual:= l;
    while (actual <> nil) and (actual^.dato.nomCiudad <> ciudad) do begin
        anterior:= actual;
        actual:= actual^.sig;
    end;

    if (actual <> nil) and (actual^.dato.nomCiudad = ciudad) then begin
        if (l = actual) then
            l:= l^.sig
        else
            anterior^.sig:= actual^.sig;
        dispose(actual);
        eliminarCiudad:= true;
    end
    else
        eliminarCiudad:= false;
end;




procedure armarNodoArbol(var abb: arbol; ciudad: String; cant: integer);
begin
    if (abb = nil) then begin
        new(abb);
        abb^.dato.cantDosis:= cant;
        abb^.dato.nomCiudad:= ciudad;
        abb^.hI:= nil;
        abb^.hD:= nil;
    end
    else begin
        if (cant < abb^.dato.cantDosis) then
            armarNodoArbol(abb^.hI, ciudad, cant)
        else
            armarNodoArbol(abb^.hD, ciudad, cant);
    end;
end;

procedure minimo(var v: vecEntrega; var ciudadMin: String; var cantDosis: integer);
var
    i: cantTipos;
    pos: integer;
begin
    ciudadMin:= 'zzz';
    cantDosis:= 0;
    pos:= -1;

    for i:= 1 to tipoN do begin
        if (v[i] <> nil) and (v[i]^.dato.nomCiudad < ciudadMin) then begin
            ciudadMin:= v[i]^.dato.nomCiudad;
            pos:= i;
        end;
    end;

    if (pos <> -1) then begin
        cantDosis:= v[pos]^.dato.cantDosis;
        v[pos]:= v[pos]^.sig;
    end;
end;

procedure mergeDosis(v: vecEntrega; var abb: arbol);
var
    ciudadMin, ciudadActual: String;
    cantDosis, cantDosisTotal: integer;
begin
    abb:= nil;
    minimo(v, ciudadMin, cantDosis);
    while (ciudadMin <> 'zzz') do begin
        ciudadActual:= ciudadMin;
        cantDosisTotal:= 0;
        while (ciudadMin <> 'zzz') and (ciudadActual = ciudadMin) do begin
            cantDosisTotal:= cantDosisTotal + cantDosis;
            minimo(v, ciudadMin, cantDosis);
        end;
        armarNodoArbol(abb, ciudadActual, cantDosisTotal);
    end;
end;

procedure imprimirMerge(abb: arbol);
begin
    if (abb <> nil) then begin
        imprimirMerge(abb^.hD);
        writeln(    '*Ciudad: ', abb^.dato.nomCiudad,
                    ' con el total de dosis: ', abb^.dato.cantDosis);
        imprimirMerge(abb^.hI);
    end;
end;




var
    v: vecEntrega;
    ciudad: String;
    tipo: cantTipos;
    abb: arbol;
BEGIN
    inicializar(v);
    cargar(v);
    writeln('');
    writeln('*************************************************************************');
    writeln('*Se impri el vector que agrupa por tipo de vacuna las listas de entrega.*');
    writeln('*************************************************************************');
    imprimir(v);

    ciudad:= 'Santa Fe'; tipo:= 1;
    writeln('');
    writeln('');
    if (eliminarCiudad(v[tipo], ciudad)) then
        writeln('se elimino la primera ciudad: ', ciudad, ' del tipo de vacuna: ', tipo)
    else
        writeln('NO se encontro la ciudad: ', ciudad, ' del tipo de vacuna: ', tipo);
    writeln('Se vuelve a imprimir la lista del tipo de vacuna: ', tipo, '*************');
    imp(v[tipo]);

    mergeDosis(v, abb);
    writeln('');
    writeln('');
    writeln('***********************************************************');
    writeln('*Se impri el arbol mergeado ordenado por cantidad de dosis*');
    writeln('***********************************************************');
    imprimirMerge(abb);
END.

