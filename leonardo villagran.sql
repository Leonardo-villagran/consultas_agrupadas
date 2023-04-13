/**/

create database "desafio2-leonardo-villagran-512";

\c "desafio2-leonardo-villagran-512"

CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente
VARCHAR);
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );

/* Consultas: */ 

/* 1.- ¿Cuántos registros hay? */

select count(fecha) as registros from INSCRITOS;

/* 2.- ¿Cuántos inscritos hay en total? */
select sum(cantidad) as cantidad_inscritos from inscritos;

/* 3.- ¿Cuál o cuáles son los registros de mayor antiguedad?

HINT: ocupar subconsultas */

select * from inscritos where fecha=(select min(fecha) from inscritos) order by fecha;

/* 4.- ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de
ahora en adelante)*/ 

select sum(cantidad) as cantidad,fecha from inscritos group by fecha order by fecha;

/* 5.- ¿Cuántos inscritos hay por fuente? */

select sum(cantidad) as cantidad,fuente from inscritos group by fuente order by fuente;

/* 6.- ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se
inscribieron en ese día? */

  select fecha, sum(cantidad) from inscritos group by fecha order by  sum(cantidad) desc limit 1;

/* 7.- ¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas
personas fueron?

HINT: si hay más de un registro, tomar el primero */ 

select  fecha, cantidad, fuente from inscritos where cantidad=(select max(cantidad) from inscritos where fuente='Blog') order by fecha;

/* 8.-  ¿Cuántas personas en promedio se inscriben en un día? */

select round(avg(cantidad),2) as personas_promedio, fecha from inscritos group by fecha order by fecha;

/* 9.- ¿Qué días se inscribieron más de 50 personas? */

select fecha, sum(cantidad) from inscritos group by fecha having sum(cantidad)>50 order by fecha;

/* 10.- ¿Cuántas personas se registraron en promedio cada día a partir del tercer día? */

select round(avg(cantidad),2)as personas_promedio, fecha from inscritos  where fecha >='2021-03-01' group by fecha order by fecha;

