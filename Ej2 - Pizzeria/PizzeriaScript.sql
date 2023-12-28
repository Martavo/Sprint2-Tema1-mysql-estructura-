SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP DATABASE IF EXISTS Pizzeria;
CREATE DATABASE Pizzeria CHARACTER SET utf8;
USE Pizzeria;

-- -----------------------------------------------------
-- Table `Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cliente` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `codigo_postal` INT NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  `telefono` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tienda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tienda` (
  `id` INT NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `codigo_postal` INT NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Comanda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Comanda` (
  `id` INT NOT NULL,
  `fecha_hora` DATETIME NOT NULL,
  `tipo_entrega` ENUM('Recogida', 'Domicilio') NOT NULL,
  `cantidad` INT NOT NULL,
  `precio` DOUBLE NOT NULL,
  `cliente_id` INT NOT NULL,
  `tienda_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Comanda_cliente1_idx` (`cliente_id` ASC) VISIBLE,
  INDEX `fk_Comanda_Tienda1_idx` (`tienda_id` ASC) VISIBLE,
  CONSTRAINT `fk_Comanda_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `Cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comanda_Tienda1`
    FOREIGN KEY (`tienda_id`)
    REFERENCES `Tienda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Categoria_pizza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Categoria_pizza` (
  `id` INT NOT NULL,
  `nombre` ENUM('Rustica', 'Fina') NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Producto` (
  `id` INT NOT NULL,
  `nombre_pizza` VARCHAR(45) NULL,
  `descripcion_pizza` TEXT(150) NULL,
  `foto_pizza` BLOB NULL,
  `precio_pizza` DOUBLE NULL,
  `Categoria_pizza_id` INT NULL,
  `nombre_hamburguesa` VARCHAR(45) NULL,
  `descripcion_hamburguera` TEXT(150) NULL,
  `foto_hamburguesa` BLOB NULL,
  `precio_hamburguesa` DOUBLE NULL,
  `nombre_bebida` VARCHAR(45) NULL,
  `descripcion_bebida` TEXT(150) NULL,
  `foto_bebida` BLOB NULL,
  `precio_bebida` DOUBLE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Producto_Categoria_pizza1_idx` (`Categoria_pizza_id` ASC) VISIBLE,
  CONSTRAINT `fk_Producto_Categoria_pizza1`
    FOREIGN KEY (`Categoria_pizza_id`)
    REFERENCES `Categoria_pizza` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Trabajador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Trabajador` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(50) NOT NULL,
  `telefono` INT NOT NULL,
  `funcion_trabajo` ENUM('Cocinero', 'Repartidor') NOT NULL,
  `tienda_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Trabajador_Tienda1_idx` (`tienda_id` ASC) VISIBLE,
  CONSTRAINT `fk_Trabajador_Tienda1`
    FOREIGN KEY (`tienda_id`)
    REFERENCES `Tienda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Trabajador_has_Comanda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Trabajador_has_Comanda` (
  `id` INT NOT NULL,
  `trabajador_id` INT NOT NULL,
  `comanda_id` INT NOT NULL,
  `fecha_hora` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Trabajador_has_Comanda_Comanda1_idx` (`comanda_id` ASC) VISIBLE,
  INDEX `fk_Trabajador_has_Comanda_Trabajador1_idx` (`trabajador_id` ASC) VISIBLE,
  CONSTRAINT `fk_Trabajador_has_Comanda_Trabajador1`
    FOREIGN KEY (`trabajador_id`)
    REFERENCES `Trabajador` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trabajador_has_Comanda_Comanda1`
    FOREIGN KEY (`comanda_id`)
    REFERENCES `Comanda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Comanda_has_Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Comanda_has_Producto` (
  `Comanda_id` INT NOT NULL,
  `Producto_id` INT NOT NULL,
  INDEX `fk_Comanda_has_Producto_Producto1_idx` (`Producto_id` ASC) VISIBLE,
  INDEX `fk_Comanda_has_Producto_Comanda1_idx` (`Comanda_id` ASC) VISIBLE,
  CONSTRAINT `fk_Comanda_has_Producto_Comanda1`
    FOREIGN KEY (`Comanda_id`)
    REFERENCES `Comanda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comanda_has_Producto_Producto1`
    FOREIGN KEY (`Producto_id`)
    REFERENCES `Producto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

 

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
