{
 Utilizando los módulos implementados en el ejercicio 2, realizar un programa que lea números enteros
 desde teclado (a lo sumo 100) y los almacene en un vector. La carga finaliza al leer el número 0. Al finalizar
 la carga, se debe intercambiar la posición del mayor elemento por la del menor elemento, e informe la
 operación realizada de la siguiente manera: “El elemento máximo ... que se encontraba en la posición ...
 fue intercambiado con el elemento mínimo ... que se encontraba en la posición ...”
   
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
	posMin:=elementoMinimo(vector,dimL);
	posMax:=elementoMaximo(vector,dimL);
	intercambiarValores(vector,posMin,posMax);
	writeln('El elemento maximo', vector[posMin],'que se encontraba en la posicion ',posMax,'fue intercambiado con el elemento minimo ',vector[posMax],' que se encontraba en la posicion',posMin);
	imprimirVector(vector,dimL);
END.

