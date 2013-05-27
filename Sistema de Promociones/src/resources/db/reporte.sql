/* Estos stored procedures se usan para recolectar datos interesantes para el
 * reporte al usuario.
 */

-----------------------------contarDatosReporte---------------------------------------------
DROP PROCEDURE IF EXISTS contarDatosReporte;

DELIMITER $$

CREATE PROCEDURE contarDatosReporte()
    BEGIN
        (SELECT 'empresas' nombre, COUNT(*) total FROM Empresas)
        UNION
        (SELECT 'promos', COUNT(*) FROM Promociones)
        UNION
        (SELECT 'premios', COUNT(*) FROM Premios)
        UNION
        (SELECT 'productos', COUNT(*) FROM Productos)
        UNION
        (SELECT 'comprados', SUM(cantidad) FROM DetallesCompraCliente)
        UNION
        (SELECT 'compras', COUNT(*) FROM HistorialComprasClientes)
        UNION 
        (SELECT 'clientes', COUNT(*) FROM Clientes);
    END$$

DELIMITER ;
-----------------------------contarDatosReporte---------------------------------------------
