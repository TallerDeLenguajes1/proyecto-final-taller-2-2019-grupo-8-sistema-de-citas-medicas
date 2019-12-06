-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-12-2019 a las 03:37:32
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `libromedico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dia`
--

CREATE TABLE `dia` (
  `id_dia` int(11) NOT NULL,
  `dia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dia`
--

INSERT INTO `dia` (`id_dia`, `dia`) VALUES
(1, 'Monday'),
(2, 'Tuesday'),
(3, 'Wednesday'),
(4, 'Thursday'),
(5, 'Friday'),
(6, 'Saturday');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `id_especialidad` int(11) NOT NULL,
  `especialidad` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`id_especialidad`, `especialidad`) VALUES
(1, 'ODONTOLOGIA'),
(2, 'ONCOLOGIA'),
(3, 'TRAUMATOLOGIA'),
(4, 'NEUMONOLOGIA'),
(5, 'NEUROLOGIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `estado` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `estado`) VALUES
(1, 'Pendiente'),
(2, 'Aplicada'),
(3, 'No asistio'),
(4, 'Cancelada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horariomedico`
--

CREATE TABLE `horariomedico` (
  `id_horariomedico` int(11) NOT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `id_dia` int(11) DEFAULT NULL,
  `horainicio_a` varchar(100) DEFAULT NULL,
  `horafin_a` varchar(100) DEFAULT NULL,
  `horainicio_b` varchar(100) DEFAULT NULL,
  `horafin_b` varchar(100) DEFAULT NULL,
  `duracion_turnos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `horariomedico`
--

INSERT INTO `horariomedico` (`id_horariomedico`, `id_medico`, `id_dia`, `horainicio_a`, `horafin_a`, `horainicio_b`, `horafin_b`, `duracion_turnos`) VALUES
(2, 1, 3, '08:00', '12:00', '17:00', '21:00', 60),
(3, 2, 1, '08:00', '12:00', '', '', 60),
(4, 2, 2, '08:00', '12:00', '17:00', '21:00', 30),
(5, 2, 4, '17:00', '21:00', '', '', 15),
(6, 1, 2, '08:00', '12:00', '17:00', '20:00', 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

CREATE TABLE `medico` (
  `id_medico` int(11) NOT NULL,
  `dni` varchar(50) DEFAULT NULL,
  `matricula` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `genero` varchar(1) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `fecha_alta` datetime DEFAULT NULL,
  `id_especialidad` int(11) DEFAULT NULL,
  `es_activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `medico`
--

INSERT INTO `medico` (`id_medico`, `dni`, `matricula`, `nombre`, `apellido`, `genero`, `fecha_nac`, `email`, `direccion`, `telefono`, `fecha_alta`, `id_especialidad`, `es_activo`) VALUES
(1, '87287362', '7620938', 'Luis', 'Gimenez', 'm', '1980-06-03', 'gimenez@hotmail.com', 'san luis 123', '381871528', '2019-12-03 16:34:35', 2, 1),
(2, '34726437', '3434', 'Carlos', 'Perez', 'm', '2019-12-04', 'carlosp_@gmail.com', 'Mendoza 1000', '43453455', '2019-12-04 15:36:11', 4, 1),
(3, '5345345', '54645645', 'Pablo', 'Gerez', 'm', '2019-12-04', 'gpablo@hotmail.com', 'San Martin', '4345345', '2019-12-04 15:41:19', 1, 1),
(4, '143345', '10101', 'Marcelo', 'Fernandez', 'm', '2019-12-04', 'jojoFernandez@gmail.com', 'Cordoba 122', '4354353', '2019-12-04 15:42:14', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `id_paciente` int(11) NOT NULL,
  `dni` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `genero` varchar(1) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `enfermedad` varchar(500) DEFAULT NULL,
  `medicamentos` varchar(500) DEFAULT NULL,
  `alergia` varchar(500) DEFAULT NULL,
  `fecha_alta` datetime DEFAULT NULL,
  `es_activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`id_paciente`, `dni`, `nombre`, `apellido`, `genero`, `fecha_nac`, `email`, `direccion`, `telefono`, `enfermedad`, `medicamentos`, `alergia`, `fecha_alta`, `es_activo`) VALUES
(1, '1234567', 'Horacio', 'Barreda', 'm', '1969-12-16', 'barreda@hotmail.com', 'Catamarca 49', '3812687373', 'No posee', 'Rivotril', 'No posee', '2019-12-03 16:33:27', 0),
(2, '33978362', 'luis', 'ariza', 'm', '2010-02-10', 'aaff', 'dsghsttsh', 'srgacsgrg', 'face', 'dvsafgt', 'asggr hth', '2009-10-20 00:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `estado_pago` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`id_pago`, `estado_pago`) VALUES
(1, 'Pendiente'),
(2, 'Pagado'),
(3, 'Anulado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservacion`
--

CREATE TABLE `reservacion` (
  `id_reservacion` int(11) NOT NULL,
  `asunto_cita` varchar(100) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `fecha_cita` varchar(50) DEFAULT NULL,
  `hora_cita` varchar(50) DEFAULT NULL,
  `fecha_alta` datetime DEFAULT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `sintomas` text DEFAULT NULL,
  `enfermedad` text DEFAULT NULL,
  `medicamentos` text DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `id_pago` int(11) NOT NULL DEFAULT 1,
  `id_estado` int(11) NOT NULL DEFAULT 1,
  `es_activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reservacion`
--

INSERT INTO `reservacion` (`id_reservacion`, `asunto_cita`, `observaciones`, `fecha_cita`, `hora_cita`, `fecha_alta`, `id_paciente`, `sintomas`, `enfermedad`, `medicamentos`, `id_usuario`, `id_medico`, `precio`, `id_pago`, `id_estado`, `es_activo`) VALUES
(1, 'Consulta sobre un dolor', 'debe pedirle la mitad del dinero', '2019-12-09', '02:30', '2019-12-03 16:37:25', 1, 'dolor abdominal', 'Posee cataratas', 'no toma ningun en especial', 1, 1, 23687, 1, 1, 0),
(2, 'Nuevo turno', 'Prueba', '2019-12-16', '03:00', '2019-12-04 15:35:38', 1, 'Prueba', 'Prueba', 'Prueba', 1, 1, 500, 1, 1, 1),
(3, 'Turno Prueba2', 'etc', '2019-12-17', '09:00', '2019-12-04 15:46:19', 1, 'etc', 'ninguna', 'ninguno', 1, 2, 4535.5, 1, 1, 1),
(4, 'SADFADS', 'DSAFA', '2019-12-10', '09:00', '2019-12-04 17:29:00', 2, 'AFSDF', 'SDF', 'ADSFA', 1, 1, 43543, 1, 4, 1),
(5, 'RFDGSGF', 'DSFGDS', '2019-12-10', '09:30', '2019-12-04 17:28:47', 1, 'SFGDS', 'FSDG', 'DSFG', 1, 1, 454, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contraseña` varchar(60) DEFAULT NULL,
  `es_activo` tinyint(1) NOT NULL DEFAULT 1,
  `es_admin` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_alta` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre_usuario`, `nombre`, `apellido`, `email`, `contraseña`, `es_activo`, `es_admin`, `fecha_alta`) VALUES
(1, 'admin', 'Emmanuel', 'Gimenez', 'Lemmanuel.gimenez@gmail.com', 'admin', 1, 1, '2019-12-03 19:32:34'),
(2, 'hola', 'Luis', 'Prat', 'prat1@gmail.com', '1234', 1, 0, '2019-12-03 16:38:54'),
(3, 'EmmanuelG', 'Emmanuel', 'perez', 'Lemmanuel@gmail.com', '1234', 0, 0, '2019-12-03 17:04:55');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `dia`
--
ALTER TABLE `dia`
  ADD PRIMARY KEY (`id_dia`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id_especialidad`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `horariomedico`
--
ALTER TABLE `horariomedico`
  ADD PRIMARY KEY (`id_horariomedico`),
  ADD KEY `id_dia` (`id_dia`),
  ADD KEY `id_medico` (`id_medico`);

--
-- Indices de la tabla `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id_medico`),
  ADD KEY `id_especialidad` (`id_especialidad`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id_paciente`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`);

--
-- Indices de la tabla `reservacion`
--
ALTER TABLE `reservacion`
  ADD PRIMARY KEY (`id_reservacion`),
  ADD KEY `id_pago` (`id_pago`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_medico` (`id_medico`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `dia`
--
ALTER TABLE `dia`
  MODIFY `id_dia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id_especialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `horariomedico`
--
ALTER TABLE `horariomedico`
  MODIFY `id_horariomedico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `medico`
--
ALTER TABLE `medico`
  MODIFY `id_medico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `reservacion`
--
ALTER TABLE `reservacion`
  MODIFY `id_reservacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `horariomedico`
--
ALTER TABLE `horariomedico`
  ADD CONSTRAINT `horariomedico_ibfk_1` FOREIGN KEY (`id_dia`) REFERENCES `dia` (`id_dia`),
  ADD CONSTRAINT `horariomedico_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`);

--
-- Filtros para la tabla `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`id_especialidad`);

--
-- Filtros para la tabla `reservacion`
--
ALTER TABLE `reservacion`
  ADD CONSTRAINT `reservacion_ibfk_1` FOREIGN KEY (`id_pago`) REFERENCES `pago` (`id_pago`),
  ADD CONSTRAINT `reservacion_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `reservacion_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `reservacion_ibfk_4` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`),
  ADD CONSTRAINT `reservacion_ibfk_5` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
