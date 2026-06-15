USE clientesypedidos;

-- Inserta al menos cinco nuevos clientes en la tabla clientes
INSERT INTO clientes (nombre, direccion, telefono) VALUES
('Juan', 'Av. Libertad 123, Concepción', '+56911111111'),
('María', 'Calle Los Alerces 456, Hualpén', '+56922222222'),
('Carlos', 'Puro Chile 789, Talcahuano', '+56933333333'),
('Ana', 'Los Carreras 1011, Chiguayante', '+56944444444'),
('Luisa', 'San Martín 202, Concepción', '+56955555555');

-- Inserta al menos diez nuevos pedidos en la tabla pedidos
-- Juan tiene 3 pedidos
-- María tiene 2 pedidos
-- Carlos tiene 1 pedido
-- Ana tiene 4 pedidos
-- Luisa tiene 1 pedido
INSERT INTO pedidos (id_cliente, fecha, total) VALUES
(1, '2026-06-01', 15000),
(1, '2026-06-05', 22000),
(1, '2026-06-12', 8500),  
(2, '2026-06-02', 45000),
(2, '2026-06-10', 12500),  
(3, '2026-06-03', 30000),  
(4, '2026-06-04', 55000),
(4, '2026-06-08', 19990),
(4, '2026-06-11', 10500),
(4, '2026-06-14', 32000),  
(5, '2026-06-06', 11000); 

-- Proyecta todos los clientes de la tabla clientes y sus respectivos pedidos.
SELECT 
    c.id_cliente,
    c.nombre AS nombre_cliente,
    p.id_pedido,
    p.fecha,
    p.total
FROM clientes c
INNER JOIN pedidos p ON c.id_cliente = p.id_cliente;

-- Proyecta todos los pedidos realizados por un cliente específico, utilizando su ID.
SELECT 
    p.id_pedido,
    p.fecha,
    p.total
FROM pedidos p
WHERE p.id_cliente = 1;

-- Calcula el total de todos los pedidos para cada cliente.
SELECT 
    c.id_cliente,
    c.nombre AS nombre_cliente,
    SUM(p.total) AS total_pedidos
FROM clientes c
INNER JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nombre;

-- Elimina un cliente específico de la tabla clientes y todos sus pedidos asociados.
-- Ya que en el diagrama se configuró la FK con 'ON DELETE CASCADE' al borrar cliente se borran sus pedidos.
DELETE FROM clientes 
WHERE id_cliente = 3;

-- Verificación para comprobar que se eliminó el cliente
SELECT * FROM clientes;

-- Proyecta los tres clientes que han realizado más pedidos, ordenados de forma descendente por el número de pedidos.
SELECT 
    c.id_cliente,
    c.nombre AS nombre_cliente,
    COUNT(p.id_cliente) AS cantidad_pedidos
FROM clientes c
INNER JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nombre
ORDER BY cantidad_pedidos DESC
LIMIT 3;