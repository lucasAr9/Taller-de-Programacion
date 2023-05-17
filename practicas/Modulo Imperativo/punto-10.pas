{ 
    Implementar un programa que contenga:
    a. Un módulo que lea información de alumnos de Taller de Programación y almacene
    en una estructura de datos sólo a aquellos alumnos que posean año de ingreso posterior
    al 2010. Esta estructura debe estar ordenada por legajo y debe ser eficiente para la
    búsqueda por dicho criterio. De cada alumno se lee legajo, apellido, nombre, DNI y año de
    ingreso.
    b. Un módulo que reciba la nueva estructura e informe el nombre y apellido de
    aquellos alumnos cuyo legajo sea inferior a 15853.
    c. Un módulo que reciba la nueva estructura e informe el nombre y apellido de
    aquellos alumnos cuyo legajo esté comprendido entre 1258 y 7692.
}

program punto10;

type
alumno = record
    legajo: integer;
    apellido: string[20];
    nombre: string[20];
    DNI: integer;
    anioIngreso: integer;
end;

arbol = ^nodo;
nodo = record
    dato: alumno;
    hijoI: arbol;
    hijoD: arbol;
end;

// procedure leerAlu(var alu: alumno);
// begin
//     with alu do begin
//         writeln(' ');
//         write('legajo: '); readln(legajo);
//         if (legajo <> 0) then begin
//             write('anio de ingreso: '); readln(anioIngreso);
//             if (anioIngreso > 2010) then begin
//                 write('apellido: '); readln(apellido);
//                 write('nombre: '); readln(nombre);
//                 write('DNI: '); readln(DNI);
//             end;
//         end;
//     end;
// end;
procedure armarNodo(var abb: arbol; alu: alumno);
begin
    if (abb = nil) then begin
        new(abb);
        abb^.dato:= alu;
        abb^.hijoI:= nil;
        abb^.hijoD:= nil;
    end
    else
    if (alu.legajo < abb^.dato.legajo) then
        armarNodo(abb^.hijoI, alu)
    else
        armarNodo(abb^.hijoD, alu);
end;
// procedure cargar(var abb: arbol);
// var
//     alu: alumno;
// begin
//     leerAlu(alu);
//     while (alu.legajo <> 0) do begin
//         if (alu.anioIngreso > 2010) then
//             armarNodo(abb, alu);
//         leerAlu(alu);
//     end;
// end;
procedure cargar(var a: arbol);
var
	f: text;
	al: alumno;
begin
    //direccion del archivo ya cargado
	assign(f, 'D:\Documentos\____Facultad de Informatica____\1er año 2do semestre\taller de programacion\__practicas en pascal__\Modulo Imperativo\punto-10.txt');
	//los datos deben estar: 1 dato por linea y todos continuados
	//deben coincidir con los tipos de datos leidos en el mismo orden
	writeln('muestra de carga de alumnos'); 
	reset(f); //comando para abrirlo
	while ( not eof(f) ) do begin
		readln(f, al.anioIngreso);
		readln(f, al.legajo);
		readln(f, al.nombre);
		readln(f, al.apellido);
		readln(f, al.dni);
		//muestra lo que esta cargando
		// writeln('anio ingreso: ', al.anioIngreso);
		// writeln('legajo: ', al.legajo);
		// writeln('nombre: ', al.nombre);
		// writeln('apellido: ', al.apellido);
		// writeln('dni: ', al.dni);
		// writeln('-------');
		armarNodo(a, al);
	end;	
	close(f);
end;


procedure imp(alu: alumno);
begin
    with alu do begin
        writeln(' ');
        write('legajo: ', legajo);
        write('anio de ingreso: ', anioIngreso);
        write('apellido: ', apellido);
        write('nombre: ', nombre);
        write('DNI: ', DNI);
    end;
end;
procedure imprimirTodo(abb: arbol);
begin
    if (abb <> nil) then begin
        imprimirTodo(abb^.hijoI);
        imp(abb^.dato);
        imprimirTodo(abb^.hijoD);
    end;
end;

{   Un módulo que reciba la nueva estructura e informe el nombre y apellido de
    aquellos alumnos cuyo legajo esté comprendido entre 1258 y 7692. }
procedure imprimir(abb: arbol);
begin
    if (abb <> nil) then begin
        if (abb^.dato.legajo > 1258) and (abb^.dato.legajo < 7692) then begin
            imprimir(abb^.hijoI);
            writeln(abb^.dato.apellido);
            writeln(abb^.dato.nombre);
            imprimir(abb^.hijoD);
        end;
    end;
end;



var
    abb: arbol;
BEGIN
    writeln(' ');
    cargar(abb);

    writeln(' ');
    writeln('imprimir todo.');
    imprimirTodo(abb);

    writeln(' ');
    writeln('solo los entre 1258 y los 7692.');
    imprimir(abb);
END.

