BEGIN;

    INSERT INTO Partidos (fecha, equipo_local, equipo_visitante, carreras_local, carreras_visitante)
    VALUES ('2026-04-01', 1, 2, 7, 3);
-- SE HACE UNA ACTUALIZACION DE CADA TABLA, POR ESO NO SE INSERTARON DATOS EN LAS TABLAS (ESTADISTICAS, TABLA_POSICIONES) DIRECTAMENTE. DICHOS DATOS SE INSERTAN MEDIANTE LAS TRANSACCION.

    UPDATE Estadisticas
    SET hits = hits + 2,
        carreras = carreras + 1,
        jonrones = jonrones + 1
    WHERE id_jugador = 1;

    UPDATE Estadisticas
    SET hits = hits + 3,
        carreras = carreras + 2
    WHERE id_jugador = 2;

    UPDATE Tabla_Posiciones
    SET juegos_ganados = juegos_ganados + 1
    WHERE id_equipo = 1;

    UPDATE Tabla_Posiciones
    SET juegos_perdidos = juegos_perdidos + 1
    WHERE id_equipo = 2;

COMMIT;

-- LUEGO DE LA TRANSACCION, SE HACE ESTO PARA COMPROBAR QUE TODO SE REALIZO DE MANERA CORRECTA --
SELECT * FROM Partidos;

SELECT j.nombre, e.hits, e.carreras, e.jonrones
FROM Estadisticas e
JOIN Jugadores j ON e.id_jugador = j.id_jugador
WHERE e.id_jugador IN (1, 2);

SELECT eq.nombre, tp.juegos_ganados, tp.juegos_perdidos
FROM Tabla_Posiciones tp
JOIN Equipos eq ON tp.id_equipo = eq.id_equipo;

