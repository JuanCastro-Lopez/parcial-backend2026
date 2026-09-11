CREATE DATABASE IF NOT EXISTS eventos_nest_db;

USE eventos_nest_db;

CREATE TABLE IF NOT EXISTS eventos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL UNIQUE,
    descripcion TEXT,
    cupoMaximo INT NOT NULL,
    estado VARCHAR(50) NOT NULL DEFAULT 'ACTIVO'
);

CREATE TABLE IF NOT EXISTS asistentes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombreCompleto VARCHAR(255) NOT NULL,
    correo VARCHAR(255) NOT NULL,
    telefono VARCHAR(50),
    codigoTicket VARCHAR(50) NOT NULL UNIQUE,
    eventoId INT NOT NULL,

    CONSTRAINT fk_asistente_evento
        FOREIGN KEY (eventoId)
        REFERENCES eventos(id)
        ON DELETE CASCADE
);