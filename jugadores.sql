-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 28-11-2019 a las 11:27:29
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
('AME_3', 'Ernesto', 'Castro', 'Martínez', 'AME', 3, 'Jugador', 20, 67, 1.65, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('AME_4', 'Juan', 'Hernández', 'Montaño', 'AME', 4, 'Jugador', 25, 63, 1.68, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('AME_5', 'Luis', 'García', 'Pérez', 'AME', 5, 'Jugador', 19, 76, 1.89, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('AME_6', 'Jorge', 'Gutierrez', 'Peña', 'AME', 6, 'Jugador', 19, 71, 1.83, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('AME_7', 'Pedro', 'González', 'Pavana', 'AME', 7, 'Jugador', 19, 68, 1.6, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('ATL_1', 'Agustín', 'Marchesin', 'Hernández', 'ATL', 1, 'Portero', 24, 69, 1.67, '1', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('ATL_2', 'Paul', 'Aguilar', 'Torres', 'ATL', 2, 'Jugador', 20, 79, 1.66, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('ATL_3', 'Emmanuel', 'Aguilera', 'Sosa', 'ATL', 3, 'Jugador', 26, 69, 1.73, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('ATL_4', 'Bruno', 'Valdéz', 'López', 'ATL', 4, 'Jugador', 26, 67, 1.76, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('ATL_5', 'Jorge', 'Sánchez', 'Alvarado', 'ATL', 5, 'Jugador', 21, 69, 1.73, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('ATL_6', 'Edson', 'Álvarez', 'Martínez', 'ATL', 6, 'Jugador', 26, 64, 1.84, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('ATL_7', 'Guido', 'Rodríguez', 'Trejo', 'ATL', 7, 'Jugador', 25, 74, 1.76, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('CAZ_1', 'Julio', 'Domínguez', 'Méndez', 'CAZ', 1, 'Portero', 17, 78, 1.71, '1', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('CAZ_2', 'Juan', 'Escobar', 'Pérez', 'CAZ', 2, 'Jugador', 20, 70, 1.75, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('CAZ_3', 'Igor', 'Lichnovsky', 'Luka', 'CAZ', 3, 'Jugador', 20, 77, 1.73, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('CAZ_4', 'Andrían', 'Aldrete', 'Herrera', 'CAZ', 4, 'Jugador', 22, 74, 1.85, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('CAZ_5', 'Christian', 'Jiménez', 'Fernández', 'CAZ', 5, 'Jugador', 21, 79, 1.83, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('CAZ_6', 'Joel', 'Pineda', 'Gómez', 'CAZ', 6, 'Jugador', 22, 74, 1.71, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('CAZ_7', 'Roberto', 'Baca', 'Yotún', 'CAZ', 7, 'Jugador', 17, 72, 1.85, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('GDL_1', 'Salvador', 'Reyes', 'Mendoza', 'GDL', 1, 'Portero', 18, 61, 1.87, '1', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('GDL_2', 'Héctor', 'Torres', 'Hernández', 'GDL', 2, 'Jugador', 21, 66, 1.58, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('GDL_3', 'Francisco', 'Jara', 'Villegaz', 'GDL', 3, 'Jugador', 21, 71, 1.77, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('GDL_4', 'Williams', 'Gómez', 'Sepúlveda', 'GDL', 4, 'Jugador', 25, 78, 1.89, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('GDL_5', 'José', 'Martínez', 'Duarte', 'GDL', 5, 'Jugador', 22, 75, 1.87, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('GDL_6', 'Benjamín', 'Galíndo', 'Bravo', 'GDL', 6, 'Jugador', 29, 61, 1.77, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('GDL_7', 'Marco', 'Fabían', 'Morales', 'GDL', 7, 'Jugador', 24, 62, 1.73, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('LEO_1', 'Juan', 'Macias', 'Pérez', 'LEO', 1, 'Portero', 18, 68, 1.79, '1', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('LEO_2', 'Pedro', 'Aquino', 'Sánchez', 'LEO', 2, 'Jugador', 26, 72, 1.86, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('LEO_3', 'Luis', 'Montes', 'Jiménez', 'LEO', 3, 'Jugador', 22, 60, 1.7, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('LEO_4', 'Yairo', 'Moreno', 'Luna', 'LEO', 4, 'Jugador', 27, 61, 1.73, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('LEO_5', 'Fernando', 'Navarro', 'Morán', 'LEO', 5, 'Jugador', 25, 68, 1.64, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('LEO_6', 'Ángel', 'Mena', 'Reyes', 'LEO', 6, 'Jugador', 17, 78, 1.81, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('LEO_7', 'Ismael', 'Sosa', 'Antuna', 'LEO', 7, 'Jugador', 17, 66, 1.89, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MOR_1', 'Sebastian', 'Sosa', 'Calero', 'MOR', 1, 'Portero', 18, 74, 1.78, '1', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MOR_2', 'Fernando', 'Aristeguieta', 'Munch', 'MOR', 2, 'Jugador', 23, 74, 1.67, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MOR_3', 'José', 'Joaquín', 'Martinez', 'MOR', 3, 'Jugador', 29, 71, 1.83, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MOR_4', 'José', 'Ortiz', 'Cortes', 'MOR', 4, 'Jugador', 24, 70, 1.88, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MOR_5', 'Mario', 'Osuna', 'Villanueva', 'MOR', 5, 'Jugador', 29, 60, 1.69, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MOR_6', 'Luis', 'Mendoza', 'Elizalde', 'MOR', 6, 'Jugador', 19, 69, 1.6, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MOR_7', 'Salvador', 'Reyes', 'Chávez', 'MOR', 7, 'Jugador', 27, 67, 1.75, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MTY_1', 'Rogelio', 'Funes', 'Mori', 'MTY', 1, 'Portero', 26, 70, 1.72, '1', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MTY_2', 'Vicent', 'Janssen', 'Pérez', 'MTY', 2, 'Jugador', 18, 66, 1.78, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MTY_3', 'Rodolfo', 'Pizarro', 'Pipa', 'MTY', 3, 'Jugador', 22, 61, 1.83, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MTY_4', 'Dorlan', 'Pabón', 'Morales', 'MTY', 4, 'Jugador', 26, 68, 1.59, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MTY_5', 'Avilés', 'Hurtado', 'Puch', 'MTY', 5, 'Jugador', 23, 78, 1.61, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MTY_6', 'Jonathan', 'Urretaviscaya', 'Cruz', 'MTY', 6, 'Jugador', 18, 67, 1.74, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('MTY_7', 'Jesús', 'Gallardo', 'Zabalegui', 'MTY', 7, 'Jugador', 20, 62, 1.63, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('NCX_1', 'Mauro', 'Quiroga', 'Durán', 'NCX', 1, 'Portero', 26, 68, 1.74, '1', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('NCX_2', 'Cristian', 'Calderón', 'Sánchez', 'NCX', 2, 'Jugador', 18, 75, 1.55, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('NCX_3', 'Maximiliano', 'Salas', 'Montaño', 'NCX', 3, 'Jugador', 19, 73, 1.69, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('NCX_4', 'Hugo', 'González', 'Dario', 'NCX', 4, 'Jugador', 27, 79, 1.56, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('NCX_5', 'Felipe', 'Gallegos', 'Diaz', 'NCX', 5, 'Jugador', 23, 77, 1.87, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('NCX_6', 'Ventura', 'Alvarado', 'Rey', 'NCX', 6, 'Jugador', 18, 70, 1.73, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('NCX_7', 'Juan', 'Delgado', 'Baeza', 'NCX', 7, 'Jugador', 18, 78, 1.86, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('PACH_1', 'Evaristo', 'Lugo', 'Hernández', 'PACH', 1, 'Portero', 18, 60, 1.86, '1', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('PACH_2', 'Samuel', 'Ruíz', 'Ramírez', 'PACH', 2, 'Jugador', 21, 69, 1.84, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('PACH_3', 'Joel', 'Mendez', 'Moca', 'PACH', 3, 'Jugador', 22, 63, 1.73, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('PACH_4', 'Ricardo', 'Esparza', 'Torres', 'PACH', 4, 'Jugador', 18, 70, 1.56, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('PACH_5', 'Antonio', 'López', 'Cruz', 'PACH', 5, 'Jugador', 19, 61, 1.79, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('PACH_6', 'Manuel', 'Fernández', 'Ramírez', 'PACH', 6, 'Jugador', 24, 77, 1.67, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('PACH_7', 'Carlos', 'Montes', 'Pérez', 'PACH', 7, 'Jugador', 22, 63, 1.79, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
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
('QRO_4', 'Jacinto', 'Salvatori', 'Juárez', 'QRO', 4, 'Jugador', 20, 60, 1.75, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('QRO_5', 'Yael', 'Alcántara', 'González', 'QRO', 5, 'Jugador', 25, 65, 1.65, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('QRO_6', 'Cristian', 'Aguilar', 'Hernández', 'QRO', 6, 'Jugador', 19, 65, 1.81, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('QRO_7', 'Julio', 'Esquivel', 'Bermúdez', 'QRO', 7, 'Jugador', 19, 69, 1.85, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('STL_1', 'Gabriel', 'Saltillo', 'Gómez', 'STL', 1, 'Portero', 19, 73, 1.56, '1', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('STL_2', 'Francisco', 'Suárez', 'Zabalegui', 'STL', 2, 'Jugador', 22, 77, 1.77, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('STL_3', 'Oswaldo', 'Lagarde', 'Montesori', 'STL', 3, 'Jugador', 25, 67, 1.56, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('STL_4', 'Bryant', 'Baca', 'Ramírez', 'STL', 4, 'Jugador', 18, 66, 1.65, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('STL_5', 'Ryan', 'Rojas', 'Mendez', 'STL', 5, 'Jugador', 22, 67, 1.66, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('STL_6', 'Fernando', 'Castelán', 'Torres', 'STL', 6, 'Jugador', 27, 60, 1.83, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
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
('TOL_7', 'Emmanuel', 'Gigliotti', 'Padilla', 'TOL', 7, 'Jugador', 27, 66, 1.62, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('UNAM_1', 'Juan', 'Iturbe', 'Arevalos', 'UNAM', 1, 'Portero', 24, 62, 1.64, '1', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('UNAM_2', 'Carlos', 'Gonzalez', 'Pinola', 'UNAM', 2, 'Jugador', 23, 71, 1.79, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('UNAM_3', 'Martin', 'Vladimir ', 'Rodriguez', 'UNAM', 3, 'Jugador', 24, 71, 1.78, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('UNAM_4', 'Pablo', 'Barrera', 'Acosta', 'UNAM', 4, 'Jugador', 25, 61, 1.65, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('UNAM_5', 'Felipe', 'Mora', 'Aliaga ', 'UNAM', 5, 'Jugador', 20, 72, 1.73, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('UNAM_6', 'Nicolas', 'Mendoza', 'Freire ', 'UNAM', 6, 'Jugador', 24, 78, 1.8, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('UNAM_7', 'Alfredo', 'Saldivar', 'Medina', 'UNAM', 7, 'Jugador', 19, 76, 1.56, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('VER_1', 'Gabriel', 'Martin', 'Peñalba', 'VER', 1, 'Portero', 17, 65, 1.57, '1', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('VER_2', 'Richards', 'Kâzim', 'Colin ', 'VER', 2, 'Jugador', 25, 77, 1.59, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('VER_3', 'Sebastian', 'Jurado', 'Roca', 'VER', 3, 'Jugador', 19, 70, 1.72, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('VER_4', 'Angel', 'Reyna', 'Martinez', 'VER', 4, 'Jugador', 29, 62, 1.6, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('VER_5', 'Daniel', 'Alberto', 'Villalva', 'VER', 5, 'Jugador', 18, 79, 1.63, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('VER_6', 'Carlon', 'Arnoldo', 'Salcido', 'VER', 6, 'Jugador', 28, 69, 1.8, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg'),
('VER_7', 'Edgar', 'Meliton', 'Hernandez', 'VER', 7, 'Jugador', 29, 70, 1.89, '0', 0, 0, 0, 0, '/resources/wp-content/themes/futsoft/images/gallery/players/default.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
