-- ¿Cuántos juegos hay en total?
SELECT COUNT(*) AS total_juegos
FROM videojuegos;
-- Resultado: 16.598 juegos en el dataset


-- ¿Qué rango de años cubre el dataset?
SELECT
    MIN(anio) AS primer_anio,
    MAX(anio) AS ultimo_anio
FROM videojuegos
WHERE anio != 'N/A';
-- Resultado: desde 1980 hasta 2020 — 40 años de la industria


-- ¿Cuántas plataformas, géneros y publishers distintos hay?
SELECT
    COUNT(DISTINCT plataforma) AS plataformas,
    COUNT(DISTINCT genero)     AS generos,
    COUNT(DISTINCT publisher)  AS publishers
FROM videojuegos;
-- Resultado: 31 plataformas, 12 géneros, 579 publishers


-- Top 10 juegos más vendidos de la historia
SELECT
    rank,
    nombre,
    plataforma,
    genero,
    publisher,
    ventas_global
FROM videojuegos
ORDER BY ventas_global DESC
LIMIT 10;
-- Resultado: Wii Sports lidera con 82.74M


-- 2.1 Ventas totales por género
SELECT
    genero,
    COUNT(*)                         AS cantidad_juegos,
    ROUND(SUM(ventas_global), 2)     AS ventas_totales_millones,
    ROUND(AVG(ventas_global), 2)     AS promedio_por_juego
FROM videojuegos
WHERE genero IS NOT NULL
GROUP BY genero
ORDER BY ventas_totales_millones DESC;
-- Resultado: Action lidera en volumen total (1751M) pero
--			Shooter (0.79) y Platform (0.94) tienen mejor promedio
--          por juego que Action (0.53) — menos juegos pero más exitosos


-- ¿Qué género prefiere cada región del mundo?
SELECT
    genero,
    ROUND(SUM(ventas_na), 2)     AS ventas_norteamerica,
    ROUND(SUM(ventas_eu), 2)     AS ventas_europa,
    ROUND(SUM(ventas_jp), 2)     AS ventas_japon,
    ROUND(SUM(ventas_otras), 2)  AS ventas_otras_regiones
FROM videojuegos
WHERE genero IS NOT NULL
GROUP BY genero
ORDER BY ventas_norteamerica DESC;
-- Resultado: Action domina en todas las regiones excepto Japón
--            donde Role-Playing es el género favorito


-- Top 10 plataformas por ventas globales
SELECT
    plataforma,
    COUNT(*)                        AS cantidad_juegos,
    ROUND(SUM(ventas_global), 2)    AS ventas_totales_millones,
    ROUND(AVG(ventas_global), 2)    AS promedio_por_juego
FROM videojuegos
GROUP BY plataforma
ORDER BY ventas_totales_millones DESC
LIMIT 10;
-- Resultado: PS2 lidera con 1255M en ventas totales
-- DS tiene casi los mismos juegos que PS2 pero menos ventas totales


-- Plataformas con mejor promedio de ventas por juego
SELECT
    plataforma,
    COUNT(*)                        AS cantidad_juegos,
    ROUND(AVG(ventas_global), 2)    AS promedio_ventas_millones
FROM videojuegos
GROUP BY plataforma
HAVING COUNT(*) >= 30
ORDER BY promedio_ventas_millones DESC;
-- Resultado: GB y NES lideran con 2.61 y 2.56M por juego
-- 			Las consolas antiguas tienen mejor promedio porque
--          había menos juegos pero todos eran grandes títulos



-- Top 10 publishers por ventas globales
SELECT
    publisher,
    COUNT(*)                        AS juegos_lanzados,
    ROUND(SUM(ventas_global), 2)    AS ventas_totales_millones,
    ROUND(AVG(ventas_global), 2)    AS promedio_por_juego
FROM videojuegos
WHERE publisher IS NOT NULL
GROUP BY publisher
ORDER BY ventas_totales_millones DESC
LIMIT 10;
-- Resultado: Nintendo lidera con 1786.56M


-- ¿Qué géneros trabaja Nintendo?
SELECT
    genero,
    COUNT(*)                        AS juegos,
    ROUND(SUM(ventas_global), 2)    AS ventas_millones
FROM videojuegos
WHERE publisher = 'Nintendo'
GROUP BY genero
ORDER BY ventas_millones DESC;
-- Resultado: Lidera el género platform


-- Clasificar cada juego en una categoría de ventas
SELECT
    nombre,
    plataforma,
    genero,
    ventas_global,
    CASE
        WHEN ventas_global >= 10  THEN 'Mega éxito (+10M)'
        WHEN ventas_global >= 5   THEN 'Gran éxito (5-10M)'
        WHEN ventas_global >= 1   THEN 'Exitoso (1-5M)'
        ELSE                           'Nicho (menos de 1M)'
    END AS categoria_ventas
FROM videojuegos
ORDER BY ventas_global DESC
LIMIT 50;
-- Resultado: columna nueva "categoria_ventas" creada desde SQL

-- ¿Cuántos juegos hay en cada categoría?
SELECT
    CASE
        WHEN ventas_global >= 10  THEN 'Mega éxito (+10M)'
        WHEN ventas_global >= 5   THEN 'Gran éxito (5-10M)'
        WHEN ventas_global >= 1   THEN 'Exitoso (1-5M)'
        ELSE                           'Nicho (menos de 1M)'
    END                             AS categoria_ventas,
    COUNT(*)                        AS cantidad_juegos,
    ROUND(SUM(ventas_global), 2)    AS ventas_totales_millones
FROM videojuegos
GROUP BY 1
ORDER BY ventas_totales_millones DESC;
-- Resultado clave:
--   - 14.517 juegos (87%) venden menos de 1M — son de nicho
--   - Solo 62 juegos son "Mega éxito" pero generan 1139M en ventas
-- 	 - La industria es muy concentrada — pocos juegos
--	 - generan la mayor parte del dinero


-- Juegos de acción en PlayStation 4
SELECT
    nombre,
    publisher,
    anio,
    ventas_global
FROM videojuegos
WHERE plataforma = 'PS4'
  AND genero     = 'Action'
ORDER BY ventas_global DESC
LIMIT 20;
-- Resultado: GTA V lidera con 11.98M — casi el triple que el 2do

-- Juegos lanzados entre 2010 y 2016 con más de 5M de ventas
SELECT
    nombre,
    plataforma,
    genero,
    anio,
    ventas_global
FROM videojuegos
WHERE anio BETWEEN '2010' AND '2016'
  AND ventas_global >= 5
ORDER BY ventas_global DESC;

