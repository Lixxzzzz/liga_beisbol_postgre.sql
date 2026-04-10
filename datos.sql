-- INSERTAMOS LOS EQUIPOS

INSERT INTO Equipos (nombre, ciudad) VALUES
('Fuerza del Caribe',   'Santiago'),
('Criolla del Diamante',     'Santo Domingo'),
('Los Tigres del Barrio',   'San Pedro de Macorís'),
('Guerreros del Béisbol',    'La Vega');


-- INSERTAMOS JUGADORES 4 POR EQUIPO 

INSERT INTO Jugadores (nombre, posicion, id_equipo) VALUES

('Carlos Martínez',  'Pitcher',       1), -- Liga Fuerza del caribe (id_equipo = 1)
('Luis Rodríguez',   'Catcher',       1),
('Pedro Sánchez',    'Primera Base',  1),
('Miguel Torres',    'Shortstop',     1),

('José Pérez',       'Pitcher',       2), -- Liga Criolla del Diamante (id_equipo = 2)
('Ramón Díaz',       'Catcher',       2),
('Andrés Gómez',     'Segunda Base',  2),
('Felipe Vargas',    'Outfielder',    2),

('Roberto Núñez',    'Pitcher',       3), -- Liga Los tigueres del barrio (id_equipo = 3)
('Samuel Cruz',      'Catcher',       3),
('Diego Herrera',    'Tercera Base',  3),
('Marcos Reyes',     'Outfielder',    3),

('Alejandro Mora',   'Pitcher',       4),-- Liga guerreros del Beisbol (id_equipo = 4)
('Cristian López',   'Catcher',       4),
('Iván Castillo',    'Primera Base',  4),
('Nelson Jiménez',   'Shortstop',     4);


-- INSERTAR ESTADÍSTICAS INICIALES, un registro por jugador, todos en cero, se agregaran mediante las transacciones.
INSERT INTO Estadisticas (id_jugador, hits, carreras, jonrones)
SELECT id_jugador, 0, 0, 0 FROM Jugadores;


-- INSERTAR EQUIPOS EN TABLA DE POSICIONES, todos empiezan en 0, para poder agregarlos mediantes las transacciones.
INSERT INTO Tabla_Posiciones (id_equipo, juegos_ganados, juegos_perdidos)
SELECT id_equipo, 0, 0 FROM Equipos;
