-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Employee`------------------------------
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Employee` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Employee` (
  `idEmployee` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Surname` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Role` ENUM('Sales', 'Guide', 'Accountant') NULL,
  `Salary` DECIMAL NULL,
  PRIMARY KEY (`idEmployee`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sales`---------------------------------
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Sales` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Sales` (
  `idSales` INT NOT NULL,
  `Employee_idEmployee` INT NOT NULL,
  PRIMARY KEY (`idSales`, `Employee_idEmployee`),
  INDEX `fk_Sales_Employee1_idx` (`Employee_idEmployee` ASC) VISIBLE,
  CONSTRAINT `fk_Sales_Employee1`
    FOREIGN KEY (`Employee_idEmployee`)
    REFERENCES `mydb`.`Employee` (`idEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Guide`---------------------------------
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Guide` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Guide` (
  `idGuide` INT NOT NULL,
  `Employee_idEmployee` INT NOT NULL,
  PRIMARY KEY (`idGuide`, `Employee_idEmployee`),
  INDEX `fk_Guide_Employee1_idx` (`Employee_idEmployee` ASC) VISIBLE,
  CONSTRAINT `fk_Guide_Employee1`
    FOREIGN KEY (`Employee_idEmployee`)
    REFERENCES `mydb`.`Employee` (`idEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tour`----------------------------------
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Tour` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Tour` (
  `idTour` INT NOT NULL,
  `Tour Name` VARCHAR(45) NULL,
  `status` VARCHAR(45) NULL,
  `departure_date` DATE NULL,
  `return_date` DATE NULL,
  `max_seats` INT NULL,
  `cost_per_person` DECIMAL NULL,
  `transport_mode` ENUM('Bus', 'Plane', 'Ship') NULL,
  `Sales_idSales` INT NOT NULL,
  `Guide_idGuide` INT NOT NULL,
  PRIMARY KEY (`idTour`, `Sales_idSales`, `Guide_idGuide`),
  INDEX `fk_Tour_Sales1_idx` (`Sales_idSales` ASC) VISIBLE,
  INDEX `fk_Tour_Guide1_idx` (`Guide_idGuide` ASC) VISIBLE,
  CONSTRAINT `fk_Tour_Sales1`
    FOREIGN KEY (`Sales_idSales`)
    REFERENCES `mydb`.`Sales` (`idSales`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tour_Guide1`
    FOREIGN KEY (`Guide_idGuide`)
    REFERENCES `mydb`.`Guide` (`idGuide`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Destination`---------------------------
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Destination` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Destination` (
  `idDestination` INT NOT NULL,
  `Destination Name` VARCHAR(45) NULL,
  `Destination Description` TEXT NULL,
  `Language` VARCHAR(45) NULL,
  PRIMARY KEY (`idDestination`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Category`------------------------------
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Category` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Category` (
  `idCategory` INT NOT NULL,
  `Category_Name` ENUM('Winter', 'Romantic', 'Summer') NULL,
  PRIMARY KEY (`idCategory`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customer`------------------------------
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Customer` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `idCostumer` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Surname` VARCHAR(45) NULL,
  `Adress` INT NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`idCostumer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Accountant`----------------------------
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Accountant` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Accountant` (
  `idAccountant` INT NOT NULL,
  `Employee_idEmployee` INT NOT NULL,
  PRIMARY KEY (`idAccountant`, `Employee_idEmployee`),
  INDEX `fk_table1_Employee1_idx` (`Employee_idEmployee` ASC) VISIBLE,
  CONSTRAINT `fk_table1_Employee1`
    FOREIGN KEY (`Employee_idEmployee`)
    REFERENCES `mydb`.`Employee` (`idEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Booking`-------------------------------
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Booking` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Booking` (
  `idBooking` INT NOT NULL,
  `Seat Number` VARCHAR(45) NULL,
  `Customer_idCostumer` INT NOT NULL,
  `Tour_idTour` INT NOT NULL,
  `Accountant_idAccountant` INT NOT NULL,
  PRIMARY KEY (`idBooking`, `Customer_idCostumer`, `Tour_idTour`, `Accountant_idAccountant`),
  INDEX `fk_Booking_Customer1_idx` (`Customer_idCostumer` ASC) VISIBLE,
  INDEX `fk_Booking_Tour1_idx` (`Tour_idTour` ASC) VISIBLE,
  INDEX `fk_Booking_Accountant1_idx` (`Accountant_idAccountant` ASC) VISIBLE,
  CONSTRAINT `fk_Booking_Customer1`
    FOREIGN KEY (`Customer_idCostumer`)
    REFERENCES `mydb`.`Customer` (`idCostumer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Booking_Tour1`
    FOREIGN KEY (`Tour_idTour`)
    REFERENCES `mydb`.`Tour` (`idTour`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Booking_Accountant1`
    FOREIGN KEY (`Accountant_idAccountant`)
    REFERENCES `mydb`.`Accountant` (`idAccountant`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Language`------------------------------
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Language` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Language` (
  `idLanguage` INT NOT NULL,
  `Language Name` VARCHAR(45) NULL,
  PRIMARY KEY (`idLanguage`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tour_has_Category`---------------------
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Tour_has_Category` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Tour_has_Category` (
  `Tour_idTour` INT NOT NULL,
  `Category_idCategory` INT NOT NULL,
  PRIMARY KEY (`Tour_idTour`, `Category_idCategory`),
  INDEX `fk_Tour_has_Category_Category1_idx` (`Category_idCategory` ASC) VISIBLE,
  INDEX `fk_Tour_has_Category_Tour_idx` (`Tour_idTour` ASC) VISIBLE,
  CONSTRAINT `fk_Tour_has_Category_Tour`
    FOREIGN KEY (`Tour_idTour`)
    REFERENCES `mydb`.`Tour` (`idTour`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tour_has_Category_Category1`
    FOREIGN KEY (`Category_idCategory`)
    REFERENCES `mydb`.`Category` (`idCategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tour_has_Destination`------------------
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Tour_has_Destination` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Tour_has_Destination` (
  `Tour_idTour` INT NOT NULL,
  `Destination_idDestination` INT NOT NULL,
  PRIMARY KEY (`Tour_idTour`, `Destination_idDestination`),
  INDEX `fk_Tour_has_Destination_Destination1_idx` (`Destination_idDestination` ASC) VISIBLE,
  INDEX `fk_Tour_has_Destination_Tour1_idx` (`Tour_idTour` ASC) VISIBLE,
  CONSTRAINT `fk_Tour_has_Destination_Tour1`
    FOREIGN KEY (`Tour_idTour`)
    REFERENCES `mydb`.`Tour` (`idTour`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tour_has_Destination_Destination1`
    FOREIGN KEY (`Destination_idDestination`)
    REFERENCES `mydb`.`Destination` (`idDestination`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Guide_has_Language`--------------------
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Guide_has_Language` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Guide_has_Language` (
  `Guide_idGuide` INT NOT NULL,
  `Guide_Employee_idEmployee` INT NOT NULL,
  `Language_idLanguage` INT NOT NULL,
  PRIMARY KEY (`Guide_idGuide`, `Guide_Employee_idEmployee`, `Language_idLanguage`),
  INDEX `fk_Guide_has_Language_Language1_idx` (`Language_idLanguage` ASC) VISIBLE,
  INDEX `fk_Guide_has_Language_Guide1_idx` (`Guide_idGuide` ASC, `Guide_Employee_idEmployee` ASC) VISIBLE,
  CONSTRAINT `fk_Guide_has_Language_Guide1`
    FOREIGN KEY (`Guide_idGuide` , `Guide_Employee_idEmployee`)
    REFERENCES `mydb`.`Guide` (`idGuide` , `Employee_idEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Guide_has_Language_Language1`
    FOREIGN KEY (`Language_idLanguage`)
    REFERENCES `mydb`.`Language` (`idLanguage`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
