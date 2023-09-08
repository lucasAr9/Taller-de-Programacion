{
b) generar una estructura con los codigos de los pacientes de (4) cuyo dni estan
comprendido entre dos valores.

c) aumentar el costo abonado por sesion de todos los pacientes en un monto recibido.

d) contar cuantos pacientes hay en la estructura abb.

e) buscar un paciente por dni y mostrar cuel es su obra social y costo por sesion.
}

program ejer4;

const
obra = 5;

type
cantObras = 1..obra;

paciente = record
    dni: integer;
    codPaciente: integer;
    obraSocial: cantObras;
    costoPorSesion: real;
end;

arbol = ^nodoArbol;
nodoArbol = record
    dato: paciente;
    hI: arbol;
    hD: arbol;
end;

lista = ^nodoLista;
nodoLista = record
    dato: paciente;
    sig: lista;
end;



procedure leer(var p: paciente; num: integer);
begin
    with p do begin
        dni:= random(30400);
        codPaciente:= num;
        obraSocial:= random(5) +1;
        costoPorSesion:= random(5000);
    end;
end;

procedure armarNodo(var abb: arbol; p: paciente);
begin
    if (abb = nil) then begin
        new(abb);
        abb^.dato:= p;
        abb^.hI:= nil;
        abb^.hD:= nil;
    end
    else begin
        if (abb^.dato.dni > p.dni) then
            armarNodo(abb^.hI, p)
        else
            armarNodo(abb^.hD, p);
    end;
end;

procedure cargar(var abb: arbol);
var
    p: paciente;
    i: integer;
begin
    randomize;
    abb:= nil;
    
    for i:= 1 to 50 do begin
        leer(p, i);
        armarNodo(abb, p);
    end;
end;

procedure imp(p: paciente);
begin
    with p do begin
        writeln('');
        writeln('DNI: ', dni);
        writeln('codigo de paciente: ', codPaciente);
        writeln('obra social: ', obraSocial);
        writeln('costo de la sesion: ', costoPorSesion:2:2);
    end;
end;
procedure imprimirArbol(abb: arbol);
begin
    if (abb <> nil) then begin
        imprimirArbol(abb^.hI);
        imp(abb^.dato);
        imprimirArbol(abb^.hD);
    end;
end;



procedure agregarAtras(p: paciente; var l, ultimo: lista);
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

procedure entreDNIs(abb: arbol; var l: lista; num1, num2: integer);
var
    ultimo: lista;
begin
    if (abb <> nil) then begin
        if (num1 < abb^.dato.dni) then begin
            if (abb^.dato.dni < num2) then begin
                entreDNIs(abb^.hI, l, num1, num2);
                if (abb^.dato.obraSocial = 4) then
                    agregarAtras(abb^.dato, l, ultimo);
                entreDNIs(abb^.hD, l, num1, num2);
            end
            else
                entreDNIs(abb^.hI, l, num1, num2);
        end
        else
            entreDNIs(abb^.hD, l, num1, num2);
    end;
end;

procedure imprimirLista(l: lista);
begin
    while (l <> nil) do begin
        imp(l^.dato);
        l:= l^.sig;
    end;
end;

procedure aumentarMontos(var abb: arbol; monto: real; cant: integer);
begin
    if (abb <> nil) then begin
        aumentarMontos(abb^.hI, monto, cant);
        cant:= cant + 1;
        abb^.dato.costoPorSesion:= abb^.dato.costoPorSesion + monto;
        aumentarMontos(abb^.hD, monto, cant);
    end;
end;

function buscar(abb: arbol; dni: integer): arbol;
begin
    if (abb <> nil) then begin
        if (abb^.dato.dni = dni) then
            buscar:= abb
        else begin
            if (dni < abb^.dato.dni) then
                buscar:= buscar(abb^.hI, dni)
            else
                buscar:= buscar(abb^.hD, dni);
        end;
    end
    else
        buscar:= nil;
end;



var
    abb, encontrado: arbol;
    num1, num2, contar: integer;
    l: lista;
    monto: real;
BEGIN
    cargar(abb);
    writeln('Se imprime el arbol ordenado por dni de paciente_________________________');
    imprimirArbol(abb);

    writeln('');
    writeln('');
    write('Primer numero de dni: '); readln(num1);
    write('Segundo numero de dni: '); readln(num2);
    entreDNIs(abb, l, num1, num2);
    writeln('');
    writeln('');
    writeln('Se imprime la lista entre los dni ', num1, ' y ', num2, '________________');
    imprimirLista(l);

    writeln('');
    writeln('');
    contar:= 0;
    write('Monto a aumentar: '); readln(monto);
    aumentarMontos(abb, monto, contar);
    writeln('La cantidad de pacientes que hay son: ', contar);
    writeln('Se imprime el arbol con los aumentos_____________________________________');
    imprimirArbol(abb);
 
    writeln('');
    writeln('');
    write('dni a buscar: '); readln(num1);
    writeln('El paciente es.');
    encontrado:= buscar(abb, num1);
    if (encontrado <> nil) then
        imp(encontrado^.dato);
END.

