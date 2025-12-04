-- =============================================
-- CONSULTAS DE NEGOCIO (REPORTES) - TECHZONE
-- =============================================

-- 1. REPORTE DE STOCK
-- Objetivo: Ver qué tenemos, con el nombre bonito de la categoría.
SELECT 
    p.nombre AS "Producto", 
    c.nombre AS "Categoría", 
    p.stock AS "Stock Actual"
FROM Productos p
JOIN Categorias c ON p.categoria_id = c.categoria_id
ORDER BY p.stock DESC;


-- 2. ALERTA DE REABASTECIMIENTO
-- Objetivo: Mostrar solo lo que se está acabando (menos de 5 unidades).
SELECT 
    nombre AS "Producto Crítico", 
    stock AS "Quedan", 
    precio AS "Precio Unitario"
FROM Productos
WHERE stock < 5;


-- 3. VALOR TOTAL DEL INVENTARIO
-- Objetivo: Saber cuánto capital ($) tenemos "parado" en la bodega.
SELECT 
    SUM(precio * stock) AS "Valor Total en Bodega ($)"
FROM Productos;


-- 4. REPORTE DE VENTAS POR PROVEEDOR
-- Objetivo: Saber qué proveedor mueve más unidades.
-- Requiere unir 3 tablas: Ventas -> Productos -> Proveedores
SELECT 
    prov.nombre AS "Proveedor",
    SUM(v.cantidad) AS "Total Unidades Vendidas"
FROM Ventas v
JOIN Productos p ON v.producto_id = p.producto_id
JOIN Proveedores prov ON p.proveedor_id = prov.proveedor_id
GROUP BY prov.nombre
ORDER BY "Total Unidades Vendidas" DESC;


-- 5. (BONUS) DINERO GENERADO POR PROVEEDOR
-- Objetivo: Saber cuánto dinero ingresó gracias a cada proveedor.
SELECT 
    prov.nombre AS "Proveedor",
    SUM(v.cantidad * p.precio) AS "Dinero Ingresado ($)"
FROM Ventas v
JOIN Productos p ON v.producto_id = p.producto_id
JOIN Proveedores prov ON p.proveedor_id = prov.proveedor_id
GROUP BY prov.nombre;