# sql-inventory-management-system
Sistema de base de datos relacional para gestión de inventario y ventas. Incluye modelado ER, normalización de datos y script de consultas de negocio (KPIs) en PostgreSQL.
# TechZone: Sistema de Inventario SQL

> Un proyecto de diseño de base de datos relacional robusta para la gestión de productos, proveedores y ventas de una tienda de hardware tecnológico.

---

### Objetivo del Proyecto

El objetivo de este proyecto es migrar un sistema de gestión manual a una **Base de Datos Relacional (RDBMS)** optimizada. El sistema resuelve problemas críticos de negocio como:
* Control de Stock y alertas de reabastecimiento.
* Trazabilidad de ventas históricas.
* Análisis de rendimiento por proveedor.
* Integridad referencial de los datos.

---

### Tecnologías Utilizadas

| Tecnología | Propósito |
| :--- | :--- |
| **PostgreSQL** | Motor de Base de Datos Relacional. |
| **SQL (Structured Query Language)** | Scripts de creación (DDL) y manipulación (DML). |
| **Modelado de Datos** | Diseño de Diagrama Entidad-Relación (ER). |

---

### Estructura del Repositorio

El proyecto se divide en 3 scripts clave que simulan el ciclo de vida de la base de datos:

1.  **`TechZoneDB.sql` (Esquema/Estructura)**
    * Contiene el DDL (`CREATE TABLE`, `ALTER TABLE`).
    * Define las tablas: `Categorias`, `Proveedores`, `Productos`, `Ventas`.
    * Establece **Llaves Primarias (PK)** y **Llaves Foráneas (FK)** para la integridad referencial.
    * Implementa restricciones `CHECK` para evitar precios o stocks negativos.

2.  **`data_insertion.sql` (Semilla de Datos)**
    * Script DML (`INSERT INTO`) diseñado para poblar la base de datos con información de prueba realista.
    * Crea un escenario con 4 categorías, varios proveedores y un historial de ventas.

3.  **`queries.sql` (Lógica de Negocio)**
    * Contiene consultas complejas para la toma de decisiones.
    * Uso de `JOIN` para unir tablas normalizadas.
    * Funciones de agregación (`SUM`, `COUNT`) y agrupamiento (`GROUP BY`) para reportes.

---

### Consultas Destacadas

Este proyecto demuestra la capacidad de extraer "Business Intelligence" mediante SQL puro. Algunos ejemplos incluidos en `queries.sql`:

* **Reporte de Valor de Inventario:** Calcula cuánto capital está invertido en bodega actualmente.
* **Alerta de Stock Crítico:** Filtra productos con menos de 5 unidades para generar órdenes de compra.
* **Rendimiento de Proveedores:** Analiza qué proveedor genera más volumen de ventas.

```sql
-- Ejemplo de Query: Ventas por Proveedor
SELECT 
    prov.nombre AS "Proveedor",
    SUM(v.cantidad) AS "Total Unidades Vendidas"
FROM Ventas v
JOIN Productos p ON v.producto_id = p.producto_id
JOIN Proveedores prov ON p.proveedor_id = prov.proveedor_id
GROUP BY prov.nombre
ORDER BY "Total Unidades Vendidas" DESC;
