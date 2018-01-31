-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-01-2018 a las 08:25:53
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
(63, 101, 3),
(66, 103, 3),
(67, 104, 3),
(68, 105, 4),
(69, 107, 6),
(72, 110, 3),
(73, 110, 6),
(74, 114, 3),
(75, 114, 4),
(76, 117, 3),
(77, 117, 4),
(78, 117, 6),
(79, 121, 3),
(80, 121, 6),
(81, 122, 3),
(82, 122, 4),
(83, 122, 6),
(84, 124, 3),
(85, 124, 4),
(86, 124, 5),
(87, 125, 3),
(88, 126, 3),
(89, 127, 3),
(90, 128, 3),
(91, 129, 3),
(92, 129, 4),
(93, 129, 5),
(94, 130, 3),
(95, 130, 4);

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

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`id`, `envia`, `mensaje`, `recibe`, `hora`, `estado`) VALUES
(22, 3, 'hola', 5, '2018-01-25 01:28:54', 1),
(23, 3, 'hey', 6, '2018-01-25 01:28:58', 0),
(24, 3, 'hola tio', 4, '2018-01-25 01:29:06', 0),
(25, 5, 'adasd', 3, '2018-01-27 00:00:00', 1),
(28, 3, 'ujbu', 5, '2018-01-29 08:40:28', 0),
(29, 3, 'dsad', 5, '2018-01-29 08:43:01', 0),
(30, 3, 'asdas', 5, '2018-01-29 08:43:16', 0),
(31, 3, 'dasd', 5, '2018-01-29 08:44:31', 0),
(32, 3, 'dasda', 5, '2018-01-29 08:44:39', 0),
(33, 3, 'asdasds', 5, '2018-01-29 08:45:17', 0),
(34, 3, 'asdas', 5, '2018-01-29 08:45:46', 0),
(35, 3, 'sdaas', 5, '2018-01-29 08:46:00', 0),
(36, 3, 'adas', 5, '2018-01-29 09:07:09', 0),
(37, 3, 'asdas', 5, '2018-01-29 09:07:29', 0),
(38, 3, 'asd', 5, '2018-01-29 09:07:50', 0),
(39, 3, 'asdasd', 5, '2018-01-29 09:09:11', 0),
(40, 3, 'fgd', 5, '2018-01-29 09:09:23', 0),
(41, 3, 'asdas', 5, '2018-01-29 09:11:24', 0),
(42, 3, 'dasda', 5, '2018-01-29 09:16:30', 0),
(47, 14, 'hola', 4, '2018-01-30 01:17:33', 0),
(48, 14, 'asd', 4, '2018-01-30 01:19:56', 0),
(49, 14, 'asda', 4, '2018-01-30 01:20:01', 0),
(50, 14, 'asdas', 4, '2018-01-30 01:20:18', 0),
(51, 14, 'sdfsd', 4, '2018-01-30 01:20:35', 0);

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
(14, 'dasds', '2018-01-24 08:43:27', 173, 3),
(15, 'dasds', '2018-01-24 08:43:27', 173, 3),
(20, 'srfgsd', '2018-01-26 10:10:11', 221, 3),
(21, 'zdc<zs', '2018-01-26 12:18:23', 217, 3),
(35, 'asdas', '2018-01-29 10:13:35', 217, 3),
(36, 'asdasdasd', '2018-01-29 10:13:52', 217, 3),
(37, 'sdas', '2018-01-29 10:14:05', 217, 3),
(38, 'sadas', '2018-01-29 10:29:00', 222, 3),
(39, 'sadas', '2018-01-29 10:29:00', 222, 3),
(40, 'jgvug', '2018-01-29 10:35:49', 222, 3),
(41, 'asd', '2018-01-29 01:53:25', 217, 3),
(42, 'gdxÃ§Ã§', '2018-01-30 08:18:37', 219, 3),
(43, 'as<da', '2018-01-30 08:33:26', 219, 3),
(44, 'dasda', '2018-01-30 08:33:32', 219, 3),
(45, 'dasd', '2018-01-30 08:33:41', 219, 3),
(46, 'dsadas', '2018-01-30 08:33:44', 219, 3),
(47, 'sdasa', '2018-01-30 08:35:08', 223, 3),
(48, 'sdasds', '2018-01-30 08:35:11', 223, 3),
(49, 'asdas', '2018-01-30 08:35:14', 223, 3),
(50, 'asdas', '2018-01-30 08:35:18', 223, 3),
(51, 'asdas', '2018-01-30 11:35:27', 224, 3),
(53, 'asda', '2018-01-30 01:50:43', 232, 14);

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
(7, 3, 173),
(8, 4, 173),
(13, 3, 178),
(14, 3, 179),
(15, 5, 180),
(16, 3, 180),
(17, 6, 181),
(19, 6, 182),
(20, 4, 182),
(29, 3, 190),
(58, 3, 213),
(59, 6, 213),
(61, 3, 214),
(63, 6, 214),
(67, 3, 217),
(70, 3, 218),
(71, 4, 218),
(72, 6, 218),
(73, 6, 217),
(77, 5, 217),
(79, 4, 217),
(80, 3, 219),
(81, 4, 219),
(82, 5, 219),
(84, 3, 220),
(85, 4, 220),
(86, 3, 221),
(87, 4, 221),
(88, 3, 222),
(89, 3, 223),
(93, 12, 178),
(98, 4, 223),
(100, 5, 223),
(101, 4, 222),
(102, 5, 222),
(103, 3, 224),
(104, 4, 224),
(107, 3, 225),
(117, 14, 231),
(118, 4, 231),
(119, 14, 232),
(120, 4, 232),
(121, 14, 233),
(122, 4, 233);

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
(168, 'ouasdnc', 'asdad', '2018-01-18', 3),
(173, 'dasda', 'asdasd', '2018-01-22', 3),
(175, 'fsd', 'sdf', '2018-01-22', 3),
(178, 'asdas', 'dasda', '2018-01-23', 3),
(179, 'asdas', 'asdasdas', '2018-01-24', 5),
(180, 'asdas', 'dasdas', '2018-01-24', 5),
(181, 'El proyecto de dani', 'el proyecto es tomar unas caÃ±as y pasarlo bien', '2018-01-24', 6),
(182, 'otro de dani', 'el segundo de prueba', '2018-01-24', 6),
(190, 'asd', 'asdas', '2018-01-25', 3),
(198, 'dasdas', 'sasdas', '2018-01-25', 3),
(213, 'luhui', 'ilg', '2018-01-25', 3),
(214, 'fghgf', 'bgfhf', '2018-01-25', 3),
(217, 'prueba', 'vamos a probar cosas', '2018-01-25', 3),
(218, 'asdas', 'asdasd', '2018-01-26', 3),
(219, 'dasdsdasad', 'dasd', '2018-01-26', 3),
(220, 'asdaskjn', 'oiasdas', '2018-01-26', 3),
(221, 'asdas', 'asdsad', '2018-01-26', 3),
(222, 'sadas', 'dasdas', '2018-01-26', 3),
(223, 'sdfs', 'sdfsdf', '2018-01-26', 3),
(224, 'pruewba', 'saidjas', '2018-01-30', 3),
(225, 'asidjas', 'sada\r\n', '2018-01-30', NULL),
(231, 'uygyu', '', '2018-01-30', 14),
(232, 'lknl', '', '2018-01-30', 14),
(233, 'dasdsa', 'dasdas', '2018-01-30', 14);

--
-- Disparadores `proyectos`
--
DELIMITER $$
CREATE TRIGGER `trigger_usuario-creador` AFTER INSERT ON `proyectos` FOR EACH ROW INSERT into participaciones(participaciones.idusuario,participaciones.idproyecto) VALUES (new.creador,new.id)
$$
DELIMITER ;

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
(101, 'asdasd', 'adsdas', 173, 1, 1, '2018-01-24'),
(103, 'dasdas', 'asdas', 173, 1, 1, '2018-01-25'),
(104, 'dasd', 'dasdas', 178, 1, 1, '2018-01-26'),
(105, 'construir bd', 'hacer toda la base de datos', 182, 0, 3, '2018-02-12'),
(106, 'juik', 'uju', 182, 0, 1, '2018-01-31'),
(107, 'jyjyj', 'jytjyt', 182, 1, 1, '2018-01-31'),
(110, 'hgfd', 'yuft', 213, 1, 1, '2018-01-25'),
(111, 'dasdas', 'asdas', 173, 0, 1, '2018-01-31'),
(112, 'asdd', 'asdas', 173, 0, 1, '2018-01-26'),
(113, 'fsdi0jf', 'sdpiofjsd', 217, 0, 1, '2018-01-26'),
(114, 'dasdas', 'asdasd', 217, 1, 1, '2018-01-26'),
(115, 'asdasd', 'asdas', 217, 0, 1, '2018-01-30'),
(116, 'asdas', 'asdasds', 217, 0, 1, '2018-01-31'),
(117, 'asda', 'asda', 217, 1, 1, '2018-01-27'),
(118, 'asdas', 'dasd', 213, 0, 1, '2018-01-30'),
(119, 'asdas', 'asdas', 213, 0, 1, '2018-01-31'),
(120, 'asda', 'asda', 213, 0, 1, '2018-01-26'),
(121, 'asda', 'asdas', 213, 1, 1, '2018-01-26'),
(122, 'dsadsa', 'asdsa', 217, 1, 1, '2018-01-31'),
(123, 'asdas', 'dasdas', 217, 0, 1, '2018-01-28'),
(124, 'asdas', 'asdas', 217, 1, 2, '2018-01-27'),
(125, 'prueba1', 'asda', 222, 1, 2, '2018-01-31'),
(126, 'ta', 'as', 222, 1, 2, '2018-01-26'),
(127, 'asda', 'fdgfd', 222, 1, 1, '2018-01-31'),
(128, 'mhbgih', 'ougu', 223, 1, 1, '2018-01-31'),
(129, 'asda', 'asdasd', 222, 0, 1, '2018-01-31'),
(130, 'asdas', 'asdas', 224, 1, 2, '2018-01-26');

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
(3, 'pepeg', '$2y$10$VrEH4neKTj2PzgUM2cOm8ONrDTJB5S7jtIP6OEp7/jq6o.rc5z5we', 1, 'pepe', 'javi98@gmail.com'),
(4, 'juan', '$2y$10$Bgfp2XZfCKj.brBOqNk98Oc98B4IAiu0S1rF7HlZz71d4b2v.f1Ke', 1, 'juan', ''),
(5, 'antonio', '$2y$10$tLEZKjJkVQaJBeTJA8pIAuKWzlw1LBCD/eP2P/1oZrC6woR3.IF6S', 1, 'Antonio Antoniez', 'antonio@prueba.com'),
(6, 'dani', '$2y$10$2n11LoSNbHzny22HMC8QP.J2i3tO.abZ727b.oH1CmjtMKxstfPjK', 1, 'Dani Garcia', 'danigartzia@gmail.com'),
(7, 'prueba', 'asdhubbbbbdsaidjasidaksdkn', 1, 'usuario prueba', 'a@b.es'),
(12, 'javier', '$2y$10$El1kQrqyifHjbS86/apU/esbXmQgibBt8bLkm6jHCshr2E1zih/ou', 1, 'javier marin', 'javiermdg998@gmail.com'),
(14, 'javier2', '$2y$10$oAOK4uDKT09/lle3g7vv2OzQl1q3xWwJSxIJ5NyiS9oZXKLREznAS', 1, 'javie marin', 'javier.marin@ikasle.egibide.org');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `muro`
--
ALTER TABLE `muro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `participaciones`
--
ALTER TABLE `participaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
