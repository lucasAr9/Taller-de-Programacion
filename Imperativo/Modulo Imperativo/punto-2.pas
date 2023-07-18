{
    2. Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
	diciembre de 2021. De cada película se conoce: código de película, código de género (1:
	acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror)
	y puntaje promedio otorgado por las críticas.
	Implementar un programa modularizado que:
	
	a. Lea los datos de películas y los almacene por orden de llegada y agrupados por
	código de género, en una estructura de datos adecuada. La lectura finaliza cuando se lee
	el código de la película -1.
	
	b. Una vez almacenada la información, genere un vector que guarde, para cada
	género, el código de película con mayor puntaje obtenido entre todas las críticas.
	
	c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de
	los dos métodos vistos en la teoría.
	
	d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el
	código de película con menor puntaje.
}

program punto_2;

const
genero = 8;

type
cantGeneros = 1..genero;

pelicula = record
    codigo: integer;
    codigoGen: cantGeneros;
    puntaje: real;
end;

lista = ^nodo;
nodo = record
    dato: pelicula;
    sig: lista;
end;

vectorPeli = array [cantGeneros] of lista;
vectorDePuntajes = array [cantGeneros] of pelicula;



{ cargar los datos en orden de llegada y agrupados por codigo de genero }
procedure leer(var p: pelicula);
begin
    write('codigo: '); readln(p.codigo);
    if (p.codigo <> -1) then begin
        write('codigo de genero: '); readln(p.codigoGen);
        write('puntaje: '); readln(p.puntaje);
    end;
end;

procedure armarNodo(var l, ultimo: lista; p: pelicula);
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

procedure cargar(var v: vectorPeli);
var
    p: pelicula;
    ultimos: vectorPeli;
begin
    leer(p);
    while (p.codigo <> -1) do begin
        armarNodo(v[p.codigoGen], ultimos[p.codigoGen], p);
        leer(p);
    end;
end;



{ inicializar el vector de listas en nil }
procedure inicializarVec(var v: vectorPeli);
var
    i: cantGeneros;
begin
    for i:= 1 to genero do
        v[i]:= nil;
end;
{ imprimir el vector con las listas para comprobar que se guardo bien }
procedure imprimir(v: vectorPeli);
var
    i: cantGeneros;
begin
    for i:= 1 to genero do begin
        writeln('');
        writeln('____________________________________________________________________');
        writeln('genero: ', i);
        writeln('');
        if (v[i] <> nil) then begin
            while (v[i] <> nil) do begin
                writeln('codigo: ', v[i]^.dato.codigo);
                writeln('puntaje: ', v[i]^.dato.puntaje:2:2);
                v[i]:= v[i]^.sig;
            end;
        end
        else
            writeln('no hay.');
    end;
end;



{ calcular el puntaje maximo }
procedure calcularMaxPuntaje(lPuntaje: lista; var max: pelicula);
begin
    while (lPuntaje <> nil) do begin
        if (max.puntaje < lPuntaje^.dato.puntaje) then begin
            max.codigo:= lPuntaje^.dato.codigo;
            max.puntaje:= lPuntaje^.dato.puntaje;
        end;
        lPuntaje:= lPuntaje^.sig;
    end;
end;
{ guardar en codigo y puntaje de la pelicula con mayor puntage de cada genero }
procedure mayoresPuntajes(v: vectorPeli; var vPuntajes: vectorDePuntajes);
var
    i: cantGeneros;
    maxPuntaje: pelicula;
begin
    maxPuntaje.codigo:= 0;
    maxPuntaje.puntaje:= -1;

    for i:= 1 to genero do begin
        if (v[i] <> nil) then begin
            calcularMaxPuntaje(v[i], maxPuntaje);
            vPuntajes[i]:= maxPuntaje;
        end
        else begin
            maxPuntaje.codigo:= 0;
            maxPuntaje.puntaje:= -1;
            vPuntajes[i].codigo:= maxPuntaje.codigo;
            vPuntajes[i].puntaje:= maxPuntaje.puntaje;
        end;
    end;
end;



{ imprimir el vector de los mayores puntajes }
procedure imprimirVecPuntajes(v: vectorDePuntajes);
var
    i: cantGeneros;
begin
    for i:= 1 to genero do begin
        writeln('');
        writeln('----------------------------');
        writeln('del genero: ', i);
        writeln('');
        if (v[i].codigo <> 0) then begin
            writeln('el codigo: ', v[i].codigo);
            writeln('con el puntaje: ', v[i].puntaje:2:2);
        end
        else
            writeln('no hay.');
    end;
end;

procedure imprimirVecPuntajes2(v: vectorDePuntajes);
var
    i: cantGeneros;
begin
    writeln('');
    writeln('');
    writeln('');
    for i:= 1 to genero do begin
        if (v[i].codigo <> 0) then begin
            writeln('el codigo: ', v[i].codigo);
            writeln('del genero: ', v[i].codigoGen);
            writeln('con el puntaje: ', v[i].puntaje:2:2);
        end;
    end;
end;



{ ordenar el vector de puntajes con el metodo de insercion }
procedure ordenarPuntajes(var v: vectorDePuntajes);
var
    i, j: integer;
    actual: pelicula;
begin
    for i:= 2 to genero do begin
        actual:= v[i];
        j:= i -1;
        while (j > 0) and (v[j].codigo > actual.codigo) do begin
            v[j +1]:= v[j];
            j:= j -1
        end;
        v[j +1]:= actual;
    end;
end;



var
    v: vectorPeli;
    vPuntajes: vectorDePuntajes;
BEGIN
    inicializarVec(v);

    cargar(v);
    imprimir(v);

    mayoresPuntajes(v, vPuntajes);
    imprimirVecPuntajes(vPuntajes);

    ordenarPuntajes(vPuntajes);
    imprimirVecPuntajes2(vPuntajes);
    writeln('siendo asi el mayor puntaje el ', vPuntajes[1].puntaje, ' y el de menor puntaje ', vPuntajes[genero].puntaje);
END.
