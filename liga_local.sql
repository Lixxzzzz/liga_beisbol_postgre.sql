-- CREACION DE TABLAS LIGAS LOCALES
CREATE TABLE Equipos (
    id_equipo SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL
);

CREATE TABLE Jugadores (
    id_jugador SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    posicion VARCHAR(50),
    id_equipo INT,
    FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo)
);

CREATE TABLE Tabla_Posiciones (
    id_equipo INT PRIMARY KEY,
    juegos_ganados INT DEFAULT 0,
    juegos_perdidos INT DEFAULT 0,
    FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo)
);
-- INSERTAMOS LOS EQUIPOS

INSERT INTO Equipos (nombre, ciudad) VALUES
('Fuerza del Caribe',   'Santiago'),
('Criolla del Diamante',     'Santo Domingo'),
('Los Tigres del Barrio',   'San Pedro de Macorís'),
('Guerreros del Béisbol',    'La Vega');


INSERT INTO Jugadores (nombre, posicion, id_equipo) VALUES
-- (id_equipo = 1)
('Carlos Martínez',  'Pitcher',       1),
('Luis Rodríguez',   'Catcher',       1),
('Pedro Sánchez',    'Primera Base',  1),
('Miguel Torres',    'Shortstop',     1),
-- (id_equipo = 2)
('José Pérez',       'Pitcher',       2),
('Ramón Díaz',       'Catcher',       2),
('Andrés Gómez',     'Segunda Base',  2),
('Felipe Vargas',    'Outfielder',    2),
-- (id_equipo = 3)
('Roberto Núñez',    'Pitcher',       3),
('Samuel Cruz',      'Catcher',       3),
('Diego Herrera',    'Tercera Base',  3),
('Marcos Reyes',     'Outfielder',    3),
-- (id_equipo = 4)
('Alejandro Mora',   'Pitcher',       4),
('Cristian López',   'Catcher',       4),
('Iván Castillo',    'Primera Base',  4),
('Nelson Jiménez',   'Shortstop',     4);

-- CONFIGURAR postgres_fdw
CREATE EXTENSION postgres_fdw;

-- CREAR SERVIDOR REMOTO
CREATE SERVER servidor_remoto
FOREIGN DATA WRAPPER postgres_fdw
OPTIONS (
    host 'liga_remota',
    port '5432',
    dbname 'liga'
);

-- CREAR MAPPEO
CREATE USER MAPPING FOR CURRENT_USER
SERVER servidor_remoto
OPTIONS (
    user 'postgres',
    password '1234'
);

-- IMPORTAR TABLAS REMOTAS
IMPORT FOREIGN SCHEMA public
LIMIT TO (Partidos, Estadisticas)
FROM SERVER servidor_remoto
INTO public;

-- VERIFICAR TABLAS
SELECT * FROM Partidos;

-- Consulta avanzada
SELECT e.nombre, p.fecha, p.carreras_local
FROM Equipos e
JOIN Partidos p ON e.id_equipo = p.equipo_local;

-- Actualización de datos
UPDATE Partidos
SET carreras_local = 20
WHERE id_partido = 1;
