-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-09-2020 a las 13:17:12
-- Versión del servidor: 10.1.39-MariaDB
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `culampolla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `direccionPostal` varchar(45) NOT NULL,
  `recomendado` varchar(10) NOT NULL,
  `clienteconocido` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `fecha`, `nombre`, `telefono`, `email`, `direccionPostal`, `recomendado`, `clienteconocido`) VALUES
(35, '2020-09-10', 'Ana Gonzalez', '937862712', 'gonazaleza@mail.com', 'Calle LLuis Companys, 91, bjos.1', 'No', ''),
(36, '2020-09-10', 'Antonio Marchena', '937891548', 'marchena@gmail.com', 'avda. america,125,bjos1,terrassa,BCN', 'Si', 'Ana Gonzalez'),
(37, '2020-09-08', 'Jordi Batlle', '937891425', 'jbatlle@gmail.com', 'Calle Formigal,45, Sant Boi, BCN', 'Si', 'Antonio Marchena ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gafas`
--

CREATE TABLE `gafas` (
  `id` int(11) NOT NULL,
  `nifproveedor` int(11) NOT NULL,
  `graduacion_OD` varchar(45) NOT NULL,
  `graduacion_OI` varchar(45) NOT NULL,
  `tipoMontura` varchar(45) NOT NULL,
  `colorMontura` varchar(45) NOT NULL,
  `colorVidrios` varchar(100) NOT NULL,
  `precio` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `gafas`
--

INSERT INTO `gafas` (`id`, `nifproveedor`, `graduacion_OD`, `graduacion_OI`, `tipoMontura`, `colorMontura`, `colorVidrios`, `precio`) VALUES
(1, 0, '-2.75', '-1.25', 'Dura', 'Negro', 'Transparente', '150'),
(2, 0, '+1.25 ', '+2', 'Pasta', 'Azul', 'Transparente', '175'),
(3, 0, '-3.25', ' -2.25', 'Metalica', 'Azul', 'Transparente ', '200'),
(4, 0, '-4.00', '-3.50', 'Metalica', 'Rojo', 'Transparente', '150'),
(5, 0, '+2.00 ', '+1.50', 'Al aire', 'Lila', 'Transparente', '220'),
(6, 0, '+2.25', '+2.00', 'Al aire', 'Verde', 'Transparente', '230');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `nif` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `telefono` int(11) NOT NULL,
  `fax` int(11) NOT NULL,
  `direccion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`nif`, `nombre`, `telefono`, `fax`, `direccion`) VALUES
(456789789, 'Quim Martinez Rodriguez', 937862745, 937862746, 'C/LLuis Companys, 45, Terrassa(BCN)'),
(502698154, 'Laura Comasolivas Juliver', 933914562, 933914563, 'Avda.America, 40, Sta. Coloma de Gramanet , BCN'),
(523996595, 'Enrique Castro Heredia', 936542317, 936542318, 'Calle Rosalenda, 135, Sabadell,BCN'),
(523996781, 'Francisco Ruiz Vazquez', 933915020, 933915021, 'Avda. America, 35, Sta Coloma de Gramenet (BCN)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `nifproveedor` int(11) NOT NULL,
  `nifempleado` varchar(45) NOT NULL,
  `nombrecliente` varchar(45) NOT NULL,
  `idgafa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `telefono` (`telefono`),
  ADD KEY `nombre` (`nombre`);

--
-- Indices de la tabla `gafas`
--
ALTER TABLE `gafas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nifproveedor` (`nifproveedor`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`nif`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ventas-clientes` (`nombrecliente`),
  ADD KEY `ventas-proveedor` (`nifproveedor`),
  ADD KEY `ventas-gafas` (`idgafa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `gafas`
--
ALTER TABLE `gafas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas-clientes` FOREIGN KEY (`nombrecliente`) REFERENCES `clientes` (`nombre`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ventas-gafas` FOREIGN KEY (`idgafa`) REFERENCES `gafas` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ventas-proveedor` FOREIGN KEY (`nifproveedor`) REFERENCES `proveedor` (`nif`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
