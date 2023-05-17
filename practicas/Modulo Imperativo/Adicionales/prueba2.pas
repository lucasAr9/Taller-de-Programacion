
program prueba2;

type

lista = ^nodo;
nodo = record
    dato: integer;
    sig: lista;
end;




{ agregar al final de la lista sin un orden }
procedure agregarAlFinal(var l, ultimo: lista; num: integer);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato:= num;
    nuevo^.sig:= nil;

    if (l = nil) then
        l:= nuevo
    else
        ultimo^.sig:= nuevo;
    ultimo:= nuevo;
end;

{ un modulo para cargar la lista }
procedure cargar(var l: lista);
var
    ultimo: lista;
    num, i: integer;
begin
    randomize;

    for i:= 1 to 50 do begin
        num:= random(40);
        agregarAlFinal(l, ultimo, num);
    end;
end;




{ eliminar todas las ocurrencias de un numero }
procedure eliminarTodos(var l: lista; num: integer);
var
    anterior, actual, aux: lista;
begin
    actual:= l;

    while (actual <> nil) do begin

        while (actual <> nil) and (actual^.dato <> num) do begin
            anterior:= actual;
            actual:= actual^.sig;
        end;

        if (actual <> nil) and (actual^.dato = num) then begin
            if (l = actual) then begin
                aux:= l;
                l:= l^.sig;
                dispose(aux);
            end
            else begin
                aux:= actual;
                anterior^.sig:= actual^.sig;
                actual:= actual^.sig;
                dispose(aux);
            end;
        end;
    end;
end;





{ imprimir la lista }
procedure imprimir(l: lista);
begin
    while (l <> nil) do begin
        write(l^.dato, ', ');
        l:= l^.sig;
    end;
end;




var
    l: lista;
    num: integer;
BEGIN
    cargar(l);

    writeln('');
    writeln('lista entera.');
    imprimir(l);

    writeln('');
    write('un numero para eliminar todas sus ocurrencias: ');
    readln(num);
    eliminarTodos(l, num);

    writeln('');
    writeln('lista con los numeros eliminados.');
    imprimir(l);
END.

