{ un programa que calcula los porcentajes }

program porcentajes;

var
    porce, monto, montoChico: real;
    precioAnterior, precioActual: real;
BEGIN
    writeln('');
    { sacar el monto total de un porcentaje }
    writeln('para sacar el monto de un porcentaje.');
    write('porcentaje: '); readln(porce);
    write('monto: '); readln(monto);
    writeln('el ', porce:2:2, ' porciento de ', monto:2:2, ' es: ', (monto * porce) / 100:2:2);
    writeln('');

    { sacar el porcentaje de un monto de otro }
    writeln('para saber que porcentaje es un monto de otro.');
    write('monto a saber su porcentaje: '); readln(montoChico);
    write('en este monto total: '); readln(monto);
    writeln(montoChico:2:2, ' es el ', (montoChico * 100) / monto:2:2, ' porciento de ', monto:2:2);
    writeln('');

    { sacar el aumento de un precio, el porcentaje que aumento }
    writeln('saber cuanto es el porcentaje de aumento');
    write('precio anterior: '); readln(precioAnterior);
    write('precio actual: '); readln(precioActual);
    writeln('de ', precioAnterior:2:2, ' a ', precioActual:2:2, ' aumento un ',
            ((precioActual - precioAnterior)*100)/precioAnterior:2:2, ' porciento.');
    writeln('');

    { aplicar un descuento a un precio y te dice cuanto tenes que pagar descontando el porcentaje }
    writeln('saber cuanto es el descuento de un porcentaje en un precio');
    write('precio total: '); readln(monto);
    write('descuento para aplicar: '); readln(porce);
    writeln('el ', porce:2:2, ' porciento de descuento de ', monto:2:2, ' da como total pagar: ',
            monto - ((porce / 100) * monto):2:2);
    writeln('');
END.

