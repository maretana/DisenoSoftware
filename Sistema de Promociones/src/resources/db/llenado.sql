/*INSERCION DE PAISES-PROVINCIAS-CIUDADES*/
/*Variables de sesion*/
SET @pais_id = 0;
SET @provincia_id = 0;
/*INSERTS*/
INSERT INTO Paises(nombre) VALUES ('Costa Rica');
SELECT LAST_INSERT_ID() INTO @pais_id;
INSERT INTO Provincias(nombre, idPais) VALUES ('San Jose', @pais_id);
SELECT LAST_INSERT_ID() INTO @provincia_id;
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad1',@provincia_id);
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad2',@provincia_id);
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad3',@provincia_id);
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad4',@provincia_id);
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad5',@provincia_id);
INSERT INTO Provincias(nombre, idPais) VALUES ('Cartago', @pais_id);
SELECT LAST_INSERT_ID() INTO @provincia_id;
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad1',@provincia_id);
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad2',@provincia_id);
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad3',@provincia_id);
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad4',@provincia_id);
INSERT INTO Provincias(nombre, idPais) VALUES ('Alajuela', @pais_id);
SELECT LAST_INSERT_ID() INTO @provincia_id;
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad1',@provincia_id);
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad2',@provincia_id);
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad3',@provincia_id);
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad4',@provincia_id);
INSERT INTO Provincias(nombre, idPais) VALUES ('Puntarenas', @pais_id);
SELECT LAST_INSERT_ID() INTO @provincia_id;
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad1',@provincia_id);
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad2',@provincia_id);
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad3',@provincia_id);
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad4',@provincia_id);
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad5',@provincia_id);
INSERT INTO Provincias(nombre, idPais) VALUES ('Guanacaste', @pais_id);
SELECT LAST_INSERT_ID() INTO @provincia_id;
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad1',@provincia_id);
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad2',@provincia_id);
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad3',@provincia_id);
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad4',@provincia_id);
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad5',@provincia_id);
INSERT INTO Provincias(nombre, idPais) VALUES ('Heredia', @pais_id);
SELECT LAST_INSERT_ID() INTO @provincia_id;
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad1',@provincia_id);
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad2',@provincia_id);
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad3',@provincia_id);
INSERT INTO Provincias(nombre, idPais) VALUES ('Limon', @pais_id);
SELECT LAST_INSERT_ID() INTO @provincia_id;
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad1',@provincia_id);
INSERT INTO Ciudad(nombre, idProvincia) VALUES ('Ciudad2',@provincia_id);