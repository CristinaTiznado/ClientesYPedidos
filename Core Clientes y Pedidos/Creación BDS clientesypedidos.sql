-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema clientesypedidos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema clientesypedidos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `clientesypedidos` DEFAULT CHARACTER SET utf8 ;
USE `clientesypedidos` ;

-- -----------------------------------------------------
-- Table `clientesypedidos`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clientesypedidos`.`clientes` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(80) NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clientesypedidos`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clientesypedidos`.`pedidos` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `id_cliente` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `total` INT NOT NULL,
  PRIMARY KEY (`id_pedido`),
  INDEX `fk_pedidos_clientes_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_pedidos_clientes`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `clientesypedidos`.`clientes` (`id_cliente`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
