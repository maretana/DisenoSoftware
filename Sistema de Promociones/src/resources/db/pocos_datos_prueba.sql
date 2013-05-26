/* Para esta prueba van a insertarse 100 empresas con una promoci�n cada una.
 * Cada promoci�n va a tener 50 prodcutos y 30 premios.
 * Como cada empresa s�lo tiene una promoci�n, no se considera la posibilidad
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
		DECLARE empresas INT DEFAULT 1;
		DECLARE promocion_id INT;
		DECLARE productos INT;
		DECLARE premios INT;
		DECLARE producto_id INT;
		WHILE empresas <= 100 DO
			INSERT Personas(nombre, apellido1) VALUES ('Encargado', CONCAT('Empresa',empresas));
			SELECT LAST_INSERT_ID() INTO encargado_id;
			INSERT Direcciones(detalles, idCiudad) VALUES (CONCAT('Detalles de la direcci�n de la Empresa',empresas),1);
			SELECT LAST_INSERT_ID() INTO direccion_id;
			INSERT INTO Empresas(nombre,usuario,password,idEncargado,idDireccion) VALUES (CONCAT('Empresa',empresas),'usuario','password',encargado_id,direccion_id);
			SELECT LAST_INSERT_ID() INTO empresa_id;
			INSERT INTO Promociones (nombre, reglamento, inicio, fin, vigencia_puntos, idEmpresa) VALUES (CONCAT('Promocion',empresas),'url reglamento promocion','2013-05-22','2013-10-25',60,empresa_id);
			SELECT LAST_INSERT_ID() INTO promocion_id;
			SET productos = 1;
			WHILE productos <= 50 DO
				INSERT INTO Productos(nombre,precio,codigo) VALUES (CONCAT('Producto',productos),2500,CONCAT(CONCAT('e',empresas),CONCAT('p',productos)));
				SELECT LAST_INSERT_ID() INTO producto_id;
				INSERT INTO Productos_por_Promociones(idProducto, idPromocion, puntos) VALUES (producto_id, promocion_id, 20);
				SET productos = productos + 1;
			END WHILE;
			SET premios = 1;
			WHILE premios <= 30 DO
				INSERT INTO Premios(nombre, puntos, idPromocion) VALUES (CONCAT('Premio',premios), 200, promocion_id);
				SET premios = premios + 1;
			END WHILE;
			SET empresas = empresas + 1;
		END WHILE;
	END$$

DELIMITER ;