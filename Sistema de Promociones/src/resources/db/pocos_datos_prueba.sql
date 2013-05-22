/* Para esta prueba van a insertarse 100 empresas con una promoción cada una.
 * Cada promoción va a tener 50 prodcutos y 30 premios.
 * Como cada empresa sólo tiene una promoción, no se considera la posibilidad
 * de usar un producto ya registrado en la BD.
 * Cada empresa tiene un encargado.
 * NOTA: Todas las empresas van a quedar registradas en la ciudad con el PK = 1.
 */
DROP PROCEDURE IF EXISTS llenarConPocosDatos;

DELIMITER $$

CREATE PROCEDURE llenarConPocosDatos()
	BEGIN
		DECLARE encargado_id INT;
		DECLARE empresa_id INT;
		DECLARE direccion_id INT;
		DECLARE contador INT DEFAULT 1;
		DECLARE promocion_id INT;
		DECLARE productos INT;
		DECLARE premios INT;
		DECLARE producto_id INT;
		WHILE contador <= 100 DO
			INSERT Personas(nombre, apellido1) VALUES ('Encargado', CONCAT('Empresa',contador));
			SELECT LAST_INSERT_ID() INTO encargado_id;
			INSERT Direcciones(detalles, idCiudad) VALUES (CONCAT('Detalles de la dirección de la Empresa',contador),1);
			SELECT LAST_INSERT_ID() INTO direccion_id;
			INSERT INTO Empresas(nombre,usuario,password,idEncargado,idDireccion) VALUES (CONCAT('Empresa',contador),'usuario','password',encargado_id,direccion_id);
			SELECT LAST_INSERT_ID() INTO empresa_id;
			INSERT INTO Promociones (reglamento, inicio, fin, vigencia_puntos, idEmpresa) VALUES ('url reglamento promocion','2013-05-22','2013-10-25',60,empresa_id);
			SELECT LAST_INSERT_ID() INTO promocion_id;
			SET productos = 1;
			WHILE productos <= 50 DO
				INSERT INTO Productos(nombre,precio) VALUES (CONCAT('Producto',productos),2500);
				SELECT LAST_INSERT_ID() INTO producto_id;
				INSERT INTO Productos_por_Promociones(idProducto, idPromocion, puntos) VALUES (producto_id, promocion_id, 20);
				SET productos = productos + 1;
			END WHILE;
			SET premios = 1;
			WHILE premios <= 30 DO
				INSERT INTO Premios(nombre, puntos, idPromocion) VALUES (CONCAT('Premio',premios), 200, promocion_id);
				SET premios = premios + 1;
			END WHILE;
			SET contador = contador + 1;
		END WHILE;
	END$$

DELIMITER ;