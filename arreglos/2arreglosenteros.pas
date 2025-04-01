{
 Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
 a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector, o el valor -1 en caso de no encontrarse.
 b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector donde se intercambiaron los valores de las posiciones x e y.
 c) sumaVector: retorna la suma de todos los elementos del vector.
 d) promedio: devuelve el valor promedio de los elementos del vector.
 e) elementoMaximo: retorna la posición del mayor elemento del vector
 f) elementoMinimo: retorna la posicion del menor elemento del vector
}


program vectorE;

uses crt;
const 
	dimF = 100;
type
	tvector = array [1..dimF] of integer;
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
{ a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector, o el valor -1 en caso de no encontrarse.}
function buscarPosicion(v:tvector;dimL:integer;elemento:integer):integer;
var
	pos:integer;
	i:integer;
begin
	pos:=-1;
	i:=1;
	while((i<=dimL)and(pos=-1))do
		begin	
			if(v[i]=elemento)then
				pos:=i
			else
				i:=i+1;
		end;
	buscarPosicion:=pos;
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
{ c) sumaVector: retorna la suma de todos los elementos del vector.}
function sumaVector(v:tvector;dimL:integer):integer;
var
	sum,i:integer;
begin
	sum:=0;
	for i:=1 to dimL do
		begin
			sum:=sum+v[i];
		end;
	sumaVector:=sum;
end;
{ d) promedio: devuelve el valor promedio de los elementos del vector.}
function promedio(v:tvector;dimL:integer):real;
var
	sum:integer;
begin
	sum:=sumaVector(v,dimL);
	promedio:=sum/dimL;
end;
{ e) elementoMaximo: retorna la posición del mayor elemento del vector}
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
{ f) elementoMinimo: retorna la posicion del menor elemento del vector}
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
procedure imprimirVector(v:tvector;dimL:integer);
var
	i:integer;
begin
	writeln('Vector: ');
	for i:=1 to dimL do
		begin
			write(v[i],' -- ');
		end;
end;
var 
	vector : tvector;
	dimL:integer;
	elemento:integer;
	posicion:integer;
	x,y:integer;
	suma:integer;
	posMin:integer;
	posMay:integer;
BEGIN
	randomize;
	cargarVectorAleatorio(vector,dimL);
	imprimirVector(vector,dimL);
	writeln('Ingrese un elemento a buscar en el vector: ');
	readln(elemento);
	posicion:=buscarPosicion(vector,dimL,elemento);
	if(posicion=-1)then
		writeln('El elemento no se encuentra en el vector')
	else
		writeln('La posicion del elemento : ',elemento,' en el vector es: ',posicion);
	writeln('Ingrese una posicion entre 1..100 : ');
	readln(x);
	writeln('Ingrese otra posicion entre 1..100: ');
	readln(y);
	intercambiarValores(vector,x,y);
	imprimirVector(vector,dimL);
	suma:=sumaVector(vector,dimL);
	writeln('La suma de todos los elementos del vector es: ',suma);
	writeln('El promedio de los elementos del vector es: ',promedio(vector,dimL):4:2);
	posMin:=elementoMinimo(vector,dimL);
	posMay:=elementoMaximo(vector,dimL);
	writeln('El elemento minimo es: ',vector[posMin],' y el elemento maximo es: ',vector[posMay]);
	
END.

