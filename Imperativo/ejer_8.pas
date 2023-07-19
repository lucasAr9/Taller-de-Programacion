program ejer_5;


type
arbol = ^nodo;
nodo = record
    dato: integer;
    hI: arbol;
    hD: arbol;
end;


procedure agregarOrdenado(var a: arbol; num: integer);
begin
    if (a = nil) then begin
        new(a);
        a^.dato:= num;
        a^.hI:= nil;
        a^.hD:= nil;
    end
    else begin
        if (num < a^.dato) then
            agregarOrdenado(a^.hI, num);
        else
            agregarOrdenado(a^.hD, num);
    end;
end;

procedure cargar(var a: arbol);
var
    num: integer;
begin
    write('Un numero: '); read(num);
    while (num <> 0) do begin
        agregarOrdenado(a, num);
        write('Un numero: '); read(num);
    end;
end;


procedure obtenerMax(a: arbol; var max: integer);
begin
    // si el arbol esta desordenado
    // if (a <> nil) then begin
    //     obtenerMax(a^.hI, max);
    //     if (a^.dato > max) then
    //         max:= a^.dato;
    //     obtenerMax(a^.hD, max);
    // end;

    // si el arbol esta ordenado
    if (a = nil) then
        max:= -1;
    else begin
        if (a^.hD <> nil) then
            obtenerMax(a^.hD, max);
        else
            max:= a^.dato;
    end;
end;


procedure imprimirOrdenado(a: arbol);
begin
    if (a <> nil) then begin
        imprimirOrdenado(a^.hI);
        write('Dato: ', a^.dato);
        imprimirOrdenado(a^.hD);
    end;
end;


procedure buscar(a: arbol; num: integer; var esta: boolean);
begin
    if (a = nil) then
        esta:= false
    else if (a^.dato = nul) then
        esta:= true
    else begin
        if (num < a^.dato) then
            buscar(a^.hI, num, esta);
        else
            buscar(a^.hD, num, esta);
    end;
end;


var
    a: arbol;
    num: integer;
    esta: boolean;
BEGIN
    cargar(a);
    obtenerMax(a, num);
    write('El numero max es: ', num);
    imprimirOrdenado(a);
    buscar(a, num, esta);
END.
