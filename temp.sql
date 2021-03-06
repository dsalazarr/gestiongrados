#
# TABLE STRUCTURE FOR: actividades
#

DROP TABLE IF EXISTS actividades;

CREATE TABLE `actividades` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `identificador` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO actividades (`id`, `descripcion`, `identificador`) VALUES (6, 'Teoría', 'A');
INSERT INTO actividades (`id`, `descripcion`, `identificador`) VALUES (7, 'Laboratorio', 'B');
INSERT INTO actividades (`id`, `descripcion`, `identificador`) VALUES (8, 'Problemas', 'C');
INSERT INTO actividades (`id`, `descripcion`, `identificador`) VALUES (9, 'Informática', 'D');
INSERT INTO actividades (`id`, `descripcion`, `identificador`) VALUES (10, 'Prácticas de campo', 'E');


#
# TABLE STRUCTURE FOR: asignaturas
#

DROP TABLE IF EXISTS asignaturas;

CREATE TABLE `asignaturas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(3) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `abreviatura` varchar(5) NOT NULL,
  `creditos` int(11) NOT NULL,
  `materia` varchar(100) NOT NULL,
  `departamento` varchar(200) NOT NULL,
  `curso` int(10) unsigned NOT NULL,
  `semestre` varchar(255) NOT NULL,
  `titulacion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `titulacion_id_idx` (`titulacion_id`),
  CONSTRAINT `asignaturas_titulacion_id_titulaciones_id` FOREIGN KEY (`titulacion_id`) REFERENCES `titulaciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO asignaturas (`id`, `codigo`, `nombre`, `abreviatura`, `creditos`, `materia`, `departamento`, `curso`, `semestre`, `titulacion_id`) VALUES (4, '123', 'Análisis y diseño de algoritmos I', 'ADAI', 6, 'Algoritmia', 'Lenguajes y sistemas', 2, 'primero', 3);
INSERT INTO asignaturas (`id`, `codigo`, `nombre`, `abreviatura`, `creditos`, `materia`, `departamento`, `curso`, `semestre`, `titulacion_id`) VALUES (5, '124', 'Estructura de Datos I', 'EDI', 6, 'Programación', 'Lenguajes y sistemas', 1, 'segundo', 3);
INSERT INTO asignaturas (`id`, `codigo`, `nombre`, `abreviatura`, `creditos`, `materia`, `departamento`, `curso`, `semestre`, `titulacion_id`) VALUES (6, '122', 'Fundamentos en Informática', 'FI', 6, 'Porgramación', 'Lenguajes y sistemas', 1, 'primero', 4);


#
# TABLE STRUCTURE FOR: aulaactividades
#

DROP TABLE IF EXISTS aulaactividades;

CREATE TABLE `aulaactividades` (
  `id_actividad` bigint(20) unsigned NOT NULL,
  `id_aula` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id_actividad`,`id_aula`),
  KEY `aulaactividades_id_aula_aulas_id` (`id_aula`),
  CONSTRAINT `aulaactividades_id_actividad_actividades_id` FOREIGN KEY (`id_actividad`) REFERENCES `actividades` (`id`),
  CONSTRAINT `aulaactividades_id_aula_aulas_id` FOREIGN KEY (`id_aula`) REFERENCES `aulas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: aulas
#

DROP TABLE IF EXISTS aulas;

CREATE TABLE `aulas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: calendarios
#

DROP TABLE IF EXISTS calendarios;

CREATE TABLE `calendarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: cargas_semanales
#

DROP TABLE IF EXISTS cargas_semanales;

CREATE TABLE `cargas_semanales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_semana` int(10) unsigned NOT NULL,
  `horas_teoria` int(10) unsigned NOT NULL,
  `horas_problemas` int(10) unsigned NOT NULL,
  `horas_informatica` int(10) unsigned NOT NULL,
  `horas_lab` int(10) unsigned NOT NULL,
  `horas_campo` int(10) unsigned NOT NULL,
  `entrega_trabajo` tinyint(1) NOT NULL,
  `examen` tinyint(1) NOT NULL,
  `plandocente_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `plandocente_id_idx` (`plandocente_id`),
  CONSTRAINT `cargas_semanales_plandocente_id_planesdocentes_id` FOREIGN KEY (`plandocente_id`) REFERENCES `planesdocentes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: ci_sessions
#

DROP TABLE IF EXISTS ci_sessions;

CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO ci_sessions (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES ('c5289ffa5cf3a2e5a6c95181b624ebbe', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:8.0) Gecko/20100101 Firefox/8.0', 1323262701, '');


#
# TABLE STRUCTURE FOR: cursos
#

DROP TABLE IF EXISTS cursos;

CREATE TABLE `cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_semanas_teoria` int(11) NOT NULL,
  `num_semanas_semestre1` int(11) NOT NULL DEFAULT '0',
  `num_semanas_semestre2` int(11) NOT NULL DEFAULT '0',
  `horas_por_credito` int(11) NOT NULL,
  `slot_minimo` bigint(20) NOT NULL DEFAULT '30',
  `hora_inicial` time NOT NULL DEFAULT '09:00:00',
  `hora_final` time NOT NULL DEFAULT '22:00:00',
  `inicio_semestre1` date NOT NULL,
  `fin_semestre1` date NOT NULL,
  `inicio_semestre2` date NOT NULL,
  `fin_semestre2` date NOT NULL,
  `inicio_examenes_enero` date NOT NULL,
  `fin_examenes_enero` date NOT NULL,
  `inicio_examenes_junio` date NOT NULL,
  `fin_examenes_junio` date NOT NULL,
  `inicio_examenes_sept` date NOT NULL,
  `fin_examenes_sept` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO cursos (`id`, `num_semanas_teoria`, `num_semanas_semestre1`, `num_semanas_semestre2`, `horas_por_credito`, `slot_minimo`, `hora_inicial`, `hora_final`, `inicio_semestre1`, `fin_semestre1`, `inicio_semestre2`, `fin_semestre2`, `inicio_examenes_enero`, `fin_examenes_enero`, `inicio_examenes_junio`, `fin_examenes_junio`, `inicio_examenes_sept`, `fin_examenes_sept`) VALUES (2, 3, 15, 15, 10, 30, '09:00:00', '22:00:00', '2011-09-22', '2012-01-10', '2012-02-03', '2012-06-04', '2012-01-12', '2012-02-01', '2012-06-05', '2012-07-05', '2012-09-01', '2012-09-20');


#
# TABLE STRUCTURE FOR: cursos_compartidos
#

DROP TABLE IF EXISTS cursos_compartidos;

CREATE TABLE `cursos_compartidos` (
  `id_plandocente` int(11) NOT NULL,
  `num_curso_compartido` int(11) NOT NULL,
  PRIMARY KEY (`id_plandocente`,`num_curso_compartido`),
  CONSTRAINT `cursos_compartidos_id_plandocente_planesdocentes_id` FOREIGN KEY (`id_plandocente`) REFERENCES `planesdocentes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: eventos
#

DROP TABLE IF EXISTS eventos;

CREATE TABLE `eventos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_evento` varchar(255) NOT NULL,
  `tipo_evento` varchar(255) NOT NULL,
  `fecha_individual` tinyint(1) NOT NULL,
  `fecha_inicial` date NOT NULL,
  `fecha_final` date NOT NULL,
  `curso_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `curso_id_idx` (`curso_id`),
  CONSTRAINT `eventos_curso_id_cursos_id` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: horario_reference
#

DROP TABLE IF EXISTS horario_reference;

CREATE TABLE `horario_reference` (
  `id_tipo` bigint(20) unsigned NOT NULL,
  `id_teoria` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id_tipo`,`id_teoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: horarios
#

DROP TABLE IF EXISTS horarios;

CREATE TABLE `horarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_curso` int(11) NOT NULL,
  `id_titulacion` int(11) NOT NULL,
  `num_curso_titulacion` int(11) NOT NULL,
  `semestre` varchar(255) NOT NULL,
  `num_grupo_titulacion` int(11) NOT NULL,
  `num_semana` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_curso_idx` (`id_curso`),
  KEY `id_titulacion_idx` (`id_titulacion`),
  CONSTRAINT `horarios_id_curso_cursos_id` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id`),
  CONSTRAINT `horarios_id_titulacion_titulaciones_id` FOREIGN KEY (`id_titulacion`) REFERENCES `titulaciones` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: lineashorarios
#

DROP TABLE IF EXISTS lineashorarios;

CREATE TABLE `lineashorarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_horario` int(11) NOT NULL,
  `id_asignatura` int(11) NOT NULL,
  `hora_inicial` time DEFAULT NULL,
  `hora_final` time DEFAULT NULL,
  `dia_semana` tinyint(3) unsigned DEFAULT NULL,
  `id_actividad` bigint(20) unsigned DEFAULT NULL,
  `num_grupo_actividad` bigint(20) unsigned NOT NULL,
  `slot_minimo` float(18,2) NOT NULL,
  `color` varchar(7) DEFAULT NULL,
  `id_aula` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_horario_idx` (`id_horario`),
  KEY `id_asignatura_idx` (`id_asignatura`),
  KEY `id_aula_idx` (`id_aula`),
  KEY `id_actividad_idx` (`id_actividad`),
  CONSTRAINT `lineashorarios_id_actividad_actividades_id` FOREIGN KEY (`id_actividad`) REFERENCES `actividades` (`id`),
  CONSTRAINT `lineashorarios_id_asignatura_asignaturas_id` FOREIGN KEY (`id_asignatura`) REFERENCES `asignaturas` (`id`),
  CONSTRAINT `lineashorarios_id_aula_aulas_id` FOREIGN KEY (`id_aula`) REFERENCES `aulas` (`id`),
  CONSTRAINT `lineashorarios_id_horario_horarios_id` FOREIGN KEY (`id_horario`) REFERENCES `horarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: planactividades
#

DROP TABLE IF EXISTS planactividades;

CREATE TABLE `planactividades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_plandocente` int(11) NOT NULL,
  `id_actividad` bigint(20) unsigned NOT NULL,
  `horas` int(10) unsigned NOT NULL DEFAULT '0',
  `grupos` int(10) unsigned NOT NULL DEFAULT '0',
  `horas_semanales` int(10) unsigned NOT NULL DEFAULT '0',
  `alternas` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_plandocente_idx` (`id_plandocente`),
  KEY `id_actividad_idx` (`id_actividad`),
  CONSTRAINT `planactividades_id_actividad_actividades_id` FOREIGN KEY (`id_actividad`) REFERENCES `actividades` (`id`),
  CONSTRAINT `planactividades_id_plandocente_planesdocentes_id` FOREIGN KEY (`id_plandocente`) REFERENCES `planesdocentes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: planesdocentes
#

DROP TABLE IF EXISTS planesdocentes;

CREATE TABLE `planesdocentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_asignatura` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_asignatura_idx` (`id_asignatura`),
  KEY `id_curso_idx` (`id_curso`),
  CONSTRAINT `planesdocentes_id_asignatura_asignaturas_id` FOREIGN KEY (`id_asignatura`) REFERENCES `asignaturas` (`id`),
  CONSTRAINT `planesdocentes_id_curso_cursos_id` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: titulaciones
#

DROP TABLE IF EXISTS titulaciones;

CREATE TABLE `titulaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(4) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `creditos` int(10) unsigned NOT NULL,
  `num_cursos` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO titulaciones (`id`, `codigo`, `nombre`, `creditos`, `num_cursos`) VALUES (3, '1714', 'Grado en Ingeniería Informática', 200, 4);
INSERT INTO titulaciones (`id`, `codigo`, `nombre`, `creditos`, `num_cursos`) VALUES (4, '1715', 'Grado en Ingeniería Industrial', 215, 4);


#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS users;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `dni` varchar(9) NOT NULL,
  `email` varchar(30) NOT NULL,
  `id_titulacion` int(11) NOT NULL,
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni` (`dni`),
  UNIQUE KEY `email` (`email`),
  KEY `id_titulacion_idx` (`id_titulacion`),
  CONSTRAINT `users_id_titulacion_titulaciones_id` FOREIGN KEY (`id_titulacion`) REFERENCES `titulaciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO users (`id`, `password`, `nombre`, `apellidos`, `dni`, `email`, `id_titulacion`, `level`) VALUES (2, '14e1b600b1fd579f47433b88e8d85291', 'Admin', 'Admin', '77777777W', 'administrador@uca.es', 3, 1);


