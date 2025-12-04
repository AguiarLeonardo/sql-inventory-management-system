-- =============================================
-- SCRIPT DE POBLADO DE DATOS (SEEDING) - TECHZONE
-- Sistema: PostgreSQL
-- =============================================

-- 1. Insertamos CATEGORIAS
-- No especificamos el ID porque es SERIAL (1, 2, 3...)
INSERT INTO Categorias (nombre) VALUES 
('Laptops'), 
('Periféricos'), 
('Componentes');

-- 2. Insertamos PROVEEDORES
INSERT INTO Proveedores (nombre, telefono) VALUES 
('Logitech Corp', '555-0100'),       -- ID 1
('Intel Distribution', '555-0200'),  -- ID 2
('Dell Global', '555-0300');         -- ID 3

-- 3. Insertamos PRODUCTOS
-- Aquí asumimos los IDs generados arriba:
-- Categorías: 1=Laptops, 2=Periféricos, 3=Componentes
-- Proveedores: 1=Logitech, 2=Intel, 3=Dell
INSERT INTO Productos (nombre, precio, stock, categoria_id, proveedor_id) VALUES 
('Mouse Gamer G502', 50.00, 20, 2, 1),       -- Logitech, Periférico
('Procesador i7 12700K', 350.00, 4, 3, 2),   -- Intel, Componente (Stock Bajo)
('Laptop Inspiron 15', 700.00, 10, 1, 3),    -- Dell, Laptop
('Teclado Mecánico RGB', 80.00, 3, 2, 1),    -- Logitech, Periférico (Stock Bajo)
('Monitor 24 pulg', 150.00, 15, 2, 3);       -- Dell, Periférico

-- 4. Insertamos VENTAS HISTÓRICAS
-- Registramos movimientos de salida de inventario
INSERT INTO Ventas (producto_id, cantidad) VALUES 
(1, 2), -- Se vendieron 2 Mouses
(1, 1), -- Se vendió 1 Mouse más (otro cliente)
(3, 1), -- Se vendió 1 Laptop
(4, 5), -- Se vendieron 5 Teclados
(2, 1); -- Se vendió 1 Procesador