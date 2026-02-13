-- =====================================================
--  FILTRADO BÁSICO EN TABLA orderdetails
--  Base de datos: classicmodels
--  Objetivo: Practicar WHERE con operadores =, IN, AND, 
--            NOT BETWEEN, LIKE
-- =====================================================

-- 1. Detalles de pedidos para el producto S18_4409
SELECT orderNumber, productCode, quantityOrdered, priceEach
FROM classicmodels.orderdetails
WHERE productCode = 'S18_4409';

-- 2. Detalles para productos de una lista específica
SELECT orderNumber, productCode, quantityOrdered, priceEach
FROM classicmodels.orderdetails
WHERE productCode IN ('S18_4409', 'S18_1342', 'S18_4668');

-- 3. Misma lista, pero con cantidad pedida > 40 unidades
SELECT orderNumber, productCode, quantityOrdered, priceEach
FROM classicmodels.orderdetails
WHERE productCode IN ('S18_4409', 'S18_1342', 'S18_4668')
  AND quantityOrdered > 40;

-- 4. Pedidos con cantidad fuera del rango 30-40 (menos de 30 o más de 40)
SELECT orderNumber, productCode, quantityOrdered, priceEach
FROM classicmodels.orderdetails
WHERE quantityOrdered NOT BETWEEN 30 AND 40;

-- 5. Productos cuyo código comienza con 'S18' (línea S18)
SELECT orderNumber, productCode, quantityOrdered, priceEach
FROM classicmodels.orderdetails
WHERE productCode LIKE 'S18%';