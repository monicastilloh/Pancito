-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3308
-- Tiempo de generación: 17-05-2025 a las 07:11:49
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
-- Base de datos: `panaderia_pos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alertas_caducidad`
--

CREATE TABLE `alertas_caducidad` (
  `id_alerta` bigint(20) UNSIGNED NOT NULL,
  `id_lote` bigint(20) UNSIGNED NOT NULL,
  `mensaje` text DEFAULT NULL,
  `fecha_alerta` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `RFC` char(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `telefono`, `correo`, `RFC`) VALUES
(1, 'Roberto', '5511223344', 'roberto.mendoza@gmail.com', 'MEVR700101HDF'),
(2, 'Laura', '5522334455', 'laura.jimenez@outlook.com', 'JIPL850202MDF'),
(3, 'Pedro', '5533445566', 'pedro.sanchez@yahoo.com', 'SAGP900303HDF');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colonia`
--

CREATE TABLE `colonia` (
  `id_colonia` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `CP` varchar(10) NOT NULL,
  `id_municipio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `colonia`
--

INSERT INTO `colonia` (`id_colonia`, `nombre`, `CP`, `id_municipio`) VALUES
(1, 'Roma Norte', '06700', 1),
(2, 'Condesa', '06140', 2),
(3, 'Del Valle', '03100', 3),
(4, 'Jardines de Morelos', '55070', 4),
(5, 'Ángel Zimbrón', '57000', 5),
(6, 'Centro', '50000', 6),
(7, 'Americana', '44160', 7),
(8, 'Providencia', '44630', 8),
(9, 'Toluquilla', '45609', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE `cuenta` (
  `usuario` varchar(50) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `privilegio` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`usuario`, `contraseña`, `privilegio`, `id_empleado`) VALUES
('cmartinez', 'cajero789', 3, 3),
('jperez', 'admin123', 1, 1),
('mgarcia', 'panadero456', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleevento`
--

CREATE TABLE `detalleevento` (
  `id_cliente` int(11) NOT NULL,
  `id_evento` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalleevento`
--

INSERT INTO `detalleevento` (`id_cliente`, `id_evento`, `id_producto`, `cantidad`, `subtotal`) VALUES
(1, 1, 3, 5, 900.00),
(1, 1, 5, 12, 300.00),
(2, 2, 1, 20, 250.00),
(2, 2, 3, 3, 540.00),
(2, 2, 4, 10, 150.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `id_detalle` int(11) NOT NULL,
  `id_venta` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalleventa`
--

INSERT INTO `detalleventa` (`id_detalle`, `id_venta`, `id_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES
(1, 1, 1, 5, 12.50, 62.50),
(2, 1, 2, 10, 5.00, 50.00),
(3, 1, 5, 2, 25.00, 50.00),
(4, 2, 3, 1, 180.00, 180.00),
(5, 2, 4, 4, 15.00, 60.00),
(6, 3, 1, 3, 12.50, 37.50),
(7, 3, 4, 2, 15.00, 30.00),
(8, 3, 5, 1, 25.00, 25.00),
(9, 4, 3, 1, 180.00, 180.00),
(10, 5, 2, 10, 5.00, 50.00),
(11, 6, 2, 10, 5.00, 50.00),
(12, 6, 1, 10, 12.50, 125.00),
(13, 7, 2, 11, 5.00, 55.00),
(14, 7, 1, 11, 12.50, 137.50),
(15, 7, 4, 4, 15.00, 60.00),
(16, 7, 3, 1, 180.00, 180.00),
(17, 8, 2, 11, 5.00, 55.00),
(18, 8, 1, 11, 12.50, 137.50),
(19, 8, 4, 4, 15.00, 60.00),
(20, 8, 3, 1, 180.00, 180.00),
(21, 9, 2, 11, 5.00, 55.00),
(22, 9, 1, 11, 12.50, 137.50),
(23, 9, 4, 4, 15.00, 60.00),
(24, 9, 3, 1, 180.00, 180.00),
(25, 10, 2, 11, 5.00, 55.00),
(26, 10, 1, 11, 12.50, 137.50),
(27, 10, 4, 4, 15.00, 60.00),
(28, 10, 3, 1, 180.00, 180.00),
(29, 11, 3, 1, 180.00, 180.00),
(30, 12, 3, 1, 180.00, 180.00),
(31, 13, 3, 1, 180.00, 180.00),
(32, 17, 3, 1, 180.00, 180.00),
(33, 18, 3, 1, 180.00, 180.00),
(34, 19, 1, 1, 12.50, 12.50),
(35, 20, 2, 1, 5.00, 5.00),
(36, 20, 3, 1, 180.00, 180.00),
(37, 21, 4, 1, 15.00, 15.00),
(38, 22, 2, 1, 5.00, 5.00),
(39, 23, 3, 1, 180.00, 180.00),
(40, 24, 5, 1, 25.00, 25.00),
(41, 24, 4, 1, 15.00, 15.00),
(42, 24, 5, 1, 25.00, 25.00),
(43, 24, 4, 1, 15.00, 15.00),
(44, 25, 2, 1, 5.00, 5.00),
(45, 26, 3, 1, 180.00, 180.00),
(46, 27, 4, 6, 15.00, 90.00),
(47, 28, 6, 1, 250.00, 250.00),
(48, 28, 6, 1, 250.00, 250.00),
(49, 29, 5, 1, 25.00, 25.00),
(50, 26, 1, 2, 10.50, 21.00),
(51, 33, 1, 1, 13.00, 13.00),
(52, 34, 5, 1, 25.00, 25.00),
(53, 35, 2, 1, 5.00, 5.00),
(54, 36, 1, 1, 13.00, 13.00),
(55, 37, 3, 3, 180.00, 540.00),
(56, 38, 3, 10, 180.00, 1800.00),
(57, 39, 2, 10, 5.00, 50.00),
(58, 39, 1, 2, 13.00, 26.00),
(59, 40, 3, 1, 180.00, 180.00),
(60, 40, 2, 1, 5.00, 5.00),
(61, 41, 1, 1, 13.00, 13.00),
(62, 41, 1, 1, 13.00, 13.00),
(63, 42, 2, 1, 5.00, 5.00),
(64, 42, 2, 1, 5.00, 5.00),
(65, 43, 1, 1, 13.00, 13.00),
(66, 44, 3, 1, 180.00, 180.00),
(67, 45, 1, 1, 13.00, 13.00),
(68, 45, 1, 1, 13.00, 13.00),
(69, 46, 1, 1, 13.00, 13.00),
(70, 46, 1, 1, 13.00, 13.00),
(71, 47, 3, 1, 180.00, 180.00),
(72, 47, 3, 1, 180.00, 180.00),
(73, 48, 1, 1, 13.00, 13.00),
(74, 48, 1, 1, 13.00, 13.00),
(75, 49, 1, 1, 13.00, 13.00),
(76, 50, 1, 1, 13.00, 13.00),
(77, 51, 1, 1, 13.00, 13.00),
(78, 52, 3, 1, 180.00, 180.00),
(79, 52, 2, 1, 5.00, 5.00),
(80, 53, 2, 1, 5.00, 5.00),
(81, 54, 2, 1, 5.00, 5.00),
(82, 54, 23, 1, 26.00, 26.00),
(83, 55, 2, 1, 5.00, 5.00),
(84, 55, 23, 1, 26.00, 26.00),
(85, 55, 11, 1, 24.00, 24.00),
(86, 55, 9, 1, 18.00, 18.00),
(87, 55, 14, 1, 22.00, 22.00),
(88, 56, 19, 1, 22.00, 22.00),
(89, 56, 14, 1, 22.00, 22.00),
(90, 56, 1, 1, 13.00, 13.00),
(91, 56, 11, 1, 24.00, 24.00),
(92, 57, 11, 1, 24.00, 24.00),
(93, 57, 18, 1, 30.00, 30.00),
(94, 57, 22, 1, 15.00, 15.00),
(95, 58, 14, 1, 22.00, 22.00),
(96, 59, 23, 1, 26.00, 26.00),
(97, 60, 23, 1, 26.00, 26.00),
(98, 61, 2, 1, 5.00, 5.00),
(99, 61, 15, 1, 25.00, 25.00),
(100, 61, 12, 1, 17.00, 17.00),
(101, 62, 1, 1, 13.00, 13.00),
(102, 63, 23, 1, 26.00, 26.00),
(103, 64, 2, 1, 5.00, 5.00),
(104, 65, 2, 1, 5.00, 5.00),
(105, 66, 2, 1, 5.00, 5.00),
(106, 67, 2, 1, 5.00, 5.00),
(107, 67, 23, 1, 26.00, 26.00),
(108, 68, 2, 1, 5.00, 5.00),
(109, 69, 2, 1, 5.00, 5.00),
(110, 70, 23, 1, 26.00, 26.00),
(111, 71, 2, 1, 5.00, 5.00),
(112, 72, 2, 1, 5.00, 5.00),
(113, 73, 23, 1, 26.00, 26.00),
(114, 74, 2, 1, 5.00, 5.00),
(115, 75, 2, 1, 5.00, 5.00),
(116, 76, 2, 1, 5.00, 5.00),
(117, 77, 2, 1, 5.00, 5.00),
(118, 78, 2, 1, 5.00, 5.00),
(119, 79, 2, 1, 5.00, 5.00),
(120, 80, 2, 1, 5.00, 5.00),
(121, 81, 2, 1, 5.00, 5.00),
(122, 82, 2, 1, 5.00, 5.00),
(123, 83, 2, 1, 5.00, 5.00),
(124, 84, 2, 1, 5.00, 5.00),
(125, 84, 15, 1, 25.00, 25.00),
(126, 84, 12, 1, 17.00, 17.00),
(127, 84, 9, 1, 18.00, 18.00),
(128, 84, 16, 6, 24.00, 144.00),
(129, 84, 8, 1, 20.00, 20.00),
(130, 85, 19, 1, 22.00, 22.00),
(131, 85, 11, 1, 24.00, 24.00),
(132, 85, 5, 1, 25.00, 25.00),
(133, 86, 23, 1, 26.00, 26.00),
(134, 86, 5, 1, 25.00, 25.00),
(135, 87, 23, 1, 26.00, 26.00),
(136, 88, 23, 1, 26.00, 26.00),
(137, 89, 2, 1, 5.00, 5.00),
(138, 90, 2, 1, 5.00, 5.00),
(139, 90, 23, 1, 26.00, 26.00),
(140, 90, 19, 1, 22.00, 22.00),
(141, 90, 14, 1, 22.00, 22.00),
(142, 90, 1, 1, 13.00, 13.00),
(143, 91, 23, 1, 26.00, 26.00),
(144, 92, 5, 1, 25.00, 25.00),
(145, 93, 5, 1, 25.00, 25.00),
(146, 94, 15, 1, 25.00, 25.00),
(147, 95, 19, 1, 22.00, 22.00),
(148, 96, 15, 1, 25.00, 25.00),
(149, 97, 23, 1, 26.00, 26.00),
(150, 98, 15, 1, 25.00, 25.00),
(151, 99, 1, 1, 13.00, 13.00),
(152, 99, 20, 1, 23.00, 23.00),
(153, 100, 5, 1, 25.00, 25.00),
(154, 100, 23, 1, 26.00, 26.00),
(155, 101, 5, 1, 25.00, 25.00),
(156, 101, 23, 1, 26.00, 26.00),
(157, 101, 14, 1, 22.00, 22.00),
(158, 101, 19, 1, 22.00, 22.00),
(159, 102, 14, 1, 22.00, 22.00),
(160, 103, 20, 1, 23.00, 23.00),
(161, 103, 1, 1, 13.00, 13.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `id_direccion` int(11) NOT NULL,
  `calle` varchar(50) NOT NULL,
  `numero` int(11) NOT NULL,
  `id_colonia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`id_direccion`, `calle`, `numero`, `id_colonia`) VALUES
(1, 'Puebla', 123, 1),
(2, 'Michoacán', 45, 2),
(3, 'Insurgentes Sur', 789, 3),
(4, 'Revolución', 321, 4),
(5, 'Juárez', 654, 5),
(6, 'Hidalgo', 987, 6),
(7, 'López Mateos', 147, 7),
(8, 'Vallarta', 258, 8),
(9, 'Morelos', 369, 9),
(11, 'Plan', 123, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido_pat` varchar(100) NOT NULL,
  `apellido_mat` varchar(100) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `RFC` char(13) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `id_direccion` int(11) DEFAULT NULL,
  `id_puesto` int(11) DEFAULT NULL,
  `sueldo` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `nombre`, `apellido_pat`, `apellido_mat`, `telefono`, `RFC`, `correo`, `id_direccion`, `id_puesto`, `sueldo`) VALUES
(1, 'Jorge Antonio', 'Martinez ', 'Rasgado', '9515094736', 'MDFRR3445CSDS', 'jorge.martinez@panaderia.com', 1, 1, 10000),
(2, 'María', 'García', 'Sánchez', '5523456789', 'GASM850202MDF', 'maria.garcia@panaderia.com', 2, 2, 6000),
(3, 'Carlos', 'Martínez', 'Díaz', '5534567890', 'MADC900303HDF', 'carlos.martinez@panaderia.com', 3, 3, 6000),
(4, 'Ana', 'Rodríguez', 'Fernández', '5545678901', 'ROFA750404MDF', 'ana.rodriguez@panaderia.com', 4, 4, 6000),
(6, 'Lana', 'Ramirez', 'Hernández', '9515121398', 'ROFA750404MDF', 'lana@panaderia.com', 11, 3, 6000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `nombre`) VALUES
(1, 'Ciudad de México'),
(2, 'Estado de México'),
(3, 'Jalisco'),
(4, 'Nuevo León'),
(5, 'Puebla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `id_evento` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `id_direccion` int(11) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `debe` decimal(10,0) NOT NULL,
  `anticipo` decimal(10,0) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`id_evento`, `fecha`, `id_direccion`, `total`, `debe`, `anticipo`, `id_cliente`) VALUES
(1, '2025-06-30 17:00:00', 1, 1200.00, 0, 1200, 1),
(2, '2025-08-05 18:00:00', 3, 850.00, 350, 500, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL,
  `id_venta` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `fecha_emision` datetime NOT NULL DEFAULT current_timestamp(),
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `id_venta`, `id_cliente`, `fecha_emision`, `total`) VALUES
(1, 2, 1, '2025-04-06 19:26:22', 230.00),
(2, 3, 2, '2025-04-06 19:26:22', 75.25),
(3, 2, 1, '2025-04-06 19:27:03', 230.00),
(4, 3, 2, '2025-04-06 19:27:03', 75.25),
(5, 44, 4, '2025-05-07 18:58:39', 208.80),
(6, 45, 4, '2025-05-07 19:00:30', 30.16),
(7, 47, 5, '2025-05-07 00:00:00', 417.60),
(8, 48, 6, '2025-05-07 00:00:00', 30.16),
(9, 48, 7, '2025-05-07 00:00:00', 30.16),
(10, 49, 8, '2025-05-07 00:00:00', 15.08),
(11, 49, 9, '2025-05-07 00:00:00', 15.08),
(12, 49, 10, '2025-05-07 00:00:00', 15.08),
(13, 51, 4, '2025-05-07 21:35:50', 15.08),
(14, 52, 4, '2025-05-07 21:36:41', 214.60),
(15, 53, 4, '2025-05-07 22:10:11', 5.80),
(16, 63, 11, '2025-05-08 01:31:20', 30.16),
(17, 63, 12, '2025-05-08 01:38:32', 30.16),
(18, 64, 13, '2025-05-08 01:39:36', 5.80),
(19, 64, 14, '2025-05-08 01:40:12', 5.80),
(20, 65, 15, '2025-05-08 01:40:39', 5.80),
(21, 65, 16, '2025-05-08 01:40:40', 5.80),
(22, 65, 17, '2025-05-08 01:40:40', 5.80),
(23, 65, 18, '2025-05-08 01:40:42', 5.80),
(24, 67, 19, '2025-05-08 01:52:07', 35.96),
(25, 68, 20, '2025-05-08 01:58:57', 5.80);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingrediente`
--

CREATE TABLE `ingrediente` (
  `id_ingrediente` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `unidad_medida` varchar(20) NOT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `stock` int(100) NOT NULL,
  `minimo` int(100) NOT NULL,
  `maximo` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingrediente`
--

INSERT INTO `ingrediente` (`id_ingrediente`, `nombre`, `unidad_medida`, `id_proveedor`, `stock`, `minimo`, `maximo`) VALUES
(1, 'Harina de trigo', 'kg', 1, 30, 10, 50),
(2, 'Azúcar', 'kg', 3, 48, 20, 60),
(3, 'Huevo', 'pieza', 2, 34, 20, 80),
(4, 'Leche entera', 'litro', 2, 40, 20, 50),
(5, 'Mantequilla', 'kg', 2, 56, 20, 60),
(6, 'Café en grano', 'kg', 4, 78, 50, 100),
(7, 'Galletas', 'kg', 1, 34, 20, 50),
(8, 'Elote en grano', 'g', 3, 10000, 3000, 20000),
(10, 'Leche condensada', 'ml', 5, 8000, 2000, 15000),
(11, 'Leche evaporada', 'ml', 5, 8000, 2000, 15000),
(12, 'Nuez picada', 'g', 3, 2000, 500, 5000),
(13, 'Canela molida', 'g', 6, 1000, 200, 3000),
(14, 'Café molido', 'g', 2, 3000, 1000, 5000),
(15, 'Chocolate líquido', 'ml', 7, 2000, 500, 4000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredienteproducto`
--

CREATE TABLE `ingredienteproducto` (
  `id_producto` int(11) NOT NULL,
  `id_ingrediente` int(11) NOT NULL,
  `cantidad_utilizada_mg` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingredienteproducto`
--

INSERT INTO `ingredienteproducto` (`id_producto`, `id_ingrediente`, `cantidad_utilizada_mg`) VALUES
(1, 1, 500.00),
(1, 2, 200.00),
(1, 3, 5.00),
(2, 1, 600.00),
(2, 3, 3.00),
(3, 1, 80000.00),
(3, 2, 40000.00),
(3, 4, 30000.00),
(4, 1, 300.00),
(5, 6, 20000.00),
(6, 1, 600.00),
(6, 7, 200.00),
(7, 1, 30000.00),
(7, 2, 20000.00),
(7, 3, 2.00),
(7, 8, 50000.00),
(8, 1, 40000.00),
(8, 2, 30000.00),
(8, 3, 3.00),
(8, 12, 15000.00),
(9, 1, 40000.00),
(9, 2, 30000.00),
(9, 5, 20000.00),
(10, 1, 60000.00),
(10, 2, 40000.00),
(10, 3, 2.00),
(10, 13, 5000.00),
(11, 1, 50000.00),
(11, 3, 2.00),
(11, 4, 20000.00),
(11, 5, 30000.00),
(12, 1, 50000.00),
(12, 2, 20000.00),
(12, 3, 2.00),
(12, 15, 10000.00),
(13, 1, 50000.00),
(13, 2, 20000.00),
(13, 3, 2.00),
(13, 4, 15000.00),
(14, 4, 30000.00),
(14, 6, 7000.00),
(15, 2, 15000.00),
(15, 4, 80000.00),
(15, 6, 10000.00),
(16, 2, 10000.00),
(16, 4, 100000.00),
(16, 6, 10000.00),
(17, 2, 10000.00),
(17, 4, 80000.00),
(17, 6, 10000.00),
(17, 15, 20000.00),
(18, 2, 20000.00),
(18, 4, 60000.00),
(18, 6, 15000.00),
(18, 15, 30000.00),
(19, 2, 15000.00),
(19, 4, 50000.00),
(19, 6, 15000.00),
(20, 2, 20000.00),
(20, 4, 100000.00),
(20, 15, 50000.00),
(21, 1, 60000.00),
(21, 2, 30000.00),
(21, 3, 3.00),
(21, 5, 25000.00),
(22, 2, 30000.00),
(22, 3, 1.00),
(22, 5, 20000.00),
(22, 7, 50000.00),
(23, 1, 70000.00),
(23, 2, 25000.00),
(23, 3, 4.00),
(23, 4, 30000.00),
(23, 5, 35000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lote`
--

CREATE TABLE `lote` (
  `id_lote` bigint(20) UNSIGNED NOT NULL,
  `id_ingrediente` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_caducidad` date NOT NULL,
  `fecha_entrada` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lote`
--

INSERT INTO `lote` (`id_lote`, `id_ingrediente`, `cantidad`, `fecha_caducidad`, `fecha_entrada`) VALUES
(1, 1, 50, '2026-12-15', '2025-05-07'),
(2, 2, 30, '2027-02-20', '2025-05-07'),
(3, 3, 20, '2023-11-30', '2025-05-07'),
(4, 4, 15, '2023-10-25', '2025-05-07'),
(5, 5, 10, '2023-09-15', '2025-05-07'),
(6, 6, 5, '2023-08-10', '2025-05-07'),
(7, 7, 8, '2024-01-05', '2025-05-07'),
(8, 8, 5000, '2024-03-31', '2023-11-10'),
(14, 14, 1500, '2025-06-30', '2024-01-10'),
(16, 15, 1000, '2025-03-31', '2024-01-05'),
(20, 10, 4000, '2024-02-28', '2023-12-01'),
(22, 11, 4000, '2024-01-31', '2023-11-20'),
(24, 12, 1000, '2024-05-30', '2023-11-15'),
(27, 13, 600, '2026-08-15', '2025-11-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `id_municipio` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `id_estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`id_municipio`, `nombre`, `id_estado`) VALUES
(1, 'Cuauhtémoc', 1),
(2, 'Benito Juárez', 1),
(3, 'Tlalpan', 1),
(4, 'Ecatepec', 2),
(5, 'Nezahualcóyotl', 2),
(6, 'Toluca', 2),
(7, 'Guadalajara', 3),
(8, 'Zapopan', 3),
(9, 'Tlaquepaque', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock_min` int(11) NOT NULL,
  `stock_max` int(11) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `imagen` varchar(100) DEFAULT NULL,
  `id_tipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre`, `descripcion`, `precio`, `stock_min`, `stock_max`, `stock`, `imagen`, `id_tipo`) VALUES
(1, 'Concha', 'Pan dulce con cubierta azucarada.', 13.00, 50, 200, 25, 'conchas.jpg', 1),
(2, 'Bolillo', 'Pan blanco tradicional', 5.00, 100, 200, 84, 'bolillo.jpg', 2),
(3, 'Pastel Tres Leches', 'Pastel esponjoso bañado en tres leches', 180.00, 5, 30, 0, 'tres_leches.jpg', 3),
(4, 'Orejas', 'Hojaldre dulce en forma de oreja', 15.00, 30, 150, 38, 'orejas.jpg', 1),
(5, 'Café Americano', 'Café negro de grano arábica', 25.00, 20, 100, 40, 'cafe_americano.jpg', 5),
(6, 'Pastel de queso', 'Un postre cremoso y refrescante que combina la suavidad del queso crema con el toque cítrico y vibrante del limón.', 250.00, 10, 100, 49, 'pastel de queso.jpg', 1),
(7, 'Pan de Elote', 'Pan dulce tradicional hecho con granos de elote.', 25.00, 10, 50, 20, 'Pan de Elote.jpeg', 1),
(8, 'Panqué de Nuez', 'Panqué casero con trozos de nuez.', 20.00, 10, 30, 14, 'Panqué de Nuez.jpeg', 1),
(9, 'Empanada de Piña', 'Dulce relleno de piña.', 18.00, 20, 60, 23, 'Empanada de Piña.jpeg', 1),
(10, 'Role de Canela', 'Pan enrollado con canela.', 22.00, 15, 50, 18, 'Role de Canela.jpeg', 1),
(11, 'Croissant', 'Pan de hojaldre clásico.', 24.00, 10, 40, 16, 'Croissant.jpeg', 1),
(12, 'Concha de Chocolate', 'Pan dulce con cubierta de chocolate.', 17.00, 20, 70, 28, 'Concha de Chocolate.jpeg', 1),
(13, 'Concha de Vainilla', 'Pan dulce con cubierta de vainilla.', 17.00, 20, 70, 30, 'Concha de Vainilla.jpeg', 1),
(14, 'Café Espresso', 'Café concentrado en porción pequeña.', 22.00, 5, 30, 4, 'Café Espresso.jpeg', 2),
(15, 'Capuchino', 'Café con leche espumosa.', 25.00, 5, 40, 10, 'Capuchino.jpeg', 2),
(16, 'Latte', 'Café suave con leche.', 24.00, 5, 40, 9, 'Latte.jpeg', 2),
(17, 'Mocha', 'Café con leche y chocolate.', 27.00, 5, 30, 10, 'Mocha.jpeg', 2),
(18, 'Frappé de Mocha', 'Café frío con chocolate.', 30.00, 5, 20, 9, 'Frappé de Mocha.jpeg', 2),
(19, 'Café Helado', 'Café servido con hielo.', 22.00, 5, 20, -5, 'Café Helado.jpeg', 2),
(20, 'Chocolate Caliente', 'Bebida caliente de chocolate.', 23.00, 5, 30, 8, 'Chocolate Caliente.jpeg', 2),
(21, 'Pan de Zanahoria', 'Pan dulce con zanahoria rallada.', 28.00, 10, 40, 15, 'Pan de Zanahoria.jpeg', 1),
(22, 'Galleta de Avena', 'Galleta casera con avena y pasas.', 15.00, 20, 80, 34, 'Galleta de Avena.jpeg', 1),
(23, 'Brioche', 'Pan dulce suave y esponjoso.', 26.00, 10, 40, 4, 'Brioche.jpeg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productotipo`
--

CREATE TABLE `productotipo` (
  `id_tipo` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productotipo`
--

INSERT INTO `productotipo` (`id_tipo`, `nombre`) VALUES
(1, 'Pan dulce'),
(2, 'Pan salado'),
(3, 'Pasteles'),
(4, 'Galletas'),
(5, 'Bebidas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `id_direccion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `nombre`, `telefono`, `correo`, `id_direccion`) VALUES
(1, 'Harinas Nacionales', '5567890123', 'ventas@harinas.com', 6),
(2, 'Lácteos del Valle', '5578901234', 'contacto@lacteos.com', 7),
(3, 'Endulzantes Mexicanos', '5589012345', 'info@endulzantes.com', 8),
(4, 'Café de Altura', '5590123456', 'ventas@cafealtura.com', 9),
(5, 'Repostería Fina SA', '5551234567', 'ventas@reposteriafinasa.com', 1),
(6, 'Café Selecto MX', '5559876543', 'contacto@cafeselecto.mx', 2),
(7, 'Distribuidora Dulce Vida', '5551122334', 'info@dulcevida.com', 3),
(8, 'Harinas del Sur', '5556677889', 'atencion@harinassur.com', 4),
(9, 'Lácteos del Valle', '5554433221', 'pedidos@lacteosvalle.com', 5),
(10, 'Proveedora San Pan', '5553344556', 'ventas@sanpan.com', 6),
(11, 'Cacao Premium', '5559988776', 'servicio@cacaopremium.com', 7),
(16, 'Dulces Aromas SA', '5551112222', 'contacto@dulcesaromas.com', NULL),
(17, 'Frutas Selectas del Sur', '5553334444', 'ventas@frutasselectas.com', NULL),
(18, 'Lácteos Gourmet MX', '5555556666', 'info@lacteosgourmet.mx', NULL),
(19, 'Chocolatería del Valle', '5557778888', 'contacto@chocolateriavalle.com', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puesto`
--

CREATE TABLE `puesto` (
  `id_puesto` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `puesto`
--

INSERT INTO `puesto` (`id_puesto`, `nombre`) VALUES
(1, 'Gerente'),
(2, 'Panadero'),
(3, 'Cajero'),
(4, 'Repartidor'),
(5, 'Atención a clientes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE `receta` (
  `id_receta` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `id_producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `receta`
--

INSERT INTO `receta` (`id_receta`, `nombre`, `descripcion`, `id_producto`) VALUES
(1, 'Receta de Concha', '1. Mezclar harina, azúcar, huevos y levadura\n2. Amasar hasta obtener una masa homogénea\n3. Formar bolitas y agregar la cobertura azucarada\n4. Dejar fermentar 1 hora\n5. Hornear a 180°C por 20 minutos', 1),
(2, 'Receta de Bolillo', '1. Mezclar harina, agua, sal y levadura\n2. Amasar vigorosamente por 15 minutos\n3. Formar barras alargadas\n4. Dejar reposar 30 minutos\n5. Hornear a 200°C por 15-20 minutos hasta dorar', 2),
(3, 'Receta de Pastel Tres Leches', '1. Preparar bizcocho: batir huevos con azúcar, agregar harina\n2. Hornear el bizcocho a 180°C por 25 minutos\n3. Mezclar leche evaporada, condensada y crema para el baño\n4. Perforar el bizcocho y bañar con la mezcla de leches\n5. Refrigerar por 4 horas antes de servir', 3),
(4, 'Receta de Orejas', '1. Preparar masa hojaldre con harina, mantequilla y agua\n2. Estirar la masa y doblar varias veces para crear capas\n3. Cortar en formas de oreja y espolvorear azúcar\n4. Hornear a 190°C por 12-15 minutos hasta dorar', 4),
(5, 'Preparación de Café Americano', '1. Moler granos de café fresco\n2. Usar 2 cucharadas de café por cada 180ml de agua\n3. Verter agua caliente (no hirviendo) a 96°C\n4. Dejar infusionar por 4 minutos\n5. Servir inmediatamente', 5),
(7, 'Receta Pan de Elote', '1. Mezclar el elote molido con leche condensada. 2. Agregar harina, azúcar y polvo para hornear. 3. Verter la mezcla en un molde engrasado. 4. Hornear a 180°C por 40 minutos.', 7),
(8, 'Receta Panqué de Nuez', '1. Batir mantequilla y azúcar hasta esponjar. 2. Agregar huevos uno a uno. 3. Incorporar harina cernida y nuez picada. 4. Verter en un molde y hornear a 170°C por 35 minutos.', 8),
(9, 'Receta Empanada de Piña', '1. Preparar una masa dulce con harina, mantequilla y azúcar. 2. Rellenar con mermelada de piña. 3. Cerrar y sellar los bordes. 4. Hornear a 180°C por 25 minutos.', 9),
(10, 'Receta Role de Canela', '1. Preparar masa de levadura y dejar reposar. 2. Extender y untar con mantequilla, azúcar y canela. 3. Enrollar y cortar en porciones. 4. Hornear a 180°C por 30 minutos.', 10),
(11, 'Receta Croissant', '1. Preparar masa de hojaldre con mantequilla. 2. Refrigerar y doblar varias veces. 3. Cortar triángulos y enrollar formando croissants. 4. Hornear a 200°C por 20 minutos.', 11),
(12, 'Receta Concha de Chocolate', '1. Preparar masa de pan dulce y dejar reposar. 2. Formar bolas y cubrir con pasta de chocolate. 3. Dejar fermentar. 4. Hornear a 180°C por 20 minutos.', 12),
(13, 'Receta Concha de Vainilla', '1. Preparar masa de pan dulce. 2. Formar bolas y cubrir con pasta de vainilla. 3. Fermentar hasta que dupliquen su tamaño. 4. Hornear a 180°C por 20 minutos.', 13),
(14, 'Receta Café Espresso', '1. Moler café oscuro fino. 2. Compactar en portafiltro. 3. Pasar agua caliente a presión. 4. Servir inmediatamente.', 14),
(15, 'Receta Capuchino', '1. Preparar un espresso. 2. Espumar leche hasta obtener textura cremosa. 3. Verter la leche espumada sobre el café. 4. Decorar con canela si se desea.', 15),
(16, 'Receta Latte', '1. Preparar un espresso. 2. Calentar y espumar leche. 3. Verter leche sobre el café suavemente. 4. Servir en vaso alto.', 16),
(17, 'Receta Mocha', '1. Preparar un espresso. 2. Agregar jarabe de chocolate. 3. Añadir leche vaporizada. 4. Coronar con crema batida y canela.', 17),
(18, 'Receta Frappé de Mocha', '1. Licuar hielo, leche, café instantáneo y jarabe de chocolate. 2. Servir en vaso alto. 3. Añadir crema batida encima. 4. Espolvorear cacao.', 18),
(19, 'Receta Café Helado', '1. Preparar café fuerte. 2. Dejar enfriar. 3. Servir con hielo y leche condensada. 4. Decorar con crema si se desea.', 19),
(20, 'Receta Chocolate Caliente', '1. Calentar leche con chocolate en trozos. 2. Batir hasta disolver. 3. Añadir canela al gusto. 4. Servir caliente.', 20),
(21, 'Receta Pan de Zanahoria', '1. Rallar zanahoria. 2. Mezclar con huevo, aceite y azúcar. 3. Agregar harina, nuez y especias. 4. Hornear a 180°C por 40 minutos.', 21),
(22, 'Receta Galleta de Avena', '1. Mezclar avena, mantequilla, azúcar y huevo. 2. Formar bolitas. 3. Colocar en charola. 4. Hornear a 180°C por 15 minutos.', 22),
(23, 'Receta Brioche', '1. Preparar masa con huevo, leche, mantequilla y azúcar. 2. Amasar bien y dejar reposar. 3. Formar piezas individuales. 4. Hornear a 180°C por 25 minutos.', 23);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopago`
--

CREATE TABLE `tipopago` (
  `id_tipo_pago` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipopago`
--

INSERT INTO `tipopago` (`id_tipo_pago`, `nombre`) VALUES
(1, 'Efectivo'),
(2, 'Tarjeta de crédito'),
(3, 'Tarjeta de débito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `total` decimal(10,2) NOT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `id_tipo_pago` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_venta`, `fecha`, `total`, `id_empleado`, `id_tipo_pago`) VALUES
(1, '2023-05-15 08:30:00', 150.50, 3, 1),
(2, '2023-05-15 10:45:00', 230.00, 3, 2),
(3, '2023-05-15 12:15:00', 75.25, 4, 1),
(4, '2025-04-07 05:42:56', 180.00, NULL, 2),
(5, '2025-04-07 07:43:22', 50.00, NULL, 3),
(6, '2025-04-07 09:40:41', 175.00, NULL, 1),
(7, '2025-04-07 14:02:00', 432.50, NULL, 1),
(8, '2025-04-07 14:02:05', 432.50, NULL, 1),
(9, '2025-04-07 14:02:06', 432.50, NULL, 1),
(10, '2025-04-07 14:02:06', 432.50, NULL, 1),
(11, '2025-04-07 14:50:44', 180.00, NULL, 1),
(12, '2025-04-07 14:51:36', 180.00, NULL, 1),
(13, '2025-04-07 14:51:37', 180.00, NULL, 1),
(17, '2025-04-08 09:40:58', 180.00, NULL, 1),
(18, '2025-04-08 09:41:01', 180.00, NULL, 1),
(19, '2025-04-08 09:43:34', 12.50, NULL, 2),
(20, '2025-04-08 09:45:14', 185.00, NULL, 3),
(21, '2025-04-08 09:49:09', 15.00, NULL, 3),
(22, '2025-04-08 09:52:55', 5.00, NULL, 2),
(23, '2025-04-08 09:56:04', 180.00, 1, 3),
(24, '2025-04-08 09:57:17', 40.00, 1, 1),
(25, '2025-04-08 14:10:32', 5.00, 1, 3),
(26, '2025-05-05 16:05:11', 180.00, 1, 1),
(27, '2025-05-05 16:08:55', 90.00, 1, 2),
(28, '2025-05-05 16:13:04', 250.00, 1, 3),
(29, '2025-05-05 16:14:32', 25.00, 1, 1),
(30, '2025-05-05 16:18:01', 100.00, 1, 1),
(33, '2025-05-05 16:25:36', 13.00, 1, 1),
(34, '2025-05-05 16:26:19', 25.00, 1, 2),
(35, '2025-05-05 16:28:14', 5.00, 1, 2),
(36, '2025-05-06 07:32:10', 13.00, 1, 2),
(37, '2025-05-06 08:35:14', 540.00, 1, 3),
(38, '2025-05-06 13:23:55', 1800.00, 1, 1),
(39, '2025-05-06 16:50:02', 76.00, 1, 1),
(40, '2025-05-07 10:38:56', 214.60, 1, 3),
(41, '2025-05-07 10:41:13', 30.16, 1, 3),
(42, '2025-05-07 10:43:05', 11.60, 1, 3),
(43, '2025-05-07 10:49:11', 15.08, 1, 2),
(44, '2025-05-07 10:58:17', 208.80, 1, 3),
(45, '2025-05-07 11:00:15', 30.16, 1, 3),
(46, '2025-05-07 11:04:30', 30.16, 1, 3),
(47, '2025-05-07 11:09:23', 417.60, 1, 3),
(48, '2025-05-07 11:32:34', 30.16, 1, 3),
(49, '2025-05-07 11:38:26', 15.08, 1, 3),
(50, '2025-05-07 12:08:02', 15.08, 1, 2),
(51, '2025-05-07 13:35:13', 15.08, 1, 2),
(52, '2025-05-07 13:36:33', 214.60, 1, 2),
(53, '2025-05-07 14:09:56', 5.80, 1, 2),
(54, '2025-05-07 16:07:13', 35.96, 1, 2),
(55, '2025-05-07 16:27:54', 110.20, 1, 2),
(56, '2025-05-07 16:53:48', 93.96, 1, 3),
(57, '2025-05-07 16:55:07', 80.04, 1, 2),
(58, '2025-05-07 17:00:42', 25.52, 1, 2),
(59, '2025-05-07 17:02:13', 30.16, 1, 3),
(60, '2025-05-07 17:15:31', 30.16, 1, 1),
(61, '2025-05-07 17:22:21', 54.52, 1, 3),
(62, '2025-05-07 17:23:46', 15.08, 1, 1),
(63, '2025-05-07 17:30:59', 30.16, 1, 3),
(64, '2025-05-07 17:39:21', 5.80, 1, 2),
(65, '2025-05-07 17:40:23', 5.80, 1, 3),
(66, '2025-05-07 17:44:29', 5.80, 1, 2),
(67, '2025-05-07 17:51:41', 35.96, 1, 3),
(68, '2025-05-07 17:58:36', 5.80, 1, 2),
(69, '2025-05-07 18:10:02', 5.80, 1, 3),
(70, '2025-05-07 18:14:49', 30.16, 1, 3),
(71, '2025-05-07 18:16:07', 5.80, 1, 3),
(72, '2025-05-07 18:23:29', 5.80, 1, 2),
(73, '2025-05-07 18:29:12', 30.16, 1, 3),
(74, '2025-05-07 18:30:44', 5.80, 1, 2),
(75, '2025-05-07 18:32:25', 5.80, 1, 2),
(76, '2025-05-07 18:36:50', 5.80, 1, 3),
(77, '2025-05-07 18:38:10', 5.80, 1, 3),
(78, '2025-05-07 18:40:05', 5.80, 1, 3),
(79, '2025-05-07 18:44:05', 5.80, 1, 3),
(80, '2025-05-07 18:46:55', 5.80, 1, 2),
(81, '2025-05-07 18:49:34', 5.80, 1, 3),
(82, '2025-05-07 18:53:37', 5.80, 1, 2),
(83, '2025-05-07 18:55:24', 5.80, 1, 2),
(84, '2025-05-07 18:57:07', 265.64, 1, 1),
(85, '2025-05-07 19:03:58', 82.36, 1, 3),
(86, '2025-05-15 22:41:25', 59.16, 1, 1),
(87, '2025-05-15 22:46:41', 30.16, 1, 1),
(88, '2025-05-16 21:12:15', 30.16, 1, 1),
(89, '2025-05-16 21:13:39', 5.80, 1, 2),
(90, '2025-05-16 21:15:30', 102.08, 1, 1),
(91, '2025-05-16 21:53:55', 30.16, 1, 2),
(92, '2025-05-16 22:07:58', 29.00, 1, 2),
(93, '2025-05-16 22:11:41', 29.00, 1, 2),
(94, '2025-05-16 22:12:18', 29.00, 1, 2),
(95, '2025-05-16 22:16:06', 25.52, 1, 1),
(96, '2025-05-16 22:16:37', 29.00, 1, 1),
(97, '2025-05-16 22:25:57', 30.16, 1, 1),
(98, '2025-05-16 22:27:33', 29.00, 1, 1),
(99, '2025-05-16 22:29:11', 41.76, 1, 1),
(100, '2025-05-16 22:30:46', 59.16, 1, 1),
(101, '2025-05-16 22:32:06', 110.20, 1, 1),
(102, '2025-05-16 22:42:54', 25.52, 1, 1),
(103, '2025-05-16 22:43:14', 41.76, 1, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alertas_caducidad`
--
ALTER TABLE `alertas_caducidad`
  ADD PRIMARY KEY (`id_alerta`),
  ADD KEY `id_lote` (`id_lote`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `colonia`
--
ALTER TABLE `colonia`
  ADD PRIMARY KEY (`id_colonia`),
  ADD KEY `id_municipio` (`id_municipio`);

--
-- Indices de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD PRIMARY KEY (`usuario`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `detalleevento`
--
ALTER TABLE `detalleevento`
  ADD PRIMARY KEY (`id_cliente`,`id_evento`,`id_producto`),
  ADD KEY `id_evento` (`id_evento`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id_direccion`),
  ADD KEY `id_colonia` (`id_colonia`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `id_direccion` (`id_direccion`),
  ADD KEY `id_puesto` (`id_puesto`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id_evento`),
  ADD KEY `id_direccion` (`id_direccion`),
  ADD KEY `fk_evento_cliente` (`id_cliente`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD PRIMARY KEY (`id_ingrediente`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `ingredienteproducto`
--
ALTER TABLE `ingredienteproducto`
  ADD PRIMARY KEY (`id_producto`,`id_ingrediente`),
  ADD KEY `id_ingrediente` (`id_ingrediente`);

--
-- Indices de la tabla `lote`
--
ALTER TABLE `lote`
  ADD PRIMARY KEY (`id_lote`),
  ADD KEY `id_ingrediente` (`id_ingrediente`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`id_municipio`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- Indices de la tabla `productotipo`
--
ALTER TABLE `productotipo`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD KEY `id_direccion` (`id_direccion`);

--
-- Indices de la tabla `puesto`
--
ALTER TABLE `puesto`
  ADD PRIMARY KEY (`id_puesto`);

--
-- Indices de la tabla `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`id_receta`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  ADD PRIMARY KEY (`id_tipo_pago`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_empleado` (`id_empleado`),
  ADD KEY `id_tipo_pago` (`id_tipo_pago`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alertas_caducidad`
--
ALTER TABLE `alertas_caducidad`
  MODIFY `id_alerta` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `colonia`
--
ALTER TABLE `colonia`
  MODIFY `id_colonia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id_direccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  MODIFY `id_ingrediente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `lote`
--
ALTER TABLE `lote`
  MODIFY `id_lote` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `municipio`
--
ALTER TABLE `municipio`
  MODIFY `id_municipio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `productotipo`
--
ALTER TABLE `productotipo`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `puesto`
--
ALTER TABLE `puesto`
  MODIFY `id_puesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `receta`
--
ALTER TABLE `receta`
  MODIFY `id_receta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  MODIFY `id_tipo_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alertas_caducidad`
--
ALTER TABLE `alertas_caducidad`
  ADD CONSTRAINT `alertas_caducidad_ibfk_1` FOREIGN KEY (`id_lote`) REFERENCES `lotes` (`id_lote`);

--
-- Filtros para la tabla `colonia`
--
ALTER TABLE `colonia`
  ADD CONSTRAINT `colonia_ibfk_1` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id_municipio`);

--
-- Filtros para la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD CONSTRAINT `cuenta_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`);

--
-- Filtros para la tabla `detalleevento`
--
ALTER TABLE `detalleevento`
  ADD CONSTRAINT `detalleevento_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `detalleevento_ibfk_2` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`),
  ADD CONSTRAINT `detalleevento_ibfk_3` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `detalleventa_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`),
  ADD CONSTRAINT `detalleventa_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`id_colonia`) REFERENCES `colonia` (`id_colonia`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`),
  ADD CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`id_puesto`) REFERENCES `puesto` (`id_puesto`);

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`),
  ADD CONSTRAINT `fk_evento_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Filtros para la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD CONSTRAINT `ingrediente_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`);

--
-- Filtros para la tabla `ingredienteproducto`
--
ALTER TABLE `ingredienteproducto`
  ADD CONSTRAINT `ingredienteproducto_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `ingredienteproducto_ibfk_2` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente` (`id_ingrediente`);

--
-- Filtros para la tabla `lote`
--
ALTER TABLE `lote`
  ADD CONSTRAINT `lote_ibfk_1` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente` (`id_ingrediente`);

--
-- Filtros para la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `productotipo` (`id_tipo`);

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`);

--
-- Filtros para la tabla `receta`
--
ALTER TABLE `receta`
  ADD CONSTRAINT `receta_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`id_tipo_pago`) REFERENCES `tipopago` (`id_tipo_pago`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
