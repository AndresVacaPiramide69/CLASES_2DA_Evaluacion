-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.1.0 - MySQL Community Server - GPL
-- SO del servidor:              Linux
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para Prueba_select
CREATE DATABASE IF NOT EXISTS `Prueba_select` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Prueba_select`;

-- Volcando estructura para tabla Prueba_select.Alumno
CREATE TABLE IF NOT EXISTS `Alumno` (
  `id` int NOT NULL DEFAULT (0),
  `nombre` varchar(50) NOT NULL,
  `primer_apellido` varchar(50) NOT NULL,
  `segundo_apellido` varchar(50) NOT NULL,
  `nota_bd` double NOT NULL DEFAULT (0),
  `nota_prog` double NOT NULL,
  `nota_entornos` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla Prueba_select.Alumno: ~20 rows (aproximadamente)
INSERT INTO `Alumno` (`id`, `nombre`, `primer_apellido`, `segundo_apellido`, `nota_bd`, `nota_prog`, `nota_entornos`) VALUES
	(1, 'Juan', 'Gómez', 'Pérez', 6.2, 7.8, 8.5),
	(2, 'Ana', 'Martínez', 'Fernández', 3.8, 4.5, 4.2),
	(3, 'Carlos', 'Sánchez', 'López', 2.5, 3.2, 4),
	(4, 'Laura', 'López', 'García', 4.8, 3.6, 2.7),
	(5, 'David', 'Hernández', 'Ramírez', 4, 2.5, 3.8),
	(6, 'José', 'Pérez', 'González', 5, 4.2, 4.5),
	(7, 'Miguel', 'García', 'Martínez', 3, 3.7, 4.2),
	(8, 'Isabel', 'Fernández', 'Sánchez', 2.2, 4.5, 3),
	(9, 'Luis', 'Ruiz', 'Rodríguez', 4.5, 3, 4.8),
	(10, 'María', 'Ramírez', 'López', 3.5, 4.8, 2),
	(11, 'José', 'Martínez', 'Gómez', 4.5, 4.2, 4.5),
	(12, 'Sara', 'González', 'Hernández', 2, 3.3, 4.5),
	(13, 'Javier', 'Fernández', 'Sánchez', 5.8, 2.5, 3),
	(14, 'Carmen', 'López', 'Martínez', 6.5, 7, 5.5),
	(15, 'Alejandro', 'Ramírez', 'Sánchez', 4.2, 4.9, 3.7),
	(16, 'Natalia', 'Martínez', 'Ruiz', 3, 5.5, 4),
	(17, 'Ricardo', 'Sánchez', 'Gómez', 2.5, 3.8, 4.5),
	(18, 'Celia', 'Gómez', 'Fernández', 4, 2, 3.2),
	(19, 'Héctor', 'Ruiz', 'López', 5.5, 4.2, 3.5),
	(20, 'Marta', 'Fernández', 'López', 3.7, 4.5, 1.8);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
