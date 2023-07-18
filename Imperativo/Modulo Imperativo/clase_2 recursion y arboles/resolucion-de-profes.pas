program TBClase2Parte1a;
type
lista=^nodo;

nodo=record
 dato:integer;
 sig:lista;
 end;
 
 { 1 }
 { ----------------------------------------------------------------------------------------------------------------------------- }
 {Realice un programa que lea 7 valores enteros. Genere una lista donde 
 * los elementos se inserten adelante. Al finalizar implemente un módulo
 *  recursivo que imprima los valores de la lista.}
 
{Agregar adelante en una lista de enteros} 
procedure agregarAdelante(var l:lista; n:integer);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=n;
	nue^.sig:=l;
	l:=nue;
end;

{Crear una lista de enteros con 7 valores}
procedure cargarlista(var l:lista);
var
	i,n:integer;
begin 
	for i:=1 to 7 do begin
		readln(n);
		agregarAdelante(l,n);
	end;
end;



{Imprimir la lista en orden}
procedure imprimir(l:lista);
begin
	if(l<>nil)then begin
		write(l^.dato, ' - ');
		imprimir(l^.sig);
	end
	{else
	  writeln('caso base');}
end;




{Imprimir la lista en orden inverso}
procedure imprimir2(l:lista);
begin
	if(l<>nil)then begin
		imprimir2(l^.sig);
		write(l^.dato, ' - ');
	end
	{else
	  writeln('caso base');}
end;



var 
	l:lista;
BEGIN
	l:=nil;
	cargarlista(l);	
    
    
    writeln();
	writeln('-------------------');
	writeln('Lista en orden');
	imprimir(l);	
	writeln();
	writeln('-------------------');
	
	writeln();
	writeln('-------------------');
	writeln('Lista invertida');
	imprimir2(l);	
	writeln();
	writeln('-------------------');

END.

{ 2 }
{ ----------------------------------------------------------------------------------------------------------------------------- }
program tres;
type 
  arbol=^nodo;
  nodo=record
    HI:arbol;
    HD:arbol;
    dato:integer;
  end;


procedure insertar(var ab:arbol;n:integer);
begin
  if(ab=nil)then begin
    new(ab);
    ab^.dato:=n;
    ab^.HI:=nil;
    ab^.HD:=nil;
  end
  else 
    if(n<ab^.dato)then 
      insertar(ab^.HI,n)
    else
      insertar(ab^.HD,n);
end;


procedure cargarArb(var a:arbol);
var
  num:integer;
begin
  readln(num);
  while(num<>0)do begin
    insertar(a,num);
    readln(num);
  end;
end;



Procedure imprimir ( a:arbol );
begin
   if ( a<> nil ) then begin
    writeln(a^.dato);
    imprimir (a^.HI);
    imprimir (a^.HD);
   end;
end;



function sumaArbol(A:arbol):integer;
begin
	if(A<>nil)then
	begin
		sumaArbol:= A^.dato + sumaArbol(A^.HI)+sumaArbol(A^.HD);
	end
	else
	begin
		sumaArbol:=0;
	end;
end;

var 
  abb:arbol;
  sum:integer;
begin
  abb:=nil;
  sum:=0;
  cargarArb(abb);
  imprimir(abb);
  writeln(sumaArbol(abb));
end.

{ 3 }
{ ----------------------------------------------------------------------------------------------------------------------------- }
Program arboles;

Type
  arbol = ^nodo;

  nodo = record
   dato: integer;
   HI: arbol;
   HD: arbol;
  end;

// crea nodos poniendo los valores menores a la iz y mayores a la der
Procedure crear (var A:arbol; num:integer);
Begin
  if (A = nil) then
   begin
      new(A);
      A^.dato:= num; A^.HI:= nil; A^.HD:= nil;
   end
   else
    if (num < A^.dato) then
		crear(A^.HI,num)
    else crear(A^.HD,num)   
End;

// imprime los valores de los nodos de izq a derecha (menores a mayores)
Procedure enOrden ( a : arbol ); 
begin
   if ( a<> nil ) then begin
    enOrden (a^.HI);
    writeln ('---',a^.dato,'---');
    enOrden (a^.HD);
   end;
end;

//-- multiplica por dos el valor del elemento de cada nodo
Procedure por2 ( a : arbol ); //sum debe inicializarse en el programa en 0. este modulo imprime nodos y suma todos los nodos e imprime valor
begin
   if ( a<> nil ) then begin
    por2 (a^.HI);
    por2 (a^.HD);
    a^.dato:= a^.dato*2;
   end;
end;


//------------busca max, devuelve valor y puntero al nodo del max
procedure maximo (a:arbol;var max:integer; var m:arbol);//max inicializada en -9999 en prog y m:=nil
begin
	 if (a<>nil) then
	 begin
		max:=a^.dato;
		m:=a;
		maximo (a^.HD,max,m);	
	end;
end;


function vermax(a:arbol):integer;
begin  
	if(a=nil)then
		vermax:=-1     
	else begin       
		vermax:=a^.dato;       
		if(a^.HD<>nil)then         
			vermax:=vermax(a^.HD);  
	end;
end;

function elemMaxF(a:arbol):integer;     
begin        
	if a<>nil then            
		if (a^.HD=nil) then 
			elemMaxF:=a^.dato            
		else elemMaxF:=elemMaxF(a^.HD)        
	else elemMaxF := -1;    
end;


function maximo2 (a : arbol):arbol; 
begin    
	if (a=nil) then        
		maximo2:= nil    
	else      
		if (a^.hd = nil) then        
			maximo2 := a    
		else        
			maximo2 := maximo2(a^.hd);
end;



//-------------programa-------------------
Var
	m,abb:arbol; max,x:integer;
Begin
	m:=nil; abb:=nil;max:=-9999;
	// se cargan nodos hasta q se ingresa el 58
	// randomize;
	// x:=random (20);
	writeln ('escriba un numero');
	read (x);
	while (x<>58)do
	begin
		crear(abb,x);
      //x:=random(58);
		writeln ('escriba un numero');
		read(x);
	end;

	enOrden (abb);
	writeln ('----------------');
	por2 (abb);
	enOrden (abb);
	maximo (abb,max, m);
	if (m<>nil) then
		writeln (max,'---',m^.dato)
	else
		writeln ('arbol vacio');
End.

