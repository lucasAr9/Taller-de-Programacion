program ejer_4;


type
lista = ^nodo;
nodo = record
    dato: integer;
    sig: lista;
end;


procedure agregarFinal(var l, ultimo: lista; num: integer);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato:= num;
    nuevo^.sig:= nil;

    if (l <> nil) then
        l:= nuevo
    else
        ultimo^.sig:= nuevo;
    ultimo:= nuevo;
end;

procedure cargar(var l: lista);
var
    num: integer;
    ultimo: lista;
begin
    l:= nil;
    write('Un numero: '); readln(num);
    while (num <> 0) do begin
        agregarFinal(l, ultimo, num);
        write('Un numero: '); readln(num);
    end;
end;


procedure calcularMax(l: lista; var max: integer);
begin
    if (l <> nil) then begin
        if (l^.dato > max) then
            max:= l^.dato;
        
        calcularMax(l^.sig, max);
    end;
end;

procedure calcularMin(l: lista; var min: integer);
begin
    if (l <> nil) then begin
        if (l^.dato > min) then
            min:= l^.dato;
        
        calcularMin(l^.sig, min);
    end;
end;


procedure buscar(l: lista; num: integer; var esta: boolean);
begin
    while (l <> nil) and (l^.dato <> num) do
        l:= l^.sig;
    
    if (l <> nil) and (l^.dato = num) then
        esta:= true;
    else
        esta:= false;
end;


var
    l: lista;
    num: integer;
    variable: integer;
    esta: boolean;
BEGIN
    cargar(l);

    variable:= 0;
    calcularMax(l, variable);
    writeln('El maximo es: ', variable);

    variable:= 0;
    calcularMin(l, variable);
    writeln('El minimo es: ', variable);

    write('Un numero para buscar: '); readln(num);
    buscar(l, num, esta);
    writeln('El numero indicado es: ', esta);
END.
