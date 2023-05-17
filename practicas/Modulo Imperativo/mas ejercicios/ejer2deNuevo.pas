{ 
Una empresa de logística ofrece 4 tipos de paquetes (1: encomienda común, 2: encomienda
express, 3: encomienda frágil, 4: certificado), y necesita procesar los envíos de sus
clientes. Para ello se dispone de un módulo “Envíos” que lee la información de los
envíos realizados y genera una estructura con código de paquete, código de localidad
de destino, peso y precio del paquete, agrupados por tipo de paquete. Por cada tipo
de paquete, los envíos se encuentran ordenados por código de localidad.

Se pide implementar un programa en Pascal que:
a) Invoque a un módulo que reciba la estructura de los envíos y utilizando la técnica
de merge o merge acumulador genere un vector de al menos 200 pos ordenado que contenga
código de localidad y el peso total acumulado entre todos sus envíos. El vector debe
estar ordenado por el peso total.

a.1) Elimine una localidad pasada por parametro.
a.2) Eliminar TODOS los pesos que aparezcan en el vector segun uno pasado por parametro.
a.3) Buscar de manera ordenada una localidad y devolver la pos en el vector,
     con busqueda binaria y busqueda ordenada.
a.4) Agregar ordenado una localidad al vector.
a.5) Agregar al final una localidad al vector.

NOTA: Para cada tipo de paquete puede haber más de un envío de la misma localidad.
}

program ejer2deNuevo;

const
paquete = 4;
dimF = 30;

type
cantPaquetes = 1..paquete;
cantDelVectorMerge = 1..dimF;

envio = record
    tipoDePaquete: cantPaquetes;
    codigoPaquete: integer;
    localidad: integer;
    peso: real;
    precio: real;
end;

lista = ^nodo;
nodo = record
    dato: envio;
    sig: lista;
end;

vecTiposEnvio = array [cantPaquetes] of lista;

{ para el merge que, para cada localidad, suma el peso y precio de cada envio }
envioMerge = record
    localidad: integer;
    pesoAcumulado: real;
    precioAcumulado: real;
end;

vectorMerge = array [cantDelVectorMerge] of envioMerge;




procedure inicializar(var v: vecTiposEnvio);
var i: cantPaquetes;
begin
    for i:= 1 to paquete do v[i]:= nil;
end;

procedure leer(var e: envio; num: integer);
begin
    with e do begin
        tipoDePaquete:= random(4) +1;
        codigoPaquete:= num;
        localidad:= random(20) + 1;
        peso:= random(200);
        precio:= random(500);
    end;
end;

procedure armarNodo(var l: lista; e: envio);
var
    nuevo, anterior, actual: lista;
begin
    new(nuevo);
    nuevo^.dato:= e;

    actual:= l;
    while (actual <> nil) and (actual^.dato.localidad < nuevo^.dato.localidad) do begin
        anterior:= actual;
        actual:= actual^.sig;
    end;

    if (actual = l) then
        l:= nuevo
    else
        anterior^.sig:= nuevo;
    nuevo^.sig:= actual;
end;

procedure cargar(var v: vecTiposEnvio);
var
    i: integer;
    e: envio;
begin
    randomize;
    for i:= 1 to 150 do begin
        leer(e, i);
        armarNodo(v[e.tipoDePaquete], e);
    end;
end;

procedure imprimirVec(v :vecTiposEnvio);
var i: cantPaquetes;
begin
    for i:= 1 to paquete do begin
        writeln('Los del tipo de paquete ', i, '-------------------------------------');
        while (v[i] <> nil) do begin
            writeln('*Codigo de paquete ', v[i]^.dato.codigoPaquete,
                ' Codigo de localidad ', v[i]^.dato.localidad, ' Peso: ',
                v[i]^.dato.peso:2:2, ' Precio: ', v[i]^.dato.precio:2:2);
            v[i]:= v[i]^.sig;
        end;
    end;
end;




procedure agregarAlNuevoVector(var newV: vectorMerge; var dL: integer;
                            min: integer; pesoTotal, precioTotal: real);
var
    e: envioMerge;
begin
    if (dL < dimF) then begin
        dL:= dL + 1;
        e.localidad:= min;
        e.pesoAcumulado:= pesoTotal;
        e.precioAcumulado:= precioTotal;
        newV[dL]:= e;
    end
    else
        writeln('*Este registro mergeado no entro -> localidad: ', min,
                ' peso total: ', pesoTotal:2:2, ' precio total: ', precioTotal:2:2);
end;

procedure minimo(var v: vecTiposEnvio; var min: integer; var peso, precio: real);
var
    i: cantPaquetes;
    pos: integer;
begin
    min:= 999;
    pos:= -1;
    peso:= 0;
    precio:= 0;

    for i:= 1 to paquete do begin
        if (v[i] <> nil) and (v[i]^.dato.localidad < min) then begin
            min:= v[i]^.dato.localidad;
            pos:= i;
        end;
    end;

    if (pos <> -1) then begin
        peso:= v[pos]^.dato.peso;
        precio:= v[pos]^.dato.precio;
        v[pos]:= v[pos]^.sig;
    end;
end;

procedure merge(v: vecTiposEnvio; var newV: vectorMerge; var dL: integer);
var
    min, minActual: integer;
    peso, pesoTotal: real;
    precio, precioTotal: real;
begin
    dL:= 0;

    minimo(v, min, peso, precio);
    while (min <> 999) do begin
        minActual:= min;
        pesoTotal:= 0;
        precioTotal:= 0;
        while (min <> 999) and (min = minActual) do begin
            pesoTotal:= pesoTotal + peso;
            precioTotal:= precioTotal + precio;
            minimo(v, min, peso, precio);
        end;
        agregarAlNuevoVector(newV, dL, minActual, pesoTotal, precioTotal);
    end;
end;

procedure imprimirMerge(newV: vectorMerge; dL: integer);
var i: integer;
begin
    for i:= 1 to dL do begin
        writeln('*Localidad: ', newV[i].localidad,
                ' Peso total: ', newV[i].pesoAcumulado:2:2,
                ' Precio total: ', newV[i].precioAcumulado:2:2);
    end;
end;




procedure eliminarUno(var newV: vectorMerge; var dL: integer; loc: integer; var e: boolean);
var
    i, j: integer;
begin
    i:= 1;
    while (i <= dL) and (newV[i].localidad < loc) do
        i:= i + 1;

    if (i <= dL) and (newV[i].localidad = loc) then begin
        dL:= dL - 1;
        for j:= i to dL do
            newV[j]:= newV[j + 1];
        e:= true;
    end;
end;

procedure eliminarTodos(var newV: vectorMerge; var dL: integer; peso: real; var e: boolean);
var
    i, j: integer;
begin
    for i:= 1 to dL do begin
        if (newV[i].pesoAcumulado = peso) then begin
            dL:= dL - 1;
            for j:= i to dL do
                newV[j]:= newV[j + 1];
            e:= true;
        end;
    end;
end;




procedure busquedaBinaria(newV: vectorMerge; dL, loc: integer; var pos: integer);
var
    primero, ultimo, medio: integer;
begin
    primero:= 1; ultimo:= dL;
    medio:= (primero + ultimo) div 2;

    while (primero <= ultimo) and (newV[medio].localidad <> loc) do begin
        if (loc < newV[medio].localidad) then
            ultimo:= medio - 1
        else
            primero:= medio + 1;
        medio:= (primero + ultimo) div 2;
    end;

    if (primero <= ultimo) and (newV[medio].localidad = loc) then
        pos:= medio
    else
        pos:= 0;
end;

procedure busqueda(newV: vectorMerge; dL, loc: integer; var pos: integer);
var
    i: integer;
begin
    i:= 1;
    while (i <= dL) and (newV[i].localidad < loc) do
        i:= i + 1;

    if (i <= dL) and (newV[i].localidad = loc) then
        pos:= i
    else
        pos:= 0;
end;




procedure agregarOrdenado(var v: vectorMerge; var dL: integer;
                            loc: integer; peso, precio: real);
var
    i, j: integer;
    e: envioMerge;
begin
    e.localidad:= loc;
    e.pesoAcumulado:= peso;
    e.precioAcumulado:= precio;

    i:= 1;
    if (dL < dimF) then begin
        while (i <= dL) and (v[i].localidad < e.localidad) do
            i:= i + 1;

        if (i <= dL) then begin
            for j:= dL downto i do
                v[j + 1]:= v[j];
            v[j]:= e;
            dL:= dL + 1;
            writeln('se agrego de manera ordenada.');
        end;
    end
    else
        writeln('no hay mas lugar en el vector.');
end;




procedure agregarAlFinal(var v: vectorMerge; var dL: integer;
                            loc: integer; peso, precio: real);
var
    e: envioMerge;
begin
    if (dL < dimF) then begin
        e.localidad:= loc;
        e.pesoAcumulado:= peso;
        e.precioAcumulado:= precio;
        dL:= dL + 1;
        v[dL]:= e;
        writeln('se agrego de manera ordenada.');
    end
    else
        writeln('no hay mas lugar en el vector.');
end;





var
    v: vecTiposEnvio;
    newV: vectorMerge;
    dL: integer;

    loc: integer; peso: real; precio: real; encontrado: boolean;
    pos: integer;
BEGIN
    inicializar(v);
    cargar(v);
    writeln('');
    writeln('');
    writeln('*********************************************************************');
    writeln('*Se imprime el vector de listas de envios---------------------------*');
    writeln('*********************************************************************');
    imprimirVec(v);

    writeln('');
    merge(v, newV, dL);
    writeln('');
    writeln('');
    writeln('*********************************************************************');
    writeln('*Se imprime el nuevo vector mergeado--------------------------------*');
    writeln('*********************************************************************');
    imprimirMerge(newV, dL);

    writeln('');
    loc:= 8; encontrado:= false;
    writeln('***ELIMINAR UNO con localidad: ', loc);
    eliminarUno(newV, dL, loc, encontrado);
    if (encontrado = true) then
        writeln('Se encontro y elimino la localidad: ', loc)
    else
        writeln('NO se encontro la localidad: ', loc);

    writeln('');
    peso:= 500; encontrado:= false;
    writeln('***ELIMINAR TODOS los pesos: ', peso:2:2);
    eliminarTodos(newV, dL, peso, encontrado);
    if (encontrado = true) then
        writeln('Se encontro y elimino al menos una vez el peso: ', peso:2:2)
    else
        writeln('NO se encontro ningun peso: ', peso:2:2);

    writeln('');
    loc:= 19;
    writeln('***BUCSAR la localidad: ', loc);
    write('BUSQUEDA BINARIA. ');
    busquedaBinaria(newV, dL, loc, pos);
    writeln('la pos es: ', pos);
    write('BUSQUEDA ORDENADA. ');
    busqueda(newV, dL, loc, pos);
    writeln('la pos es: ', pos);

    writeln('');
    loc:= 10; peso:= 100; precio:= 150;
    writeln('***AGREGAR la localidad: ', loc, ' con peso: ',
                peso:2:2, ' y precio: ', precio:2:2);
    writeln('AGREGAR ORDENADO.');
    agregarOrdenado(newV, dL, loc, peso, precio);
    writeln('AGREGAR AL FINAL.');
    agregarAlFinal(newV, dL, loc, peso, precio);

    writeln('');
    writeln('se imprime de vuelta el nuevo vector----------------------------------');
    imprimirMerge(newV, dL);
END.

