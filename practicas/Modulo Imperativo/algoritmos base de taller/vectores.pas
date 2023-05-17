{ ---------------------------------------operaciones con VECTORES--------------------------------------- }
{ de manera ITERATIVA y de manera RECURSIVA }

{ RECORRIDO TOTAL }
var
    v: vector;
    i: integer;
begin
    for i:= 1 to dimF do
        writeln(v[i]);
end.
{ RECORRIDO PARCIAL }
var // puede no existir
    v: vector;
    i: integer;
begin
    i:= 1;
    while (i <= dimF) and (v[i] <> 0) do
        i:= i +1;
end.





{ CARGA DE DATOS TOTAL }
procedure cargaTotal(var v: vector);
var
    i: integer;
begin
    for i:= 1 to dimF do
        readln(v[i]);
end;

{ CARGA DE DATOS PARCIAL }
procedure cargaParcial(var v: vector; var dL: integer);
var
    num: integer;
begin
    dL:= 0;
    readln(num);
    while (dL < dimF) and (num <> 0) do begin
        dL:= dL +1;
        v[dL]:= num;
        readln(num);
    end;
end;





{ AGREGAR AL FINAL }
procedure agregarAlFinal(var v: vector; var dL: integer; elemeto: integer);
begin
    if (dL < dimF) then begin
        dL:= dL +1;
        v[dL]:= elemento;
    end;
end;





{ INSERTAR UN ELEMENTO }
// en una posicion determinada
procedure insertarPosDeterminada(var v:vector; var dL: integer; elemento, pos: integer);
var
   i: integer;
begin
    if (dL < dimF) and ((pos >= 1) and (pos <= dL)) then begin
        for i:= dL downto pos do
            v[i +1]:= v[i];
        v[pos]:= elemento;
        dL:= dL +1;
    end
    else
        writeln('no hay mas lugar para insertar el numero o pos invalida.');
end;
// manteniendo un orden en un vector ordenado de menor a mayor
procedure insertarOrdenado(var v: vector; var dL: integer; num: integer);
var
    i, j: integer;
begin
    i:= 1;
    if (dL < dimF) then begin
        while (i <= dL) and (num > v[i]) do
            i:= i +1;

        for j:= dL downto i do
            v[j +1]:= v[j];
        v[i]:= num;
        dL:= dL +1;
    end
    else
        writeln('no hay mas lugar para insertar el numero.');
end;





{ BORRAR UN ELEMENTO. 4 maneras }
// (1) EN UNA POSICION DETERMINADA ----------------------------------------------------------
procedure borrarPos(var v: vector; var dL: integer; pos: integer);
var
    i: integer;
begin
    if (pos >= 1) and (pos <= dL) then begin
        for i:= pos to dL -1  do
            v[i]:= v[i +1];
        dL:= dL -1;
    end;
end;

// (2) CON UN ELEMENTO DETERMINADO ----------------------------------------------------------
procedure eliminarUno(var v: vector; var dL: integer; loc: integer);
var
    i, j: integer;
begin
    i:= 1;
    while (i <= dL) and (v[i].localidad < loc) do
        i:= i + 1;

    if (i <= dL) and (v[i].localidad = loc) then begin
        dL:= dL - 1;
        for j:= i to dL do
            v[j]:= v[j + 1];
        e:= true;
    end;
end;

// (3) BORRAR TODAS LAS OCURRENCIAS DE UN ELEMENTO ------------------------------------------
procedure eliminarTodasOccurrencias(var v: vector; var dL: integer; num: integer);
var
    i, j, num: integer;
begin
    for i:= 1 to dL do begin
        if (v[i] = num) then begin
            dL:= dL -1;
            for j:= i to dL do
                v[j]:= v[j +1];
        end;
    end;
end;

// (4) BORRAR EN BLOQUE, solo si el vector esta ordenado ------------------------------------
procedure eliminarEnBloque(var v: vector; var dL: integer);
var
    i, pos, cant: integer;
    num1, num2: integer;
begin
    write('entre: '); readln(num1);
    write('y entre: '); readln(num2);
    cant:= 0;
    i:= 1;
    { buscar el primer numero }
    while ( (i <= dL) and (v[i] < num1) ) do
        i:= i +1;

    pos:= i;
    { buscar el segundo numero y quedarme con el que le sigue para ir acomodando el que siga }
    while ( (i <= dL) and (v[i] <= num2) ) do
        i:= i +1;

    { eliminar a todos los numeros de las posiciones entre el primero y el ultimo calculados }
    cant:= i - pos;
    for i:= (pos + cant) to dL do
        v[i - cant]:= v[i];

    dL:= dL - cant;
    writeln('La cantidad de numeros eliminados son: ', cant);
end;





{ BUSCAR UN ELEMENTO EN VECTOR DESORDENADO *PROCESO* } {ordenado es v[i] < num}
procedure buscarDesordenado(v: vector; dL, num: integer; var ok: boolean);
var
    i: integer; 
begin
    i:= 1;
    while (i <= dL) and (v[i] <> num) do
        i:= i +1;

    if (i <= dL) and (v[i] = num) then
        ok:= true;
    else
        ok:= false;
end;

{ BUSCAR UN ELEMENTO EN VECTOR DESORDENADO *FUNCION* } {ordenado es v[i] < num}
function buscarDesordenado(v: vector; dL, num: integer): boolean;
var
    i: integer;
begin
    i:= 1;
    while (i <= dL) and (v[i] <> num) do
        i:= i +1;

    if (i <= dL) and (v[i] = num) then
        buscarOrdenado:= true;
    else
        buscarOrdenado:= false;
end;

{ BUSQUEDA DICOTOMICA/BINARIA *PROCESO* }
procedure busquedaBinaria(var v: vector; dL, num: integer; var ok: boolean);
var
    primero, ultimo, medio: integer;
begin
    primero:= 1;
    ultimo:= dL;
    medio:= (primero + ultimo) div 2;

    while (primero <= ultimo) and (num <> v[medio]) do begin
        if (num < v[medio]) then
            ultimo:= medio -1
        else
            primero:= medio +1;
        medio:= (primero + ultimo) div 2;
    end;

    if (primero <= ultimo) and (num = v[medio]) then
        ok:= true
    else
        ok:= false;
end;

{ BUSQUEDA DICOTOMICA/BINARIA *FUNCION_RECURSIVA* }
function busqCod(v: vector; primero, ultimo, cod: integer): integer;
var
    medio: integer;
begin
    if (primero < ultimo) then begin
    
        medio:= (primero + ultimo) div 2;
        if (v[medio].cod = cod) then
            busqCod:= medio
        else
            if (v[medio].cod < cod) then
                busqCod:= busqCod(v, medio +1, ultimo, cod)
            else
                busqCod:= busqCod(v, primero, medio -1, cod);
    end
    else
        if (v[primero].cod = cod) then
            busqCod:= primero
        else
            busqCod:= -1;
end;





{ ORDENAR UN VECTOR POR *SELECCION* }
procedure ordenarSeleccion(var v: vector; dL: integer);
var
    i, j, p, aux: integer;
begin
    for i:= 1 to dL -1 do begin
        p:= i;
        for j:= i +1 to dL do
            if v[j] < v[p] then 
                p:= j;
        {intercambia v[i] y v[p]}
        if (i <> p) then begin
            aux:= v[i];
            v[i]:= v[p];
            v[p]:= aux;
        end;
    end;
end;

{ ORDENAR UN VECTOR POR *INSERCION* }
procedure ordenarInsercion(var v: vector; dL: integer );
var 
    i, j: integer; 
    actual: integer;
begin
    actual:= 0;
    for i:= 2 to dL do begin 
        actual:= v[i];
        j:= i -1; 
        while (j > 0) and (v[j] > actual) do begin
            v[j +1]:= v[j];
            j:= j -1;
        end;  
        v[j +1]:= actual; 
    end;
end;





{ CALCULAR MAXIMO DE *MANERA RECURSION_PROCESO* }
procedure calcularMax(v: vector; i: integer; var max: integer);
begin
    if (i <= dimF) then begin
        if (v[i] > max) then
            max:= v[i];
        calcularMax(v, i +1, max);
    end;
end;

{ CALCULAR MAXIMO DE *MANERA RECURSION_FUNCION* }
function calcularMaximo(v: vector; max: integer; i: integer): integer;
begin
    if (i < dimF) then begin
        if (v[i] > max) then
            max:= v[i];
        calcularMaximo:= calcularMaximo(v, max, i +1);
    end
    else
        calcularMaximo:= max;
end;





{ SUMAR LOS ELEMENTOS DEL VECTOR }
function suma(v: vector; dL: integer): integer;
begin
    if (dL = 0) then
        suma:= 0
    else
        suma:= suma(v, dL-1) + v[dL];
end;





{ calcula promedio de un vector de manera recursiva }
function calcularPromedio(v: vector; i: integer): real;
begin
    if(i <= dimF)then
      calcularPromedio:= v[i].legajo / dimF + calcularPromedio(v, i+1);
end;




{ FIN }