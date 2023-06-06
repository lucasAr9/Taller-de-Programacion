program VectorOfVectors;

type
  TVector = array of integer;
  TVectors = array of TVector;

var
  v1, v2, v3: TVector;
  vectores: TVectors;
  i, j: integer;

begin
  // Inicializar vectores individuales
  v1 := [1, 2, 3];
  v2 := [4, 5, 6];
  v3 := [7, 8, 9];

  // Inicializar el vector de vectores
  SetLength(vectores, 3);
  for i := 0 to 2 do
  begin
    vectores[i] := v1; // Aquí puedes cambiar el valor de i para inicializar con otros vectores
  end;

  // Recorrer el vector de vectores
  for i := 0 to 2 do
  begin
    for j := 0 to 2 do
    begin
	  WriteLn('i: ', i, ' j: ', j);
      WriteLn('Elemento ', i * 3 + j, ': ', vectores[i][j]);
    end;
  end;
end.
