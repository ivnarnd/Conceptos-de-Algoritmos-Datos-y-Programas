{
 2. El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año
 2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.
 a) Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
 b) Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido
 en el inciso a).
 c) Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura finaliza al
 ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos realizados durante los  meses de verano (enero, febrero y marzo)
 y la cantidad de casamientos realizados en los primeros 10 días de cada mes. 
 Nota: utilizar el módulo realizado en b) para la lectura de fecha.
 
}
program registroCivil;
uses crt;
type
	tdia=1..31;
	tmes=1..12;
	tfecha = record
		dia:tdia;
		mes:tmes;
		anio:integer;
	end;
procedure leerFecha(var f:tfecha);
begin
	writeln('Ingrese el anio:');
	readln(f.anio);
	if(f.anio=2019)then
		begin
			writeln('Ingrese el mes : ');
			readln(f.mes);
			writeln('Ingrese el dia: ');
			readln(f.dia);
		end;
end;
function fechaPrimerosDiez(dia:tdia):boolean;
begin
	fechaPrimerosDiez:=(dia<=10);
end;
function mesVerano(mes:tmes):boolean;
begin
	if((mes = 1) or (mes=2) or (mes=12))then
		mesVerano := true
	else
		mesVerano:=false;
end;
var
	fecha:tfecha;
	cantVerano : integer;
	cantDiez:integer;
BEGIN
	cantVerano := 0; 
	cantDiez := 0;
	leerFecha(fecha);
	while(fecha.anio = 2019) do
		begin
			if(fechaPrimerosDiez(fecha.dia))then
				cantDiez:=cantDiez+1;
			if(mesVerano(fecha.mes))then
				cantVerano:=cantVerano+1;
			leerFecha(fecha);
		end;
	writeln('La cantidad de casamientos realizados en verano es: ',cantVerano);
	writeln('La cantidad de casamientos en los primeros dias de cada mes es: ',cantDiez);
END.

