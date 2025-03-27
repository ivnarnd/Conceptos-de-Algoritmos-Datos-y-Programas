{
*
*Dado el siguiente programa: 
 a. Completar el programa principal para que lea información de alumnos (código, nombre, promedio) e informe
 la cantidad de alumnos leídos. La lectura finaliza cuando ingresa un alumno con código 0, que no debe
 procesarse. Nota: utilizar el módulo leer.
 * 
 b. Modificar al programa anterior para que, al finalizar la lectura de todos los alumnos, se informe también el
 nombre del alumno con mejor promedio.
}
program Registros;
 type
 str20 = string[20];
 alumno = record
	codigo : integer;
	nombre : str20;
	promedio : real;
 end;
 procedure leer(var alu : alumno);
 begin
	writeln('Ingrese el codigo del alumno');
	readln(alu.codigo);
	if (alu.codigo <> 0) then
		begin
			writeln('Ingrese el nombre del alumno');
			readln(alu.nombre);
			writeln('Ingrese el promedio del alumno');
			readln(alu.promedio);
		end;
 end;
 procedure mayProm(prom:real;nom:str20;var promM:real;var nombreM:str20);
 begin
	if(prom >= promM)then
		begin
			promM:=prom;
			nombreM:=nom;
		end;
 end;
 { declaración de variables del programa principal }
 var
 a : alumno;
 cantLeidos:integer;
 nombreMay:str20;
 promMay:real;
 { cuerpo del programa principal }
 begin
	promMay:=-1;
	cantLeidos:=0;
	leer(a);
	while(a.codigo<>0)do
		begin
			cantLeidos:=cantLeidos+1;
			mayProm(a.promedio,a.nombre,promMay,nombreMay);
			leer(a);
		end;
	writeln('La cantidad de Alumnos leida es : ',cantLeidos);
	writeln('El Alumno con mejor promedio es: ',nombreMay,' con un promedio : ',promMay:2:2);
 end.
