-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               10.4.22-MariaDB - mariadb.org binary distribution
-- Server Betriebssystem:        Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Exportiere Datenbank Struktur für ic_erp
DROP DATABASE IF EXISTS `ic_erp`;
CREATE DATABASE IF NOT EXISTS `ic_erp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci */;
USE `ic_erp`;

-- Exportiere Struktur von Tabelle ic_erp.ic_attribut_daten
DROP TABLE IF EXISTS `ic_attribut_daten`;
CREATE TABLE IF NOT EXISTS `ic_attribut_daten` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID_FIRMA` bigint(20) NOT NULL DEFAULT 0,
  `ATTRIBUT_NAME` varchar(255) COLLATE utf8mb4_german2_ci DEFAULT NULL,
  `ID_ATTRIBUT_DATENTYP` bigint(20) NOT NULL,
  `DATUM_ERSTELLT` timestamp NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`ID`),
  KEY `FK_ID_FIRMA.ATTRIBUT_DATEN_ID.FIRMA` (`ID_FIRMA`),
  KEY `FK_ID_ATTRIBUT_DATENTYP.ATTRIBUT_DATENTYP_ID_ATTRIBUT_DATENTYP` (`ID_ATTRIBUT_DATENTYP`),
  CONSTRAINT `FK_ID_ATTRIBUT_DATENTYP.ATTRIBUT_DATENTYP_ID_ATTRIBUT_DATENTYP` FOREIGN KEY (`ID_ATTRIBUT_DATENTYP`) REFERENCES `ic_attribut_datentyp` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ID_FIRMA.ATTRIBUT_DATEN_ID.FIRMA` FOREIGN KEY (`ID_FIRMA`) REFERENCES `ic_firma` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Exportiere Daten aus Tabelle ic_erp.ic_attribut_daten: ~2 rows (ungefähr)
DELETE FROM `ic_attribut_daten`;
INSERT INTO `ic_attribut_daten` (`ID`, `ID_FIRMA`, `ATTRIBUT_NAME`, `ID_ATTRIBUT_DATENTYP`, `DATUM_ERSTELLT`) VALUES
	(2, 1, 'FIRMENNAME', 1, '2023-01-04 23:00:00'),
	(3, 1, 'VORNAME', 1, '2023-01-04 23:00:00'),
	(4, 1, 'KUNDENNR', 2, '2023-01-04 23:00:00');

-- Exportiere Struktur von Tabelle ic_erp.ic_attribut_datentyp
DROP TABLE IF EXISTS `ic_attribut_datentyp`;
CREATE TABLE IF NOT EXISTS `ic_attribut_datentyp` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID_FIRMA` bigint(20) NOT NULL DEFAULT 0,
  `BEZEICHNUNG` varchar(255) COLLATE utf8mb4_german2_ci NOT NULL DEFAULT '0',
  `DATUM_ERSTELLUNG` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `FK_ID_FIRMA.ATTRIBUT_DATENTYP_ID.FIRMA` (`ID_FIRMA`),
  CONSTRAINT `FK_ID_FIRMA.ATTRIBUT_DATENTYP_ID.FIRMA` FOREIGN KEY (`ID_FIRMA`) REFERENCES `ic_firma` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Exportiere Daten aus Tabelle ic_erp.ic_attribut_datentyp: ~0 rows (ungefähr)
DELETE FROM `ic_attribut_datentyp`;
INSERT INTO `ic_attribut_datentyp` (`ID`, `ID_FIRMA`, `BEZEICHNUNG`, `DATUM_ERSTELLUNG`) VALUES
	(1, 1, 'VARCHAR2', '2023-01-05 11:47:33'),
	(2, 1, 'NUMBER', '2023-01-05 11:50:35');

-- Exportiere Struktur von Tabelle ic_erp.ic_firma
DROP TABLE IF EXISTS `ic_firma`;
CREATE TABLE IF NOT EXISTS `ic_firma` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BEZEICHNUNG` varchar(255) COLLATE utf8mb4_german2_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Exportiere Daten aus Tabelle ic_erp.ic_firma: ~0 rows (ungefähr)
DELETE FROM `ic_firma`;
INSERT INTO `ic_firma` (`ID`, `BEZEICHNUNG`) VALUES
	(1, 'IT-Christmann');

-- Exportiere Struktur von Tabelle ic_erp.ic_firma_daten
DROP TABLE IF EXISTS `ic_firma_daten`;
CREATE TABLE IF NOT EXISTS `ic_firma_daten` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID_FIRMA` bigint(20) DEFAULT 0,
  `ID_ATTRIBUT` bigint(20) DEFAULT 0,
  `WERT` varchar(1024) COLLATE utf8mb4_german2_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ID_FIRMA.FIRMA_DATEN_ID.FIRMA` (`ID_FIRMA`),
  KEY `FK_ID_ATTRIBUT.FIRMA_DATEN_ID.ATTRIBUT` (`ID_ATTRIBUT`),
  CONSTRAINT `FK_ID_ATTRIBUT.FIRMA_DATEN_ID.ATTRIBUT` FOREIGN KEY (`ID_ATTRIBUT`) REFERENCES `ic_attribut_daten` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ID_FIRMA.FIRMA_DATEN_ID.FIRMA` FOREIGN KEY (`ID_FIRMA`) REFERENCES `ic_firma` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Exportiere Daten aus Tabelle ic_erp.ic_firma_daten: ~0 rows (ungefähr)
DELETE FROM `ic_firma_daten`;
INSERT INTO `ic_firma_daten` (`ID`, `ID_FIRMA`, `ID_ATTRIBUT`, `WERT`) VALUES
	(1, 1, 2, 'IT-Christmann');

-- Exportiere Struktur von Tabelle ic_erp.ic_kunde
DROP TABLE IF EXISTS `ic_kunde`;
CREATE TABLE IF NOT EXISTS `ic_kunde` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID_FIRMA` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `FK_ID_FIRMA.KUNDE_ID.FIRMA` (`ID_FIRMA`),
  CONSTRAINT `FK_ID_FIRMA.KUNDE_ID.FIRMA` FOREIGN KEY (`ID_FIRMA`) REFERENCES `ic_firma` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Exportiere Daten aus Tabelle ic_erp.ic_kunde: ~0 rows (ungefähr)
DELETE FROM `ic_kunde`;
INSERT INTO `ic_kunde` (`ID`, `ID_FIRMA`) VALUES
	(1, 1);

-- Exportiere Struktur von Tabelle ic_erp.ic_kunde_daten
DROP TABLE IF EXISTS `ic_kunde_daten`;
CREATE TABLE IF NOT EXISTS `ic_kunde_daten` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID_KUNDE` bigint(20) DEFAULT 0,
  `ID_FIRMA` bigint(20) DEFAULT 0,
  `ID_ATTRIBUT` bigint(20) DEFAULT 0,
  `WERT` varchar(1024) COLLATE utf8mb4_german2_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ID_KUNDE.KUNDE_DATEN_ID.KUNDE` (`ID_KUNDE`),
  KEY `FK_ID_FIRMA.KUNDE_DATEN_ID.FIRMA` (`ID_FIRMA`),
  KEY `FK_ID_ATTRIBUT.KUNDE_DATEN_ID.ATTRIBUT_DATEN` (`ID_ATTRIBUT`),
  CONSTRAINT `FK_ID_ATTRIBUT.KUNDE_DATEN_ID.ATTRIBUT_DATEN` FOREIGN KEY (`ID_ATTRIBUT`) REFERENCES `ic_attribut_daten` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ID_FIRMA.KUNDE_DATEN_ID.FIRMA` FOREIGN KEY (`ID_FIRMA`) REFERENCES `ic_firma` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ID_KUNDE.KUNDE_DATEN_ID.KUNDE` FOREIGN KEY (`ID_KUNDE`) REFERENCES `ic_kunde` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Exportiere Daten aus Tabelle ic_erp.ic_kunde_daten: ~1 rows (ungefähr)
DELETE FROM `ic_kunde_daten`;
INSERT INTO `ic_kunde_daten` (`ID`, `ID_KUNDE`, `ID_FIRMA`, `ID_ATTRIBUT`, `WERT`) VALUES
	(2, 1, 1, 3, 'Jan-Lukas'),
	(3, 1, 1, 4, '2023001');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
