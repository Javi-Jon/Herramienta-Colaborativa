-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-01-2018 a las 17:35:14
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bodegas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodegas`
--

CREATE TABLE `bodegas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `provincia` varchar(30) NOT NULL,
  `ciudad` varchar(30) NOT NULL,
  `calle` varchar(30) NOT NULL,
  `portal` int(3) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `contacto` varchar(50) NOT NULL,
  `fundacion` date NOT NULL,
  `restaurante` int(1) NOT NULL,
  `hotel` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bodegas`
--

INSERT INTO `bodegas` (`id`, `nombre`, `provincia`, `ciudad`, `calle`, `portal`, `email`, `telefono`, `contacto`, `fundacion`, `restaurante`, `hotel`) VALUES
(1, 'vinos javier', 'araba', 'vitoria', 'avenida', 12, 'jav@fgm.com', '1234512', 'javier', '0000-00-00', 1, 1),
(2, 'vinos Manolo', 'Avila', 'avila sity', 'avenida', 15, 'vinosmanolo@gmai.cmo', '2134567', 'manolo', '0000-00-00', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vinos`
--

CREATE TABLE `vinos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `ano` int(5) NOT NULL,
  `tipo` int(1) NOT NULL,
  `porcentaje` int(3) NOT NULL,
  `bodega` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vinos`
--

INSERT INTO `vinos` (`id`, `nombre`, `descripcion`, `ano`, `tipo`, `porcentaje`, `bodega`) VALUES
(1, 'vino rojo', 'vino rojito muy bueno                     \r\n                                         \r\n                                         \r\n                                         \r\n                                         \r\n                    ', 1572, 1, 22, 1),
(4, 'vino blanco', 'vino vasdas                     \r\n                                         \r\n                                         \r\n                                         \r\n                                         \r\n                                         \r\n ', 1234, 3, 24, 1),
(7, 'vino paco', 'vino tinto muy rico                                        \r\n                                         \r\n                                         \r\n                                         \r\n                                         \r\n                 ', 145, 1, 25, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bodegas`
--
ALTER TABLE `bodegas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombreBodega` (`nombre`),
  ADD UNIQUE KEY `emailUnico` (`email`),
  ADD UNIQUE KEY `telefonoUnico` (`telefono`);

--
-- Indices de la tabla `vinos`
--
ALTER TABLE `vinos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bodegaInd` (`bodega`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bodegas`
--
ALTER TABLE `bodegas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `vinos`
--
ALTER TABLE `vinos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `vinos`
--
ALTER TABLE `vinos`
  ADD CONSTRAINT `vinos_ibfk_1` FOREIGN KEY (`bodega`) REFERENCES `bodegas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
