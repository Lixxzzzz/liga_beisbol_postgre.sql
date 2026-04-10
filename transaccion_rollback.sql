--TRANSACCION CON UN ROLLBACK 
BEGIN;

    INSERT INTO Partidos (fecha, equipo_local, equipo_visitante, carreras_local, carreras_visitante)
    VALUES ('2026-04-02', 3, 4, 5, 2);

    UPDATE Estadisticas
    SET hits = hits + 4,
        carreras = carreras + 3
    WHERE id_jugador = 9;

    UPDATE Tabla_Posiciones
    SET juegos_ganados = juegos_ganados + 1
    WHERE id_equipo = 99;

ROLLBACK;

--LUEGO HACEMOS ESO PRA COMPROBAR QUE NO SE HIZO LA TRANSACCION PORQUE TIENE UN ROLLBACK, DEBERIA DE APARECER EL PARTIDO 01/02/2026, NO EL DE 02/04/2026

SELECT * FROM Partidos;

-- Las estadísticas de Roberto Núñez deben seguir en 0
SELECT j.nombre, e.hits, e.carreras, e.jonrones
FROM Estadisticas e
JOIN Jugadores j ON e.id_jugador = j.id_jugador
WHERE e.id_jugador = 9;
