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


-- Volcando estructura de base de datos para Instituto
CREATE DATABASE IF NOT EXISTS `Instituto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Instituto`;

-- Volcando estructura para tabla Instituto.Curso
CREATE TABLE IF NOT EXISTS `Curso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `curso` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Índice 2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla Instituto.Curso: ~6 rows (aproximadamente)
INSERT IGNORE INTO `Curso` (`id`, `curso`) VALUES
	(1, '2020-2021'),
	(2, '2021-2022'),
	(3, '2022-2023'),
	(4, '2019-2020'),
	(5, '2018-2019'),
	(6, '2023-2024');

-- Volcando estructura para tabla Instituto.Departamento
CREATE TABLE IF NOT EXISTS `Departamento` (
  `codigo` int NOT NULL,
  `nombre` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla Instituto.Departamento: ~6 rows (aproximadamente)
INSERT IGNORE INTO `Departamento` (`codigo`, `nombre`) VALUES
	(48, 'Fol'),
	(100, 'Proyectos de edificación'),
	(158, 'Renovables'),
	(358, 'Electricidad'),
	(1234, 'Informática'),
	(1254, 'Inglés');

-- Volcando estructura para tabla Instituto.Estudiante
CREATE TABLE IF NOT EXISTS `Estudiante` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `edad` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla Instituto.Estudiante: ~14 rows (aproximadamente)
INSERT IGNORE INTO `Estudiante` (`id`, `nombre`, `edad`) VALUES
	(1, 'Javi', 18),
	(2, 'María', 25),
	(3, 'Pepe', 48),
	(4, 'Juan', 64),
	(5, 'Mario', 54),
	(6, 'Sonsoles', 16),
	(7, 'Erica', 18),
	(8, 'Sonia', 29),
	(9, 'Inés', 35),
	(10, 'Sergio', 39),
	(11, 'Eduardo', 16),
	(12, 'Pablo', 17),
	(13, 'Eva', 24),
	(14, 'Anabel', 29);

-- Volcando estructura para tabla Instituto.Estudiante_Modulo_Profesional
CREATE TABLE IF NOT EXISTS `Estudiante_Modulo_Profesional` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_estudiante` int NOT NULL DEFAULT '0',
  `fk_modulo_profesional` int NOT NULL DEFAULT '0',
  `fk_curso` int NOT NULL,
  `nota_final` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Índice 5` (`fk_estudiante`,`fk_modulo_profesional`,`fk_curso`),
  KEY `FK_Estudiante_Modulo_Profesional_Modulo_Profesional` (`fk_modulo_profesional`),
  KEY `FK_Estudiante_Modulo_Profesional_Curso` (`fk_curso`),
  CONSTRAINT `FK_Estudiante_Modulo_Profesional_Curso` FOREIGN KEY (`fk_curso`) REFERENCES `Curso` (`id`),
  CONSTRAINT `FK_Estudiante_Modulo_Profesional_Estudiante` FOREIGN KEY (`fk_estudiante`) REFERENCES `Estudiante` (`id`),
  CONSTRAINT `FK_Estudiante_Modulo_Profesional_Modulo_Profesional` FOREIGN KEY (`fk_modulo_profesional`) REFERENCES `Modulo_Profesional` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla Instituto.Estudiante_Modulo_Profesional: ~27 rows (aproximadamente)
INSERT IGNORE INTO `Estudiante_Modulo_Profesional` (`id`, `fk_estudiante`, `fk_modulo_profesional`, `fk_curso`, `nota_final`) VALUES
	(1, 1, 484, 2, 8),
	(2, 1, 483, 1, 7),
	(3, 1, 485, 1, 5),
	(4, 2, 15, 5, 4),
	(5, 2, 15, 4, 3),
	(6, 2, 56, 5, 5),
	(7, 2, 57, 4, 4),
	(8, 2, 57, 5, 6),
	(9, 3, 484, 2, 2),
	(10, 3, 484, 3, 4),
	(11, 3, 484, 4, 5),
	(12, 4, 57, 6, NULL),
	(13, 4, 58, 6, NULL),
	(14, 4, 56, 6, NULL),
	(15, 5, 484, 4, 9),
	(16, 5, 487, 4, 10),
	(17, 5, 488, 4, 9),
	(18, 5, 485, 4, 8),
	(19, 5, 483, 4, 9),
	(20, 6, 15, 6, NULL),
	(21, 6, 125, 6, NULL),
	(22, 7, 57, 6, NULL),
	(23, 8, 15, 3, 7),
	(24, 8, 125, 3, 7),
	(25, 9, 484, 1, 6),
	(26, 9, 487, 1, 6),
	(27, 9, 485, 1, 4);

-- Volcando estructura para tabla Instituto.Modulo_Profesional
CREATE TABLE IF NOT EXISTS `Modulo_Profesional` (
  `codigo` int NOT NULL,
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `numero_horas` int NOT NULL DEFAULT (0),
  `numero_creditos` int NOT NULL,
  `fk_departamento` int DEFAULT NULL,
  `fk_docente` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_Modulo_Profesional_Departamento` (`fk_departamento`),
  KEY `FK_Modulo_Profesional_Profesor` (`fk_docente`),
  CONSTRAINT `FK_Modulo_Profesional_Departamento` FOREIGN KEY (`fk_departamento`) REFERENCES `Departamento` (`codigo`),
  CONSTRAINT `FK_Modulo_Profesional_Profesor` FOREIGN KEY (`fk_docente`) REFERENCES `Profesor` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla Instituto.Modulo_Profesional: ~10 rows (aproximadamente)
INSERT IGNORE INTO `Modulo_Profesional` (`codigo`, `nombre`, `numero_horas`, `numero_creditos`, `fk_departamento`, `fk_docente`) VALUES
	(15, 'Engergía solar', 160, 10, 158, '7842'),
	(56, 'Estructuras de construcción', 256, 10, 100, '7842'),
	(57, 'Representaciones de construcción', 96, 10, 100, '7842'),
	(58, 'Planificación de construcción', 150, 10, 100, '7842'),
	(125, 'Matenimiento eólico', 256, 10, 158, '5846'),
	(483, 'Sistemas informáticos', 160, 10, 1234, '4561'),
	(484, 'Bases de datos', 192, 10, 1234, '1854'),
	(485, 'Programación', 256, 10, 1234, '4561'),
	(487, 'Entornos de desarrollo', 96, 10, 1234, '1854'),
	(488, 'Lenguajes de marcas', 160, 10, 1234, '1854');

-- Volcando estructura para tabla Instituto.Profesor
CREATE TABLE IF NOT EXISTS `Profesor` (
  `dni` varchar(9) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `primer_apellido` varchar(50) NOT NULL,
  `segundo_apellido` varchar(50) DEFAULT NULL,
  `codigo_departamento` int NOT NULL,
  PRIMARY KEY (`dni`),
  KEY `FK_Profesor_Departamento` (`codigo_departamento`),
  CONSTRAINT `FK_Profesor_Departamento` FOREIGN KEY (`codigo_departamento`) REFERENCES `Departamento` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla Instituto.Profesor: ~4 rows (aproximadamente)
INSERT IGNORE INTO `Profesor` (`dni`, `nombre`, `primer_apellido`, `segundo_apellido`, `codigo_departamento`) VALUES
	('1854', 'Javi', 'Fuertes', 'Lat', 1234),
	('4561', 'Clara', 'Villuendas', 'Tortajada', 1234),
	('5846', 'Pablo', 'Sanz', NULL, 1254),
	('7842', 'Erica', 'Allueva', NULL, 358);

-- Volcando estructura para tabla Instituto.Tarjeta
CREATE TABLE IF NOT EXISTS `Tarjeta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_estudiante` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Índice 3` (`fk_estudiante`),
  CONSTRAINT `FK_Tarjeta_Estudiante` FOREIGN KEY (`fk_estudiante`) REFERENCES `Estudiante` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla Instituto.Tarjeta: ~3 rows (aproximadamente)
INSERT IGNORE INTO `Tarjeta` (`id`, `fk_estudiante`) VALUES
	(300, 2),
	(301, 5),
	(302, 10);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
