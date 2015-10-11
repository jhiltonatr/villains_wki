-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-10-2015 a las 17:56:50
-- Versión del servidor: 5.5.36
-- Versión de PHP: 5.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `villains`
--
CREATE DATABASE IF NOT EXISTS `villains` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `villains`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `villains`
--

CREATE TABLE IF NOT EXISTS `villains` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del villano',
  `dsname` varchar(150) NOT NULL COMMENT 'Nombre del villano',
  `dsprofile` varchar(1000) NOT NULL COMMENT 'Descripción e historia del personaje',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla de villanos' AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `villains`
--

INSERT INTO `villains` (`id`, `dsname`, `dsprofile`) VALUES
(1, 'Loki', 'Thor''s villain'),
(2, 'Dr Doom', 'Villain from Fantastic 4'),
(3, 'Red Hulk', 'Villain from Hulk'),
(4, 'Hulk', 'Not really a villain, but he has kicked a lot of superheros'),
(5, 'Magneto', 'We all know this one'),
(6, 'Jules Winnfield', '<img src="http://goo.gl/B9XoGk" />');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
