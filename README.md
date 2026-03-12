# Análisis de Ventas de Videojuegos
**Proyecto de Portafolio | Analista de Datos | PostgreSQL**

---

## Descripción

Análisis de ventas globales de videojuegos usando datos reales de más de **16.500 juegos**
lanzados entre 1980 y 2020, con información de plataforma, género, publisher y ventas
por región (Norteamérica, Europa, Japón y resto del mundo).

> Dataset fuente: [Kaggle — Video Game Sales](https://www.kaggle.com/datasets/gregorut/videogamesales)

---

## Preguntas de Negocio Respondidas

| # | Pregunta |
|---|----------|
| 1 | ¿Cuáles son los juegos más vendidos de la historia? |
| 2 | ¿Qué géneros generan más ventas globales? |
| 3 | ¿Qué género prefiere cada región del mundo? |
| 4 | ¿Cuáles son las plataformas con más ventas? |
| 5 | ¿Qué publishers dominan la industria? |
| 6 | ¿Cuántos juegos son realmente exitosos vs de nicho? |

---

## Estructura del Proyecto

```
videojuegos_portfolio/
|-- Datos_crudo
|   |-- vgsales.xlsx
|
|-- Documentacion
|   |-- README.md 
|
|--schema.sql
|--carga_datos.sql
|--analisis.sql

```

---

## Conceptos SQL Utilizados

- `SELECT`, `FROM`, `WHERE`, `ORDER BY`, `LIMIT`
- `GROUP BY` con `SUM`, `AVG`, `COUNT`
- `HAVING` para filtrar grupos
- `CASE WHEN` para clasificar y segmentar
- `DISTINCT` para valores únicos
- `BETWEEN` y operadores de comparación
- `ROUND` y funciones numéricas

---

## Cómo Ejecutar

```bash
- 1. Usar los datos que se encuentran ubicados en la carpeta "Datos_crudo" o Descargar el dataset de Kaggle
    https://www.kaggle.com/datasets/gregorut/videogamesales

- 2. Conectarse a PostgreSQL
psql -U tu_usuario -d tu_base

- 3. Ejecutar en orden
\i Schema.sql
\i Carga_datos.sql
\i Analisis.sql
```

---

## Hallazgos Principales

- **Wii Sports** es el juego más vendido con 82.74M de copias
- **Action** lidera en volumen pero **Platform** y **Shooter tienen** mejor promedio por juego 
- **PS2** es la consola con más ventas históricas (1255M)
- **GB** y **NES** tienen el mejor promedio por juego entre consolas con volumen representativo
- El **87%** de los juegos vende menos de 1M de copias
- **Nintendo** domina el top 10 histórico de juegos más vendidos
- **GTA V** es el juego de acción más vendido en PS4
---

## Autor

**Braian Cano** — Analista de Datos  
[LinkedIn](https://www.linkedin.com/in/braian-cano-97846929a/) | [GitHub](https://github.com/BraianCano?tab=overview&from=2026-03-01&to=2026-03-11)
