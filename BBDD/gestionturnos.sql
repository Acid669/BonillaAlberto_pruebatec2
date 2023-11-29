-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 29, 2023 at 08:59 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestionturnos`
--

-- --------------------------------------------------------

--
-- Table structure for table `ciudadano`
--

DROP TABLE IF EXISTS `ciudadano`;
CREATE TABLE IF NOT EXISTS `ciudadano` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `APELLIDO` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `DNI` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `NOMBRE` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `ciudadano`
--

INSERT INTO `ciudadano` (`ID`, `APELLIDO`, `DNI`, `NOMBRE`) VALUES
(1, 'Gomez Perez', '12345678A', 'Juan'),
(2, 'Rordiguez Lopez', '87654321B', 'Maria'),
(3, 'Fernandez Gomez', '23456789D', 'Roberto'),
(4, 'Sanchez Ramos', '34567890E', 'Laura'),
(5, 'Diaz Rodriguez', '78901234I', 'Lucia'),
(6, 'Torres Lopez', '90123456K', 'Isabel');

-- --------------------------------------------------------

--
-- Table structure for table `turno`
--

DROP TABLE IF EXISTS `turno`;
CREATE TABLE IF NOT EXISTS `turno` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `ESTADO` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `HORA` time(3) DEFAULT NULL,
  `ciudadano_id` bigint DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_TURNO_ciudadano_id` (`ciudadano_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `turno`
--

INSERT INTO `turno` (`ID`, `DESCRIPCION`, `ESTADO`, `FECHA`, `HORA`, `ciudadano_id`) VALUES
(1, 'Registro de Nacimiento', 'En espera', '2023-01-15', '08:30:00.000', 1),
(2, 'Registro de Matrimonio', 'Atendido', '2023-02-20', '09:15:00.000', 2),
(3, 'Registro de Matrimonio', 'Atendido', '2023-02-20', '09:15:00.000', 3),
(4, 'Rectificacion de Datos', 'En espera', '2023-05-12', '15:30:00.000', 4),
(5, 'Reconocimiento de Paternidad', 'Atendido', '2023-09-04', '08:45:00.000', 5),
(6, 'Cambio de Nombre', 'En espera', '2023-10-11', '12:30:00.000', 5),
(7, 'Registro de Nacimiento', 'En espera', '2023-11-15', '09:00:00.000', 6),
(8, 'Rectificacion de Datos', 'En espera', '2023-11-22', '11:30:00.000', 3),
(9, 'Rectificacion de Datos', 'En espera', '2023-02-20', '09:00:00.000', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
