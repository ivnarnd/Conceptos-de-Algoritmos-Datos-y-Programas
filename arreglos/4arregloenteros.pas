{
* Dado que en la solución anterior se recorre dos veces el vector (una para calcular el elemento máximo y
 otra para el mínimo), implementar un único módulo que recorra una única vez el vector y devuelva ambas
 posiciones.
}
program enteros;

uses crt;
const
	dimF=100;
type
	rindice = -1..dimF;
	tvector = array[1..dimF]of integer;
{cargar el vector aleatorio}
procedure cargarVectorAleatorio(var v:tvector; var dimL:integer);
var
	ele:integer;
begin
	dimL:=0;
	ele:=random(120);
	while((dimL<dimF)and(ele<>0))do
		begin
			dimL:=dimL+1;
			v[dimL]:=ele;
			ele:=random(120);
		end;
end;
procedure maxYmin(v:tvector;dimL:integer;var pmax,pmin:integer);
var
	i:integer;
	min,max:integer;
begin
	
	min:=32767;
	max:=-32767;
	for i:=1 to dimL do 
		begin
			if(v[i]<min)then
				begin
					pmin:=i;
					min:=v[i];
				end;
			if(v[i]>max)then
				begin
					pmax:=i;
					max:=v[i];
				end;
		end;
end;
{elementoMaximo: retorna la posición del mayor elemento del vector}
function elementoMaximo(v:tvector;dimL:integer):integer;
var
	pos:integer;
	max:integer;
	i:integer;
begin
	max:=-32768;
	pos:=-1;
	for i:=1 to dimL do
		begin
			if(v[i]>max)then	
				begin
					max:=v[i];
					pos:=i;
				end;
		end;
	elementoMaximo:=pos;
end;
{elementoMinimo: retorna la posicion del menor elemento del vector}
function elementoMinimo(v:tvector;dimL:integer):integer;
var
	pos:integer;
	min:integer;
	i:integer;
begin
	min := 32767;
	pos := -1;
	for i:=1 to dimL do
		begin
			if(v[i]<min)then
				begin
					min:=v[i];
					pos:=i;
				end;
		end;
	elementoMinimo:=pos;
end;
{intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector donde se intercambiaron los valores de las posiciones x e y.}
procedure intercambiarValores(var v:tvector;x,y:integer);
var
	item:integer;
begin
	item:=v[x];
	v[x]:=v[y];
	v[y]:=item;
end;
procedure imprimirVector(v:tvector;dimL:integer);
var
	i:integer;
begin
	writeln('Vector: ');
	for i:=1 to dimL do
		begin
			write(v[i],'|');
		end;
end;
var 
	vector : tvector;
	dimL:integer;
	posMin:integer;
	posMax:integer;

BEGIN
	randomize;
	cargarVectorAleatorio(vector,dimL);
	imprimirVector(vector,dimL);
	writeln;
	maxYmin(vector,dimL,posMax,posMin);
	intercambiarValores(vector,posMin,posMax);
	writeln('El elemento maximo', vector[posMin],'que se encontraba en la posicion ',posMax,'fue intercambiado con el elemento minimo ',vector[posMax],' que se encontraba en la posicion',posMin);
	imprimirVector(vector,dimL);
END.

