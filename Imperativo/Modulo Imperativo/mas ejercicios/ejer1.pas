{ 
    Una feria municipal tiene 20 puestos de venta y necesita procesar las compras de sus
    clientes. Para ello se dispone de un módulo “Compras” que lee la información de las
    compras realizadas en los puestos de venta y genera una estructura con código de
    cliente, dni de cliente, fecha y monto de la compra, agrupados por puesto de venta.

    Para cada puesto de venta, los clientes se encuentran ordenados por código de cliente.
    
    Se pide implementar un programa en Pascal que: 
    a) Invoque a un módulo que reciba la estructura de las compras y utilizando la técnica
    de merge o merge acumulador genere un árbol ordenado que contenga el dni de cliente
    y monto total acumulado entre todas sus compras.
    El árbol debe estar ordenado por el monto total.

    b) Implementar un módulo recursivo que reciba la estructura generada en a) y retorne
    la cantidad de clientes con monto total superior a un valor que se recibe como
    parámetro. NOTA: Cada puesto puede realizar más de una venta al mismo cliente.
    No es necesario implementar la carga de la estructura que se dispone.
    Alcanza con declarar el encabezado del procedimiento e invocarlo para que el
    programa compile satisfactoriamente.
}

program ejer_1;

const
puesto = 20;

type
cantPuestos = 1..puesto;

fecha = record
    dia: 1..31;
    mes: 1..12;
    anio: 2000..2020;
end;

compra = record
    puesto: cantPuestos;
    codigo: integer;
    dni: integer;
    f: fecha;
    monto: real;
end;

lista = ^nodoLista;
nodoLista = record
    dato1: compra;
    sig: lista;
end;

vector = array [cantPuestos] of lista;

compraPorCli = record
    dni: integer;
    monto: real;
end;

arbol = ^nodoArbol;
nodoArbol = record
    dato: compraPorCli;
    hi: arbol;
    hd: arbol;
end;




{ cargar los datos de las compras agrupados por puesto de venta (20) y ordenados por codigo }
procedure leer(var c: compra);
var
    mismoNum: integer;
begin
    c.puesto:= random(20) +1;
    mismoNum:= random(50);
    c.codigo:= mismoNum;
    c.dni:= mismoNum;
    c.f.dia:= random(30) +1;
    c.f.mes:= random(11) +1;
    c.f.anio:= random(20) +2000;
    c.monto:= random(35000);
end;

procedure armarNodoLista(var l: lista; c: compra);
var
    anterior, actual, nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato1:= c;

    actual:= l;
    while (actual <> nil) and (actual^.dato1.codigo < c.codigo) do begin
        anterior:= actual;
        actual:= actual^.sig;
    end;

    if (l = actual) then
        l:= nuevo
    else
        anterior^.sig:= nuevo;
    nuevo^.sig:= actual;
end;

procedure cargar(var v: vector);
var
    i: integer;
    c: compra;
begin
    randomize;
    for i:= 1 to 100 do begin
        leer(c);
        armarNodoLista(v[c.puesto], c);
    end;
end;

procedure inicializar(var v: vector);
var i: cantPuestos;
begin
    for i:= 1 to puesto do
        v[i]:= nil;
end;

procedure imprimirVecDeListas(v: vector);
var
    i: cantPuestos;
begin
    for i:= 1 to puesto do begin
        writeln('');
        writeln('------> puesto: ', i);
        if (v[i] <> nil) then begin
            while (v[i] <> nil) do begin
                writeln('');
                writeln('codigo: ', v[i]^.dato1.codigo);
                writeln('dni: ', v[i]^.dato1.dni);
                writeln('fecha: ', v[i]^.dato1.f.dia, '/', v[i]^.dato1.f.mes, '/', v[i]^.dato1.f.anio);
                writeln('monto: ', v[i]^.dato1.monto:2:2);
                v[i]:= v[i]^.sig;
            end;
        end
        else
            writeln('no hay.');
    end;
end;




{ sumar el monto de cada cliente (dni) y agregarlo a un arbol ordenado por monto }
procedure armarNodoArbol(var abb: arbol; actual: integer; total: real);
begin
    if (abb = nil) then begin
        new(abb);
        abb^.dato.dni:= actual;
        abb^.dato.monto:= total;
        abb^.hI:= nil;
        abb^.hD:= nil;
    end
    else begin
        if (total < abb^.dato.monto) then
            armarNodoArbol(abb^.hI, actual, total)
        else
            armarNodoArbol(abb^.hD, actual, total);
    end;
end;

procedure minimo(var v: vector; var monto: real; var min: integer);
var
    i: cantPuestos;
    pos: integer;
begin
    min:= 999;
    monto:= 0;
    pos:= -1;

    for i:= 1 to puesto do begin
        if (v[i] <> nil) and (v[i]^.dato1.codigo < min) then begin
            min:= v[i]^.dato1.codigo;
            pos:= i;
        end;
    end;

    if (pos <> -1) then begin
        min:= v[pos]^.dato1.dni;
        monto:= v[pos]^.dato1.monto;
        v[pos]:= v[pos]^.sig;
    end;
end;

procedure merge(var abb: arbol; v: vector);
var
    actual, min: integer;
    total, monto: real;
begin
    abb:= nil;

    minimo(v, monto, min);
    while (min <> 999) do begin
        actual:= min;
        total:= 0;
        while (min <> 999) and (actual = min) do begin
            total:= total + monto;
            minimo(v, monto, min);
        end;
        armarNodoArbol(abb, actual, total);
    end;
end;

procedure imprimirMerge(abb: arbol);
begin
    if (abb <> nil) then begin
        imprimirMerge(abb^.hI);
        writeln('');
        writeln('dni: ', abb^.dato.dni);
        writeln('monto: ', abb^.dato.monto:2:2);
        imprimirMerge(abb^.hD);
    end;
end;





procedure calcular(abb: arbol; monto: real; var cant: integer);
begin
    if (abb <> nil) then begin
        if (abb^.dato.monto > 0) then begin

            if (abb^.dato.monto < monto) then begin
                calcular(abb^.hI, monto, cant);
                cant:= cant +1;
                calcular(abb^.hD, monto, cant);
            end
            else
                calcular(abb^.hI, monto, cant);
        end
        else
            calcular(abb^.hD, monto, cant);
    end;
end;





var
    v: vector;
    abb: arbol;
    monto: real;
    cant: integer;
BEGIN
    inicializar(v);
    cargar(v);
    writeln('');
    writeln('');
    writeln('se imprime el vector de listas.');
    imprimirVecDeListas(v);

    merge(abb, v);
    writeln('');
    writeln('');
    writeln('se imprime el arbol mergeado.');
    imprimirMerge(abb);

    cant:= 0;
    write('un monto para ver cuantos clientes lo superan: '); readln(monto);
    calcular(abb, monto, cant);
    writeln('la cant es: ', cant);
END.

