-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-05-2024 a las 22:03:36
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `votaciones_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidatos`
--

CREATE TABLE `candidatos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `candidatos`
--

INSERT INTO `candidatos` (`id`, `nombre`) VALUES
(1, 'Juan Perez'),
(2, 'Nayareth Salas'),
(3, 'Marisol Carvajal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunas`
--

CREATE TABLE `comunas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `region_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comunas`
--

INSERT INTO `comunas` (`id`, `nombre`, `region_id`) VALUES
(1, 'Vallenar', 4),
(2, 'La Serena', 5),
(3, 'Copiapo', 4),
(4, 'Coquimbo', 5),
(5, 'Las Condes', 7),
(6, 'Maipu', 7),
(7, 'Conchali', 7),
(8, 'Vicuña', 5),
(9, 'El Salvador', 4),
(10, 'Arica', 1),
(11, 'Camarones', 1),
(12, 'General Lagos', 1),
(13, 'Putre', 1),
(14, 'Alto Hospicio', 2),
(15, 'Iquique', 2),
(16, 'Camiña', 2),
(17, 'Colchane', 2),
(18, 'Huara', 2),
(19, 'Pica', 2),
(20, 'Pozo Almonte', 2),
(21, 'Antofagasta', 3),
(22, 'Mejillones', 3),
(23, 'Sierra Gorda', 3),
(24, 'Taltal', 3),
(25, 'Calama', 3),
(26, 'Ollagüe', 3),
(27, 'San Pedro De Atacama', 3),
(28, 'María Elena', 3),
(29, 'Tocopilla', 3),
(30, 'Chañaral', 4),
(31, 'Diego de Almagro', 4),
(32, 'Caldera', 4),
(33, 'Tierra Amarilla', 4),
(34, 'Alto del Carmen', 4),
(35, 'Freirina', 4),
(36, 'Huasco', 4),
(37, 'Andacollo', 5),
(38, 'La Higuera', 5),
(39, 'Paihuano', 5),
(40, 'Combarbalá', 5),
(41, 'Monte Patria', 5),
(42, 'Ovalle', 5),
(43, 'Punitaqui', 5),
(44, 'Río Hurtado', 5),
(45, 'Canela', 5),
(46, 'Illapel', 5),
(47, 'Los Vilos', 5),
(48, 'Salamanca', 5),
(49, 'Isla de Pascua', 6),
(50, 'Calle Larga', 6),
(51, 'Los Andes', 6),
(52, 'Rinconada', 6),
(53, 'San Esteban', 6),
(54, 'Cabildo', 6),
(55, 'La Ligua', 6),
(56, 'Papudo', 6),
(57, 'Patorca', 6),
(58, 'Zapallar', 6),
(59, 'Hijuelas', 6),
(60, 'La Calera', 6),
(61, 'La Cruz', 6),
(63, 'Quillota', 6),
(64, 'Algarrobo', 6),
(65, 'Cartagena', 6),
(66, 'El Quisco', 6),
(67, 'El Tabo', 6),
(68, 'San Antonio', 6),
(69, 'San Domingo', 6),
(70, 'Catemu', 6),
(71, 'Llay-Llay', 6),
(72, 'Panquehue', 6),
(73, 'Putaendo', 6),
(74, 'San Felipe', 6),
(75, 'Santa María', 6),
(76, 'Casablanca', 6),
(77, 'Concón', 6),
(78, 'Juan Fernández', 6),
(79, 'Puchuncaví', 6),
(80, 'Quintero', 6),
(81, 'Valparaíso', 6),
(82, 'Viña del Mar', 6),
(83, 'Limache', 6),
(84, 'Olmué', 6),
(85, 'Quilpué', 6),
(86, 'Villa Alemana', 6),
(87, 'Colina', 7),
(88, 'Lampa', 7),
(89, 'Til Til', 7),
(90, 'Pirque', 7),
(91, 'Puente Alto', 7),
(92, 'San Jose de Maipo', 7),
(93, 'Buin', 7),
(94, 'Calera de Tango', 7),
(95, 'Paine', 7),
(96, 'San Bernardo', 7),
(97, 'Alhué', 7),
(98, 'Curacaví', 7),
(99, 'Maria Pinto', 7),
(100, 'Melipilla', 7),
(101, 'San Pedro', 7),
(102, 'Cerrrillos', 7),
(103, 'Cerro Navia', 7),
(104, 'El Bosque', 7),
(105, 'Estación Central', 7),
(106, 'Huechuraba', 7),
(107, 'Independencia', 7),
(108, 'La Cisterna', 7),
(109, 'La Granja', 7),
(110, 'La Florida', 7),
(111, 'La Pintana', 7),
(112, 'La Reina', 7),
(113, 'Lo Barnechea', 7),
(114, 'Lo Espejo', 7),
(115, 'Lo Prado', 7),
(116, 'Macul', 7),
(117, 'Ñuñoa', 7),
(118, 'Pedro Aguirre Cerda', 7),
(119, 'Peñalolén', 7),
(120, 'Providencia', 7),
(121, 'Pudahuel', 7),
(122, 'Quilicura', 7),
(123, 'Quinta Normal', 7),
(124, 'Recoleta', 7),
(125, 'Renca', 7),
(126, 'San Miguel', 7),
(127, 'San Joaquín', 7),
(128, 'San Ramón', 7),
(129, 'Santiago', 7),
(130, 'Vitacura', 7),
(131, 'El Monte', 7),
(132, 'Isla de Maipo', 7),
(133, 'Padre Hurtado', 7),
(134, 'Peñaflor', 7),
(135, 'Talagante', 7),
(136, 'Codegua', 8),
(137, 'Coinco', 8),
(138, 'Coltauco', 8),
(139, 'Doñihue', 8),
(140, 'Graneros', 8),
(141, 'Las Cabras', 8),
(142, 'Machalí', 8),
(143, 'Malloa', 8),
(144, 'Mostazal', 8),
(145, 'Olivar', 8),
(146, 'Peumo', 8),
(147, 'Pichidegua', 8),
(148, 'Quinta de Tilcoco', 8),
(149, 'Rancagua', 8),
(150, 'Rengo', 8),
(151, 'Requínoa', 8),
(152, 'San Vicente de Tagua Tagua', 8),
(153, 'La Estrella', 8),
(154, 'Litueche', 8),
(155, 'Marchigûe', 8),
(156, 'Navidad', 8),
(157, 'Paredones', 8),
(158, 'Pichilemu', 8),
(159, 'Chépica', 8),
(160, 'Chimbarongo', 8),
(161, 'Lolol', 8),
(162, 'Nancagua', 8),
(163, 'Palmilla', 8),
(164, 'Peralillo', 8),
(165, 'Placilla', 8),
(166, 'Pumanque', 8),
(167, 'San Fernando', 8),
(168, 'Santa Cruz', 8),
(169, 'Cauquenes', 9),
(170, 'Chanco', 9),
(171, 'Pelluhue', 9),
(172, 'Curicó', 9),
(173, 'Hualañé', 9),
(174, 'Licantén', 9),
(175, 'Molina', 9),
(176, 'Rauco', 9),
(177, 'Romeral', 9),
(178, 'Sagrada Familia', 9),
(179, 'Teno', 9),
(180, 'Vichiquén', 9),
(181, 'Colbún', 9),
(182, 'Linares', 9),
(183, 'Longaví', 9),
(184, 'Parral', 9),
(185, 'Retiro', 9),
(186, 'San Javier', 9),
(187, 'Villa Alegre', 9),
(188, 'Yerbas Buenas', 9),
(189, 'Constitución', 9),
(190, 'Curepto', 9),
(191, 'Empedrado', 9),
(192, 'Maule', 9),
(193, 'Pelarco', 9),
(194, 'Pencahue', 9),
(195, 'Río Claro', 9),
(196, 'San Clemente', 9),
(197, 'San Rafael', 9),
(198, 'Talca', 9),
(199, 'Cobquecura', 10),
(200, 'Coelemu', 10),
(201, 'Ninhue', 10),
(202, 'Portezuelo', 10),
(203, 'Quirihue', 10),
(204, 'Ránquil', 10),
(205, 'Trehuaco', 10),
(206, 'Bulnes', 10),
(207, 'Chillán Viejo', 10),
(208, 'Chillán', 10),
(209, 'El Carmen', 10),
(210, 'Pemuco', 10),
(211, 'Pinto', 10),
(212, 'Quillón', 10),
(213, 'San Ignacio', 10),
(214, 'Yungay', 10),
(215, 'Coihueco', 10),
(216, 'Ñiquén', 10),
(217, 'San Carlos', 10),
(218, 'San Fabián', 10),
(219, 'San Nicolás', 10),
(220, 'Arauco', 11),
(221, 'Cañete', 11),
(222, 'Contulmo', 11),
(223, 'Curanilahue', 11),
(224, 'Lebu', 11),
(225, 'Los Álamos', 11),
(226, 'Tirúa', 11),
(227, 'Alto Biobío', 11),
(228, 'Antuco', 11),
(229, 'Cabrero', 11),
(230, 'Laja', 11),
(231, 'Los Ángeles', 11),
(232, 'Mulchén', 11),
(233, 'Nacimiento', 11),
(234, 'Quilaco', 11),
(235, 'Quilleco', 11),
(236, 'San Rosendo', 11),
(237, 'Santa Bárbara', 11),
(238, 'Tucapel', 11),
(239, 'Yumbel', 11),
(240, 'Chiguayante', 11),
(241, 'Concepción', 11),
(242, 'Coronel', 11),
(243, 'Florida', 11),
(244, 'Hualpén', 11),
(245, 'Hualqui', 11),
(246, 'Lota', 11),
(247, 'Penco', 11),
(248, 'San Pedro de la Paz', 11),
(249, 'Santa Juana', 11),
(250, 'Talcahuano', 11),
(251, 'Tome', 11),
(252, 'Carahue', 12),
(253, 'Cholchol', 12),
(254, 'Cunco', 12),
(255, 'Curarrehue', 12),
(256, 'Freire', 12),
(257, 'Galvarino', 12),
(258, 'Gorbea', 12),
(259, 'Lautaro', 12),
(260, 'Loncoche', 12),
(261, 'Melipeuco', 12),
(262, 'Nueva Imperial', 12),
(263, 'Padre Las Casas', 12),
(264, 'Perquenco', 12),
(265, 'Pitrufquén', 12),
(266, 'Pucón', 12),
(267, 'Puerto Saavedra', 12),
(268, 'Temuco', 12),
(269, 'Teodoro Schmidt', 12),
(270, 'Toltón', 12),
(271, 'Vilcún', 12),
(272, 'Villarrica', 12),
(273, 'Angol', 12),
(274, 'Collipulli', 12),
(275, 'Curacautín', 12),
(276, 'Ercilla', 12),
(277, 'Lonquimay', 12),
(278, 'Los Sauces', 12),
(279, 'Lumaco', 12),
(280, 'Purén', 12),
(281, 'Renaico', 12),
(282, 'Traiguén', 12),
(283, 'Victoria', 12),
(284, 'Mariquina', 13),
(285, 'Lanco', 13),
(286, 'Máfil', 13),
(287, 'Valdivia', 13),
(288, 'Corral', 13),
(289, 'Paillaco', 13),
(290, 'Los Lagos', 13),
(291, 'Panguipulli', 13),
(292, 'La Unión', 13),
(293, 'Río Bueno', 13),
(294, 'Lago Ranco', 13),
(295, 'Futrono', 13),
(296, 'Ancud', 14),
(297, 'Castro', 14),
(298, 'Chonchi', 14),
(299, 'Curaco de Vélez', 14),
(300, 'Dalcahue', 14),
(301, 'Puqueldón', 14),
(302, 'Quellén', 14),
(303, 'Quemchi', 14),
(304, 'Quellón', 14),
(305, 'Quinchao', 14),
(306, 'Calbuco', 14),
(307, 'Cochamó', 14),
(308, 'Fresia', 14),
(309, 'Frutillar', 14),
(310, 'Llanquihue', 14),
(311, 'Los Muermos', 14),
(312, 'Maullín', 14),
(313, 'Puerto Montt', 14),
(314, 'Puerto Varas', 14),
(315, 'Osorno', 14),
(316, 'Puerto Octay', 14),
(317, 'Purranque', 14),
(318, 'Puyehue', 14),
(319, 'Rio Negro', 14),
(320, 'San Juan de la Costa', 14),
(321, 'San Pablo', 14),
(322, 'Chaitén', 14),
(323, 'Futaleufu', 14),
(324, 'Hualaihue', 14),
(325, 'Palena', 14),
(326, 'Cisnes', 15),
(327, 'Guaitecas', 15),
(328, 'Aysén', 15),
(329, 'Cochrane', 15),
(330, 'O´Higgins', 15),
(331, 'Tortel', 15),
(332, 'Coyhaique', 15),
(333, 'Lago Verde', 15),
(334, 'Chile Chico', 15),
(335, 'Río Ibañez', 15),
(336, 'Antártica', 16),
(337, 'Cabo de Hornos', 16),
(338, 'Laguna Blanca', 16),
(339, 'Punta Arenas', 16),
(340, 'Río Verde', 16),
(341, 'San Gregorio', 16),
(342, 'Porvenir', 16),
(343, 'Primavera', 16),
(344, 'Timaukel', 16),
(345, 'Natales', 16),
(346, 'Torres del Paine', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regiones`
--

CREATE TABLE `regiones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `regiones`
--

INSERT INTO `regiones` (`id`, `nombre`) VALUES
(1, 'Arica-Parinacota'),
(2, 'Tarapacá'),
(3, 'Antofagasta'),
(4, 'Atacama'),
(5, 'Coquimbo'),
(6, 'Valparaíso '),
(7, 'Metropolitana'),
(8, 'O\'Higgins'),
(9, 'Maule'),
(10, 'Ñuble'),
(11, 'Bío Bío'),
(12, 'Araucanía'),
(13, 'Los Rios'),
(14, 'Los Lagos'),
(15, 'Aysén'),
(16, 'Magallanes y Antártica Chilena');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votantes`
--

CREATE TABLE `votantes` (
  `id` int(11) NOT NULL,
  `nombre_apellido` varchar(50) NOT NULL,
  `alias` varchar(20) NOT NULL,
  `rut` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `region` varchar(20) NOT NULL,
  `comuna` varchar(20) NOT NULL,
  `candidato` varchar(50) NOT NULL,
  `medio_social` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `votantes`
--

INSERT INTO `votantes` (`id`, `nombre_apellido`, `alias`, `rut`, `email`, `region`, `comuna`, `candidato`, `medio_social`) VALUES
(18, 'Francisco Mella', 'Pancho2395', '9178033-k', 'jorge@prueba.cl', 'Atacama', 'Vallenar', 'Nayareth Salas', 'TV, Redes Sociales'),
(19, 'jorge trigo', '7R1G0', '19400301-3', 'jorge.trigo1898@gmail.com', 'Maule', 'Romeral', 'Marisol Carvajal', 'TV, Redes Sociales'),
(20, 'Francisco Farias', 'Juanito24', '16696954-9', 'pancho@prueba.com', 'Los Rios', 'Paillaco', 'Juan Perez', 'Web, Amigo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `candidatos`
--
ALTER TABLE `candidatos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comunas`
--
ALTER TABLE `comunas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region_id` (`region_id`);

--
-- Indices de la tabla `regiones`
--
ALTER TABLE `regiones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `votantes`
--
ALTER TABLE `votantes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `candidatos`
--
ALTER TABLE `candidatos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `comunas`
--
ALTER TABLE `comunas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=347;

--
-- AUTO_INCREMENT de la tabla `regiones`
--
ALTER TABLE `regiones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `votantes`
--
ALTER TABLE `votantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comunas`
--
ALTER TABLE `comunas`
  ADD CONSTRAINT `comunas_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regiones` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
