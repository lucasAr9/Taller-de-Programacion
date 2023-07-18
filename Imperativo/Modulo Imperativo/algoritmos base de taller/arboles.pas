{ ---------------------------------------operaciones con ARBOLES--------------------------------------- }
{ de manera ITERATIVA y de manera RECURSIVA }

{ DECLARACION }
type
arbol = ^nodo;
nodo = record
    dato: integer;
    hijoI: arbol;
    hijoD: arbol;
end;





{ un modulo para generar nombres aleatorios }
procedure generarMarcaRandom(var marc: String);
var num: integer;
begin
    num:= random(5);
    case num of
        0: marc:= 'Lambo';
        1: marc:= 'Peugeot';
        2: marc:= 'Fiat';
        3: marc:= 'Honda';
        4: marc:= 'Audi';
        5: marc:= 'Ferrari';
    end;
end;
procedure leer(var au: auto);
var
    marc: String;
begin
    au.patente:= random(100);
    generarMarcaRandom(marc);
    au.marca:= marc;
    au.modelo:= random(8) + 2010;
end;

{ crear el nodo y enganchar al siguiente }
procedure armarNodo(var abb: arbol; au: auto);
begin
    if (abb = nil) then begin
        new(abb);
        abb^.dato:= au;
        abb^.hI:= nil;
        abb^.hD:= nil;
    end
    else begin
        if (au.patente < abb^.dato.patente) then
            armarNodo(abb^.hI, au)
        else
            armarNodo(abb^.hD, au);
    end;
end;

{ cargar el arbol con los autos }
procedure cargar(var abb: arbol);
var
    au: auto;
begin
    abb:= nil
    randomize;
    leer(au);
    while (au.patente <> 0) do begin
        armarNodo(abb, au);
        leer(au);
    end;
end;





{ IMPRIMIR EN ORDEN }
procedure imprimirOrdenado(abb: arbol);
begin
    if (abb <> nil) then begin
        imprimirOrdenado(abb^.hijoI);
        write(abb^.dato, ', ');
        imprimirOrdenado(abb^.hijoD);
    end;
end;

{ IMPRIMIR PRE ORDEN }
procedure preOrden(abb: arbol);
begin
    if (abb <> nil) then begin
        write(abb^.dato, ', ');
        preOrden(abb^.hijoI);
        preOrden(abb^.hijoD);
    end;
end;

{ IMPRIMIR POS ORDEN }
procedure posOrden(abb: arbol);
begin
    if (abb <> nil) then begin
        posOrden(abb^.hijoI);
        posOrden(abb^.hijoD);
        write(abb^.dato, ', ');
    end;
end;

{ IMPRIMIR POR NIVELES }
procedure imprimirPorNivel(abb: arbol);
var
    l, aux, ult: listaNivel;
    nivel, cant, i: integer;
begin
    l:= nil;
    if (abb <> nil) then begin
        nivel:= 0;
        agregarAtras(l, ult, abb);

        while (l <> nil) do begin
            nivel:= nivel + 1;
            cant:= contarElementos(l);
            write ('Nivel ', nivel, ': ');

            for i:= 1 to cant do begin
                write (l^.info^.dato, ' - ');

                if (l^.info^.HI <> nil) then
                    agregarAtras(l, ult, l^.info^.HI);
                else
                    if (l^.info^.HD <> nil) then
                        agregarAtras(l, ult, l^.info^.HD);

                aux:= l;
                l:= l^.sig;
                dispose(aux);
            end;
            writeln('');
        end;
    end;
end;





{ CONTAR LOS ELEMENTOS DE UN ARBOL *PROCESO* }
procedure cantidadElementos(abb: arbol; var cant: integer);
begin
    if (abb <> nil) then begin
        cant:= cant +1;
        cantidadElementos(abb^.hijoI, cant);
        cantidadElementos(abb^.hijoD, cant);
    end;
end;

{ CONTAR LOS ELEMENTOS DE UN ARBOL *FUNCION* }
function contarElementos(abb: arbol): integer;
begin
    if (abb <> nil) then
        contarElementos:= 1 + contarElementos(abb^.hijoI) + contarElementos(abb^.hijoD)
    else
        contarElementos:= 0;
end;

{ CONTAR CANTIDAD DE VECES QUE APARECE UN ELEMENTO EN EL ARBOL *FUNCION*}
function buscar(a: arbol; num: integer): integer;
begin
	if (a = nil) then 
		buscar:= 0
	else
		if (num = a^.dato) then
			buscar:= (buscar(a^.hI, num) + 1)
		else
			if (num < a^.dato) then
				buscar:= buscar(a^.hI, num)
			else
				buscar:= buscar(a^.hD, num)
end;

{ CALCULAR, POR EJEMPLO, CUANTOS AUTOS DE TAL MARCA HAY *PROCESO* }
procedure cantAutosPorMarca(abb: arbol; marca: String; var cant: integer);
begin
    if (abb <> nil) then begin

        cantAutosPorMarca(abb^.hI, marca, cant);

        if (abb^.dato.marca = marca) then
            cant:= cant +1;

        cantAutosPorMarca(abb^.hD, marca, cant);
    end;
end;





{ INSERTA UN ELEMENTO EN UN ARBOL DE MANERA ORDENADA }
procedure insertarOrdenado(var abb: arbol; num: integer);
begin
    if (abb = nil) then begin
        new(abb);
        abb^.dato:= num;
        abb^.hijoI:= nil;
        abb^.hijoD:= nil;
    end
    else
    if (num < abb^.dato) then
        armarNodo(abb^.hijoI, num)
    else
        armarNodo(abb^.hijoD, num);
end;





{ agregar adelante los elementos en las listas del vector agrupando por modelo }
procedure agregarAdelante(var l: lista; au: auto);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato:= au;
    nuevo^.sig:= l;
    l:= nuevo;
end;

{ generar una nueva estructura de datos agrupando los autos por modelo }
procedure agruparPorAnioFabricacion(abb: arbol; var v: vector);
begin
    if (abb <> nil) then begin
        agruparPorAnioFabricacion(abb^.hD, v);
        agregarAdelante(v[abb^.dato.modelo], abb^.dato);
        agruparPorAnioFabricacion(abb^.hI, v);
    end;
end;





{ CALCULAR MAXIMO DE *MANERA RECURSIVA_FUNCION* devuelve entero }
function calcularMaxInt(abb: arbol): integer;
begin 
    if (abb^.hijoD <> nil) then
        calcularMaxInt:= calcularMaxInt(abb^.hijoD);
    else
        calcularMaxInt:= abb^.dato;
end;

{ CALCULAR MAXIMO DE *MANERA RECURSIVA_FUNCION* devuelve puntero }
function calcularMax(abb: arbol): arbol;
begin
	if (abb = nil) or (abb^.hijoD = nil) then
        calcularMax:= abb
    else
        calcularMax:= calcularMax(abb^.hijoD);
end;





{ BUECAR DE MANERA ORDENADA }
function numBuscar(abb: arbol; num: integer): boolean;
begin
    if (abb = nil) then
        numBuscar:= false
    else
        if (num = abb^.dato) then
            numBuscar:= true
        else
            if (num < abb^.dato) then
                numBuscar:= numBuscar(abb^.hijoI, num)
            else
                numBuscar:= numBuscar(abb^.hijoD, num);
end;

{ BUSCAR SIN UN ORDEN *PROCESO* devuelve puntero }
procedure buscar(abb: arbol; num: integer; var estoEs: arbol);
begin
    if (abb = nil) then
        estoEs:= nil
    else
    if (num = abb^.dato) then
        estoEs:= abb
    else begin
        buscar(abb^.hijoI, num, estoEs);
        if (estoEs = nil) then
            buscar(abb^.hijoD, num, estoEs);
    end;
end;

{ BUSCAR SIN UN ORDEN *PROCESO* devuelve boolean }
procedure buscar(abb: arbol; num: integer; var ok: boolean);
begin
    if (abb = nil) then
        ok:= false
    else
    if (num = abb^.dato) then
        ok:= true
    else begin
        buscar(abb^.hijoI, num, ok);
        if (not ok) then
            buscar(abb^.hijoD, num, ok);
    end;
end;

{ BUSCAR SIN UN ORDEN *FUNCION* devuelve puntero }
function buscar(abb: arbol; num: integer): arbol;
var
  aux: arbol;
begin
    if (abb = nil) then
        buscar:= nil
    else
    if (abb^.dato = num) then
        buscar:= abb
    else begin
        aux:= buscar(abb^.hijoI, num);
        if (aux = nil) then
            aux:= buscar(abb^.hijoD, num);
        buscar:= aux;
    end;
end;

{ BUSCAR SIN UN ORDEN *FUNCION* devuelve boolean }
function buscar(abb: arbol; num: integer): boolean;
begin
    if (abb = nil) then 
        buscar:= false
    else 
        buscar:= (abb^.dato = num) or buscar(abb^.hijoI, num) or buscar(abb^.hijoD, num);
end;





{ generar un vector entre los legajos A y B de la categoria numCate }
procedure entreLegajos(var v: vector; var dL: integer; A, B, numCate: integer; abb: arbol);
begin
    if (abb <> nil) then begin
      
        if (abb^.dato.legajo > A) then begin

            if (abb^.dato.legajo < B) then begin

				entreLegajos(v, dL, A, B, numCate, abb^.hI);

                if (abb^.dato.cate = numCate) then begin
                    dL:= dL +1;
                    v[dL].legajo:= abb^.dato.legajo;
                    v[dL].dni:= abb^.dato.dni;
                end;

                entreLegajos(v, dL, A, B, numCate, abb^.hD);
            end
      		else
                entreLegajos(v, dL, A, B, numCate, abb^.hI);      
        end
        else
            entreLegajos(v, dL, A, B, numCate, abb^.hD);
    end;
end;





{ generar una nueva lista entre los legajos A y B de la categoria numCate }
procedure agregarAdelante(var l: newLista; legajo: integer; dni: integer);
var
    nuevo: newLista;
begin
    new(nuevo);
    nuevo^.dato.legajo:= legajo;
    nuevo^.dato.dni:= dni;
    nuevo^.sig:= l;
    l:= nuevo;    
end;
procedure entreLegajos(var l: newLista; A, B, numCate: integer; abb: arbol);
begin
    if (abb <> nil) then begin

        if (abb^.dato.legajo > A) then begin

            if (abb^.dato.legajo < B) then begin

                entreLegajos(l, A, B, numCate, abb^.hI);

                if (abb^.dato.cate = numCate) then
                    agregarAdelante(l, abb^.dato.legajo, abb^.dato.dni);

                entreLegajos(l, A, B, numCate, abb^.hD);
            end
            else
                entreLegajos(l, A, B, numCate, abb^.hI);
        end
        else
            entreLegajos(l, A, B, numCate, abb^.hD);
    end;
end;





{ IMPRIMIR ENTRE NUMEROS }
procedure imprimirEntreValores(a: arbol);
begin
    if (a <> nil) then begin

        if (a^.dato.legajo > 2803) and (a^.dato.legajo < 6982) then begin
			writeln(a^.dato.nombre);
			imprimirEntreValores(a^.HI);
			imprimirEntreValores(a^.HD);
        end
		else begin
			if (a^.dato.legajo < 2803) then
                imprimirEntreValores(a^.HD);
			else
				if (a^.dato.legajo > 6982) then
                    imprimirEntreValores(a^.HI);
        end;
    end;
end;





{ BORRAR UN ELEMENTO EN EL ARBOL }
procedure borrar(num: elem; var abb: arbol; var ok: boolean);
var
    aux: arbol;
begin
    if (abb = nil) then
        ok:= false
    else begin
        if (num < abb^.dato) then// BUSCO EN EL SUBARBOL IZQUIERDO
            borrar(num, abb^.hijoI, ok)
        else begin
            if (num > abb^.dato) then// BUSCO EN EL SUBARBOL DERECHO
                borrar(num, abb^.hijoD, ok)
            else begin
                ok:= true;
                if (abb^.hijoI = nil) then begin// SOLO HIJO A DERECHA
                    aux:= abb;
                    abb:= abb^.hijoD;
                    dispose(aux)
                end
                else begin
                    if (abb^.hijoD = nil) then begin// SOLO HIJO A IZQUIERDA
                        aux:= abb;
                        abb:= abb^.hijoI;
                        dispose(aux)
                    end
                    else begin// DOS HIJOS. REEMPLAZO CON EL MENOR DE LA DERECHA
                        aux:= Minimo(abb^.hijoD);
                        abb^.dato = aux^.dato;
                        borrar(abb^.dato, abb^.hijoD, ok);
                    end;
                end;
            end;
        end;
    end;
end;




{ FIN }