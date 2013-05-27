/* Llena la base de datos con la cantidad de datos proporcionada por el usuario.
 * Recibe las empresas que van a registrarse, las promociones que va a tener cada empresa,
 * Los productos que va a tener cada promocion y los prmeios que va a tener cada promocion.
 * NOTA: Todas las empresas van a quedar registradas en la ciudad con el PK = 1.
 * Supone que la base de datos no tiene datos previos.
 */
DROP PROCEDURE IF EXISTS llenarDatosPrueba;

DELIMITER $$

CREATE PROCEDURE llenarDatosPrueba(IN pEmpresas INT, IN pPromos INT, IN pProductos INT
                                     IN pPremios INT)
	BEGIN
		DECLARE encargado_id INT;
		DECLARE empresa_id INT;
		DECLARE direccion_id INT;
		DECLARE empresas INT DEFAULT 0;
		DECLARE promocion_id INT;
		DECLARE productos INT;
		DECLARE premios INT;
		DECLARE producto_id INT;
                DECLARE promociones INT;
		WHILE empresas < pEmpresas DO
			INSERT Personas(nombre, apellido1) VALUES ('Encargado', CONCAT('Empresa',empresas));
			SELECT LAST_INSERT_ID() INTO encargado_id;
			INSERT Direcciones(detalles, idCiudad) VALUES (CONCAT('Detalles de la direccion de la Empresa',empresas),1);
			SELECT LAST_INSERT_ID() INTO direccion_id;
			INSERT INTO Empresas(nombre,usuario,password,idEncargado,idDireccion) VALUES (CONCAT('Empresa',empresas),'usuario','password',encargado_id,direccion_id);
			SELECT LAST_INSERT_ID() INTO empresa_id;
                        SET promociones = 0;
                        WHILE promociones < pPromos DO
                            INSERT INTO Promociones (nombre, reglamento, inicio, fin, vigencia_puntos, idEmpresa) VALUES (CONCAT('Promocion',promociones),'url reglamento promocion','2013-05-22','2013-10-25',60,empresa_id);
                            SELECT LAST_INSERT_ID() INTO promocion_id;
                            SET productos = 0;
                            WHILE productos < pProductos DO
				INSERT INTO Productos(nombre,precio,codigo) VALUES (CONCAT('Producto',(productos+(pProductos*promociones))),2500,CONCAT('e',empresas,'p',productos,'pr',promociones));
				SELECT LAST_INSERT_ID() INTO producto_id;
				INSERT INTO Productos_por_Promociones(idProducto, idPromocion, puntos) VALUES (producto_id, promocion_id, 20);
				SET productos = productos + 1;
                            END WHILE;
                            SET premios = 0;
                            WHILE premios < pPremios DO
                                INSERT INTO Premios(nombre, puntos, idPromocion) VALUES (CONCAT('Premio',(premios+(pPremios*promociones))), 200, promocion_id);
                                SET premios = premios + 1;
                            END WHILE;
                            SET promociones = promociones + 1;
                        END WHILE;
			SET empresas = empresas + 1;
		END WHILE;
	END$$

DELIMITER ;