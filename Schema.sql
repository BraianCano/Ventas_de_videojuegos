CREATE TABLE videojuegos (
    rank          INT,
    nombre        VARCHAR(200),
    plataforma    VARCHAR(20),
    anio          VARCHAR(10),
    genero        VARCHAR(50),
    publisher     VARCHAR(100),
    ventas_na     NUMERIC(6,2),
    ventas_eu     NUMERIC(6,2),
    ventas_jp     NUMERIC(6,2),
    ventas_otras  NUMERIC(6,2),
    ventas_global NUMERIC(6,2)
);
