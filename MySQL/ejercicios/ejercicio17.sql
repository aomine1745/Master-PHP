/*Obtener listado con los encargos realizados por el cliente 'Fruteria Antonio Inc'*/
SELECT e.idencargos, e.cantidad, co.modelo, cl.nombre AS 'cliente', e.fecha FROM encargos e INNER JOIN coches co ON e.idcoches = co.idcoches INNER JOIN clientes cl ON e.idclientes = cl.idclientes WHERE e.idclientes IN(SELECT idclientes FROM clientes WHERE nombre = 'Fruteria Antonia Inc'); 