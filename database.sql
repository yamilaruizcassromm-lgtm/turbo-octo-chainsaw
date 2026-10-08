-- Creación de la base de datos para el colegio
CREATE DATABASE IF NOT EXISTS bti_evaluaciones;
USE bti_evaluaciones;

-- Tabla de Estudiantes
CREATE TABLE estudiantes (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre_apellido VARCHAR(100) NOT NULL,
    curso_seccion VARCHAR(20) NOT NULL DEFAULT '2.º BTI',
    institucion VARCHAR(100) DEFAULT 'Colegio Nacional EMD Asunción Escalada'
);

-- Tabla de Trabajos Prácticos
CREATE TABLE trabajos_practicos (
    id_trabajo INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    asignatura VARCHAR(80) NOT NULL,
    fecha_entrega DATE NOT NULL,
    url_video VARCHAR(255),
    url_pagina_web VARCHAR(255),
    id_estudiante INT,
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante) ON DELETE CASCADE
);

-- Tabla de Preguntas y Respuestas del Cuestionario
CREATE TABLE cuestionario_respuestas (
    id_respuesta INT AUTO_INCREMENT PRIMARY KEY,
    id_trabajo INT,
    numero_pregunta INT NOT NULL,
    pregunta TEXT NOT NULL,
    respuesta TEXT NOT NULL,
    FOREIGN KEY (id_trabajo) REFERENCES trabajos_practicos(id_trabajo) ON DELETE CASCADE
);

-- Registros de prueba
INSERT INTO estudiantes (nombre_apellido, curso_seccion) 
VALUES ('Tu Nombre y Apellido', '2.º BTI');

INSERT INTO trabajos_practicos (titulo, asignatura, fecha_entrega, url_video, id_estudiante) 
VALUES ('Lo que aprendí del video', 'Software / Desarrollo Web', '2026-10-08', 'https://www.youtube.com/watch?v=pi33WDrgfpl', 1);