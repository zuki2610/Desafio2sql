--1 ¿Cuántos registros hay?--
SELECT COUNT(*) FROM INSCRITOS;
--2 ¿Cuántos inscritos hay en total?--
SELECT SUM(cantidad) FROM INSCRITOS;
--3 ¿Cuál o cuáles son los registros de mayor antigüedad?--
SELECT * FROM INSCRITOS WHERE fecha IN (SELECT MIN(fecha) FROM INSCRITOS);
--4 ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante)--
SELECT SUM(cantidad), fecha FROM INSCRITOS GROUP BY fecha ORDER BY fecha ASC;
--5¿Cuántos inscritos hay por fuente?--
SELECT SUM(cantidad) cantidad, fuente FROM INSCRITOS GROUP BY fuente;
--6 ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día? --
SELECT SUM(cantidad), fecha FROM INSCRITOS GROUP BY fecha ORDER BY SUM(cantidad) DESC LIMIT 1;
--7 ¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas personas fueron?
SELECT * FROM INSCRITOS WHERE cantidad in (SELECT MAX(cantidad) FROM INSCRITOS WHERE fuente = 'Blog');
--8 ¿Cuántas personas en promedio se inscriben en un día? --
SELECT AVG (cantidad) FROM INSCRITOS;
--9  ¿Qué días se inscribieron más de 50 personas?--
SELECT fecha, cantidad FROM INSCRITOS WHERE cantidad > 50 ORDER BY fecha;
--10 ¿Cuántas personas se registraron en promedio cada día a partir del tercer día?
SELECT fecha, AVG(cantidad) FROM INSCRITOS WHERE fecha >= CAST('2021-01-03' AS date) GROUP BY FECHA ORDER BY fecha;

