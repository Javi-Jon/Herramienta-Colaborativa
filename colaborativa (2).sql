-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-01-2018 a las 13:55:37
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `colaborativa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivos`
--

CREATE TABLE `archivos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `ruta` varchar(200) NOT NULL,
  `proyecto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion`
--

CREATE TABLE `asignacion` (
  `id` int(11) NOT NULL,
  `idtarea` int(11) NOT NULL,
  `iduser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asignacion`
--

INSERT INTO `asignacion` (`id`, `idtarea`, `iduser`) VALUES
(26, 66, 3),
(27, 66, 4),
(28, 67, 3),
(29, 68, 3),
(30, 68, 4),
(33, 71, 3),
(34, 71, 4),
(35, 73, 3),
(36, 73, 4),
(37, 76, 3),
(38, 76, 4),
(39, 78, 3),
(40, 78, 4),
(45, 82, 3),
(46, 82, 4),
(47, 83, 3),
(48, 84, 3),
(49, 87, 3),
(50, 88, 3),
(51, 89, 3),
(52, 91, 3),
(53, 91, 4),
(55, 93, 3),
(56, 94, 3),
(57, 94, 4),
(58, 95, 3),
(60, 97, 3),
(61, 99, 3),
(63, 101, 3),
(64, 102, 3),
(65, 102, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `id` int(11) NOT NULL,
  `envia` int(11) NOT NULL,
  `mensaje` varchar(250) NOT NULL,
  `recibe` int(11) NOT NULL,
  `hora` datetime NOT NULL,
  `estado` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muro`
--

CREATE TABLE `muro` (
  `id` int(11) NOT NULL,
  `mensaje` varchar(250) NOT NULL,
  `hora` datetime NOT NULL,
  `proyecto` int(11) NOT NULL,
  `autor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `muro`
--

INSERT INTO `muro` (`id`, `mensaje`, `hora`, `proyecto`, `autor`) VALUES
(1, 'hola a todos ', '0000-00-00 00:00:00', 167, 4),
(2, 'hey que pasa', '0000-00-00 00:00:00', 167, 3),
(3, 'sdaasda', '2018-01-22 01:55:11', 167, 3),
(4, 'sdaasda', '2018-01-22 01:55:29', 167, 3),
(5, 'dasdad', '2018-01-22 02:00:35', 167, 3),
(6, 'asdasd', '2018-01-22 02:03:33', 169, 3),
(7, 'dasda', '2018-01-23 08:42:01', 169, 3),
(8, 'dasda', '2018-01-23 08:53:28', 172, 3),
(9, 'oqwid', '2018-01-23 08:59:06', 172, 3),
(10, 'sdf', '2018-01-23 09:32:37', 167, 3),
(11, 'asdasd', '2018-01-23 09:52:21', 176, 3),
(12, 'sdgfsd', '2018-01-23 12:10:24', 176, 3),
(13, 'zsdas', '2018-01-23 12:10:35', 176, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participaciones`
--

CREATE TABLE `participaciones` (
  `id` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idproyecto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `participaciones`
--

INSERT INTO `participaciones` (`id`, `idusuario`, `idproyecto`) VALUES
(1, 3, 167),
(2, 3, 169),
(3, 3, 170),
(4, 3, 171),
(5, 3, 172),
(6, 4, 172),
(7, 3, 173),
(8, 4, 173),
(9, 3, 174),
(10, 4, 174),
(11, 3, 176),
(12, 3, 177),
(13, 3, 178);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `creacion` date NOT NULL,
  `creador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`id`, `nombre`, `descripcion`, `creacion`, `creador`) VALUES
(114, 'asda', 'asd', '2018-01-16', 3),
(115, 'adsd', 'asdas', '2018-01-16', 3),
(116, 'asdas', 'sadas', '2018-01-16', 3),
(117, 'ASDa', 'sdas', '2018-01-16', 3),
(118, 'dasd', 'adas', '2018-01-16', 3),
(119, 'asd', 'asdas', '2018-01-16', 3),
(120, 'dasd', 'asdas', '2018-01-16', 3),
(121, 'dasd', 'asdas', '2018-01-16', 3),
(122, 'asd', 'asd', '2018-01-16', 3),
(123, 'asd', 'asda', '2018-01-16', 3),
(124, 'adsd', 'asdas', '2018-01-16', 3),
(125, 'sdv', 'sdf', '2018-01-16', 3),
(126, 'dasdsdasad', 'asdas', '2018-01-16', 3),
(127, 'asda', 'asdas', '2018-01-16', 3),
(128, 'asdas', 'asdas', '2018-01-16', 3),
(129, 'asdas', 'dasdasd', '2018-01-16', 3),
(130, 'dasd', 'asdas', '2018-01-16', 3),
(131, 'asda', 'asdasd', '2018-01-16', 3),
(132, 'sad', 'asdasd', '2018-01-16', 3),
(133, 'dasdas', 'asdasd', '2018-01-16', 3),
(134, 'asdas', 'asdas', '2018-01-16', 3),
(135, 'asd', 'asdas', '2018-01-16', 3),
(136, 'asdas', 'asdas', '2018-01-16', 3),
(137, 'adds', 'asdas', '2018-01-16', 3),
(138, 'asdas', 'asdas', '2018-01-16', 3),
(139, 'asdsad', 'asdas', '2018-01-16', 3),
(140, 'asdsa', 'asdasd', '2018-01-16', 3),
(141, 'asda', 'dasda', '2018-01-16', 3),
(142, 'asdas', 'asdas', '2018-01-16', 3),
(143, 'asdas', 'asdas', '2018-01-16', 3),
(144, 'asdas', 'asdas', '2018-01-16', 3),
(145, 'adsd', 'asdas', '2018-01-16', 3),
(146, 'asda', 'asdasd', '2018-01-16', 3),
(147, 'sadda', 'asda', '2018-01-16', 3),
(148, 'asda', 'asdad', '2018-01-16', 3),
(149, 'asdas', 'asdasd', '2018-01-16', 3),
(150, 'asdsad', 'asdas', '2018-01-16', 3),
(151, 'dasdsa', 'asddd', '2018-01-16', 3),
(152, 'asdsa', 'asdasd', '2018-01-16', 3),
(153, 'asda', 'asda', '2018-01-16', 3),
(154, 'asdas', 'asda', '2018-01-16', 3),
(155, 'asdas', 'asdas', '2018-01-16', 3),
(156, 'asdas', 'asdas', '2018-01-16', 3),
(157, 'asdsa', 'asdas', '2018-01-16', 3),
(158, 'asdd', 'asdas', '2018-01-16', 3),
(159, 'ASD', 'dasd', '2018-01-16', 3),
(160, 'dasdsdasad', 'dasd', '2018-01-16', 3),
(161, 'asdas', 'asdasd', '2018-01-16', 3),
(162, 'sada', 'sadas', '2018-01-16', 3),
(163, 'dasdsa', 'asdas', '2018-01-16', 3),
(164, 'adsa', 'asd', '2018-01-16', 3),
(165, 'asda', 'asdas', '2018-01-16', 3),
(166, 'asdas', 'asdas', '2018-01-16', 3),
(167, 'zsf dzd', 'zdfdzx', '2018-01-18', 3),
(168, 'ouasdnc', 'asdad', '2018-01-18', 3),
(169, 'asda', 'asdas', '2018-01-19', 3),
(170, 'sadas', 'asdadas', '2018-01-19', 3),
(171, 'sadas', 'asdasd', '2018-01-19', 3),
(172, 'asdas', 'asdasd', '2018-01-19', 3),
(173, 'dasda', 'asdasd', '2018-01-22', 3),
(174, 'jasuas', 'dasd', '2018-01-22', 3),
(175, 'fsd', 'sdf', '2018-01-22', 3),
(176, 'askhjbdasndasklnd', 'sdaoidassa+sapjdsaiod sdaoidassa+sapjdsaiod', '2018-01-23', 3),
(177, 'sadcas', 'asdasa', '2018-01-23', 3),
(178, 'asdas', 'dasda', '2018-01-23', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `descripcion` varchar(140) NOT NULL,
  `proyecto` int(11) NOT NULL,
  `estado` int(1) NOT NULL,
  `dificultad` int(1) NOT NULL,
  `plazo` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id`, `titulo`, `descripcion`, `proyecto`, `estado`, `dificultad`, `plazo`) VALUES
(63, '', '', 173, 0, 1, '0000-00-00'),
(66, 'dasdas', 'asdas', 173, 1, 1, '2018-01-30'),
(67, 'sdsa', 'asdasd', 173, 1, 1, '2018-01-19'),
(68, 'asdas', 'dasad', 173, 1, 2, '2018-01-25'),
(70, '', '', 173, 0, 1, '0000-00-00'),
(71, 'dasdsa', 'dasd', 173, 1, 2, '2018-01-31'),
(72, '', '', 173, 0, 1, '0000-00-00'),
(73, 'dsad', 'asdas', 173, 1, 2, '0000-00-00'),
(74, 'dasdas', 'dsaas', 173, 0, 3, '2018-01-18'),
(75, '', '', 173, 0, 1, '0000-00-00'),
(76, '', '', 173, 1, 1, '0000-00-00'),
(77, 'asdd', 'asdas', 173, 0, 2, '2018-01-24'),
(78, 'gyuyf', 'ouhiugq', 173, 1, 1, '2018-01-26'),
(80, '', '', 173, 0, 1, '0000-00-00'),
(82, 'dasda', 'sadas', 173, 1, 3, '2018-01-19'),
(83, 'saa', 'asdas', 167, 1, 1, '2018-01-24'),
(84, 'asda', 'asdas', 167, 1, 1, '2018-01-26'),
(85, 'asdsa', 'asdas', 167, 0, 1, '2018-01-25'),
(86, 'dasd', 'dasd', 167, 0, 1, '2018-01-26'),
(87, 'asdsa', 'adasds', 167, 1, 1, '2018-01-30'),
(88, 'dasd', 'asdas', 167, 1, 1, '2018-01-24'),
(89, 'asdasd', 'asdsa', 167, 0, 1, '2018-01-25'),
(90, '', '', 172, 0, 1, '0000-00-00'),
(91, 'asdAS', 'ASDAS', 172, 1, 1, '2018-01-25'),
(93, 'dasd', 'asdas', 169, 1, 1, '2018-01-25'),
(94, 'asdasik', 'oiajsda', 172, 1, 1, '2018-01-24'),
(95, 'dasdas', 'asdas', 169, 1, 1, '2018-01-31'),
(97, 'dasd', 'dasda', 176, 1, 1, '2018-01-19'),
(98, 'asdasd', 'asdas', 176, 0, 1, '2018-01-19'),
(99, 'dszd', 'sad', 177, 1, 1, '2018-01-17'),
(101, 'asdasd', 'adsdas', 173, 0, 1, '2018-01-24'),
(102, 'sdfsd', 'dasdasd', 173, 0, 1, '2018-01-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tipo` int(1) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `tipo`, `fullname`, `correo`) VALUES
(3, 'pepeg', '$2y$10$VrEH4neKTj2PzgUM2cOm8ONrDTJB5S7jtIP6OEp7/jq6o.rc5z5we', 0, 'pepe', 'javiermdg998@gmail.com'),
(4, 'juan', '$2y$10$Bgfp2XZfCKj.brBOqNk98Oc98B4IAiu0S1rF7HlZz71d4b2v.f1Ke', 0, 'juan', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_ruta` (`ruta`),
  ADD KEY `fk_proyecto_arch` (`proyecto`);

--
-- Indices de la tabla `asignacion`
--
ALTER TABLE `asignacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tarea_asign` (`idtarea`),
  ADD KEY `fk_iduser_asign` (`iduser`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_envia` (`envia`),
  ADD KEY `fk_recibe` (`recibe`);

--
-- Indices de la tabla `muro`
--
ALTER TABLE `muro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_proyecto_muro` (`proyecto`),
  ADD KEY `fk_autor_muro` (`autor`);

--
-- Indices de la tabla `participaciones`
--
ALTER TABLE `participaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_iduser_part` (`idusuario`),
  ADD KEY `fk_idpryecto_part` (`idproyecto`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_creador` (`creador`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tare_proy` (`proyecto`) USING BTREE;

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_username` (`username`),
  ADD UNIQUE KEY `uqcorreo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `archivos`
--
ALTER TABLE `archivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `asignacion`
--
ALTER TABLE `asignacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `muro`
--
ALTER TABLE `muro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `participaciones`
--
ALTER TABLE `participaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD CONSTRAINT `archivos_ibfk_1` FOREIGN KEY (`proyecto`) REFERENCES `proyectos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `asignacion`
--
ALTER TABLE `asignacion`
  ADD CONSTRAINT `asignacion_ibfk_1` FOREIGN KEY (`iduser`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asignacion_ibfk_2` FOREIGN KEY (`idtarea`) REFERENCES `tareas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`envia`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_2` FOREIGN KEY (`recibe`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `muro`
--
ALTER TABLE `muro`
  ADD CONSTRAINT `muro_ibfk_1` FOREIGN KEY (`autor`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `muro_ibfk_2` FOREIGN KEY (`proyecto`) REFERENCES `proyectos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `participaciones`
--
ALTER TABLE `participaciones`
  ADD CONSTRAINT `participaciones_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participaciones_ibfk_2` FOREIGN KEY (`idproyecto`) REFERENCES `proyectos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD CONSTRAINT `proyectos_ibfk_1` FOREIGN KEY (`creador`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD CONSTRAINT `tareas_ibfk_1` FOREIGN KEY (`proyecto`) REFERENCES `proyectos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
