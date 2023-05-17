{ ------------------------------------------------------------------------------------- }
{ merge unificador }
program EjercitacionTeoria3Estantes;
const 
	cantE=5;
	fin='ZZZ';
type
	lista =^nodo;
	nodo = record
		dato:string;
		sig:lista;
	end;
	vEstantes = array[1..cantE] of lista;

procedure AgregarAtras(var L,ult:lista;min:string);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.dato:=min;
	nuevo^.sig:=nil;
	if (L = nil) then
		L:=nuevo
	else
		ult^.sig:=nuevo;
	ult:=nuevo;
end;


procedure CalcularMinimo(var estantes:vEstantes;var min:string);
var
	i,minIndice:integer;
begin
	min:=fin;
	minIndice:=-1;
	for i:= 1 to cantE do
	begin
		if(estantes[i] <> nil) then
		begin
			if(estantes[i]^.dato <= min) then
			begin
				minIndice:=i;
				min:=estantes[i]^.dato;
			end;
		end;
	end;
	if(minIndice <> -1) then
		estantes[minIndice]:=estantes[minIndice]^.sig;	
end;


procedure MergeEstantes(estantes:vEstantes; var Enuevo,ult:lista);
var
	min:string;
begin
	Enuevo:=nil;
	CalcularMinimo(estantes,min);
	while(min <> fin)do
	begin
		AgregarAtras(Enuevo,ult,min);
		CalcularMinimo(estantes,min);
	end;
end;
Procedure InsertarAscendente(var pri:lista;valor:string);
//Crea un nuevo nodo y recorre lista para insertarlo de forma que la lista quede ordenada de manera ascendente
//pri puede ser nil
//puede modificarse para otros órdenes
var
	aux,ant,nue:lista;
begin
	new(nue);
	nue^.dato:=valor;
	aux:=pri;
	while ((aux<>nil)and(aux^.dato<valor)) do begin
		ant:=aux;
		aux:=aux^.sig;
	end;
	nue^.sig:=aux;
	if(aux=pri)then
		pri:=nue
	else
		ant^.sig:=nue;
end;
//
Procedure GenerarEstantes(var v:vEstantes);
	var
		aux:string;
		i:integer;
	begin
		writeln('LECTURA');
		for i:=1 to cantE do begin
			v[i]:=nil;
			writeln('Lista numero ',i,' ---------|');
			write('Ingrese un libro: ');
			readln(aux);
			while(aux<>fin)do begin
				InsertarAscendente(v[i],aux);
				write('Ingrese un libro: ');
				readln(aux);
			end;
		end;
		writeln('-----------------------------------------------------|');
	end;

Procedure ImprimirLista(l:lista);
	begin
		if(l<>nil)then
			while(l<>nil)do begin
				writeln(l^.dato);
				l:=l^.sig;
			end
		else
			writeln('*LISTA VACIA*');
	end;

//
Procedure ImprimirVector(v:vEstantes);
	var
		i:integer;
	begin
		writeln('IMPRESION');
		for i:=1 to cantE do begin
			writeln('Lista numero ',i,' ---------|');
			ImprimirLista(v[i])
		end;
		writeln('-----------------------------------------------------|');
	end;
//----------------------------------------------------------------------

var
	estantes:vEstantes;
	Enuevo,ultnuevo:lista;
begin
	GenerarEstantes(estantes);
	ImprimirVector(estantes);	
	MergeEstantes(estantes,Enuevo,ultnuevo);
	ImprimirLista(Enuevo);
end.



{ ------------------------------------------------------------------------------------- }
{ merge contador }
program dos;
const
  dimF=4;
type
  subR=1..dimF;
  
  gasto=record
    nombre:string;
    costo:real;
    integrante:subR;
  end;
  
  subGasto=record
    nombre:string;
    costo:real;
  end;
  
  lista=^nodo;
  nodo=record
    dato:subGasto;
    sig:lista;
  end;
  
  vecL=array[subR]of lista;

  arbol=^nodo2;
  nodo2=record
    dato:subGasto;
    HI:arbol;
    HD:arbol;
  end;

procedure inicializarVec(var v:vecL);
var 
  i:subR;
begin
  for i:= 1 to dimF do 
    v[i]:=nil;
end;
  
procedure leerGasto(var g:gasto);
begin
  writeln('en que gasto: ');readln(g.nombre);
  if(g.nombre<>'ZZ')then begin
    writeln('cuanto gasto: ');readln(g.costo);
    writeln('numero de integrante');readln(g.integrante);
  end;
end;

procedure agregarOrdenado(var l:lista;g:gasto);
var
  nuevo,anterior,actual:lista;
begin
  actual:=l;
  new(nuevo);
  nuevo^.dato.nombre:=g.nombre;
  nuevo^.dato.costo:=g.costo;
  nuevo^.sig:=nil;
  while((actual<>nil)and(actual^.dato.nombre < g.nombre))do begin
    anterior:=actual;
    actual:=actual^.sig;
  end;
  if(actual=l)then
    l:=nuevo
  else
    anterior^.sig:=nuevo;
  nuevo^.sig:=actual;
end;

procedure cargarVec(var v:vecL);
var
  g:gasto;
begin
  leerGasto(g);
  while(g.nombre<>'ZZ')do begin
    agregarOrdenado(v[g.integrante],g);
    leerGasto(g);
  end;
end;

procedure imprimirVec(v:vecL);
var
  i:subR;
begin
  for i:=1 to dimF do begin
    writeln('Gastos del integrante',i,':');
    while(v[i]<>nil)do begin
      writeln (v[i]^.dato.nombre);
      writeln(v[i]^.dato.costo:0:2);
      v[i]:=v[i]^.sig
    end;
  end;
end;

{empiezan procedmientos para el merge}
procedure agregarAtras(var l:lista;var ult:lista; nom:string;cost:real);
var
  nuevo:lista;
begin
  new(nuevo);
  nuevo^.dato.nombre:=nom;
  nuevo^.dato.costo:=cost;
  nuevo^.sig:=nil;
  if (l = nil) then
		l:=nuevo
  else
		ult^.sig:=nuevo;
  ult:=nuevo;
end;

procedure minimo(var v:vecL;var nomMin:string; var costo:real);
var
  indiceMin,i:integer;
begin
  nomMin:='ZZZ'; indiceMin:=-1;
  for i:= 1 to dimF do 
    if(v[i]<>nil)then 
      if(v[i]^.dato.nombre<nomMin)then begin
        indiceMin:=i;
        nomMin:=v[i]^.dato.nombre;
      end;
  if(indiceMin <> -1)then begin
    //nomMin:=v[indiceMin]^.dato.nombre;
    costo:=v[indiceMin]^.dato.costo;
    v[indiceMin]:=v[indiceMin]^.sig;
  end;
end;

procedure merge(v:vecL;var nuevaL:lista);
var
  nomMin, actual:string;
  monto,montoTot:real;
  ult: lista;
begin
  nuevaL:=nil;
  minimo(v,nomMin,monto);
  while(nomMin<>'ZZZ')do begin
    actual:=nomMin;
    montoTot:=0;
    while((nomMin<>'ZZZ')and(actual=nomMin))do begin
      montoTot:=montoTot+monto;
      minimo(v,nomMin,monto);
    end;
    agregarAtras(nuevaL,ult,actual,montoTot);
  end;
end;

procedure imprimirL(list:lista);
begin
  writeln('gastos unificados:  ');
  while(list<>nil)do begin
    writeln(list^.dato.nombre);
    writeln(list^.dato.costo:0:2);
    list:=list^.sig;
  end;
end;

{armo el arbol}
procedure agregar(var a:arbol; g:subGasto);
begin
  if(a=nil)then begin
    new(a);
    a^.dato:=g;
	  a^.HI:=nil;
    a^.HD:=nil;
  end
  else 
    if(g.costo<a^.dato.costo)then 
      agregar(a^.HI,g)
    else 
      agregar(a^.HD,g);
end;


procedure cargarArb(var a:arbol; l:lista);
begin
  a:=nil;
  while(l<>nil)do begin
    agregar(a,l^.dato);
    l:=l^.sig;
  end;
end;


procedure minimo(a:arbol;var nomMin:string);
begin
  if(a<>nil)then
    if(a^.HI=nil)then 
      nomMin:=a^.dato.nombre
    else
      minimo(a^.HI, nomMin); 
end;




{programa ppal}
var
  vec:vecL;
  listaN:lista;
  arb:arbol;
  min:string;
begin
  inicializarVec(vec);
  cargarVec(vec);
  imprimirVec(vec);
  merge(vec,listaN);
  imprimirL(listaN);
  cargarArb(arb,listaN);
  minimo(arb,min);
  writeln('el nombre del gasto que menos costo es: ',min);
end.

