/*Modificar la comisión de los vendedores y ponerla al 0.5% cuando ganan mas de 5000*/
UPDATE vendedores SET comision = 0.5 WHERE sueldo >= 5000;