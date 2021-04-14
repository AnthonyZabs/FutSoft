-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 13-04-2021 a las 22:27:18
-- Versión del servidor: 5.7.21-log
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
-- Base de datos: `itp_futsoft`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `access_u_code`
--

CREATE TABLE `access_u_code` (
  `id` int(11) NOT NULL,
  `code` varchar(6) NOT NULL,
  `used` enum('0','1') NOT NULL DEFAULT '0',
  `usedby` varchar(50) DEFAULT NULL,
  `genby` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `access_u_code`
--

INSERT INTO `access_u_code` (`id`, `code`, `used`, `usedby`, `genby`) VALUES
(1, 'FUT123', '1', 'Admin', 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config_site`
--

CREATE TABLE `config_site` (
  `title` varchar(350) NOT NULL,
  `www` varchar(350) NOT NULL,
  `slogan` varchar(125) NOT NULL,
  `developed` varchar(350) NOT NULL,
  `mant` enum('0','1') NOT NULL DEFAULT '0',
  `regs` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `config_site`
--

INSERT INTO `config_site` (`title`, `www`, `slogan`, `developed`, `mant`, `regs`) VALUES
('FutSoft', 'http://futsoft.prj', 'La mejor Gestion de Torneos en Linea', 'FutSoft', '0', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id` varchar(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `uni_color1` varchar(50) NOT NULL,
  `uni_color2` varchar(50) NOT NULL,
  `vacantes` int(2) NOT NULL DEFAULT '10',
  `representante` varchar(100) NOT NULL,
  `domic` varchar(100) NOT NULL,
  `tel` int(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `escudo` varchar(500) NOT NULL DEFAULT 'http://futsoft.itp/resources/wp-content/themes/footballclub-2.6.1/images/esc_dftl.png',
  `vics` int(11) NOT NULL DEFAULT '0',
  `ders` int(11) NOT NULL DEFAULT '0',
  `gf` int(11) NOT NULL DEFAULT '0',
  `gc` int(11) NOT NULL DEFAULT '0',
  `jj` int(11) NOT NULL DEFAULT '0',
  `emps` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id`, `name`, `uni_color1`, `uni_color2`, `vacantes`, `representante`, `domic`, `tel`, `email`, `escudo`, `vics`, `ders`, `gf`, `gc`, `jj`, `emps`) VALUES
('AME', 'America', '#ffff00', '#0080c0', 3, 'America', 'Ciudad de Mexico', 0, '', 'http://static.wixstatic.com/media/409c89_c1f91e7a9629461e99e18f8d0d9f881b.png/v1/fill/w_568,h_568,al_c/409c89_c1f91e7a9629461e99e18f8d0d9f881b.png', 0, 0, 1, 2, 3, 3),
('ATL', 'Atlas', '#e80000', '#000000', 3, 'Atlas', 'Atlas', 0, '', 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4223.png', 1, 0, 3, 1, 3, 2),
('CAZ', 'Cruz Azul', '#0080ff', '#ffffff', 3, 'Cruz Azul', 'Ciudad de Mexico', 0, '', 'https://upload.wikimedia.org/wikipedia/commons/6/69/Escudo_Deportivo_Cruz_Azul.png', 1, 0, 4, 1, 3, 2),
('GDL', 'Guadalajara', '#0080ff', '#ff0000', 3, 'Guadalajara', 'Guadalajara', 0, '', 'https://cdn.worldvectorlogo.com/logos/chivas-guadalajara.svg', 0, 1, 1, 3, 3, 2),
('LEO', 'Leon', '#00a800', '#ffffff', 3, 'Leon', 'Leon', 0, '', 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/3981.png', 0, 1, 1, 4, 3, 2),
('MOR', 'Morelia', '#ffff00', '#ff0000', 3, 'Morelia', 'Morelia', 0, '', 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/3827.png', 0, 0, 2, 2, 3, 3),
('MTY', 'Monterrey', '#004080', '#ffffff', 3, 'Monterrey', 'Monterrey, Nuevo Leon', 0, '', 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4248.png', 0, 1, 0, 3, 3, 2),
('NCX', 'Necaxa', '#ff0000', '#ffffff', 3, 'Necaxa', 'Necaxa', 0, '', 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4282.png', 0, 0, 2, 2, 3, 3),
('PACH', 'Pachuca', '#0080c0', '#ffffff', 3, 'Pachuca', 'Pachuca de Soto', 0, '', 'https://s3.amazonaws.com/lmxwebsite/docs/archdgtl/AfldDrct/logos/11/11.png', 1, 0, 3, 0, 2, 1),
('PUE', 'Puebla', '#0080c0', '#0080ff', 3, 'Puebla', 'Puebla', 0, '', 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4246.png', 0, 1, 0, 1, 2, 1),
('QRO', 'Queretaro', '#004080', '#000000', 3, 'Queretaro', 'Queretaro', 0, '', 'http://as00.epimg.net/img/comunes/fotos/fichas/equipos/large/4251.png', 1, 0, 2, 0, 2, 1),
('STL', 'Santos Laguna', '#008040', '#ffffff', 3, 'Santos', 'Santos Laguna', 0, '', 'https://seeklogo.com/images/C/club-santos-laguna-logo-F4D3BDEE38-seeklogo.com.png', 1, 0, 1, 0, 2, 1),
('TJN', 'Tijuana', '#ff0000', '#ffffff', 3, 'Tijuana', 'Tijuana, Baja California', 0, '', 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/3828.png', 0, 1, 0, 2, 2, 1),
('TOL', 'Toluca', '#ff0000', '#000000', 3, 'Toluca', 'Toluca, Mexico', 0, '', 'http://as00.epimg.net/img/comunes/fotos/fichas/equipos/large/4249.png', 0, 0, 1, 3, 2, 2),
('UNAM', 'UNAM', '#004080', '#808000', 3, 'UNAM', 'Ciudad Universitaria', 0, '', 'http://as00.epimg.net/img/comunes/fotos/fichas/equipos/large/1597.png', 0, 0, 2, 1, 2, 2),
('VER', 'Veracruz', '#0080c0', '#ff0000', 3, 'Veracruz', 'Veracruz', 0, '', 'http://as00.epimg.net/img/comunes/fotos/fichas/equipos/large/4247.png', 0, 0, 3, 1, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `faltas`
--

CREATE TABLE `faltas` (
  `id` int(11) NOT NULL,
  `juego_id` int(11) NOT NULL,
  `jugador_id` varchar(10) NOT NULL,
  `tarjeta` enum('n','a','r') NOT NULL DEFAULT 'n',
  `minut` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `faltas`
--

INSERT INTO `faltas` (`id`, `juego_id`, `jugador_id`, `tarjeta`, `minut`) VALUES
(1, 1, 'ATL_4', 'a', '16:24:45'),
(2, 3, 'STL_2', 'a', '04:02:24'),
(3, 5, 'LEO_3', 'r', '04:05:26'),
(4, 6, 'MTY_4', 'a', '16:08:12'),
(5, 8, 'AME_7', 'a', '16:24:02'),
(6, 8, 'AME_6', 'r', '16:43:08'),
(7, 13, 'no', 'a', '16:33:01'),
(8, 15, 'QRO_5', 'a', '16:22:58'),
(9, 16, 'AME_6', 'n', '16:22:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `goals`
--

CREATE TABLE `goals` (
  `id` int(11) NOT NULL,
  `juego_id` int(11) NOT NULL,
  `jugador_id` varchar(10) NOT NULL,
  `minut` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `goals`
--

INSERT INTO `goals` (`id`, `juego_id`, `jugador_id`, `minut`) VALUES
(1, 1, 'ATL_1', '16:10:15'),
(2, 2, 'NCX_4', '16:20:37'),
(3, 2, 'MOR_7', '16:33:56'),
(4, 2, 'NCX_3', '16:45:08'),
(5, 4, 'VER_6', '16:35:41'),
(6, 4, 'VER_5', '16:44:53'),
(7, 5, 'LEO_6', '16:06:37'),
(8, 5, 'CAZ_5', '04:15:46'),
(9, 5, 'CAZ_6', '04:24:55'),
(10, 5, 'CAZ_7', '16:33:06'),
(11, 6, 'PACH_2', '04:08:01'),
(12, 7, 'QRO_5', '16:08:26'),
(13, 8, 'UNAM_7', '16:08:40'),
(14, 8, 'AME_3', '16:13:48'),
(15, 9, 'GDL_2', '16:13:09'),
(16, 9, 'ATL_5', '16:32:18'),
(17, 9, 'ATL_5', '16:44:07'),
(18, 10, 'MOR_6', '16:14:34'),
(19, 11, 'STL_6', '16:15:01'),
(20, 12, 'TOL_7', '16:15:12'),
(21, 12, 'VER_6', '16:23:28'),
(22, 13, 'CAZ_5', '16:15:55'),
(23, 14, 'PACH_5', '16:16:21'),
(24, 14, 'PACH_7', '16:44:28'),
(25, 15, 'QRO_4', '16:16:48'),
(26, 16, 'UNAM_5', '16:17:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornadas`
--

CREATE TABLE `jornadas` (
  `id` int(11) NOT NULL,
  `num` int(2) NOT NULL,
  `temporada` varchar(100) NOT NULL,
  `juegos` int(2) NOT NULL DEFAULT '8'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `jornadas`
--

INSERT INTO `jornadas` (`id`, `num`, `temporada`, `juegos`) VALUES
(1, 1, 'Temporada 2019 A', 8),
(2, 2, 'Temporada 2019 A', 8),
(3, 3, 'Temporada 2019 A', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juegos`
--

CREATE TABLE `juegos` (
  `id` int(11) NOT NULL,
  `fkjornid` int(11) DEFAULT NULL,
  `jornid` int(11) NOT NULL,
  `fech` varchar(100) NOT NULL,
  `hour` varchar(100) NOT NULL,
  `equip1` varchar(100) NOT NULL,
  `goals1` int(2) NOT NULL DEFAULT '0',
  `equip2` varchar(100) NOT NULL,
  `goals2` int(2) NOT NULL DEFAULT '0',
  `played` enum('0','1') NOT NULL DEFAULT '0',
  `arb` varchar(100) DEFAULT 'No definido',
  `comments` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `juegos`
--

INSERT INTO `juegos` (`id`, `fkjornid`, `jornid`, `fech`, `hour`, `equip1`, `goals1`, `equip2`, `goals2`, `played`, `arb`, `comments`) VALUES
(1, 1, 1, '04/11/2019', '16:00', 'ATL', 1, 'GDL', 0, '1', 'Mario Ruiz', '<br>Gol del Equipo Atlas por parte del Jugador Agustín. En el minuto 16:10:15<br>Falta del Equipo Atlas por parte del Jugador Bruno. Tarjeta: Amarilla. En el minuto 16:24:45'),
(2, 1, 1, '05/11/2019', '16:00', 'MOR', 1, 'NCX', 2, '1', 'Mario Ruiz', '<br>Gol del Equipo Necaxa por parte del Jugador Hugo. En el minuto 16:20:37<br>Gol del Equipo Morelia por parte del Jugador Salvador. En el minuto 16:33:56<br>Gol del Equipo Necaxa por parte del Jugador Maximiliano. En el minuto 16:45:08'),
(3, 1, 1, '06/11/2019', '16:00', 'PUE', 0, 'STL', 0, '1', 'Mario Ruiz', '<br>Falta del Equipo Santos Laguna por parte del Jugador Francisco. Tarjeta: Amarilla. En el minuto 04:02:24'),
(4, 1, 1, '07/11/2019', '16:00', 'TOL', 0, 'VER', 2, '1', 'Mario Ruiz', '<br>Gol del Equipo Veracruz por parte del Jugador Carlon. En el minuto 16:35:41<br>Gol del Equipo Veracruz por parte del Jugador Daniel. En el minuto 16:44:53'),
(5, 1, 1, '08/11/2019', '16:00', 'CAZ', 3, 'LEO', 1, '1', 'Mario Ruiz', '<br>Falta del Equipo Leon por parte del Jugador Luis. Tarjeta: Roja. En el minuto 04:05:26<br>Gol del Equipo Leon por parte del Jugador Ángel. En el minuto 16:06:37<br>Gol del Equipo Cruz Azul por parte del Jugador Christian. En el minuto 04:15:46<br>Gol del Equipo Cruz Azul por parte del Jugador Joel. En el minuto 04:24:55<br>Gol del Equipo Cruz Azul por parte del Jugador Roberto. En el minuto 16:33:06'),
(6, 1, 1, '09/11/2019', '16:00', 'MTY', 0, 'PACH', 1, '1', 'Parra Ramirez', '<br>Gol del Equipo Pachuca por parte del Jugador Samuel. En el minuto 04:08:01<br>Falta del Equipo Monterrey por parte del Jugador Dorlan. Tarjeta: Amarilla. En el minuto 16:08:12'),
(7, 1, 1, '10/11/2019', '16:00', 'QRO', 1, 'TJN', 0, '1', 'Parra Ramirez', '<br>Gol del Equipo Queretaro por parte del Jugador Yael. En el minuto 16:08:26'),
(8, 1, 1, '11/11/2019', '16:00', 'UNAM', 1, 'AME', 1, '1', 'Parra Ramirez', '<br>Gol del Equipo UNAM por parte del Jugador Alfredo. En el minuto 16:08:40<br>Gol del Equipo America por parte del Jugador Ernesto. En el minuto 16:13:48<br>Falta del Equipo America por parte del Jugador Pedro. Tarjeta: Amarilla. En el minuto 16:24:02<br>Falta del Equipo America por parte del Jugador Jorge. Tarjeta: Roja. En el minuto 16:43:08'),
(9, 2, 2, '12/12/2019', '16:00', 'GDL', 1, 'ATL', 2, '1', 'Mario Ruiz', '<br>Gol del Equipo Guadalajara por parte del Jugador Héctor. En el minuto 16:13:09<br>Gol del Equipo Atlas por parte del Jugador Jorge. En el minuto 16:32:18<br>Gol del Equipo Atlas por parte del Jugador Jorge. En el minuto 16:44:07'),
(10, 2, 2, '12/12/2019', '16:00', 'NCX', 0, 'MOR', 1, '1', 'Mario Ruiz', '<br>Gol del Equipo Morelia por parte del Jugador Luis. En el minuto 16:14:34'),
(11, 2, 2, '12/12/2019', '16:00', 'STL', 1, 'PUE', 0, '1', 'Mario Ruiz', '<br>Gol del Equipo Santos Laguna por parte del Jugador Fernando. En el minuto 16:15:01'),
(12, 2, 2, '12/12/2019', '16:00', 'VER', 1, 'TOL', 1, '1', 'Mario Ruiz', '<br>Gol del Equipo Toluca por parte del Jugador Emmanuel. En el minuto 16:15:12<br>Gol del Equipo Veracruz por parte del Jugador Carlon. En el minuto 16:23:28'),
(13, 2, 2, '12/12/2019', '16:00', 'LEO', 0, 'CAZ', 1, '1', 'Mario Ruiz', '<br>Gol del Equipo Cruz Azul por parte del Jugador Christian. En el minuto 16:15:55<br>Falta del Equipo Leon por parte del Jugador . Tarjeta: Amarilla. En el minuto 16:33:01'),
(14, 2, 2, '12/12/2019', '16:00', 'PACH', 2, 'MTY', 0, '1', 'Mario Ruiz', '<br>Gol del Equipo Pachuca por parte del Jugador Antonio. En el minuto 16:16:21<br>Gol del Equipo Pachuca por parte del Jugador Carlos. En el minuto 16:44:28'),
(15, 2, 2, '12/12/2019', '16:00', 'TJN', 0, 'QRO', 1, '1', 'Mario Ruiz', '<br>Gol del Equipo Queretaro por parte del Jugador Jacinto. En el minuto 16:16:48<br>Falta del Equipo Queretaro por parte del Jugador Yael. Tarjeta: Amarilla. En el minuto 16:22:58'),
(16, 2, 2, '12/12/2019', '16:00', 'AME', 0, 'UNAM', 1, '1', 'Mario Ruiz', '<br>Gol del Equipo UNAM por parte del Jugador Felipe. En el minuto 16:17:14<br>Falta del Equipo America por parte del Jugador Jorge. Tarjeta: Ninguna. En el minuto 16:22:21'),
(17, 3, 3, '13/12/2019', '16:00', 'ATL', 0, 'MOR', 0, '0', 'No definido', NULL),
(18, 3, 3, '14/12/2019', '16:00', 'STL', 0, 'VER', 0, '0', 'No definido', NULL),
(19, 3, 3, '15/12/2019', '16:00', 'CAZ', 0, 'PACH', 0, '0', 'No definido', NULL),
(20, 3, 3, '16/12/2019', '16:00', 'QRO', 0, 'UNAM', 0, '0', 'No definido', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

CREATE TABLE `jugadores` (
  `id` varchar(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ap_pa` varchar(100) NOT NULL,
  `ap_ma` varchar(100) NOT NULL,
  `equip_id` varchar(5) DEFAULT NULL,
  `num` int(3) NOT NULL,
  `pos` varchar(50) NOT NULL,
  `edad` int(2) NOT NULL,
  `peso` float NOT NULL,
  `estatura` float NOT NULL,
  `capitan` enum('0','1') NOT NULL DEFAULT '0',
  `goles` int(100) NOT NULL DEFAULT '0',
  `faltas` int(11) DEFAULT '0',
  `tar_r` int(11) NOT NULL DEFAULT '0',
  `tar_am` int(11) NOT NULL DEFAULT '0',
  `photo` varchar(200) NOT NULL DEFAULT '/resources/wp-content/themes/footballclub-2.6.1/images/gallery/players/default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`id`, `nombre`, `ap_pa`, `ap_ma`, `equip_id`, `num`, `pos`, `edad`, `peso`, `estatura`, `capitan`, `goles`, `faltas`, `tar_r`, `tar_am`, `photo`) VALUES
('AME_1', 'Enrique', 'Mendoza', 'Pérez', 'AME', 1, 'Portero', 23, 74, 1.76, '1', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('AME_2', 'Raúl', 'Pérez', 'Figueroa', 'AME', 2, 'Jugador', 29, 77, 1.56, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('AME_3', 'Ernesto', 'Castro', 'Martínez', 'AME', 3, 'Jugador', 20, 67, 1.65, '0', 1, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('AME_4', 'Juan', 'Hernández', 'Montaño', 'AME', 4, 'Jugador', 25, 63, 1.68, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('AME_5', 'Luis', 'García', 'Pérez', 'AME', 5, 'Jugador', 19, 76, 1.89, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('AME_6', 'Jorge', 'Gutierrez', 'Peña', 'AME', 6, 'Jugador', 19, 71, 1.83, '0', 0, 2, 1, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('AME_7', 'Pedro', 'González', 'Pavana', 'AME', 7, 'Jugador', 19, 68, 1.6, '0', 0, 1, 0, 1, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('ATL_1', 'Agustín', 'Marchesin', 'Hernández', 'ATL', 1, 'Portero', 24, 69, 1.67, '1', 1, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('ATL_2', 'Paul', 'Aguilar', 'Torres', 'ATL', 2, 'Jugador', 20, 79, 1.66, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('ATL_3', 'Emmanuel', 'Aguilera', 'Sosa', 'ATL', 3, 'Jugador', 26, 69, 1.73, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('ATL_4', 'Bruno', 'Valdéz', 'López', 'ATL', 4, 'Jugador', 26, 67, 1.76, '0', 0, 1, 0, 1, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('ATL_5', 'Jorge', 'Sánchez', 'Alvarado', 'ATL', 5, 'Jugador', 21, 69, 1.73, '0', 2, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('ATL_6', 'Edson', 'Álvarez', 'Martínez', 'ATL', 6, 'Jugador', 26, 64, 1.84, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('ATL_7', 'Guido', 'Rodríguez', 'Trejo', 'ATL', 7, 'Jugador', 25, 74, 1.76, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('CAZ_1', 'Julio', 'Domínguez', 'Méndez', 'CAZ', 1, 'Portero', 17, 78, 1.71, '1', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('CAZ_2', 'Juan', 'Escobar', 'Pérez', 'CAZ', 2, 'Jugador', 20, 70, 1.75, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('CAZ_3', 'Igor', 'Lichnovsky', 'Luka', 'CAZ', 3, 'Jugador', 20, 77, 1.73, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('CAZ_4', 'Andrían', 'Aldrete', 'Herrera', 'CAZ', 4, 'Jugador', 22, 74, 1.85, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('CAZ_5', 'Christian', 'Jiménez', 'Fernández', 'CAZ', 5, 'Jugador', 21, 79, 1.83, '0', 2, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('CAZ_6', 'Joel', 'Pineda', 'Gómez', 'CAZ', 6, 'Jugador', 22, 74, 1.71, '0', 1, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('CAZ_7', 'Roberto', 'Baca', 'Yotún', 'CAZ', 7, 'Jugador', 17, 72, 1.85, '0', 1, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('GDL_1', 'Salvador', 'Reyes', 'Mendoza', 'GDL', 1, 'Portero', 18, 61, 1.87, '1', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('GDL_2', 'Héctor', 'Torres', 'Hernández', 'GDL', 2, 'Jugador', 21, 66, 1.58, '0', 1, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('GDL_3', 'Francisco', 'Jara', 'Villegaz', 'GDL', 3, 'Jugador', 21, 71, 1.77, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('GDL_4', 'Williams', 'Gómez', 'Sepúlveda', 'GDL', 4, 'Jugador', 25, 78, 1.89, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('GDL_5', 'José', 'Martínez', 'Duarte', 'GDL', 5, 'Jugador', 22, 75, 1.87, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('GDL_6', 'Benjamín', 'Galíndo', 'Bravo', 'GDL', 6, 'Jugador', 29, 61, 1.77, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('GDL_7', 'Marco', 'Fabían', 'Morales', 'GDL', 7, 'Jugador', 24, 62, 1.73, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('LEO_1', 'Juan', 'Macias', 'Pérez', 'LEO', 1, 'Portero', 18, 68, 1.79, '1', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('LEO_2', 'Pedro', 'Aquino', 'Sánchez', 'LEO', 2, 'Jugador', 26, 72, 1.86, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('LEO_3', 'Luis', 'Montes', 'Jiménez', 'LEO', 3, 'Jugador', 22, 60, 1.7, '0', 0, 1, 1, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('LEO_4', 'Yairo', 'Moreno', 'Luna', 'LEO', 4, 'Jugador', 27, 61, 1.73, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('LEO_5', 'Fernando', 'Navarro', 'Morán', 'LEO', 5, 'Jugador', 25, 68, 1.64, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('LEO_6', 'Ángel', 'Mena', 'Reyes', 'LEO', 6, 'Jugador', 17, 78, 1.81, '0', 1, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('LEO_7', 'Ismael', 'Sosa', 'Antuna', 'LEO', 7, 'Jugador', 17, 66, 1.89, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MOR_1', 'Sebastian', 'Sosa', 'Calero', 'MOR', 1, 'Portero', 18, 74, 1.78, '1', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MOR_2', 'Fernando', 'Aristeguieta', 'Munch', 'MOR', 2, 'Jugador', 23, 74, 1.67, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MOR_3', 'José', 'Joaquín', 'Martinez', 'MOR', 3, 'Jugador', 29, 71, 1.83, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MOR_4', 'José', 'Ortiz', 'Cortes', 'MOR', 4, 'Jugador', 24, 70, 1.88, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MOR_5', 'Mario', 'Osuna', 'Villanueva', 'MOR', 5, 'Jugador', 29, 60, 1.69, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MOR_6', 'Luis', 'Mendoza', 'Elizalde', 'MOR', 6, 'Jugador', 19, 69, 1.6, '0', 1, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MOR_7', 'Salvador', 'Reyes', 'Chávez', 'MOR', 7, 'Jugador', 27, 67, 1.75, '0', 1, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MTY_1', 'Rogelio', 'Funes', 'Mori', 'MTY', 1, 'Portero', 26, 70, 1.72, '1', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MTY_2', 'Vicent', 'Janssen', 'Pérez', 'MTY', 2, 'Jugador', 18, 66, 1.78, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MTY_3', 'Rodolfo', 'Pizarro', 'Pipa', 'MTY', 3, 'Jugador', 22, 61, 1.83, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MTY_4', 'Dorlan', 'Pabón', 'Morales', 'MTY', 4, 'Jugador', 26, 68, 1.59, '0', 0, 1, 0, 1, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MTY_5', 'Avilés', 'Hurtado', 'Puch', 'MTY', 5, 'Jugador', 23, 78, 1.61, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MTY_6', 'Jonathan', 'Urretaviscaya', 'Cruz', 'MTY', 6, 'Jugador', 18, 67, 1.74, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MTY_7', 'Jesús', 'Gallardo', 'Zabalegui', 'MTY', 7, 'Jugador', 20, 62, 1.63, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('NCX_1', 'Mauro', 'Quiroga', 'Durán', 'NCX', 1, 'Portero', 26, 68, 1.74, '1', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('NCX_2', 'Cristian', 'Calderón', 'Sánchez', 'NCX', 2, 'Jugador', 18, 75, 1.55, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('NCX_3', 'Maximiliano', 'Salas', 'Montaño', 'NCX', 3, 'Jugador', 19, 73, 1.69, '0', 1, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('NCX_4', 'Hugo', 'González', 'Dario', 'NCX', 4, 'Jugador', 27, 79, 1.56, '0', 1, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('NCX_5', 'Felipe', 'Gallegos', 'Diaz', 'NCX', 5, 'Jugador', 23, 77, 1.87, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('NCX_6', 'Ventura', 'Alvarado', 'Rey', 'NCX', 6, 'Jugador', 18, 70, 1.73, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('NCX_7', 'Juan', 'Delgado', 'Baeza', 'NCX', 7, 'Jugador', 18, 78, 1.86, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('PACH_1', 'Evaristo', 'Lugo', 'Hernández', 'PACH', 1, 'Portero', 18, 60, 1.86, '1', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('PACH_2', 'Samuel', 'Ruíz', 'Ramírez', 'PACH', 2, 'Jugador', 21, 69, 1.84, '0', 1, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('PACH_3', 'Joel', 'Mendez', 'Moca', 'PACH', 3, 'Jugador', 22, 63, 1.73, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('PACH_4', 'Ricardo', 'Esparza', 'Torres', 'PACH', 4, 'Jugador', 18, 70, 1.56, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('PACH_5', 'Antonio', 'López', 'Cruz', 'PACH', 5, 'Jugador', 19, 61, 1.79, '0', 1, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('PACH_6', 'Manuel', 'Fernández', 'Ramírez', 'PACH', 6, 'Jugador', 24, 77, 1.67, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('PACH_7', 'Carlos', 'Montes', 'Pérez', 'PACH', 7, 'Jugador', 22, 63, 1.79, '0', 1, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('PUE_1', 'José', 'Castro', 'Cañedo', 'PUE', 1, 'Portero', 22, 66, 1.7, '1', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('PUE_2', 'Miguel', 'Pagola', 'Aguilar', 'PUE', 2, 'Jugador', 27, 78, 1.6, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('PUE_3', 'Erick', 'Calva', 'Lugo', 'PUE', 3, 'Jugador', 27, 72, 1.67, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('PUE_4', 'Emilio', 'Muñiz', 'Sánchez', 'PUE', 4, 'Jugador', 22, 69, 1.68, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('PUE_5', 'Jonathan', 'Cerón', 'Salinas', 'PUE', 5, 'Jugador', 29, 69, 1.84, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('PUE_6', 'Jaime', 'González', 'Santana', 'PUE', 6, 'Jugador', 22, 60, 1.55, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('PUE_7', 'Saúl', 'Villamil', 'Carmona', 'PUE', 7, 'Jugador', 20, 73, 1.73, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('QRO_1', 'Eduardo', 'Pérez', 'Sánchez', 'QRO', 1, 'Portero', 18, 66, 1.78, '1', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('QRO_2', 'Emmanuel', 'Valenzuela', 'Cruz', 'QRO', 2, 'Jugador', 26, 71, 1.79, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('QRO_3', 'Edgar', 'Torres', 'Torres', 'QRO', 3, 'Jugador', 20, 79, 1.73, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('QRO_4', 'Jacinto', 'Salvatori', 'Juárez', 'QRO', 4, 'Jugador', 20, 60, 1.75, '0', 1, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('QRO_5', 'Yael', 'Alcántara', 'González', 'QRO', 5, 'Jugador', 25, 65, 1.65, '0', 1, 1, 0, 1, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('QRO_6', 'Cristian', 'Aguilar', 'Hernández', 'QRO', 6, 'Jugador', 19, 65, 1.81, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('QRO_7', 'Julio', 'Esquivel', 'Bermúdez', 'QRO', 7, 'Jugador', 19, 69, 1.85, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('STL_1', 'Gabriel', 'Saltillo', 'Gómez', 'STL', 1, 'Portero', 19, 73, 1.56, '1', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('STL_2', 'Francisco', 'Suárez', 'Zabalegui', 'STL', 2, 'Jugador', 22, 77, 1.77, '0', 0, 1, 0, 1, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('STL_3', 'Oswaldo', 'Lagarde', 'Montesori', 'STL', 3, 'Jugador', 25, 67, 1.56, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('STL_4', 'Bryant', 'Baca', 'Ramírez', 'STL', 4, 'Jugador', 18, 66, 1.65, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('STL_5', 'Ryan', 'Rojas', 'Mendez', 'STL', 5, 'Jugador', 22, 67, 1.66, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('STL_6', 'Fernando', 'Castelán', 'Torres', 'STL', 6, 'Jugador', 27, 60, 1.83, '0', 1, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('STL_7', 'Diego', 'Andrade', 'Calva', 'STL', 7, 'Jugador', 26, 76, 1.57, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('TJN_1', 'Miller', 'Bolaños', 'Reasco', 'TJN', 1, 'Portero', 21, 64, 1.85, '1', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('TJN_2', 'gibrand', 'Lajud', 'bojalil', 'TJN', 2, 'Jugador', 21, 72, 1.62, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('TJN_3', 'Erick', 'Torres', 'Padilla', 'TJN', 3, 'Jugador', 26, 68, 1.68, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('TJN_4', 'Camilo', 'Da Silva', 'Sanbezzo', 'TJN', 4, 'Jugador', 25, 63, 1.67, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('TJN_5', 'Ariel', 'Gerardo', 'Nahuelpan', 'TJN', 5, 'Jugador', 18, 75, 1.76, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('TJN_6', 'Luis', 'Michel', 'Vergara', 'TJN', 6, 'Jugador', 25, 63, 1.89, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('TJN_7', 'Kevin', 'Balanta', 'Pérez', 'TJN', 7, 'Jugador', 28, 71, 1.57, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('TOL_1', 'Alfredo', 'Talavera', 'Dias', 'TOL', 1, 'Portero', 23, 66, 1.68, '1', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('TOL_2', 'Gaston', 'Sauro', 'Pérez', 'TOL', 2, 'Jugador', 26, 78, 1.8, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('TOL_3', 'Diego', 'Rigonato ', 'Rodriguez', 'TOL', 3, 'Jugador', 20, 72, 1.7, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('TOL_4', 'Rodrigo', 'Salinas', 'Dorantes', 'TOL', 4, 'Jugador', 17, 66, 1.55, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('TOL_5', 'Pedro', 'Alexis', 'Canelo', 'TOL', 5, 'Jugador', 23, 76, 1.82, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('TOL_6', 'Antonio', 'Rios', 'Martinez', 'TOL', 6, 'Jugador', 23, 63, 1.87, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('TOL_7', 'Emmanuel', 'Gigliotti', 'Padilla', 'TOL', 7, 'Jugador', 27, 66, 1.62, '0', 1, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('UNAM_1', 'Juan', 'Iturbe', 'Arevalos', 'UNAM', 1, 'Portero', 24, 62, 1.64, '1', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('UNAM_2', 'Carlos', 'Gonzalez', 'Pinola', 'UNAM', 2, 'Jugador', 23, 71, 1.79, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('UNAM_3', 'Martin', 'Vladimir ', 'Rodriguez', 'UNAM', 3, 'Jugador', 24, 71, 1.78, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('UNAM_4', 'Pablo', 'Barrera', 'Acosta', 'UNAM', 4, 'Jugador', 25, 61, 1.65, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('UNAM_5', 'Felipe', 'Mora', 'Aliaga ', 'UNAM', 5, 'Jugador', 20, 72, 1.73, '0', 1, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('UNAM_6', 'Nicolas', 'Mendoza', 'Freire ', 'UNAM', 6, 'Jugador', 24, 78, 1.8, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('UNAM_7', 'Alfredo', 'Saldivar', 'Medina', 'UNAM', 7, 'Jugador', 19, 76, 1.56, '0', 1, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('VER_1', 'Gabriel', 'Martin', 'Peñalba', 'VER', 1, 'Portero', 17, 65, 1.57, '1', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('VER_2', 'Richards', 'Kâzim', 'Colin ', 'VER', 2, 'Jugador', 25, 77, 1.59, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('VER_3', 'Sebastian', 'Jurado', 'Roca', 'VER', 3, 'Jugador', 19, 70, 1.72, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('VER_4', 'Angel', 'Reyna', 'Martinez', 'VER', 4, 'Jugador', 29, 62, 1.6, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('VER_5', 'Daniel', 'Alberto', 'Villalva', 'VER', 5, 'Jugador', 18, 79, 1.63, '0', 1, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('VER_6', 'Carlon', 'Arnoldo', 'Salcido', 'VER', 6, 'Jugador', 28, 69, 1.8, '0', 2, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('VER_7', 'Edgar', 'Meliton', 'Hernandez', 'VER', 7, 'Jugador', 29, 70, 1.89, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ranks`
--

CREATE TABLE `ranks` (
  `id` int(7) NOT NULL,
  `rank` int(7) NOT NULL,
  `name` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ranks`
--

INSERT INTO `ranks` (`id`, `rank`, `name`) VALUES
(1, 1, 'Administrador'),
(2, 2, 'Dueño');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temporadas`
--

CREATE TABLE `temporadas` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `genby` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `temporadas`
--

INSERT INTO `temporadas` (`id`, `name`, `genby`) VALUES
(1, 'Temporada 2019 A', 'Antonio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(7) NOT NULL,
  `name` varchar(125) NOT NULL,
  `user` varchar(45) NOT NULL,
  `pass` varchar(350) NOT NULL,
  `email` varchar(350) NOT NULL,
  `ip` varchar(350) NOT NULL,
  `day_reg` varchar(350) NOT NULL,
  `rank` int(7) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `user`, `pass`, `email`, `ip`, `day_reg`, `rank`) VALUES
(1, 'Antonio Aguilar', 'Antonio', 'H-CDU93AE.69B,F(Y9#0R9C8P-V4V.#0R-&0V-C<X8C<Q-C4P,6(R,P``\n`\n', 'fut@msn.com', '127.0.0.1', '1527271579', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `access_u_code`
--
ALTER TABLE `access_u_code`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `config_site`
--
ALTER TABLE `config_site`
  ADD PRIMARY KEY (`title`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `faltas`
--
ALTER TABLE `faltas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `jornadas`
--
ALTER TABLE `jornadas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `juegos`
--
ALTER TABLE `juegos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ranks`
--
ALTER TABLE `ranks`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `temporadas`
--
ALTER TABLE `temporadas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `access_u_code`
--
ALTER TABLE `access_u_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `faltas`
--
ALTER TABLE `faltas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `goals`
--
ALTER TABLE `goals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `jornadas`
--
ALTER TABLE `jornadas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `juegos`
--
ALTER TABLE `juegos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `ranks`
--
ALTER TABLE `ranks`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `temporadas`
--
ALTER TABLE `temporadas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
