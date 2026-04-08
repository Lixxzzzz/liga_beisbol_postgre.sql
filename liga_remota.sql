-- CREACION DE TABLAS LIGAS REMOTAS
CREATE TABLE Partidos (
    id_partido SERIAL PRIMARY KEY,
    fecha DATE NOT NULL,
    equipo_local INT,
    equipo_visitante INT,
    carreras_local INT,
    carreras_visitante INT
);

CREATE TABLE Estadisticas (
    id_estadistica SERIAL PRIMARY KEY,
    id_jugador INT,
    golpes INT DEFAULT 0,
    carreras INT DEFAULT 0,
    jonrones INT DEFAULT 0
);

-- INSERTAR DATOS DE PRUEBA
INSERT INTO Partidos (fecha, equipo_local, equipo_visitante, carreras_local, carreras_visitante)
VALUES
('2026-04-01', 1, 2, 5, 3),
('2026-04-02', 2, 3, 2, 4);

INSERT INTO Estadisticas (id_jugador, golpes, carreras, jonrones)
VALUES
(1, 3, 1, 1),
(2, 2, 2, 0);