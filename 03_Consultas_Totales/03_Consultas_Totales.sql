-- =====================================================
--  EJERCICIOS PRÁCTICOS SQL - TABLA CUSTOMERS
--  Base de datos: classicmodels
--  Objetivo: Practicar consultas básicas y agregaciones
-- =====================================================

-- 1. Visualiza todos los clientes (exploración inicial)
SELECT * FROM classicmodels.customers;

-- 2. ¿Cuántos clientes tenemos en San Francisco?
SELECT COUNT(*) AS clientes_en_san_francisco
FROM classicmodels.customers
WHERE city = 'San Francisco';

-- 3. Clientes sin comercial asignado (salesRepEmployeeNumber nulo)
SELECT customerName, phone, salesRepEmployeeNumber
FROM classicmodels.customers
WHERE salesRepEmployeeNumber IS NULL;

-- 4. Países donde solo tenemos un cliente
SELECT country, COUNT(*) AS clientes_por_pais
FROM classicmodels.customers
GROUP BY country
HAVING COUNT(*) = 1;  -- Usamos COUNT(*) directamente para mayor compatibilidad

-- 5. Teléfonos que empiezan con un prefijo entre paréntesis
SELECT *
FROM classicmodels.customers
WHERE phone LIKE '(%';  -- El paréntesis literal al inicio

-- 6. Apellidos de contacto únicos para imprimir (sin duplicados)
SELECT DISTINCT contactLastName AS apellido_unico
FROM classicmodels.customers
ORDER BY contactLastName;  -- Opcional: orden alfabético

-- 7. Top 5 comerciales con más clientes con crédito entre 50k y 100k
SELECT salesRepEmployeeNumber, COUNT(*) AS clientes_gestionados
FROM classicmodels.customers
WHERE creditLimit BETWEEN 50000 AND 100000
GROUP BY salesRepEmployeeNumber
ORDER BY clientes_gestionados DESC
LIMIT 5;

-- 8. Total de crédito acumulado por ciudad en Francia, Alemania y España,
--    solo para ciudades con total > 50000, ordenado de mayor a menor.
SELECT city, country, SUM(creditLimit) AS total_riesgo
FROM classicmodels.customers
WHERE country IN ('France', 'Germany', 'Spain')
GROUP BY country, city
HAVING SUM(creditLimit) > 50000
ORDER BY total_riesgo DESC;

-- 9. Promedio de crédito por país, solo para países con promedio > 60000,
--    ordenado de mayor a menor promedio.
SELECT country, AVG(creditLimit) AS promedio_credito
FROM classicmodels.customers
GROUP BY country
HAVING AVG(creditLimit) > 60000   -- Usamos la función directamente
ORDER BY promedio_credito DESC;