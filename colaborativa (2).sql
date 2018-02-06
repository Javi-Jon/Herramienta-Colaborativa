-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-02-2018 a las 11:49:13
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

--
-- Volcado de datos para la tabla `archivos`
--

INSERT INTO `archivos` (`id`, `nombre`, `ruta`, `proyecto`) VALUES
(1, 'error.js', 'C:/xampp/htdocs/HColaborativ/Archivos/1517486416.js', 222),
(2, 'Bodegas (2).zip', 'C:/xampp/htdocs/HColaborativ/Archivos/1517486416.zip', 222),
(3, 'Captura1.PNG', 'Archivos1517486727.PNG', 222),
(4, 'error.js', 'Archivos1517486727.js', 222),
(5, 'file.png', './Archivos/1517487850.png', 222),
(6, 'prueba.html', './Archivos/1517487850.html', 222),
(7, 'Bodegas (2).zip', './Archivos/1517488557.zip', 237),
(9, 'file.png', './Archivos/1517488575.png', 237),
(10, '2_Ejercicios Flexbox-20171211.zip', './Archivos/1517488597.zip', 237),
(11, 'aprendephpconejercicios.pdf', './Archivos/1517488645.pdf', 237),
(12, 'aprendephpconejercicios.pdf', './Archivos/1517488680.pdf', 237),
(13, 'accesibilidad y usabilidad Javi y Jon.pdf', './Archivos/1517489668.pdf', 237),
(14, 'bodegas.sql', './Archivos/1517489668.sql', 237),
(15, 'Bodegas (2).zip', './Archivos/1517556421.zip', 239),
(16, 'aprendephpconejercicios.pdf', './Archivos/1517556422.pdf', 239),
(17, 'comunidad.jpg', './Archivos/1517564286.jpg', 241),
(18, 'file.png', './Archivos/1517564286.png', 241),
(20, 'user.png', './Archivos/1517564287.png', 241),
(21, 'index.html', './Archivos/1517832953.html', 241),
(22, 'Flexbox.odt', './Archivos/1517904494.odt', 247);

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
(95, 130, 4),
(96, 131, 14),
(97, 131, 4),
(98, 131, 5),
(99, 132, 14),
(100, 132, 4),
(101, 133, 3),
(102, 133, 6),
(104, 135, 3),
(105, 135, 12),
(106, 135, 4),
(107, 136, 3),
(108, 136, 12),
(111, 138, 3),
(112, 138, 12),
(113, 139, 3),
(114, 139, 12),
(117, 142, 3),
(118, 142, 12),
(119, 143, 12),
(126, 148, 3),
(127, 148, 12),
(128, 148, 5),
(129, 149, 12),
(130, 149, 5),
(131, 151, 5),
(132, 152, 5),
(133, 153, 14),
(134, 153, 3),
(162, 163, 3),
(163, 163, 5),
(164, 164, 3),
(165, 164, 5),
(166, 165, 3),
(167, 165, 5),
(168, 166, 3),
(169, 166, 5),
(170, 167, 3),
(171, 167, 5),
(172, 168, 3),
(173, 168, 5),
(174, 169, 3),
(175, 169, 5),
(176, 170, 3),
(177, 170, 5),
(178, 171, 3),
(179, 171, 5),
(180, 172, 3),
(181, 172, 5),
(182, 173, 3),
(183, 173, 5),
(184, 175, 3),
(185, 175, 5),
(186, 176, 3),
(187, 176, 5),
(188, 177, 14),
(189, 177, 3),
(190, 178, 14),
(191, 181, 14),
(192, 181, 3),
(193, 182, 14),
(194, 182, 3);

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
(24, 3, 'hola tio', 4, '2018-01-25 01:29:06', 1),
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
(47, 14, 'hola', 4, '2018-01-30 01:17:33', 1),
(48, 14, 'asd', 4, '2018-01-30 01:19:56', 1),
(49, 14, 'asda', 4, '2018-01-30 01:20:01', 1),
(50, 14, 'asdas', 4, '2018-01-30 01:20:18', 1),
(51, 14, 'sdfsd', 4, '2018-01-30 01:20:35', 1),
(52, 14, 'jibuxs', 4, '2018-01-31 09:21:53', 1),
(53, 4, 'jhbhl', 14, '2018-01-31 09:22:06', 1),
(54, 14, 'ut', 4, '2018-01-31 10:36:20', 1),
(55, 3, 'hola', 14, '2018-02-01 09:47:21', 1),
(56, 3, 'asd', 4, '2018-02-01 09:47:27', 1),
(57, 3, 'asdas', 14, '2018-02-01 09:47:33', 1),
(58, 4, 'que me dejes en paz ya no te conozco tio!', 3, '2018-02-01 10:51:19', 1),
(59, 3, 'dsada', 12, '2018-02-01 11:00:08', 0),
(60, 3, 'dfsf', 5, '2018-02-02 08:39:24', 0),
(61, 4, 'pepe puto tonto!', 3, '2018-02-02 12:09:37', 1),
(62, 4, 'cabeza mierda', 3, '2018-02-02 12:11:34', 1),
(63, 4, 'hueles a queso', 3, '2018-02-02 12:15:16', 1),
(64, 3, 'tio ya tienes una edad!', 4, '2018-02-02 12:15:40', 1),
(65, 4, 'tuuu!', 14, '2018-02-02 01:51:10', 1),
(66, 4, 'callate!', 3, '2018-02-02 01:51:22', 1),
(67, 3, 'dasda', 4, '2018-02-02 01:52:04', 1),
(68, 4, 'asdsa', 3, '2018-02-02 01:52:31', 1),
(69, 3, 'asdsa', 4, '2018-02-02 13:54:01', 1),
(70, 3, 'asdsa', 4, '2018-02-05 10:52:41', 1),
(71, 3, 'asdas', 12, '2018-02-05 10:52:59', 0),
(72, 3, 'que quieres', 14, '2018-02-05 10:55:39', 1),
(73, 14, 'nada tio', 3, '2018-02-05 10:55:54', 1),
(74, 4, 'tii yi tiinis ini idid', 3, '2018-02-05 14:04:06', 1),
(75, 4, 'hola!', 3, '2018-02-06 08:12:32', 1),
(76, 3, 'ya empezamos...', 4, '2018-02-06 08:12:50', 1),
(77, 4, 'khb', 5, '2018-02-06 09:16:45', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muro`
--

CREATE TABLE `muro` (
  `id` int(11) NOT NULL,
  `mensaje` varchar(250) NOT NULL,
  `hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `proyecto` int(11) NOT NULL,
  `autor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `muro`
--

INSERT INTO `muro` (`id`, `mensaje`, `hora`, `proyecto`, `autor`) VALUES
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
(53, 'asda', '2018-01-30 01:50:43', 232, 14),
(54, 'antonio se ha unido al grupo', '0000-00-00 00:00:00', 232, 5),
(55, 'antonio ha abandonado el grupo', '0000-00-00 00:00:00', 232, 5),
(56, 'juan ha  sido expulsado por el administrador del grupo', '0000-00-00 00:00:00', 232, 4),
(57, 'juan se ha unido al grupo', '0000-00-00 00:00:00', 232, 4),
(58, 'antonio se ha unido al grupo', '0000-00-00 00:00:00', 232, 5),
(59, 'antonio ha  sido expulsado por el administrador del grupo', '2018-01-31 09:10:41', 232, 5),
(60, 'antonio se ha unido al grupo', '2018-01-31 09:10:57', 232, 5),
(61, 'javier2 se ha unido al grupo', '2018-01-31 09:47:27', 234, 14),
(62, 'juan se ha unido al grupo', '2018-01-31 09:47:31', 234, 4),
(65, 'pepeg se ha unido al grupo', '2018-01-31 12:20:47', 236, 3),
(66, 'dani se ha unido al grupo', '2018-01-31 12:20:53', 236, 6),
(67, 'asd', '2018-01-31 12:28:43', 236, 3),
(68, 'asd', '2018-01-31 12:28:46', 236, 3),
(69, '', '2018-01-31 12:28:46', 236, 3),
(70, 'asdasd', '2018-01-31 12:28:50', 236, 3),
(71, 'as', '2018-01-31 12:28:50', 236, 3),
(72, 'asd', '2018-01-31 12:28:51', 236, 3),
(73, 'asd', '2018-01-31 12:28:51', 236, 3),
(74, 'asd', '2018-01-31 12:28:51', 236, 3),
(75, 'aasdasdasd', '2018-01-31 12:29:08', 236, 3),
(76, 'asd', '2018-01-31 12:29:08', 236, 3),
(77, 'as', '2018-01-31 12:29:09', 236, 3),
(78, 'asd', '2018-01-31 12:29:09', 236, 3),
(79, 'asd', '2018-01-31 12:29:09', 236, 3),
(80, 'asd', '2018-01-31 12:29:10', 236, 3),
(81, 'as', '2018-01-31 12:29:10', 236, 3),
(82, 'as', '2018-01-31 12:29:10', 236, 3),
(83, 'd', '2018-01-31 12:29:10', 236, 3),
(84, '', '2018-01-31 12:29:10', 236, 3),
(85, 'a', '2018-01-31 12:29:11', 236, 3),
(86, 's', '2018-01-31 12:29:11', 236, 3),
(87, 'juan se ha unido al grupo', '2018-01-31 13:46:33', 236, 4),
(88, 'pepeg se ha unido al grupo', '2018-02-01 08:22:27', 237, 3),
(89, 'juan se ha unido al grupo', '2018-02-01 08:22:32', 237, 4),
(90, 'javier2 se ha unido al grupo', '2018-02-01 08:24:36', 237, 14),
(91, 'javier2 ha  sido expulsado por el administrador del grupo', '2018-02-01 08:31:15', 237, 14),
(92, 'javier2 se ha unido al grupo', '2018-02-01 08:33:05', 237, 14),
(93, 'javier2 ha  sido expulsado por el administrador del grupo', '2018-02-01 08:36:02', 237, 14),
(94, 'javier2 se ha unido al grupo', '2018-02-01 09:01:20', 237, 14),
(95, 'javier2 ha  sido expulsado por el administrador del grupo', '2018-02-01 09:01:40', 237, 14),
(96, 'javier2 se ha unido al grupo', '2018-02-01 09:20:05', 237, 14),
(97, 'javier2 ha  sido expulsado por el administrador del grupo', '2018-02-01 09:20:59', 237, 14),
(98, 'javier2 se ha unido al grupo', '2018-02-01 09:21:07', 237, 14),
(99, 'javier2 ha  sido expulsado por el administrador del grupo', '2018-02-01 09:21:14', 237, 14),
(100, 'javier2 se ha unido al grupo', '2018-02-01 09:21:22', 237, 14),
(101, 'javier2 ha  sido expulsado por el administrador del grupo', '2018-02-01 09:21:56', 237, 14),
(102, 'javier2 se ha unido al grupo', '2018-02-01 09:22:05', 237, 14),
(103, 'javier2 ha  sido expulsado por el administrador del grupo', '2018-02-01 09:22:23', 237, 14),
(104, 'javier2 se ha unido al grupo', '2018-02-01 09:23:00', 237, 14),
(105, 'javier2 ha  sido expulsado por el administrador del grupo', '2018-02-01 09:23:23', 237, 14),
(106, 'javier2 se ha unido al grupo', '2018-02-01 09:23:30', 237, 14),
(107, 'javier2 ha  sido expulsado por el administrador del grupo', '2018-02-01 09:23:46', 237, 14),
(108, 'javier2 se ha unido al grupo', '2018-02-01 09:39:47', 237, 14),
(109, 'javier2 ha  sido expulsado por el administrador del grupo', '2018-02-01 09:40:20', 237, 14),
(110, 'javier2 se ha unido al grupo', '2018-02-01 09:47:12', 237, 14),
(111, 'javier2 ha  sido expulsado por el administrador del grupo', '2018-02-01 13:30:58', 237, 14),
(112, 'juan ha  sido expulsado por el administrador del grupo', '2018-02-01 13:31:10', 237, 4),
(113, 'juan se ha unido al grupo', '2018-02-01 13:33:30', 237, 4),
(114, 'juan ha  sido expulsado por el administrador del grupo', '2018-02-01 13:33:49', 237, 4),
(115, 'juan se ha unido al grupo', '2018-02-01 13:34:22', 237, 4),
(116, 'hola  juan!', '2018-02-01 02:05:44', 237, 3),
(117, 'pepeg se ha unido al grupo', '2018-02-01 14:06:25', 238, 3),
(118, 'pepeg se ha unido al grupo', '2018-02-01 14:11:32', 239, 3),
(119, 'pepeg se ha unido al grupo', '2018-02-02 08:47:27', 240, 3),
(120, 'juan se ha unido al grupo', '2018-02-02 08:47:29', 240, 4),
(121, 'antonio se ha unido al grupo', '2018-02-02 08:47:32', 240, 5),
(122, 'pepeg se ha unido al grupo', '2018-02-02 08:48:00', 241, 3),
(123, 'juan se ha unido al grupo', '2018-02-02 08:48:02', 241, 4),
(124, 'antonio se ha unido al grupo', '2018-02-02 08:48:07', 241, 5),
(125, 'juan se ha unido al grupo', '2018-02-02 10:19:39', 242, 4),
(126, 'juan se ha unido al grupo', '2018-02-02 10:19:49', 243, 4),
(127, 'juan se ha unido al grupo', '2018-02-02 10:19:54', 244, 4),
(128, 'juan se ha unido al grupo', '2018-02-02 10:20:05', 245, 4),
(129, 'juan se ha unido al grupo', '2018-02-02 10:20:10', 246, 4),
(130, 'juan se ha unido al grupo', '2018-02-02 10:20:15', 247, 4),
(131, 'pepeg se ha unido al grupo', '2018-02-02 10:22:26', 247, 3),
(132, 'pepeg ha  sido expulsado por el administrador del grupo', '2018-02-02 10:22:31', 247, 3),
(133, 'javier se ha unido al grupo', '2018-02-05 10:00:36', 241, 12),
(134, 'as', '2018-02-05 10:51:24', 241, 3),
(135, 'a', '2018-02-05 10:51:24', 241, 3),
(136, '', '2018-02-05 10:51:25', 241, 3),
(137, '', '2018-02-05 10:51:25', 241, 3),
(138, 'a', '2018-02-05 10:51:25', 241, 3),
(139, '', '2018-02-05 10:51:25', 241, 3),
(140, '', '2018-02-05 10:51:25', 241, 3),
(141, 'javier2 se ha unido al grupo', '2018-02-05 10:55:17', 248, 14),
(142, 'pepeg se ha unido al grupo', '2018-02-05 10:55:20', 248, 3),
(143, 'javier ha  sido expulsado por el administrador del grupo', '2018-02-05 12:34:12', 241, 12),
(144, 'javier se ha unido al grupo', '2018-02-05 12:34:16', 241, 12),
(145, 'javier ha  sido expulsado por el administrador del grupo', '2018-02-05 12:34:21', 241, 12),
(146, 'javier se ha unido al grupo', '2018-02-05 12:34:38', 241, 12),
(147, 'antonio ha  sido expulsado por el administrador del grupo', '2018-02-05 12:36:10', 241, 5),
(148, 'juan se ha unido al grupo', '2018-02-05 12:40:22', 241, 4),
(149, 'juan ha  sido expulsado por el administrador del grupo', '2018-02-05 12:40:29', 241, 4),
(150, 'juan ha  sido expulsado por el administrador del grupo', '2018-02-05 12:40:45', 241, 4),
(151, 'juan se ha unido al grupo', '2018-02-05 12:40:47', 241, 4),
(152, 'antonio se ha unido al grupo', '2018-02-05 12:44:35', 241, 5),
(153, 'antonio ha  sido expulsado por el administrador del grupo', '2018-02-05 12:45:20', 241, 5),
(154, 'antonio se ha unido al grupo', '2018-02-05 12:45:22', 241, 5),
(155, 'antonio ha  sido expulsado por el administrador del grupo', '2018-02-05 12:45:57', 241, 5),
(156, 'antonio se ha unido al grupo', '2018-02-05 12:46:00', 241, 5),
(157, 'antonio ha  sido expulsado por el administrador del grupo', '2018-02-05 12:46:17', 241, 5),
(158, 'antonio se ha unido al grupo', '2018-02-05 12:46:20', 241, 5),
(159, 'antonio ha  sido expulsado por el administrador del grupo', '2018-02-05 12:46:32', 241, 5),
(160, 'juan ha  sido expulsado por el administrador del grupo', '2018-02-05 12:49:58', 241, 4),
(161, 'juan se ha unido al grupo', '2018-02-05 12:50:04', 241, 4),
(162, 'juan ha  sido expulsado por el administrador del grupo', '2018-02-05 12:50:07', 241, 4),
(163, 'antonio se ha unido al grupo', '2018-02-05 13:15:06', 241, 5),
(164, 'pepeg se ha unido al grupo', '2018-02-06 08:14:37', 249, 3),
(165, 'antonio se ha unido al grupo', '2018-02-06 08:14:45', 249, 5),
(166, 'juan se ha unido al grupo', '2018-02-06 08:15:17', 249, 4),
(167, 'juan ha  sido expulsado por el administrador del grupo', '2018-02-06 08:15:46', 249, 4),
(168, 'juan se ha unido al grupo', '2018-02-06 08:22:07', 249, 4),
(169, 'juan ha  sido expulsado por el administrador del grupo', '2018-02-06 08:22:35', 249, 4),
(170, 'juan se ha unido al grupo', '2018-02-06 08:30:22', 249, 4),
(171, 'juan ha  sido expulsado por el administrador del grupo', '2018-02-06 08:30:44', 249, 4),
(172, 'juan se ha unido al grupo', '2018-02-06 08:30:54', 249, 4),
(173, 'juan ha  sido expulsado por el administrador del grupo', '2018-02-06 08:30:58', 249, 4),
(174, 'juan se ha unido al grupo', '2018-02-06 08:31:16', 249, 4),
(175, 'juan ha  sido expulsado por el administrador del grupo', '2018-02-06 08:34:18', 249, 4),
(176, 'juan se ha unido al grupo', '2018-02-06 08:34:23', 249, 4),
(177, 'juan ha  sido expulsado por el administrador del grupo', '2018-02-06 08:34:27', 249, 4),
(178, 'juan se ha unido al grupo', '2018-02-06 08:34:34', 249, 4),
(180, 'antonio ha  sido expulsado por el administrador del grupo', '2018-02-06 08:54:38', 249, 5),
(181, 'antonio se ha unido al grupo', '2018-02-06 09:01:09', 249, 5),
(182, 'juan ha  sido expulsado por el administrador del grupo', '2018-02-06 09:01:34', 249, 4),
(183, 'pepeg se ha unido al grupo', '2018-02-06 09:07:53', 247, 3),
(184, 'javier2 se ha unido al grupo', '2018-02-06 09:08:29', 247, 14),
(185, 'pepeg se ha unido al grupo', '2018-02-06 09:08:36', 247, 3),
(186, 'pepeg se ha unido al grupo', '2018-02-06 09:08:42', 247, 3),
(187, 'pepeg ha  sido expulsado por el administrador del grupo', '2018-02-06 09:08:44', 247, 3),
(188, 'pepeg ha  sido expulsado por el administrador del grupo', '2018-02-06 09:08:45', 247, 3),
(189, 'javier2 ha  sido expulsado por el administrador del grupo', '2018-02-06 09:08:46', 247, 14),
(190, 'pepeg ha  sido expulsado por el administrador del grupo', '2018-02-06 09:08:47', 247, 3),
(191, 'juan se ha unido al grupo', '2018-02-06 09:10:33', 249, 4),
(192, 'juan se ha unido al grupo', '2018-02-06 09:10:39', 249, 4),
(193, 'juan ha  sido expulsado por el administrador del grupo', '2018-02-06 09:14:25', 249, 4),
(194, 'juan ha  sido expulsado por el administrador del grupo', '2018-02-06 09:14:50', 249, 4),
(195, 'juan se ha unido al grupo', '2018-02-06 09:15:07', 249, 4),
(196, 'juan ha  sido expulsado por el administrador del grupo', '2018-02-06 09:20:32', 249, 4),
(197, 'juan se ha unido al grupo', '2018-02-06 09:21:03', 249, 4),
(198, 'juan ha  sido expulsado por el administrador del grupo', '2018-02-06 09:21:24', 249, 4);

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
(13, 3, 178),
(16, 3, 180),
(29, 3, 190),
(58, 3, 213),
(61, 3, 214),
(67, 3, 217),
(70, 3, 218),
(80, 3, 219),
(84, 3, 220),
(86, 3, 221),
(88, 3, 222),
(89, 3, 223),
(103, 3, 224),
(134, 3, 236),
(137, 3, 237),
(152, 3, 238),
(153, 3, 239),
(154, 3, 240),
(157, 3, 241),
(168, 3, 248),
(179, 3, 249),
(20, 4, 182),
(79, 4, 217),
(71, 4, 218),
(81, 4, 219),
(85, 4, 220),
(87, 4, 221),
(101, 4, 222),
(98, 4, 223),
(104, 4, 224),
(118, 4, 231),
(127, 4, 232),
(122, 4, 233),
(131, 4, 234),
(136, 4, 236),
(151, 4, 237),
(155, 4, 240),
(160, 4, 242),
(161, 4, 243),
(162, 4, 244),
(163, 4, 245),
(164, 4, 246),
(165, 4, 247),
(15, 5, 180),
(77, 5, 217),
(82, 5, 219),
(102, 5, 222),
(100, 5, 223),
(129, 5, 232),
(156, 5, 240),
(178, 5, 241),
(189, 5, 249),
(17, 6, 181),
(19, 6, 182),
(59, 6, 213),
(63, 6, 214),
(73, 6, 217),
(72, 6, 218),
(135, 6, 236),
(93, 12, 178),
(170, 12, 241),
(117, 14, 231),
(119, 14, 232),
(121, 14, 233),
(130, 14, 234),
(167, 14, 248);

--
-- Disparadores `participaciones`
--
DELIMITER $$
CREATE TRIGGER `usuario_abandonar_muro` AFTER DELETE ON `participaciones` FOR EACH ROW BEGIN
DECLARE
nombreusuario varchar(40);
SET nombreusuario := (select username FROM usuarios 
                       where id=old.idusuario);

	INSERT INTO `muro`
    ( `mensaje`,
     `proyecto`, 
     `autor`)
		VALUES 
        (concat(nombreusuario,' ha  sido expulsado por el administrador del grupo'),
         old.idproyecto,
         old.idusuario);
         
         DELETE FROM asignacion WHERE idtarea IN(SELECT tareas.`id` FROM tareas WHERE proyecto=old.idproyecto);
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `usuario_unirse_muro` AFTER INSERT ON `participaciones` FOR EACH ROW BEGIN
DECLARE
nombreusuario varchar(40);
SET nombreusuario := (select username FROM usuarios 
                       where id=new.idusuario);

	INSERT INTO `muro`
    ( `mensaje`,
     `proyecto`, 
     `autor`)
		VALUES 
        (concat(nombreusuario,' se ha unido al grupo'),
         new.idproyecto,
         new.idusuario);
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `creacion` date NOT NULL,
  `creador` int(11) DEFAULT NULL,
  `tipo` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`id`, `nombre`, `descripcion`, `creacion`, `creador`, `tipo`) VALUES
(114, 'asda', 'asd', '2018-01-16', 3, 1),
(115, 'adsd', 'asdas', '2018-01-16', 3, 1),
(116, 'asdas', 'sadas', '2018-01-16', 3, 1),
(117, 'ASDa', 'sdas', '2018-01-16', 3, 1),
(118, 'dasd', 'adas', '2018-01-16', 3, 1),
(119, 'asd', 'asdas', '2018-01-16', 3, 1),
(120, 'dasd', 'asdas', '2018-01-16', 3, 1),
(121, 'dasd', 'asdas', '2018-01-16', 3, 1),
(122, 'asd', 'asd', '2018-01-16', 3, 1),
(123, 'asd', 'asda', '2018-01-16', 3, 1),
(124, 'adsd', 'asdas', '2018-01-16', 3, 1),
(125, 'sdv', 'sdf', '2018-01-16', 3, 1),
(126, 'dasdsdasad', 'asdas', '2018-01-16', 3, 1),
(127, 'asda', 'asdas', '2018-01-16', 3, 1),
(128, 'asdas', 'asdas', '2018-01-16', 3, 1),
(129, 'asdas', 'dasdasd', '2018-01-16', 3, 1),
(130, 'dasd', 'asdas', '2018-01-16', 3, 1),
(131, 'asda', 'asdasd', '2018-01-16', 3, 1),
(132, 'sad', 'asdasd', '2018-01-16', 3, 1),
(133, 'dasdas', 'asdasd', '2018-01-16', 3, 1),
(134, 'asdas', 'asdas', '2018-01-16', 3, 1),
(135, 'asd', 'asdas', '2018-01-16', 3, 1),
(136, 'asdas', 'asdas', '2018-01-16', 3, 1),
(137, 'adds', 'asdas', '2018-01-16', 3, 1),
(138, 'asdas', 'asdas', '2018-01-16', 3, 1),
(139, 'asdsad', 'asdas', '2018-01-16', 3, 1),
(140, 'asdsa', 'asdasd', '2018-01-16', 3, 1),
(141, 'asda', 'dasda', '2018-01-16', 3, 1),
(142, 'asdas', 'asdas', '2018-01-16', 3, 1),
(143, 'asdas', 'asdas', '2018-01-16', 3, 1),
(144, 'asdas', 'asdas', '2018-01-16', 3, 1),
(145, 'adsd', 'asdas', '2018-01-16', 3, 1),
(146, 'asda', 'asdasd', '2018-01-16', 3, 1),
(147, 'sadda', 'asda', '2018-01-16', 3, 1),
(148, 'asda', 'asdad', '2018-01-16', 3, 1),
(149, 'asdas', 'asdasd', '2018-01-16', 3, 1),
(150, 'asdsad', 'asdas', '2018-01-16', 3, 1),
(151, 'dasdsa', 'asddd', '2018-01-16', 3, 1),
(152, 'asdsa', 'asdasd', '2018-01-16', 3, 1),
(153, 'asda', 'asda', '2018-01-16', 3, 1),
(154, 'asdas', 'asda', '2018-01-16', 3, 1),
(155, 'asdas', 'asdas', '2018-01-16', 3, 1),
(156, 'asdas', 'asdas', '2018-01-16', 3, 1),
(157, 'asdsa', 'asdas', '2018-01-16', 3, 1),
(158, 'asdd', 'asdas', '2018-01-16', 3, 1),
(159, 'ASD', 'dasd', '2018-01-16', 3, 1),
(160, 'dasdsdasad', 'dasd', '2018-01-16', 3, 1),
(161, 'asdas', 'asdasd', '2018-01-16', 3, 1),
(162, 'sada', 'sadas', '2018-01-16', 3, 1),
(163, 'dasdsa', 'asdas', '2018-01-16', 3, 1),
(164, 'adsa', 'asd', '2018-01-16', 3, 1),
(165, 'asda', 'asdas', '2018-01-16', 3, 1),
(166, 'asdas', 'asdas', '2018-01-16', 3, 1),
(168, 'ouasdnc', 'asdad', '2018-01-18', 3, 1),
(175, 'fsd', 'sdf', '2018-01-22', 3, 1),
(178, 'asdas', 'dasda', '2018-01-23', 3, 1),
(180, 'asdas', 'dasdas', '2018-01-24', 5, 1),
(181, 'El proyecto de dani', 'el proyecto es tomar unas caÃ±as y pasarlo bien', '2018-01-24', 6, 1),
(182, 'otro de dani', 'el segundo de prueba', '2018-01-24', 6, 1),
(190, 'asd', 'asdas', '2018-01-25', 3, 1),
(198, 'dasdas', 'sasdas', '2018-01-25', 3, 1),
(213, 'luhui', 'ilg', '2018-01-25', 3, 1),
(214, 'fghgf', 'bgfhf', '2018-01-25', 3, 1),
(217, 'prueba', 'vamos a probar cosas', '2018-01-25', 3, 1),
(218, 'asdas', 'asdasd', '2018-01-26', 3, 1),
(219, 'dasdsdasad', 'dasd', '2018-01-26', 3, 1),
(220, 'asdaskjn', 'oiasdas', '2018-01-26', 3, 1),
(221, 'asdas', 'asdsad', '2018-01-26', 3, 1),
(222, 'sadas', 'dasdas', '2018-01-26', 3, 1),
(223, 'sdfs', 'sdfsdf', '2018-01-26', 3, 1),
(224, 'pruewba', 'saidjas', '2018-01-30', 3, 1),
(231, 'uygyu', '', '2018-01-30', 14, 1),
(232, 'lknl', '', '2018-01-30', 14, 1),
(233, 'dasdsa', 'dasdas', '2018-01-30', 14, 1),
(234, 'aoisdsaia', 'asdasd', '2018-01-31', 14, 0),
(236, 'dsasd', 'asdasd', '2018-01-31', 3, 0),
(237, 'aDSA', 'ASDAS', '2018-02-01', 3, 0),
(238, 'asdsad', 'asdas', '2018-02-01', 3, 1),
(239, 'sadas', 'asdsad', '2018-02-01', 3, 0),
(240, 'asdsaidjasiojdaoi', 'asdasoidjasiojdasi0jdas', '2018-02-02', 3, 0),
(241, 'loaremqa dsadosadsaop asdiojas p asipjd', 'aspdmasip aspidj aspi dasdspdijsapdoj  sajdapsdad', '2018-02-02', 3, 0),
(242, 'asdas', 'asdas', '2018-02-02', 4, 0),
(243, 'dasdsa', 'sadas', '2018-02-02', 4, 0),
(244, 'sadasd', 'asdasdas', '2018-02-02', 4, 0),
(245, 'dasdas', 'asdasd', '2018-02-02', 4, 0),
(246, 'asdas', 'dasdasd', '2018-02-02', 4, 0),
(247, 'asdas', 'asdasda', '2018-02-02', 4, 0),
(248, 'asdas', 'asdsa', '2018-02-05', 14, 0),
(249, 'sal,d sa', 'aspomdas', '2018-02-06', 3, 0);

--
-- Disparadores `proyectos`
--
DELIMITER $$
CREATE TRIGGER `trigger_usuario-creador` AFTER INSERT ON `proyectos` FOR EACH ROW INSERT into participaciones(participaciones.idusuario,participaciones.idproyecto) VALUES (new.creador,new.id)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `idproyecto` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `solicitudes`
--

INSERT INTO `solicitudes` (`idproyecto`, `idusuario`, `id`) VALUES
(234, 3, 1),
(236, 14, 11),
(236, 14, 13),
(234, 3, 38),
(234, 3, 40),
(234, 3, 46),
(234, 3, 47),
(243, 3, 48),
(242, 3, 49),
(242, 3, 65);

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
(104, 'dasd', 'dasdas', 178, 1, 1, '2018-01-26'),
(105, 'construir bd', 'hacer toda la base de datos', 182, 0, 3, '2018-02-12'),
(106, 'juik', 'uju', 182, 0, 1, '2018-01-31'),
(107, 'jyjyj', 'jytjyt', 182, 1, 1, '2018-01-31'),
(110, 'hgfd', 'yuft', 213, 1, 1, '2018-01-25'),
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
(123, 'asdas', 'dasdas', 217, 1, 1, '2018-01-28'),
(124, 'asdas', 'asdas', 217, 1, 2, '2018-01-27'),
(125, 'prueba1', 'asda', 222, 1, 2, '2018-01-31'),
(126, 'ta', 'as', 222, 1, 2, '2018-01-26'),
(127, 'asda', 'fdgfd', 222, 1, 1, '2018-01-31'),
(128, 'mhbgih', 'ougu', 223, 1, 1, '2018-01-31'),
(129, 'asda', 'asdasd', 222, 1, 1, '2018-01-31'),
(130, 'asdas', 'asdas', 224, 1, 2, '2018-01-26'),
(131, 'hacer la colada', 'lavar los calcetines', 232, 1, 2, '2018-02-01'),
(132, 'fsadfds', 'sdfsd', 234, 1, 2, '2018-01-20'),
(133, 'asdsa', 'asdsa', 236, 0, 2, '2018-02-01'),
(135, 'asdi', 'asddas', 241, 1, 1, '2018-02-27'),
(136, 'asda', 'asdas', 241, 1, 2, '2018-02-20'),
(138, 'asd', 'dasd', 241, 1, 2, '2018-02-22'),
(139, 'asdas', 'asdas', 241, 1, 1, '2018-02-19'),
(141, 'prueba', 'asdas', 241, 1, 2, '2018-02-28'),
(142, 'asdas', 'dasd', 241, 1, 1, '2018-02-20'),
(143, 'dassa', 'sadas', 241, 1, 2, '2018-02-19'),
(145, 'asdas', 'asdas', 241, 1, 2, '2018-02-27'),
(148, 'nasdansd', 'adsjansd', 241, 1, 2, '2018-02-23'),
(149, 'asdas', 'sadas', 241, 1, 3, '2018-02-20'),
(150, 'gdfg', 'asdas', 241, 0, 2, '2018-02-14'),
(151, 'asdsagfdsgv', 'bnfg', 241, 0, 2, '2018-02-20'),
(152, 'dasd', 'fgdf', 241, 0, 2, '2018-02-21'),
(153, 'dasda', 'sadas', 248, 1, 2, '2018-02-08'),
(154, 'asdas', 'asdasd', 249, 1, 2, '2018-02-20'),
(155, 'asdas', 'asdas', 249, 1, 2, '2018-02-20'),
(156, 'asdas', 'asdas', 249, 1, 2, '2018-02-15'),
(157, 'asdas', 'gdfgdf', 249, 1, 2, '2018-02-20'),
(158, 'igyigq', 'iouhiuhi9pug', 249, 1, 2, '2018-02-14'),
(159, 'asdsa', 'fgc', 249, 1, 2, '2018-02-19'),
(160, 'ersf', 'sdfsdf', 249, 1, 2, '2018-02-22'),
(161, 'asdsa', 'asdas', 249, 1, 2, '2018-02-21'),
(162, 'sadas', 'asdas', 249, 1, 2, '2018-02-22'),
(163, 'asdas', 'asdas', 249, 1, 1, '2018-02-20'),
(164, 'qwe', 'qwe', 249, 1, 1, '2018-02-19'),
(165, 'sdadas', 'dasdas', 249, 1, 2, '2018-02-22'),
(166, 'qwe', 'qwe', 249, 1, 1, '2018-02-22'),
(167, 'dasda', 'qweqwe', 249, 0, 3, '2018-02-21'),
(168, 'asdasd', 'dasdad', 249, 1, 3, '2018-02-21'),
(169, 'asda', 'adsas', 249, 1, 2, '2018-02-20'),
(170, 'dasda', 'asdasas', 249, 1, 2, '2018-02-21'),
(171, 'asdas', 'asdasd', 249, 1, 3, '2018-02-21'),
(172, 'dasas', 'asdasd', 249, 0, 2, '2018-02-15'),
(173, 'sadas', 'dasdas', 249, 0, 2, '2018-02-21'),
(174, 'dsada', 'asdad', 249, 0, 2, '2018-02-15'),
(175, 'qwe', 'qweq', 249, 0, 3, '2018-02-15'),
(176, 'asd', 'asdas', 249, 0, 2, '2018-02-21'),
(177, 'dasdas', 'dasda', 248, 1, 2, '2018-02-21'),
(178, 'asdas', 'asdasd', 248, 0, 2, '2018-03-01'),
(179, 'asda', 'dasda', 248, 1, 2, '2018-02-20'),
(180, 'dasd', 'asdas', 248, 0, 2, '2018-02-20'),
(181, 'dasd', 'asdasd', 248, 0, 3, '2018-02-21'),
(182, 'asdda', 'asda', 248, 1, 1, '2018-02-15');

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
(14, 'javier2', '$2y$10$oAOK4uDKT09/lle3g7vv2OzQl1q3xWwJSxIJ5NyiS9oZXKLREznAS', 1, 'javie marin', 'javier.marin@ikasle.egibide.org'),
(30, 'pepe', '$2y$10$SolKof4HZ0Gy0ICLQ286d.WQKyRFWremLZjn/2bRfUA2dUOLeAM32', 1, 'pesda', 'pruebasjavier3@gmail.com'),
(33, 'pepegasdad', '$2y$10$4Fn24AnkBfBrq6652K8dKeBbi/tqi4hYzXK9q9d0mbZhSaHTLsqhq', 0, 'asdas', 'dasda@mail.es'),
(34, 'pepegasdasd', '$2y$10$h53/QnuiGRr/eJcbl7OtCeoOgWcA8GwTgmiB5pta9QQfBL8aqfyLK', 0, 'asdasdfs', 'jose@prueba.com'),
(35, 'pep12312', '$2y$10$SrZgaToQzN2OQEq5JL/7TODUNDKgBdWRKG1JZoDJ8ArKi/k5ndwBi', 0, 'dasd', 'qwe@mail.es'),
(39, 'pepeg21', '$2y$10$EdqDOmlZEegf1cYoBXM1au6fjqFlhENBmC7xY518837hfsxhoIMg.', 0, 'qweq', 'antonio@prueba.coma');

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
  ADD UNIQUE KEY `participacion_unica_2` (`idusuario`,`idproyecto`),
  ADD KEY `fk_iduser_part` (`idusuario`),
  ADD KEY `fk_idpryecto_part` (`idproyecto`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_creador` (`creador`);

--
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_proyecto_unirse` (`idproyecto`),
  ADD KEY `fk_usuario_unirse` (`idusuario`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `asignacion`
--
ALTER TABLE `asignacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de la tabla `muro`
--
ALTER TABLE `muro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT de la tabla `participaciones`
--
ALTER TABLE `participaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

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
-- Filtros para la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD CONSTRAINT `solicitudes_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `solicitudes_ibfk_2` FOREIGN KEY (`idproyecto`) REFERENCES `proyectos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD CONSTRAINT `tareas_ibfk_1` FOREIGN KEY (`proyecto`) REFERENCES `proyectos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
