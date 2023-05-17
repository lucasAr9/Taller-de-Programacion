{ un programa para probar el corte de control }

Program corteControl;

Type
inmueble = record
    localidad: string;
    cantHab: integer;
    cantBanios:integer;
    precio: real;
end;

Procedure leer(var i: inmueble);
begin
    with i do begin
        write('localidad: '); readln(localidad);
        write('cantidad Habitaciones: '); readln(cantHab);
        write('cantidad de banios: '); readln(cantBanios);
        write('precio: '); readln(precio);
    end;
end;


Var
    inmu: inmueble;
    locActual: string;
    cantInmu: integer;
BEGIN
    leer(inmu);
    while (inmu.localidad <> 'XXX') do begin
        locActual:= inmu.localidad;
        cantInmu:= 0;
        while (inmu.localidad <> 'XXX') and (inmu.localidad = locActual) do begin
            cantInmu:= cantInmu + 1;
            leer(inmu);
            maxPrecio(inmu.precio, maxLoc, maxP);
        end;
        writeln('La cantidad de inmuebles en ',locActual,' son: ',cantInmu);
    end;
END.

