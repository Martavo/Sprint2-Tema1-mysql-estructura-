
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP DATABASE IF EXISTS Optica;
CREATE DATABASE Optica CHARACTER SET utf8;
USE Optica;

-- -----------------------------------------------------
-- Table `proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proveedor` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` TEXT(100) NOT NULL,
  `telefono` INT NULL,
  `fax` INT NULL,
  `NIF` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `telefono_UNIQUE` (`telefono` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gafas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gafas` (
  `id` INT NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `color_montura` VARCHAR(45) NOT NULL,
  `color_cristal_dch` VARCHAR(45) NOT NULL,
  `color_crital_izq` VARCHAR(45) NOT NULL,
  `precio` DOUBLE NOT NULL,
  `graduacion_izq` DOUBLE NULL,
  `graducacion_dch` DOUBLE NULL,
  `montura` ENUM('Flotante', 'Pasta', 'Metalicas') NULL,
  `proveedor_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_gafas_proveedor1_idx` (`proveedor_id` ASC) VISIBLE,
  CONSTRAINT `fk_gafas_proveedor1`
    FOREIGN KEY (`proveedor_id`)
    REFERENCES `proveedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(155) NOT NULL,
  `direccion` VARCHAR(150) NOT NULL,
  `telefono` INT NOT NULL,
  `email` VARCHAR(105) NOT NULL,
  `fecha_registro` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empleado` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido1` VARCHAR(45) NOT NULL,
  `apellido2` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `venta` (
  `id` INT NOT NULL,
  `id_empleado` INT NOT NULL,
  `id_clientes` INT NOT NULL,
  `gafas_id` INT NOT NULL,
  `tiempo_venta` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_empleado_idx` (`id_empleado` ASC) VISIBLE,
  INDEX `id_clientes_idx` (`id_clientes` ASC) VISIBLE,
  INDEX `fk_venta_gafas1_idx` (`gafas_id` ASC) VISIBLE,
  CONSTRAINT `id_empleado`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `empleado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_clientes`
    FOREIGN KEY (`id_clientes`)
    REFERENCES `cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_gafas1`
    FOREIGN KEY (`gafas_id`)
    REFERENCES `gafas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recomendacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recomendacion` (
  `id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cliente_has_recomendacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cliente_has_recomendacion` (
  `cliente_id` INT NOT NULL,
  `recomendacion_id` INT NOT NULL,
  INDEX `cliente_id_idx` (`cliente_id` ASC) VISIBLE,
  INDEX `fk_cliente_has_recomendacion_recomendacion1_idx` (`recomendacion_id` ASC) VISIBLE,
  CONSTRAINT `cliente_id`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_has_recomendacion_recomendacion1`
    FOREIGN KEY (`recomendacion_id`)
    REFERENCES `recomendacion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
