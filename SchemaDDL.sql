CREATE SCHEMA IF NOT EXISTS `tennisScorecardPro`;
USE `tennisScorecardPro` ;

-- -----------------------------------------------------
-- Table `tennisScorecardPro`.`Courts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tennisScorecardPro`.`Courts` (
  `courtID` INT(11) NOT NULL AUTO_INCREMENT,
  `courtName` VARCHAR(45) NOT NULL,
  `surfaceMaterial` VARCHAR(45) NULL DEFAULT NULL,
  `surfaceColor` VARCHAR(45) NULL DEFAULT NULL,
  `size` VARCHAR(45) NULL DEFAULT NULL,
  `locationLong` FLOAT(10,6) NOT NULL,
  `locationLat` FLOAT(10,6) NOT NULL,
  PRIMARY KEY (`courtID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `tennisScorecardPro`.`Players`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tennisScorecardPro`.`Players` (
  `playerID` INT(11) NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(45) NOT NULL,
  `fName` VARCHAR(45) NULL DEFAULT NULL,
  `lName` VARCHAR(45) NULL DEFAULT NULL,
  `gender` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`playerID`),
  UNIQUE INDEX `userName_UNIQUE` (`userName` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `tennisScorecardPro`.`Games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tennisScorecardPro`.`Games` (
  `gameID` INT(11) NOT NULL AUTO_INCREMENT,
  `numPointsWonByA` INT(11) NOT NULL,
  `numPointsWonByB` INT(11) NOT NULL,
  `playerA` INT(11) NOT NULL,
  `playerB` INT(11) NOT NULL,
  `court` INT(11) NULL DEFAULT NULL,
  `winningPlayer` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`gameID`),
  INDEX `teamA_idx` (`playerA` ASC),
  INDEX `teamB_idx` (`playerB` ASC),
  INDEX `court_idx` (`court` ASC),
  INDEX `playerB_idx` (`playerB` ASC),
  INDEX `winningPlayer_idx` (`winningPlayer` ASC),
  CONSTRAINT `winningPlayer`
    FOREIGN KEY (`winningPlayer`)
    REFERENCES `tennisScorecardPro`.`Players` (`playerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `court`
    FOREIGN KEY (`court`)
    REFERENCES `tennisScorecardPro`.`Courts` (`courtID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `playerA`
    FOREIGN KEY (`playerA`)
    REFERENCES `tennisScorecardPro`.`Players` (`playerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `playerB`
    FOREIGN KEY (`playerB`)
    REFERENCES `tennisScorecardPro`.`Players` (`playerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 61
DEFAULT CHARACTER SET = latin1;

-- -----------------------------------------------------
-- Table `tennisScorecardPro`.`GamesWon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tennisScorecardPro`.`GamesWon` (
  `gamesWonID` INT(11) NOT NULL AUTO_INCREMENT,
  `gamesWonGameID` INT(11) NOT NULL,
  `gamesWonPlayerID` INT(11) NOT NULL,
  PRIMARY KEY (`gamesWonID`),
  INDEX `gamesWonGameID_idx` (`gamesWonGameID` ASC),
  INDEX `gamesWonPlayerID_idx` (`gamesWonPlayerID` ASC),
  CONSTRAINT `gamesWonGameID`
    FOREIGN KEY (`gamesWonGameID`)
    REFERENCES `tennisScorecardPro`.`Games` (`gameID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `gamesWonPlayerID`
    FOREIGN KEY (`gamesWonPlayerID`)
    REFERENCES `tennisScorecardPro`.`Players` (`playerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `tennisScorecardPro`.`Serves`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tennisScorecardPro`.`Serves` (
  `serveID` INT(11) NOT NULL AUTO_INCREMENT,
  `speed` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`serveID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `tennisScorecardPro`.`PlayerServe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tennisScorecardPro`.`PlayerServe` (
  `playerServePlayerID` INT(11) NOT NULL,
  `playerServeServeID` INT(11) NOT NULL,
  PRIMARY KEY (`playerServePlayerID`, `playerServeServeID`),
  INDEX `playerServeServeID_idx` (`playerServeServeID` ASC),
  CONSTRAINT `playerServePlayerID`
    FOREIGN KEY (`playerServePlayerID`)
    REFERENCES `tennisScorecardPro`.`Players` (`playerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `playerServeServeID`
    FOREIGN KEY (`playerServeServeID`)
    REFERENCES `tennisScorecardPro`.`Serves` (`serveID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
