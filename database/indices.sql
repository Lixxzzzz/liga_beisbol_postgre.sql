-- INSERTS
INSERT INTO Equipos (nombre, ciudad) VALUES
('Licey', 'Santo Domingo'),
('Aguilas', 'Santiago');

INSERT INTO Jugadores (nombre, posicion, id_equipo) VALUES
('Juan Perez', 'Pitcher', 1),
('Carlos Gomez', 'Bateador', 1),
('Luis Martinez', 'Catcher', 2);

INSERT INTO Jugadores (nombre, posicion, id_equipo)
SELECT 'Jugador ' || generate_series, 'Pitcher', 1
FROM generate_series(1, 10000);

-- PRUEBA SIN ÍNDICE
EXPLAIN ANALYZE
SELECT * FROM Jugadores
WHERE id_equipo = 1;

-- CREAR ÍNDICE
CREATE INDEX idx_jugadores_equipo
ON Jugadores(id_equipo);

-- PRUEBA CON ÍNDICE
EXPLAIN ANALYZE
SELECT * FROM Jugadores
WHERE id_equipo = 1;