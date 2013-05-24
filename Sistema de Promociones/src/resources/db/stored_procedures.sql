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

DROP PROCEDURE IF EXISTS contarPuntosClientePorPromocionPorEmpresa;

DELIMITER $$
/*Busca los puntos que tiene un cliente en cada promocion de cada empresa.*/
CREATE PROCEDURE contarPuntosClientePorPromocionPorEmpresa(IN pIdentificacion VARCHAR(45))
    BEGIN
        SELECT SUM(DCC.cantidad*PP.puntos) puntos, P.nombre promocion, E.nombre empresa FROM Clientes C
        INNER JOIN HistorialComprasClientes HCC ON C.idCliente = HCC.idCliente
        INNER JOIN DetallesCompraCliente DCC ON HCC.idHistorialComprasClientes = DCC.idHistorialComprasClientes
        INNER JOIN Productos Pr ON DCC.idProducto = Pr.idProducto
        INNER JOIN Productos_por_Promociones PP ON Pr.idProducto = PP.idProducto
        INNER JOIN Promociones P ON PP.idPromocion = P.idPromocion
        INNER JOIN Empresas E ON P.idEmpresa = E.idEmpresa
        WHERE C.identificacion = pIdentificacion
        GROUP BY P.idPromocion;
    END$$
