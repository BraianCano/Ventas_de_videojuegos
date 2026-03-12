COPY videojuegos (rank, nombre, plataforma, anio, genero, publisher,
                  ventas_na, ventas_eu, ventas_jp, ventas_otras, ventas_global)
FROM 'C:/Users/Braian/Documents/Proyectos/Ventas_de_videojuegos/Datos_crudo/vgsales.csv'
WITH (FORMAT CSV, HEADER TRUE, ENCODING 'UTF8');


SELECT COUNT(*)        AS total_juegos  FROM videojuegos;
SELECT *               FROM videojuegos LIMIT 5;
