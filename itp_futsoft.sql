-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-05-2018 a las 06:22:32
-- Versión del servidor: 5.6.24
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
('FutSoft', 'http://futsoft.itp', 'La mejor Gestión de Torneos en Línea', 'FutSoft', '0', '1');

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
('AME', 'America', '#ffff00', '#0080c0', 10, 'America', 'Ciudad de Mexico', 0, '', 'http://static.wixstatic.com/media/409c89_c1f91e7a9629461e99e18f8d0d9f881b.png/v1/fill/w_568,h_568,al_c/409c89_c1f91e7a9629461e99e18f8d0d9f881b.png', 2, 0, 0, 0, 1, 0),
('ATL', 'Atlas', '#e80000', '#000000', 10, 'Atlas', 'Atlas', 0, '', 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4223.png', 0, 2, 0, 0, 1, 0),
('CAZ', 'Cruz Azul', '#0080ff', '#ffffff', 9, 'Cruz Azul', 'Ciudad de Mexico', 0, '', 'https://upload.wikimedia.org/wikipedia/commons/6/69/Escudo_Deportivo_Cruz_Azul.png', 0, 0, 1, 0, 0, 0),
('GDL', 'Guadalajara', '#0080ff', '#ff0000', 10, 'Guadalajara', 'Guadalajara', 0, '', 'https://elorbe.com//archivos_data/2017/05/3678.png', 0, 0, 0, 2, 0, 0),
('LEO', 'Leon', '#00a800', '#ffffff', 10, 'Leon', 'Leon', 0, '', 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/3981.png', 0, 0, 0, 0, 0, 0),
('MOR', 'Morelia', '#ffff00', '#ff0000', 10, 'Morelia', 'Morelia', 0, '', 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/3827.png', 0, 0, 0, 0, 0, 0),
('MTY', 'Monterrey', '#004080', '#ffffff', 10, 'Monterrey', 'Monterrey, Nuevo Leon', 0, '', 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4248.png', 0, 0, 0, 0, 0, 0),
('NCX', 'Necaxa', '#ff0000', '#ffffff', 10, 'Necaxa', 'Necaxa', 0, '', 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4282.png', 0, 0, 0, 0, 0, 0),
('PACH', 'Pachuca', '#0080c0', '#ffffff', 10, 'Pachuca', 'Pachuca de Soto', 0, '', 'http://img.futbox.com/v1/046/67c/ab0/165/931f264fd306d27553be_zoom.png', 0, 0, 0, 0, 0, 0),
('PUE', 'Puebla', '#0080c0', '#0080ff', 10, 'Puebla', 'Puebla', 0, '', 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/4246.png', 0, 0, 0, 0, 0, 0),
('QRO', 'Queretaro', '#004080', '#000000', 10, 'Queretaro', 'Queretaro', 0, '', 'http://as00.epimg.net/img/comunes/fotos/fichas/equipos/large/4251.png', 0, 0, 0, 0, 0, 0),
('STL', 'Santos Laguna', '#008040', '#ffffff', 10, 'Santos', 'Santos Laguna', 0, '', 'https://seeklogo.com/images/C/club-santos-laguna-logo-F4D3BDEE38-seeklogo.com.png', 0, 0, 0, 0, 0, 0),
('TJN', 'Tijuana', '#ff0000', '#ffffff', 10, 'Tijuana', 'Tijuana, Baja California', 0, '', 'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/3828.png', 0, 0, 0, 0, 0, 0),
('TOL', 'Toluca', '#ff0000', '#000000', 10, 'Toluca', 'Toluca, Mexico', 0, '', 'http://as00.epimg.net/img/comunes/fotos/fichas/equipos/large/4249.png', 0, 0, 0, 0, 0, 0),
('UNAM', 'UNAM', '#004080', '#808000', 10, 'UNAM', 'Ciudad Universitaria', 0, '', 'https://es.onefootball.com/wp-content/uploads/sites/12/2017/06/Pumas-UNAM.png', 0, 0, 0, 0, 0, 0),
('VER', 'Veracruz', '#0080c0', '#ff0000', 10, 'Veracruz', 'Veracruz', 0, '', 'http://as00.epimg.net/img/comunes/fotos/fichas/equipos/large/4247.png', 0, 0, 0, 0, 0, 0);

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
(1, 17, 'AME_10', 'a', '04:11:27'),
(2, 17, 'AME_10', 'a', '04:12:07'),
(3, 17, 'AME_10', 'r', '04:12:21'),
(4, 17, 'AME_10', 'r', '04:12:58'),
(5, 17, 'AME_10', 'a', '04:48:30'),
(6, 17, 'AME_10', 'r', '12:52:27');

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
(1, 17, 'AME_10', '03:11:20'),
(2, 17, 'AME_10', '03:12:45'),
(3, 17, 'AME_10', '03:12:57'),
(4, 17, 'AME_10', '04:10:28'),
(5, 17, 'AME_10', '04:52:22'),
(6, 17, 'AME_10', '06:43:23'),
(7, 17, 'no', '07:17:02'),
(8, 17, 'AME_10', '12:51:32'),
(9, 17, 'AME_10', '12:52:17'),
(10, 37, 'no', '01:05:21'),
(11, 18, 'CAZ_10', '03:12:21'),
(12, 18, 'CAZ_10', '03:12:51');

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
(3, 1, 'Temporada 2018 A', 8),
(11, 2, 'Temporada 2018 A', 8),
(12, 3, 'Temporada 2018 A', 8);

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
(17, 3, 1, '26/05/2018', '10:50:53', 'AME', 7, 'ATL', 1, '1', 'Perez', '0<br>Gol<br>Otro Gol<br>Falta del Equipo AME por parte del Jugador AME_10. Tarjeta: Amarilla<br>Gol del Equipo AME por parte del Jugador AME_10. En el minuto 04:52:22<br>Gol del Equipo AME por parte del Jugador AME_10. En el minuto 06:43:23<br>Gol del Equipo ATL por parte del Jugador no. En el minuto 07:17:02<br>Gol del Equipo AME por parte del Jugador AME_10. En el minuto 12:51:32<br>Gol del Equipo AME por parte del Jugador AME_10. En el minuto 12:52:17<br>Falta del Equipo AME por parte del Jug<br>el arbitro se apendejó'),
(18, 3, 1, '26/05/2018', '10:50:53', 'CAZ', 2, 'GDL', 0, '1', 'No definido', '<br>polasd<br>ó<br>Gol del Equipo CAZ por parte del Jugador CAZ_10. En el minuto 03:12:21<br>Gol del Equipo CAZ por parte del Jugador CAZ_10. En el minuto 03:12:51'),
(19, 3, 1, '31/05/2018', '11:50:53', 'LEO', 0, 'MOR', 0, '1', 'Pereira', '<br>gfgf'),
(20, 3, 1, '26/05/2018', '10:50:53', 'MTY', 0, 'NCX', 0, '1', 'No definido', NULL),
(21, 3, 1, '26/05/2018', '10:50:53', 'PACH', 0, 'PUE', 0, '1', 'No definido', NULL),
(22, 3, 1, '26/05/2018', '10:50:53', 'QRO', 0, 'STL', 0, '1', 'No definido', NULL),
(23, 3, 1, '26/05/2018', '10:50:53', 'TJN', 0, 'TOL', 0, '1', 'No definido', NULL),
(24, 3, 1, '26/05/2018', '10:50:53', 'UNAM', 0, 'VER', 0, '1', 'No definido', NULL),
(45, 11, 2, '21/05/2018', '01:32:08', 'ATL', 0, 'AME', 0, '1', 'No definido', NULL),
(46, 11, 2, '21/05/2018', '01:32:08', 'GDL', 0, 'CAZ', 0, '1', 'No definido', NULL),
(47, 11, 2, '21/05/2018', '01:32:08', 'MOR', 0, 'LEO', 0, '1', 'No definido', NULL),
(48, 11, 2, '21/05/2018', '01:32:08', 'NCX', 0, 'MTY', 0, '1', 'No definido', NULL),
(49, 11, 2, '21/05/2018', '01:32:08', 'PUE', 0, 'PACH', 0, '1', 'No definido', NULL),
(50, 11, 2, '21/05/2018', '01:32:08', 'STL', 0, 'QRO', 0, '1', 'No definido', NULL),
(51, 11, 2, '21/05/2018', '01:32:08', 'TOL', 0, 'TJN', 0, '1', 'No definido', NULL),
(52, 11, 2, '21/05/2018', '01:32:08', 'VER', 0, 'UNAM', 0, '1', 'No definido', NULL),
(53, 12, 3, '21/05/2018', '01:33:16', 'AME', 0, 'CAZ', 0, '0', 'No definido', NULL),
(54, 12, 3, '21/05/2018', '01:33:16', 'LEO', 0, 'MTY', 0, '0', 'No definido', NULL),
(55, 12, 3, '21/05/2018', '01:33:16', 'PACH', 0, 'QRO', 0, '0', 'No definido', NULL),
(56, 12, 3, '21/05/2018', '01:33:16', 'TJN', 0, 'UNAM', 0, '0', 'No definido', NULL);

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
  `photo` varchar(200) NOT NULL DEFAULT 'http://futsoft.itp/resources/wp-content/themes/footballclub-2.6.1/images/gallery/players/default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`id`, `nombre`, `ap_pa`, `ap_ma`, `equip_id`, `num`, `pos`, `edad`, `peso`, `estatura`, `capitan`, `goles`, `faltas`, `tar_r`, `tar_am`, `photo`) VALUES
('CAZ_10', 'Cabañas', 'Ameri', 'Rico', 'CAZ', 10, 'Delantero', 30, 88, 1.8, '0', 9, 6, 2, 3, 'http://futsoft.itp/resources/wp-content/themes/footballclub-2.6.1/images/gallery/players/default.jpg	');

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
(4, 'Temporada 2018 A', 'Admin'),
(5, 'Temporada 2018 B', 'Antonio');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `faltas`
--
ALTER TABLE `faltas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `goals`
--
ALTER TABLE `goals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `jornadas`
--
ALTER TABLE `jornadas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `juegos`
--
ALTER TABLE `juegos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT de la tabla `ranks`
--
ALTER TABLE `ranks`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `temporadas`
--
ALTER TABLE `temporadas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
