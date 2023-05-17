{ ---------------------------------------operaciones con LISTAS--------------------------------------- }
{ de manera ITERATIVA y de manera RECURSIVA }
{ con corte de control y con MERGE DE LISTAS y MERGE ACUMULADOR }

{ RECORRER UNA LISTA }
procedure recorrido(l: lista);
begin
    while (l <> nil) do begin
        writeln(l^.dato);
        l:= l^.sig;
    end;
end;





{ CALCULAR LOS QUE SUPERAN LAS 100 UNIDADES VENDIDAS }
procedure contar500(l: listaMerge; var cant: integer);
begin
    if (l <> nil) then begin
        if (l^.dato.cantTotal >= 100) then
            cant:= cant + 1;
        contar500(l^.sig, cant);
    end;
end;





{ BUSCAR DESORDENADO *FUNCION* devuelve puntero } {ordenado es l^.dato < num}
function buscar(l: lista; num: integer): lista;
begin
    while (l <> nil) and (l^.dato <> num) do
        l:= l^.sig;

    if (l <> nil) and (l^.dato = num) then
        buscar:= l
    else
        buscar:= nil;
end;

{ BUSCAR DESORDENADO *FUNCION* devuelve boolean } {ordenado es l^.dato < num}
function buscar(l: lista; num: integer): boolean;
begin
    while (l <> nil) and (l^.dato <> num) do
        l:= l^.sig;

    if (l <> nil) and (l^.dato = num) then
        buscar:= true
    else
        buscar:= false;
end;

{ BUSCAR DE *MANERA RECURSIVA* devuelve boolean }
function buscar(l: lista; num: integer): boolean;
begin
    if (l = nil) then
        buscar:= false
    else
    if (l^.dato = num) then
        buscar:= true
    else
        buscar:= buscar(l^.sig, num);
end;





{ AGREGAR UN ELEMENTO AL PRINCIPIO DE LA LISTA }
procedure agregarAdelante(var l: lista; num: integer);
var 
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.datos:= num;
    nuevo^.sig:= l;
    l:= nuevo;
end;

{ AGREGAR UN ELEMENTO AL FINAL DE LA LISTA }
procedure agregarAlFinal(var l, ultimo: lista; num: integer);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato:= min;
    nuevo^.sig:= nil;

    if (l = nil) then
        l:= nuevo
    else
        ultimo^.sig:= nuevo;
    ultimo:= nuevo;
end;

{ AGREGAR UN ELEMENTO AL FINAL DE LA LISTA RECORRIENDO LA LISTA  }
procedure agregarAtrasVersion2(var l: lista; num: integer); //recorre toda la lista
var
    nuevo, actual: lista;
begin
    new(nuevo);
    nuevo^.dato:= num;
    nuevo^.sig:= nil;

    if (l <> nil) then begin
        actual:= l;
        while (actual^.sig <> nil) do
            actual:= actual^.sig;
        actual^.sig:= nuevo;
    end
    else
        l:= nuevo;
end;

{ AGREGAR UN ELEMENTO A LA LISTA ORDENADAMENTE }
procedure agregarOrdenado(var l: lista; num: integer); 
var
    nuevo, anterior, actual: lista;
begin
    new(nuevo);
    nuevo^.dato:= num;
    actual:= l;

    while (actual <> nil) and (actual^.dato < num) do begin
        anterior:= actual;
        actual:= actual^.sig;
    end;

    if (l = actual) then
        l:= nuevo
    else
        anterior^.sig:= nuevo;
    nuevo^.sig:= actual;
end;





{ ELIMINAR UN ELEMENTO DE LA LISTA }
procedure eliminar(var l: lista; num: integer; var ctrl: boolean);
var
    anterior, actual: lista;
begin
    ctrl:= false;
    actual:= l;

    while (actual <> nil) and (actual^.dato <> num) do begin
        anterior:= actual;
        actual:= actual^.sig;
    end;

    if (actual <> nil) and (num = actual^.dato) then begin
        if (l = actual) then
            l:= l^.sig
        else
            anterior^.sig:= actual^.sig;
        dispose(actual);
        ctrl:= true;
    end;
end;

{ ELIMINAR TODAS LAS OCURRENCIAS DE UN ELEMENTO EN UNA LISTA }
procedure eliminarTodos(var l: lista; num: integer);
var
    anterior, actual, aux: lista;
begin
    actual:= l;
    while (actual <> nil) do begin
        if (actual^.dato = num) then begin
            aux:= actual;
            if (actual = l) then
                l:= l^.sig
            else
                anterior^.sig:= actual^.sig;
            actual:= actual^.sig;
            dispose(aux);
        end
        else begin
            anterior:= actual;
            actual:= actual^.sig;
        end;
    end;
end;

{ ELIMINAR EN LAS LISTAS DE LAS SUCURSALES DESDE A HADTA B }
procedure eliminarBloque(var v: vecSucursal; a, b: integer);
var
    primero, ultimo, aux: lista;
    i: cantSucursales;
begin
    for i:= 1 to sucursal do begin
        primero:= v[i];
        while (primero <> nil) and (primero^.dato.codigo <= a) do
            primero:= primero^.sig;

        ultimo:= primero;
        while (ultimo <> nil) and (ultimo^.dato.codigo <= b) do begin
            aux:= ultimo;
            ultimo:= ultimo^.sig;
            dispose(aux);
        end;

        primero^.sig:= ultimo;
    end;
end;





{ INSERTAR UN NUEVO ELEMENTO A LA LISTA ORDENADA }
procedure insertar(var l: lista; num: integer);
var 
    anterior, nuevo, actual: lista;
begin
    new(nuevo);
    nuevo^.dato:= num;
    actual:= l;

    while (actual <> nil) and (actual^.dato < num) do begin
        anterior:= actual;
        actual:= actual^.sig;
    end;
    
    if (l = actual) then 
        l:= nuevo   
    else  
        anterior^.sig:= nuevo; 
    nuevo^.sig:= actual;
end;





{ CORTE DE CONTROL }
procedure corteDeControl(var l: lista);
var
    cantidad, actual: integer;
begin
    while (l <> nil) do begin
        actual:= l^.dato;
        cantidad:= 0;
        while (l <> nil) and (actual = l^.dato) do begin
            cantidad:= cantidad +1;
            l:= l^.sig;
        end;
        writeLn('La cantidad de ', l^.dato, ' es ', cantidad);
    end;
end;





{ CALCULAR MINIMO DE *MANERA RECURSIVA_PROCESO* }
procedure calcularMin(l: lista; var min: integer);
begin
    if (l <> nil) then begin
        if (l^.dato < min) then
            min:= l^.dato;

        calcularMin(l^.sig, min);
    end;
end;

{ CALCULAR MINIMO DE *MANERA RECURSICA_FUNCION* }
function calcularMin(l: lista; min: integer): integer;
begin
    if (l = nil) then begin
        calcularMin:= min;
    end
    else begin
        if (l^.dato < min) then
            min:= l^.dato;

        calcularMin:= calcularMin(l^.sig, min);
    end;
end;





{ MERGE ENTRE DOS LISTAS }
procedure merge(l1, l2: lista; var newL: lista);
var 
    min: string;
    ultimo: lista;
begin
    newL:= nil;    
    minimo (l1, l2, min);    
    while (min <> 'ZZZ') do begin
        agregarAlFinal(newL, ultimo, min);
        minimo (l1, l2, min);
    end;
end;

// MINIMO DEL MERGE ENTRE DOS LISTAS
procedure minimo(var l1, l2: lista; var min: string);
begin
    min:= 'ZZZ';
    if (l1 <> nil) and (l2 <> nil) then begin
        if (l1^.dato <= l2^.dato ) then begin
            min:= l1^.dato;
            l1:= l1^.sig;
        end
        else begin
            min:= l2^.dato;
            l2:= l2^.sig;
        end;
    end
    else begin
        if (l1 <> nil) and (l2 = nil) then begin
            min:= l1^.dato;
            l1:= l1^.sig;
        end;
    end
    else begin
        if (l1 = nil) and (l2 <> nil) then begin
            min:= l2^.dato;
            l2:= l2^.sig;
        end;
    end;
end;
// AGREGARLO AL FINAL
procedure agregarAlFinal(var l, ultimo: lista; min: string);





{ MERGE ENTRE MAS DE DOS LISTAS }
procedure merge(v: vector; var newL: lista);
var
   min: string;
   ultimo: lista;
begin
    newL:= nil;
	minimo(v, min);
	while (min <> 'ZZZ') do begin
		agregarAlFinal(newL, ultimo, min);
		minimo(v, min);
	end;
end;

// MINIMO DEL MERGE ENTRE MAS DE DOS LISTAS
procedure minimo(var v: vector; var min: string);
var
   pos, i: integer;
begin
	min:= 'ZZZ';
	pos:= -1;

	for i:= 1 to dimF do begin
		if (v[i] <> nil) and (v[i]^.dato <= min) then begin
			min:= v[i]^.dato; 
			pos:= i;	
		end;
    end;

	if (pos <> -1) then  
		v[pos]:= v[pos]^.sig;
end;
// AGREGARLO AL FINAL
procedure agregarAlFinal(var l, ultimo: lista; min: string);





{ MERGE ACUMULADOR }
procedure merge(v: vector; var newL: lista);
var
    actual, min: integer;
    montoTotal, monto: real;
    ultimo: lista;
begin
    newL:= nil;

    minimo(min, monto, v);
    while (min <> 999) do begin
        actual:= min;
        montoTotal:= 0;
        while (min <> 999) and (actual = min) do begin
            montoTotal:= montoTotal + monto;
            minimo(min, monto, v);
        end;
        agregarAtras(newL, ultimo, actual, montoTotal);
    end;
end;

// MINIMO DEL MERGE ACUMULADOR
procedure minimo(var min: integer; var monto: real; var v: vector);
var
    i, pos: integer;
begin
    min:= 999;
    monto:= 0;
    pos:= -1;

    for i:= 1 to dimF do begin
        if (v[i] <> nil) and (v[i]^.dato.codObra < min) then begin
            min:= v[i]^.dato.codObra;
            pos:= i;
        end;
    end;

    if (pos <> -1) then begin
        monto:= v[pos]^.dato.monto;
        v[pos]:= v[pos]^.sig;
    end;
end;
// AGREGARLO AL FINAL
procedure agregarAtras(var l, ultimo: lista; actual: integer; montoTotal: real);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato.codObra:= actual;
    nuevo^.dato.monto:= montoTotal;
    nuevo^.sig:= nil;

    if (l = nil) then
        l:= nuevo
    else
        ultimo^.sig:= nuevo;
    ultimo:= nuevo;
end;




{ FIN }