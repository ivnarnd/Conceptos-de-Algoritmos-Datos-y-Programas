{
 3. Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
 a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.
 b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.
 c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
 desde la mitad más uno hacia la última posición.
 d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la
 posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere
 que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.
 e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.
   
   
}


program vectorE;

uses crt;
const 
	dimF = 20;
type 
	tvector = array[1..dimF] of integer;
procedure cargarVector(var v:tvector;var dimL:integer);
var
	dato:integer;
begin
	writeln('Ingrese un dato: [0] para Finalizar:');
	readln(dato);
	while((dimL < dimF)and(dato<>0))do
		begin
			dimL:=dimL+1;
			v[dimL]:=dato;
			writeln('Ingrese un dato: [0] para Finalizar:');
			readln(dato);
		end;
end;

			
procedure imprimirVectorCompleto (v:tvector;dimL:integer);
var
	i:integer;
begin
	writeln('Vector de Numeros enteros: ');
	for i:=1 to dimL do
		begin
			writeln(v[i]);
		end;
end;
procedure imprimirFinInicio(v:tvector;dimL:integer);
var
	i:integer;
begin
	writeln('Vector de Numeros enteros desde el fin al comienzo: ');
	for i:=dimL downto 1 do
		begin
			writeln(v[i]);
		end;
end;
procedure imprimirSectores(v:tvector;dimL:integer);
var
	i:integer;
begin
	writeln('Impresion desde la mitad hacia el primer elemento: ');
	for i:= (dimL div 2) downto 1 do
		begin
			writeln(v[i]);
		end;
	writeln('Impresion desde la mitad + 1 hacia el final: ');
	for i:=(dimL div 2)+1 to dimL do
		begin
			writeln(v[i]);
		end;
end;
{ d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la
 posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere
 que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.}
procedure imprimirRango(v:tvector;dimL,x,y:integer);
var
	i:integer;
begin
	writeln('Impresion desde x: ',x,' hacia y :',y);
	if(x<=y)then
		for i:=x to y do
			writeln(v[i])
	else
		for i:=x downto y do
			writeln(v[i]);
end;
var 
	vector:tvector;
	dimL : integer;
	x,y:integer;
BEGIN
	dimL:=0;
	cargarVector(vector,dimL);
	imprimirVectorCompleto(vector,dimL);
	imprimirFinInicio(vector,dimL);
	imprimirSectores(vector,dimL);
	writeln('Ingrese un indice x de inicio de impresion: ');
	read(x);
	writeln('Ingrese un indice y de finalizacion de impresion: ');
	read(y);
	imprimirRango(vector,dimL,x,y);
END.

