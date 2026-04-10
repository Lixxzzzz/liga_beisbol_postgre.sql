-- TABLA: Equipos
CREATE TABLE Equipos (
    id_equipo SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL
);

-- TABLA: Jugadores
CREATE TABLE Jugadores (
    id_jugador SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    posicion VARCHAR(50),
    id_equipo INT,
    CONSTRAINT fk_equipo
        FOREIGN KEY (id_equipo)
        REFERENCES Equipos(id_equipo)
        ON DELETE CASCADE
);

-- TABLA: Partidos
CREATE TABLE Partidos (
    id_partido SERIAL PRIMARY KEY,
    fecha DATE NOT NULL,
    equipo_local INT,
    equipo_visitante INT,
    carreras_local INT,
    carreras_visitante INT,
    CONSTRAINT fk_local
        FOREIGN KEY (equipo_local)
        REFERENCES Equipos(id_equipo),
    CONSTRAINT fk_visitante
        FOREIGN KEY (equipo_visitante)
        REFERENCES Equipos(id_equipo)
);

-- TABLA: Estadisticas
CREATE TABLE Estadisticas (
    id_estadistica SERIAL PRIMARY KEY,
    id_jugador INT,
    hits INT DEFAULT 0,
    carreras INT DEFAULT 0,
    jonrones INT DEFAULT 0,
    CONSTRAINT fk_jugador
        FOREIGN KEY (id_jugador)
        REFERENCES Jugadores(id_jugador)
        ON DELETE CASCADE
);

-- TABLA: Tabla_Posiciones
CREATE TABLE Tabla_Posiciones (
    id_equipo INT PRIMARY KEY,
    juegos_ganados INT DEFAULT 0,
    juegos_perdidos INT DEFAULT 0,
    CONSTRAINT fk_equipo_pos
        FOREIGN KEY (id_equipo)
        REFERENCES Equipos(id_equipo)
        ON DELETE CASCADE
