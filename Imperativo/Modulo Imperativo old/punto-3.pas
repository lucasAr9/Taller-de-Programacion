{ 
Una librería requiere el procesamiento de la información de sus productos. De cada
producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
Implementar un programa modularizado que:

    a. Lea los datos de los productos y los almacene ordenados por código de producto y
    agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos
    finaliza cuando se lee el precio 0.
    Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.

    b. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3.
    Considerar que puede haber más o menos de 30 productos del rubro 3. Si la cantidad de
    productos del rubro 3 es mayor a 30, almacenar los primeros 30 que están en la lista e
    ignore el resto.

    c. Ordene, por precio, los elementos del vector generado en b) utilizando alguno de
    los dos métodos vistos en la teoría.

    d. Muestre los precios del vector ordenado.
}

program punto3;

const
r = 8;
rubroTres = 5;

type
cantRubros = 1..r;

producto = record
    codigo: integer;
    rubro: cantRubros;
    precio: real;
end;

lista = ^nodo;
nodo = record
    dato: producto;
    sig: lista;
end;

vLista = array [cantRubros] of lista;
vector = array [1..rubroTres] of producto;


procedure inicializarVec(var vLis: vLista);
var
    i: cantRubros;
begin
    for i:= 1 to r do
        vLis[i]:= nil;
end;

procedure imprimirLista(l: lista; i: cantRubros);
begin
    writeln(' ');
    if (l <> nil) then begin
        writeln('---> del rubro ', i);
        while (l <> nil) do begin
            writeln('codigo prod: ', l^.dato.codigo);
            writeln('precio: ', l^.dato.precio:2:2);
            writeln('...');
            l:= l^.sig;
        end;
    end
    else
        writeln('del rubro ', i, ' no hay.');
end;
procedure imprimir(vLis: vLista);
var
    i: cantRubros;
begin
    for i:= 1 to r do
        imprimirLista(vLis[i], i);
end;

procedure leerProducto(var p: producto);
begin
    writeln(' ');
    with p do begin
        write ('precio del producto: '); readln(precio);
        if (precio <> 0) then begin
            write ('codigo del producto: '); readln(codigo);
            write ('(1..8) rubro: '); readln(rubro);
        end;
    end;
end;
procedure armarNodo(var l: lista; p: producto);
var
    nuevo, anterior, actual: lista;
begin
    new(nuevo);
    nuevo^.dato:= p;

    actual:= l;
    while (actual <> nil) and (actual^.dato.codigo < nuevo^.dato.codigo) do begin
        anterior:= actual;
        actual:= actual^.sig;
    end;

    if (actual = l) then    
        l:= nuevo
    else
        anterior^.sig:= nuevo;
    nuevo^.sig:= actual;    
end;
procedure cargarOrdenadoPorRubro(var vLis: vLista);
var
    p: producto;
begin
    leerProducto(p);
    while (p.precio <> 0) do begin
        armarNodo(vLis[p.rubro], p);
        leerProducto(p);
    end;
end;

procedure losDelTres(l: lista; var v: vector; var dL: integer);
begin
    while (dL < rubroTres) and (l <> nil) do begin
        dL:= dL +1;
        v[dL]:= l^.dato;
        l:= l^.sig;
    end;
    if (dL < rubroTres) then begin
        if (dL = 0) then
            writeln('no hay productos del rubro 3.')
        else
            writeln('estos son los productos del rubro 3.');
    end
    else
        writeln('el vector esta lleno y no entram mas productos.');
end;
procedure imprimirVec(v: vector; dL: integer);
var
    i: integer;
begin
    for i:= 1 to dL do begin
        writeln('codigo prod: ', v[i].codigo);
        writeln('precio: ', v[i].precio:2:2);
    end;
end;

procedure ahoraOrdenadoPrecio(var v: vector; dL: integer);
var
    i, j: integer;
    actual: producto;
begin
    for i:= 2 to dL do begin
        actual:= v[i];
        j:= i -1;
        while (j > 0) and (v[j].precio > actual.precio) do begin
            v[j +1]:= v[j];
            j:= j -1;
        end;
        v[j +1]:= actual;
    end;
end;


var
    vLis: vLista;
    v: vector;
    dL: integer;
BEGIN
    inicializarVec(vLis);
    cargarOrdenadoPorRubro(vLis);
    imprimir(vLis);

    writeln('...........................................................');
    writeln('el vector de los del rubro 3.');
    writeln(' ');
    dL:= 0;
    losDelTres(vLis[3], v, dL);
    if (dL <> 0) then begin
        imprimirVec(v, dL);
        writeln('ahora el vector de los del rubro 3 se ordeno por precio.');
        ahoraOrdenadoPrecio(v, dL);
        imprimirVec(v, dL);
    end;
END.

