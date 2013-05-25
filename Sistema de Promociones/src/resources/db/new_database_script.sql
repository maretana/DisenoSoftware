SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `sys_promo` ;
CREATE SCHEMA IF NOT EXISTS `sys_promo` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `sys_promo` ;

-- -----------------------------------------------------
-- Table `sys_promo`.`Personas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_promo`.`Personas` ;

CREATE  TABLE IF NOT EXISTS `sys_promo`.`Personas` (
  `idPersona` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(20) NOT NULL ,
  `apellido1` VARCHAR(20) NOT NULL ,
  `apellido2` VARCHAR(20) NULL ,
  PRIMARY KEY (`idPersona`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_promo`.`TiposContacto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_promo`.`TiposContacto` ;

CREATE  TABLE IF NOT EXISTS `sys_promo`.`TiposContacto` (
  `idTipoContacto` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(20) NOT NULL ,
  PRIMARY KEY (`idTipoContacto`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_promo`.`Contactos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_promo`.`Contactos` ;

CREATE  TABLE IF NOT EXISTS `sys_promo`.`Contactos` (
  `idContacto` INT NOT NULL AUTO_INCREMENT ,
  `valor` VARCHAR(20) NOT NULL ,
  `idPersona` INT NOT NULL ,
  `idTiposContacto` INT NOT NULL ,
  PRIMARY KEY (`idContacto`) ,
  INDEX `fk_Contactos_Personas_idx` (`idPersona` ASC) ,
  INDEX `fk_Contactos_TiposContacto1_idx` (`idTiposContacto` ASC) ,
  CONSTRAINT `fk_Contactos_Personas`
    FOREIGN KEY (`idPersona` )
    REFERENCES `sys_promo`.`Personas` (`idPersona` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contactos_TiposContacto1`
    FOREIGN KEY (`idTiposContacto` )
    REFERENCES `sys_promo`.`TiposContacto` (`idTipoContacto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_promo`.`Clientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_promo`.`Clientes` ;

CREATE  TABLE IF NOT EXISTS `sys_promo`.`Clientes` (
  `idCliente` INT NOT NULL AUTO_INCREMENT ,
  `identificacion` VARCHAR(45) NOT NULL ,
  `idPersona` INT NOT NULL ,
  PRIMARY KEY (`idCliente`) ,
  INDEX `fk_Clientes_Personas1_idx` (`idPersona` ASC) ,
  UNIQUE INDEX `Identificación_UNIQUE` (`identificacion` ASC) ,
  CONSTRAINT `fk_Clientes_Personas1`
    FOREIGN KEY (`idPersona` )
    REFERENCES `sys_promo`.`Personas` (`idPersona` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_promo`.`Paises`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_promo`.`Paises` ;

CREATE  TABLE IF NOT EXISTS `sys_promo`.`Paises` (
  `idPais` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idPais`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_promo`.`Provincias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_promo`.`Provincias` ;

CREATE  TABLE IF NOT EXISTS `sys_promo`.`Provincias` (
  `idProvincia` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `idPais` INT NOT NULL ,
  PRIMARY KEY (`idProvincia`) ,
  INDEX `fk_Provincias_Paises1_idx` (`idPais` ASC) ,
  CONSTRAINT `fk_Provincias_Paises1`
    FOREIGN KEY (`idPais` )
    REFERENCES `sys_promo`.`Paises` (`idPais` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_promo`.`Ciudad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_promo`.`Ciudad` ;

CREATE  TABLE IF NOT EXISTS `sys_promo`.`Ciudad` (
  `idCiudad` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `idProvincia` INT NOT NULL ,
  PRIMARY KEY (`idCiudad`) ,
  INDEX `fk_Ciudad_Provincias1_idx` (`idProvincia` ASC) ,
  CONSTRAINT `fk_Ciudad_Provincias1`
    FOREIGN KEY (`idProvincia` )
    REFERENCES `sys_promo`.`Provincias` (`idProvincia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_promo`.`Direcciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_promo`.`Direcciones` ;

CREATE  TABLE IF NOT EXISTS `sys_promo`.`Direcciones` (
  `idDireccion` INT NOT NULL AUTO_INCREMENT ,
  `detalles` VARCHAR(200) NOT NULL ,
  `idCiudad` INT NOT NULL ,
  PRIMARY KEY (`idDireccion`) ,
  INDEX `fk_Direcciones_Ciudad1_idx` (`idCiudad` ASC) ,
  CONSTRAINT `fk_Direcciones_Ciudad1`
    FOREIGN KEY (`idCiudad` )
    REFERENCES `sys_promo`.`Ciudad` (`idCiudad` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_promo`.`Empresas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_promo`.`Empresas` ;

CREATE  TABLE IF NOT EXISTS `sys_promo`.`Empresas` (
  `idEmpresa` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(100) NOT NULL ,
  `usuario` VARCHAR(30) NOT NULL ,
  `password` BINARY(150) NOT NULL ,
  `idEncargado` INT NOT NULL ,
  `idDireccion` INT NOT NULL ,
  PRIMARY KEY (`idEmpresa`) ,
  INDEX `fk_Empresas_Personas1_idx` (`idEncargado` ASC) ,
  INDEX `fk_Empresas_Direcciones1_idx` (`idDireccion` ASC) ,
  CONSTRAINT `fk_Empresas_Personas1`
    FOREIGN KEY (`idEncargado` )
    REFERENCES `sys_promo`.`Personas` (`idPersona` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empresas_Direcciones1`
    FOREIGN KEY (`idDireccion` )
    REFERENCES `sys_promo`.`Direcciones` (`idDireccion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_promo`.`Promociones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_promo`.`Promociones` ;

CREATE  TABLE IF NOT EXISTS `sys_promo`.`Promociones` (
  `idPromocion` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(100) NOT NULL ,
  `reglamento` VARCHAR(50) NOT NULL ,
  `inicio` DATETIME NOT NULL ,
  `fin` DATETIME NOT NULL ,
  `vigencia_puntos` INT NOT NULL COMMENT 'Dias que duran los puntos desde la ultmia compra del cliente. De esta forma con cada compra incrementa el tiempo de validez de sus puntos actuales.' ,
  `idEmpresa` INT NOT NULL ,
  PRIMARY KEY (`idPromocion`) ,
  INDEX `fk_Promociones_Empresas1_idx` (`idEmpresa` ASC) ,
  CONSTRAINT `fk_Promociones_Empresas1`
    FOREIGN KEY (`idEmpresa` )
    REFERENCES `sys_promo`.`Empresas` (`idEmpresa` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_promo`.`Productos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_promo`.`Productos` ;

CREATE  TABLE IF NOT EXISTS `sys_promo`.`Productos` (
  `idProducto` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(200) NOT NULL ,
  `foto` VARCHAR(45) NULL ,
  `precio` DOUBLE(14,4) NOT NULL ,
  PRIMARY KEY (`idProducto`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_promo`.`Productos_por_Promociones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_promo`.`Productos_por_Promociones` ;

CREATE  TABLE IF NOT EXISTS `sys_promo`.`Productos_por_Promociones` (
  `idProducto` INT NOT NULL ,
  `idPromocion` INT NOT NULL ,
  `puntos` INT NOT NULL ,
  PRIMARY KEY (`idProducto`, `idPromocion`) ,
  INDEX `fk_Productos_por_Promociones_Promociones1_idx` (`idPromocion` ASC) ,
  INDEX `fk_Productos_por_Promociones_Productos1_idx` (`idProducto` ASC) ,
  CONSTRAINT `fk_Productos_por_Promociones_Productos1`
    FOREIGN KEY (`idProducto` )
    REFERENCES `sys_promo`.`Productos` (`idProducto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Productos_por_Promociones_Promociones1`
    FOREIGN KEY (`idPromocion` )
    REFERENCES `sys_promo`.`Promociones` (`idPromocion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_promo`.`TiposCuenta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_promo`.`TiposCuenta` ;

CREATE  TABLE IF NOT EXISTS `sys_promo`.`TiposCuenta` (
  `idTipoCuenta` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `plazo` INT NOT NULL ,
  `tarifa` DOUBLE(14,4) NOT NULL ,
  PRIMARY KEY (`idTipoCuenta`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_promo`.`CuentasEmpresas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_promo`.`CuentasEmpresas` ;

CREATE  TABLE IF NOT EXISTS `sys_promo`.`CuentasEmpresas` (
  `idCuentaEmpresa` INT NOT NULL AUTO_INCREMENT ,
  `inicio` DATETIME NOT NULL ,
  `fin` DATETIME NOT NULL ,
  `idEmpresa` INT NOT NULL ,
  `idTipoCuenta` INT NOT NULL ,
  PRIMARY KEY (`idCuentaEmpresa`) ,
  INDEX `fk_CuentasEmpresas_Empresas1_idx` (`idEmpresa` ASC) ,
  INDEX `fk_CuentasEmpresas_TiposCuenta1_idx` (`idTipoCuenta` ASC) ,
  CONSTRAINT `fk_CuentasEmpresas_Empresas1`
    FOREIGN KEY (`idEmpresa` )
    REFERENCES `sys_promo`.`Empresas` (`idEmpresa` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CuentasEmpresas_TiposCuenta1`
    FOREIGN KEY (`idTipoCuenta` )
    REFERENCES `sys_promo`.`TiposCuenta` (`idTipoCuenta` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_promo`.`Premios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_promo`.`Premios` ;

CREATE  TABLE IF NOT EXISTS `sys_promo`.`Premios` (
  `idPremio` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `puntos` INT NOT NULL ,
  `Descripcion` VARCHAR(500) NULL ,
  `idPromocion` INT NOT NULL ,
  PRIMARY KEY (`idPremio`) ,
  INDEX `fk_Premios_Promociones1_idx` (`idPromocion` ASC) ,
  CONSTRAINT `fk_Premios_Promociones1`
    FOREIGN KEY (`idPromocion` )
    REFERENCES `sys_promo`.`Promociones` (`idPromocion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_promo`.`Premios_por_Clientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_promo`.`Premios_por_Clientes` ;

CREATE  TABLE IF NOT EXISTS `sys_promo`.`Premios_por_Clientes` (
  `idPremio` INT NOT NULL ,
  `idCliente` INT NOT NULL ,
  `fecha` DATETIME NOT NULL ,
  PRIMARY KEY (`idPremio`, `idCliente`) ,
  INDEX `fk_Premios_por_Clientes_Clientes1_idx` (`idCliente` ASC) ,
  INDEX `fk_Premios_por_Clientes_Premios1_idx` (`idPremio` ASC) ,
  CONSTRAINT `fk_Premios_por_Clientes_Premios1`
    FOREIGN KEY (`idPremio` )
    REFERENCES `sys_promo`.`Premios` (`idPremio` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Premios_por_Clientes_Clientes1`
    FOREIGN KEY (`idCliente` )
    REFERENCES `sys_promo`.`Clientes` (`idCliente` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_promo`.`HistorialComprasClientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_promo`.`HistorialComprasClientes` ;

CREATE  TABLE IF NOT EXISTS `sys_promo`.`HistorialComprasClientes` (
  `idHistorialComprasClientes` INT NOT NULL AUTO_INCREMENT ,
  `fecha` DATETIME NOT NULL ,
  `codigo` CHAR(20) NOT NULL COMMENT 'Codigo de la factura del cliente' ,
  `idCliente` INT NOT NULL ,
  PRIMARY KEY (`idHistorialComprasClientes`) ,
  INDEX `fk_HistorialComprasClientes_Clientes1_idx` (`idCliente` ASC) ,
  CONSTRAINT `fk_HistorialComprasClientes_Clientes1`
    FOREIGN KEY (`idCliente` )
    REFERENCES `sys_promo`.`Clientes` (`idCliente` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sys_promo`.`DetallesCompraCliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sys_promo`.`DetallesCompraCliente` ;

CREATE  TABLE IF NOT EXISTS `sys_promo`.`DetallesCompraCliente` (
  `idDetalle` INT NOT NULL AUTO_INCREMENT ,
  `cantidad` INT NOT NULL ,
  `idHistorialComprasClientes` INT NOT NULL ,
  `idProducto` INT NOT NULL ,
  PRIMARY KEY (`idDetalle`) ,
  INDEX `fk_DetallesCompraCliente_HistorialComprasClientes1_idx` (`idHistorialComprasClientes` ASC) ,
  INDEX `fk_DetallesCompraCliente_Productos1_idx` (`idProducto` ASC) ,
  CONSTRAINT `fk_DetallesCompraCliente_HistorialComprasClientes1`
    FOREIGN KEY (`idHistorialComprasClientes` )
    REFERENCES `sys_promo`.`HistorialComprasClientes` (`idHistorialComprasClientes` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetallesCompraCliente_Productos1`
    FOREIGN KEY (`idProducto` )
    REFERENCES `sys_promo`.`Productos` (`idProducto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `sys_promo` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
