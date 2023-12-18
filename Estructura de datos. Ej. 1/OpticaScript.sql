SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`proveedor` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(150) NOT NULL,
  `telefono` VARCHAR(45) NULL,
  `fax` VARCHAR(45) NULL,
  `NIF` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `telefono_UNIQUE` (`telefono` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`gafas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gafas` (
  `id` INT NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `graduacion` INT NULL,
  `montura` VARCHAR(45) NOT NULL,
  `color_montura` VARCHAR(45) NOT NULL,
  `color_crital` VARCHAR(45) NOT NULL,
  `precio` INT NOT NULL,
  `id_proveedor` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_proveedor_idx` (`id_proveedor` ASC) VISIBLE,
  CONSTRAINT `id_proveedor`
    FOREIGN KEY (`id_proveedor`)
    REFERENCES `mydb`.`proveedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(155) NOT NULL,
  `direccion` VARCHAR(150) NOT NULL,
  `telefono` INT NOT NULL,
  `email` VARCHAR(105) NOT NULL,
  `fecha_registro` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`empleado` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido1` VARCHAR(45) NOT NULL,
  `apellido2` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`venta` (
  `id` INT NOT NULL,
  `id_empleado` INT NOT NULL,
  `id_clientes` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_empleado_idx` (`id_empleado` ASC) VISIBLE,
  INDEX `id_clientes_idx` (`id_clientes` ASC) VISIBLE,
  CONSTRAINT `id_empleado`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `mydb`.`empleado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_clientes`
    FOREIGN KEY (`id_clientes`)
    REFERENCES `mydb`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`recomendacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`recomendacion` (
  `id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente_has_recomendacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente_has_recomendacion` (
  `cliente_id` INT NOT NULL,
  `recomendacion_id` INT NULL,
  INDEX `recomendacion_id_idx` (`recomendacion_id` ASC) VISIBLE,
  INDEX `cliente_id_idx` (`cliente_id` ASC) VISIBLE,
  CONSTRAINT `cliente_id`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `mydb`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `recomendacion_id`
    FOREIGN KEY (`recomendacion_id`)
    REFERENCES `mydb`.`recomendacion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`gafas_has_ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gafas_has_ventas` (
  `gafas_id` INT NOT NULL,
  `venta_id` INT NOT NULL,
  `tiempo_venta` DATETIME NOT NULL,
  INDEX `gafas_id_idx` (`gafas_id` ASC) VISIBLE,
  INDEX `venta_id_idx` (`venta_id` ASC) VISIBLE,
  CONSTRAINT `gafas_id`
    FOREIGN KEY (`gafas_id`)
    REFERENCES `mydb`.`gafas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `venta_id`
    FOREIGN KEY (`venta_id`)
    REFERENCES `mydb`.`venta` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
