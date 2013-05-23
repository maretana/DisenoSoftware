DROP PROCEDURE IF EXISTS buscarClientePorID;

DELIMITER $$
/* Busca el cliente con la identificacion proporcionada.*/
CREATE PROCEDURE buscarClientePorID(IN pIdentificacion VARCHAR(45))
	BEGIN
		SELECT P.nombre nombre, P.apellido1 apellido1, P.apellido2 apellido2 FROM Personas P
		INNER JOIN Clientes C ON P.idPersona = C.idPersona
		WHERE C.identificacion = pIdentificacion;
	END$$

DELIMITER ;