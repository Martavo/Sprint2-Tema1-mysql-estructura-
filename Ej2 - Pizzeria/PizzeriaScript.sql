
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP DATABASE IF EXISTS Pizzeria;
CREATE DATABASE Pizzeria CHARACTER SET utf8mb4;
USE Pizzeria;

-- -----------------------------------------------------
-- Table `Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cliente` (
  `id` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(100) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `CodigoPostal` INT NOT NULL,
  `Ciudad` VARCHAR(45) NOT NULL,
  `Provincia` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tienda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tienda` (
  `id` INT NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `CodigoPostal` INT NOT NULL,
  `Ciudad` VARCHAR(45) NOT NULL,
  `Provincia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Comanda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Comanda` (
  `id` INT NOT NULL,
  `Fecha_hora` VARCHAR(45) NOT NULL,
  `Tipo_entrega` VARCHAR(45) NOT NULL,
  `Cantidad_productos` INT NOT NULL,
  `Precio` INT NOT NULL,
  `cliente_id` INT NOT NULL,
  `Tienda_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Comanda_cliente1_idx` (`cliente_id` ASC) VISIBLE,
  INDEX `fk_Comanda_Tienda1_idx` (`Tienda_id` ASC) VISIBLE,
  CONSTRAINT `fk_Comanda_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `Cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comanda_Tienda1`
    FOREIGN KEY (`Tienda_id`)
    REFERENCES `Tienda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hamburguesa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hamburguesa` (
  `id` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descipcion` TEXT(200) NOT NULL,
  `Foto` BLOB NOT NULL,
  `Precio` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bebida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bebida` (
  `id` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descipcion` TEXT(200) NOT NULL,
  `Foto` BLOB NOT NULL,
  `Precio` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Categoria` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizza` (
  `id` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` TEXT(200) NOT NULL,
  `Foto` BLOB NOT NULL,
  `Precio` INT NOT NULL,
  `Categoria_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Pizza_Categoria1_idx` (`Categoria_id` ASC) VISIBLE,
  CONSTRAINT `fk_Pizza_Categoria1`
    FOREIGN KEY (`Categoria_id`)
    REFERENCES `Categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Producto` (
  `id` INT NOT NULL,
  `Hamburguesa_id` INT ,
  `Bebida_id` INT ,
  `Pizza_id` INT ,
  PRIMARY KEY (`id`),
  INDEX `fk_Producto_Hamburguesa1_idx` (`Hamburguesa_id` ASC) VISIBLE,
  INDEX `fk_Producto_Bebida1_idx` (`Bebida_id` ASC) VISIBLE,
  INDEX `fk_Producto_Pizza1_idx` (`Pizza_id` ASC) VISIBLE,
  CONSTRAINT `fk_Producto_Hamburguesa1`
    FOREIGN KEY (`Hamburguesa_id`)
    REFERENCES `Hamburguesa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_Bebida1`
    FOREIGN KEY (`Bebida_id`)
    REFERENCES `Bebida` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_Pizza1`
    FOREIGN KEY (`Pizza_id`)
    REFERENCES `Pizza` (`id`)
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



-- -----------------------------------------------------
-- Table `Trabajador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Trabajador` (
  `id` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(50) NOT NULL,
  `Telefono` INT NOT NULL,
  `FuncionTrabajo` ENUM('Cocinero', 'Repartidor') NOT NULL,
  `Tienda_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Trabajador_Tienda1_idx` (`Tienda_id` ASC) VISIBLE,
  CONSTRAINT `fk_Trabajador_Tienda1`
    FOREIGN KEY (`Tienda_id`)
    REFERENCES `Tienda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Trabajador_has_Comanda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Trabajador_has_Comanda` (
  `id` VARCHAR(45) NOT NULL,
  `Trabajador_id` INT NOT NULL,
  `Comanda_id` INT NOT NULL,
  `Fecha_hora` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Trabajador_has_Comanda_Comanda1_idx` (`Comanda_id` ASC) VISIBLE,
  INDEX `fk_Trabajador_has_Comanda_Trabajador1_idx` (`Trabajador_id` ASC) VISIBLE,
  CONSTRAINT `fk_Trabajador_has_Comanda_Trabajador1`
    FOREIGN KEY (`Trabajador_id`)
    REFERENCES `Trabajador` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trabajador_has_Comanda_Comanda1`
    FOREIGN KEY (`Comanda_id`)
    REFERENCES `Comanda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
