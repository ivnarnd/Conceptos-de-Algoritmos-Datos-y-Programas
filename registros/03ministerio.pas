{
El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As,
 con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año
 2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único de
 establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se pide
 implementar un programa que procese la información y determine:
 ● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
 ● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
 El programa debe utilizar:
 a) Un módulo para la lectura de la información de la escuela.
 b) Un módulo paradeterminar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad
 de alumnos y la cantidad de docentes). 
}


program ministerio;

uses crt;
const
	PROP = 23.435;
type
	str20 = string[20];
	tescuela = record
		cue:integer;
		nombre:str20;
		cantDocentes:integer;
		cantAlumnos:integer;
		localidad:str20;
	end;
procedure leerEscuela (var e:tescuela);
begin
	writeln('Ingrese el codigo CUE : ');
	readln(e.cue);
	writeln('Ingrese el nombre : ');
	readln(e.nombre);
	writeln('Ingrese la cantidad de docentes: ');
	readln(e.cantDocentes);
	writeln('Ingrese la cantidad de Alumnos: ');
	readln(e.cantAlumnos);
	writeln('Ingrese la localidad: ');
	readln(e.localidad);
end;
procedure min2(var cue1,cue2:integer; var rel1,rel2:real; cue:integer;rel:real);
begin
	if(rel<=rel1)then
		begin
			cue2:=cue1;
			rel2:=rel1;
			cue1:=cue;
			rel1:=rel;
		end
	else
		if(rel<=rel2)then
			begin
				rel2:=rel;
				cue2:=cue;
			end;
end;
function calcularRel (docentes,alumnos:real):real;
begin
	calcularRel:=alumnos/docentes;
end;
function superaRel(rel:real):boolean;
begin
	superaRel:=rel>PROP;
end;
var
	esc:tescuela;
	cantSup:integer;
	rel:real;
	i:integer;
	rel1,rel2:real;
	cue1,cue2:integer;
BEGIN
	rel1:=1000;
	rel2:=1000;
	cantSup:=0;
	for i:=1 to 5 do
		begin
			leerEscuela(esc);
			rel:= calcularRel(esc.cantDocentes,esc.cantAlumnos);
			min2(cue1,cue2,rel1,rel2,esc.cue,rel);
			if(superaRel(rel))then
				cantSup:=cantSup+1;
		end;
	writeln('La cantidad de escuelas que superan la proporcion de la unesco es: ',cantSup);
	writeln('Los colegios con mejor proporcion de alumnos son: ');
	writeln('1: ',cue1,' = ',rel1:2:3,' y  2:',cue2,' = ',rel2:2:3);
	
END.

