

-- CREAR BASE DE DATOS
CREATE DATABASE retail_project;

-- TABLA CLIENTES
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150)  NOT NULL,
    edad INTEGER NOT NULL CHECK (edad >= 18),
    telefono VARCHAR(20)
);

-- TABLA PRODUCTOS
CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio NUMERIC(10,2) NOT NULL CHECK (precio > 0),
    stock INTEGER NOT NULL CHECK (stock >= 0)
);

-- TABLA VENTAS
CREATE TABLE ventas (
    id_venta SERIAL PRIMARY KEY,
    id_cliente INTEGER NOT NULL,
    id_producto INTEGER NOT NULL,
    fecha DATE NOT NULL,
    cantidad INTEGER NOT NULL CHECK (cantidad > 0),

    FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),

    FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto)
);


BEGIN;

-- INSERTAR CLIENTES
INSERT INTO clientes (nombre, email, edad, telefono)
VALUES ('Ana Lopez', 'ana@email.com', 28, '1123456789');

INSERT INTO clientes (nombre, email, edad, telefono)
VALUES ('Juan Perez', 'juan@email.com', 35, '1134567890');

INSERT INTO clientes (nombre, email, edad, telefono)
VALUES ('Maria Gomez', 'maria@email.com', 42, '1145678901');

INSERT INTO clientes (nombre, email, edad, telefono)
VALUES ('Pedro Ruiz', 'pedro@email.com', 25, '1156789012');

INSERT INTO clientes (nombre, email, edad, telefono)
VALUES ('Laura Diaz', 'laura@email.com', 31, '1167890123');


-- INSERTAR PRODUCTOS
INSERT INTO productos (nombre, categoria, precio, stock)
VALUES ('Notebook', 'Tecnologia', 850000, 10);

INSERT INTO productos (nombre, categoria, precio, stock)
VALUES ('Mouse', 'Tecnologia', 15000, 50);

INSERT INTO productos (nombre, categoria, precio, stock)
VALUES ('Escritorio', 'Muebles', 120000, 15);

INSERT INTO productos (nombre, categoria, precio, stock)
VALUES ('Silla', 'Muebles', 95000, 20);

INSERT INTO productos (nombre, categoria, precio, stock)
VALUES ('Teclado', 'Tecnologia', 25000, 30);


-- INSERTAR VENTAS
INSERT INTO ventas (id_cliente, id_producto, fecha, cantidad)
VALUES (1, 1, '2026-11-01', 1);

INSERT INTO ventas (id_cliente, id_producto, fecha, cantidad)
VALUES (2, 2, '2026-11-02', 2);

INSERT INTO ventas (id_cliente, id_producto, fecha, cantidad)
VALUES (3, 3, '2026-11-03', 1);

INSERT INTO ventas (id_cliente, id_producto, fecha, cantidad)
VALUES (4, 4, '2026-11-04', 2);

INSERT INTO ventas (id_cliente, id_producto, fecha, cantidad)
VALUES (5, 5, '2026-11-05', 3);

COMMIT;

select * from clientes c; 
select * from productos; 
select * from ventas ;

-- actualizar precios con UPDATE --

UPDATE productos
SET precio = precio * 1.10
WHERE categoria = 'Tecnologia';

--- eliminar una venta con DELETE --


DELETE FROM ventas
WHERE id_venta = 3;






