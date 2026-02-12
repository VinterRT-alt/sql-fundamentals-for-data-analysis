-- =====================================================
--  PRÁCTICA SQL - CONSULTAS BÁSICAS
--  Base de datos: classicmodels
--  Tablas: orders, customers
--  Objetivo: Familiarizarse con SELECT, funciones de agregado
--           y renombrado de columnas.
-- =====================================================

-- 1. Visualiza toda la información de la tabla orders
--    NOTA: Se evita SELECT * en entornos productivos; aquí se usa con fines didácticos.
SELECT *
FROM classicmodels.orders;

-- 2. Visualiza el número de orden y la fecha de orden de la tabla orders
SELECT
    orderNumber,
    orderDate
FROM classicmodels.orders;

-- 3. ¿Cuántas compras se han registrado en total?
--    COUNT(*) cuenta todas las filas, independientemente de valores nulos.
SELECT
    COUNT(*) AS total_compras
FROM classicmodels.orders;

-- 4. ¿Cuántas compras tienen algún comentario asociado?
--    COUNT(columna) omite valores NULL, por lo que solo cuenta órdenes con comentarios.
SELECT
    COUNT(comments) AS compras_con_comentario
FROM classicmodels.orders;

-- 5. ¿En cuántos días distintos se han realizado compras?
SELECT
    COUNT(DISTINCT orderDate) AS dias_distintos_compras
FROM classicmodels.orders;

-- 6. ¿Cuál es la primera y la última fecha de compra registrada?
SELECT
    MIN(orderDate) AS primera_compra,
    MAX(orderDate) AS ultima_compra
FROM classicmodels.orders;

-- 7. (Consulta equivalente a la anterior, con nombres de columna más descriptivos)
SELECT
    MIN(orderDate) AS fecha_primera_compra,
    MAX(orderDate) AS fecha_ultima_compra
FROM classicmodels.orders;