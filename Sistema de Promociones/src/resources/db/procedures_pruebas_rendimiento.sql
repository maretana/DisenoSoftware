/* Estos stored procedures son usados por la aplicación que mide el rendimiento.
 * Son procedures de utilería, sólo se usan para hacer llenado de datos y otras
 * tareas a fin.
 */

---------------------------------- registrarClientePruebaRendimiento -----------------------------------------------
DROP PROCEDURE IF EXISTS registrarClientePruebaRendimiento;

DELIMITER $$
/* Registra un cliente nuevo en la BD sólo con la información básica necesaria pero también se le puede
 * el apellido2.
 */
CREATE PROCEDURE registrarClientePruebaRendimiento(IN pNombre VARCHAR(20), IN pApellido1 VARCHAR(20), IN pApellido2 VARCHAR(20),
                                                           IN pIdentificacion VARCHAR(45))
    BEGIN
        INSERT INTO Personas(nombre, apellido1, apellido2) VALUES (pNombre, pApellido1, pApellido2);
        INSERT INTO Clientes(identificacion, idPersona) VALUES (pIdentificacion, LAST_INSERT_ID());
    END$$

DELIMITER ;
---------------------------------- registrarClientePruebaRendimiento -----------------------------------------------

---------------------------------- registrarNuevaCompraPruebaRendimiento -----------------------------------------------
DROP PROCEDURE IF EXISTS registrarNuevaCompraPruebaRendimiento;

DELIMITER $$
/* Registra la compra con un codigo generado por la base de datos a partir de una semilla.
 * El código luego se va a usar para registrar los detalles de la compra. Este método de
 * registrar compras sirve para las pruebas, pero en implementación se debería registrar
 * compras de forma diferente. También recibe los días de diferencia de la compra ("la
 * compra fue hace n días").
 */
CREATE PROCEDURE registrarNuevaCompraPruebaRendimiento(INOUT pCodigo CHAR(20), IN pIdentificacion VARCHAR(20), IN pDias INT)
    BEGIN
        DECLARE cliente_id INT;
        SELECT idCliente INTO cliente_id FROM Clientes WHERE identificacion = pIdentificacion;
        SELECT SUBSTRING(CAST(MD5(pCodigo) AS CHAR),1,20) INTO pCodigo;
        INSERT INTO HistorialComprasClientes(fecha, codigo, idCliente) VALUES ((SYSDATE() - INTERVAL pDias DAY), pCodigo, cliente_id);
    END$$

DELIMITER ;
---------------------------------- registrarNuevaCompraPruebaRendimiento -----------------------------------------------

---------------------------------- insertarDetalleCompraPruebaRendimiento -----------------------------------------------
DROP PROCEDURE IF EXISTS insertarDetalleCompraPruebaRendimiento;

DELIMITER $$
/* Reigstra la compra de un producto en cierta empresa dentro del historial de compras del cliente.
 * Recibe el nombre del producto (el SP usado en implementación debería recibir el código del producto),
 * el nombre de la empresa y la cantidad comprada de ese producto. También recibe el código del historial
 * de compras.
 */
CREATE PROCEDURE insertarDetalleCompraPruebaRendimiento(IN pCodigo CHAR(20), IN pProducto VARCHAR(200), IN pCantidad INT,
                                                        IN pEmpresa VARCHAR(100))
    BEGIN
        DECLARE producto_id INT;
        DECLARE historial_id INT;
        SELECT idHistorialComprasClientes INTO historial_id FROM HistorialComprasClientes WHERE codigo = pCodigo;
        SELECT DISTINCT P.idProducto INTO producto_id FROM Productos P
        INNER JOIN Productos_Por_Promociones PP ON P.idProducto = PP.idProducto
        INNER JOIN Promociones Pr ON PP.idPromocion = Pr.idPromocion
        INNER JOIN Empresas E ON Pr.idEmpresa = E.idEmpresa
        WHERE   E.nombre = pEmpresa
            AND P.nombre = pProducto;
        INSERT INTO DetallesCompraCliente (cantidad, idHistorialComprasClientes, idProducto) VALUES (pCantidad, historial_id, producto_id);
    END$$

DELIMITER ;
---------------------------------- insertarDetalleCompraPruebaRendimiento -----------------------------------------------

---------------------------------- borrarClientePruebaRendimiento -----------------------------------------------
DROP PROCEDURE IF EXISTS borrarClientesPruebaRendimiento;

DELIMITER $$
/* Borra todos los clientes por completo de la base de datos.
 * Esto implica que borra todos los registros que se hayan agregado sobre los clientes (e.g. compras).
 */
CREATE PROCEDURE borrarClientesPruebaRendimiento()
    BEGIN
        DELETE DCC, HCC, C, P FROM Personas P
        INNER JOIN Clientes C ON P.`idPersona` = C.`idPersona`
        INNER JOIN HistorialComprasClientes HCC ON C.`idCliente` = HCC.`idCliente`
        INNER JOIN DetallesCompraCliente DCC ON HCC.`idHistorialComprasClientes` = DCC.`idHistorialComprasClientes`;
    END$$

DELIMITER ;
---------------------------------- borrarClientePruebaRendimiento -----------------------------------------------