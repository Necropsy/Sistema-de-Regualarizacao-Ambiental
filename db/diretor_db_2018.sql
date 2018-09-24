-- -----------------------------------------------------
-- Table `Zona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Zona` (
  `idZona` INT NOT NULL AUTO_INCREMENT,
  `nomeZona` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idZona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bairro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bairro` (
  `idBairro` INT NOT NULL AUTO_INCREMENT,
  `nomeBairro` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idBairro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Rua`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Rua` (
  `CEP` INT NOT NULL,
  `nomeRua` VARCHAR(150) NOT NULL,
  `Logradouro` VARCHAR(45) NOT NULL,
  `areaMínimaLote` DOUBLE NOT NULL,
  `testadaMínima` DOUBLE NOT NULL,
  `taxaDePermeabilizacao` DOUBLE NOT NULL,
  `taxaDeOcupacaoMax` DOUBLE NOT NULL,
  `numPavimentos` INT NOT NULL,
  `larguraCalcadaMin` DOUBLE NOT NULL,
  `afastFrontalMin` DOUBLE NOT NULL,
  `coefAproveitamento` DOUBLE NOT NULL,
  `Bairro_idBairro` INT NOT NULL,
  PRIMARY KEY (`CEP`),
  INDEX `fk_Rua_Bairro1_idx` (`Bairro_idBairro` ASC) VISIBLE,
  CONSTRAINT `fk_Rua_Bairro1`
    FOREIGN KEY (`Bairro_idBairro`)
    REFERENCES `mydb`.`Bairro` (`idBairro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Zona_has_Bairro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Zona_has_Bairro` (
  `Zona_idZona` INT NOT NULL,
  `Bairro_idBairro` INT NOT NULL,
  PRIMARY KEY (`Zona_idZona`, `Bairro_idBairro`),
  INDEX `fk_Zona_has_Bairro_Bairro1_idx` (`Bairro_idBairro` ASC) VISIBLE,
  INDEX `fk_Zona_has_Bairro_Zona_idx` (`Zona_idZona` ASC) VISIBLE,
  CONSTRAINT `fk_Zona_has_Bairro_Zona`
    FOREIGN KEY (`Zona_idZona`)
    REFERENCES `mydb`.`Zona` (`idZona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Zona_has_Bairro_Bairro1`
    FOREIGN KEY (`Bairro_idBairro`)
    REFERENCES `mydb`.`Bairro` (`idBairro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

