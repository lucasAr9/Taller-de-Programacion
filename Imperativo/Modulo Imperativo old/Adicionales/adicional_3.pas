{ 
3. El administrador de un edificio de oficinas, cuenta en papel, con la información del pago de
las expensas de dichas oficinas. Implementar un programa que:

a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada
oficina se ingresa código de identificación, DNI del propietario y valor de la expensa. La
lectura finaliza cuando llega el código de identificación -1.

b. Ordene el vector, aplicando alguno de los métodos vistos en la teoría, para obtener el
vector ordenado por código de identificación de la oficina.

c. Realice una búsqueda dicotómica que recibe el vector generado en b) y un código de
identificación de oficina y retorne si dicho código está en el vector. En el caso de
encontrarlo, se debe informar el DNI del propietario y en caso contrario informar que
el código buscado no existe.
}

program adicional_3;

const
ultimaOfi = 300;

type
cantOfi = 1..ultimaOfi;

oficina = record
    codigo: integer;
    dniPropietario: integer;
    expensa: real;
end;

vecOficinas = array [cantOfi] of oficina;



{ cargar los datos de las oficinal al vector de oficinas }
procedure leer(var o: oficina);
begin
    write('codigo: '); readln(o.codigo);
    if (o.codigo <> -1) then begin
        write('DNI del Propietario: '); readln(o.dniPropietario);
        write('monto de expensas: '); readln(o.expensa);
    end;
end;

procedure cargar(var v: vecOficinas; var dL: integer);
var
    o: oficina;
begin
    dL:= 0;
    leer(o);
    while (dL < ultimaOfi) and (o.codigo <> -1) do begin
        dL:= dL +1;
        v[dL]:= o;
        leer(o);
    end;
end;



{ ordenar el vector de oficinas con ordenamiento por insercion ordenados por codigo }
procedure ordenarPorCodigo(var v: vecOficinas; dL: integer);
var
    i, j: integer;
    actual: oficina;
begin
    for i:= 2 to dL do begin
        actual:= v[i];
        j:= i -1;
        while (j > 0) and (v[j].codigo > actual.codigo) do begin
            v[j +1]:= v[j];
            j:= j -1;
        end;
        v[j +1]:= actual;
    end;
end;



procedure imprimirVecOrdenado(v: vecOficinas; dL: integer);
var i: integer;
begin
    writeln('');
    for i:= 1 to dL do begin
        writeln('codigo: ', v[i].codigo);
        writeln('DNI del Propietario: ', v[i].dniPropietario);
        writeln('monto de expensas: ', v[i].expensa:2:2);
    end;
end;



{ una busqueda binaria por codigo }
procedure busquedaBinaria(v: vecOficinas; dL: integer; cod: integer);
var
    primero, medio, ultimo: integer;
begin
    primero:= 1;
    ultimo:= dL;
    medio:= (primero + ultimo) div 2;

    while (primero <= ultimo) and (cod <> v[medio].codigo) do begin
        if (cod < v[medio].codigo) then
            ultimo:= medio -1
        else
            primero:= medio +1;
        medio:= (primero + ultimo) div 2;
    end;

    if (primero <= ultimo) and (cod = v[medio].codigo) then begin
        writeln('DNI del Propietario: ', v[medio].dniPropietario);
        writeln('monto de expensas: ', v[medio].expensa:2:2);
    end
    else
        writeln('no se encontro la oficina esa.');
end;



var
    v: vecOficinas;
    dL: integer;
    cod: integer;
BEGIN
    cargar(v, dL);
    ordenarPorCodigo(v, dL);
    imprimirVecOrdenado(v, dL);

    write('codigo para buscar: '); readln(cod);
    busquedaBinaria(v, dL, cod);
END.
