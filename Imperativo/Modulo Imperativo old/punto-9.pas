{
    Implemente un programa que invoque a un módulo que genere un árbol binario de
    búsqueda con nombres de personas que se leen desde teclado. La lectura finaliza con el
    nombre ‘ZZZ’ que no debe procesarse. También debe invocar a otro módulo que reciba el
    árbol generado y un nombre, y retorne verdadero si existe dicho nombre en el árbol o falso
    en caso contrario.
}

program punto9;

type
arbol = ^nodo;
nodo = record
    dato: string[20];
    hijoI: arbol;
    hijoD: arbol;
end;

procedure armarNodo(var abb: arbol; nombre: string);
begin
    if (abb = nil) then begin
        new(abb);
        abb^.dato:= nombre;
        abb^.hijoI:= nil;
        abb^.hijoD:= nil;
    end
    else
    if (nombre < abb^.dato) then
        armarNodo(abb^.hijoI, nombre)
    else
        armarNodo(abb^.hijoD, nombre);
end;
procedure cargar(var abb: arbol);
var
    nombre: string[20];
begin
    abb:= nil;
    readln(nombre);
    while (nombre <> 'zzz') do begin
        armarNodo(abb, nombre);
        readln(nombre);
    end;
end;

function buscarNombre(abb: arbol; nombre: string): boolean;
begin
    if (abb = nil) then
        buscarNombre:= false
    else
    if (abb^.dato = nombre) then
        buscarNombre:= true
    else
    if (nombre < abb^.dato) then
        buscarNombre:= buscarNombre(abb^.hijoI, nombre)
    else
        buscarNombre:= buscarNombre(abb^.hijoD, nombre);
end;


var
    abb: arbol;
    nombre: string[20];
BEGIN
    writeln(' ');
    writeln('cargar arbol con nombres.');
    cargar(abb);

    writeln(' ');
    write('nombre para buscar: '); readln(nombre);
    if ( buscarNombre(abb, nombre) ) then
        writeln('el nombre se encontro con exito.')
    else
        writeln('nope. no se encontro con exito.');
END.

