
drop table if exists linea_pedido;
drop table if exists tipo_producto;
drop table if exists producto;
drop table if exists pedido;
drop table if exists mesa_cliente;
drop table if exists cliente;
drop table if exists mesa;
drop table if exists camarero;


create table if not exists camarero (
	id serial primary key,
	nombre varchar(100) not null,
	apellidos varchar(200) not null,
	dni char(10) not null,
	email varchar(300)
);

create table if not exists mesa (
	id serial primary key,
	numero int not null,
	id_camarero int not null,
	constraint fk_camarero_mesa foreign key (id_camarero) references camarero(id)
);


create table if not exists cliente (
	id serial primary key,
	nombre varchar(300) not null
);

create table if not exists mesa_cliente (
	id_mesa int not null,
	id_cliente int not null,
	constraint fk_mesa_cliente foreign key (id_mesa) references mesa(id),
	constraint fk_cliente_mesa foreign key (id_cliente) references cliente(id)
);

create table if not exists pedido (
	id serial primary key,
	precio real not null,
	fecha date not null default current_date,
	id_mesa int not null,
	constraint fk_pedido_mesa foreign key (id_mesa) references mesa(id)
);

create table if not exists producto (
	id serial primary key,
	nombre varchar(100) not null,
	descripcion varchar(1000) not null
);

create table if not exists tipo_producto (
	id serial primary key,
	tipo int not null,
	precio real not null,
	tamanyo int not null,
	id_producto int not null,
	constraint fk_tipo_producto_producto foreign key (id_producto) references producto(id)
);

create table if not exists linea_pedido (
	id serial primary key,

	id_tipo_producto int not null,
	id_pedido int not null,
	cantidad int not null,

	constraint fk_linea_pedido_tipo_producto foreign key (id_tipo_producto) references tipo_producto(id),
	constraint fk_linea_pedido_pedido foreign key (id_pedido) references pedido(id)
);


-- Camarero
INSERT INTO camarero (nombre, apellidos, dni, email)
VALUES ('Juan', 'Pérez García', '12345678A', 'juan.perez@example.com');

INSERT INTO camarero (nombre, apellidos, dni, email)
VALUES ('María', 'López Sánchez', '87654321B', 'maria.lopez@example.com');

INSERT INTO camarero (nombre, apellidos, dni, email)
VALUES ('Pedro', 'González Fernández', '11223344C', 'pedro.gonzalez@example.com');

INSERT INTO camarero (nombre, apellidos, dni, email)
VALUES ('Alberto', 'Sanabria García', '77223344C', 'alberto.sanabria@example.com');

INSERT INTO camarero (nombre, apellidos, dni, email)
VALUES ('Alberto', 'Sanabria García', '77223344C', 'alberto.sanabria@example.com');

INSERT INTO camarero (nombre, apellidos, dni, email)
VALUES ('Alberto', 'Sanabria García', '77223344C', 'alberto.sanabria@example.com');

-- Mesa
INSERT INTO mesa (numero, id_camarero)
VALUES (1, 5);

INSERT INTO mesa (numero, id_camarero)
VALUES (2, 6);

INSERT INTO mesa (numero, id_camarero)
VALUES (3, 3);

INSERT INTO mesa (numero, id_camarero)
VALUES (4, 1);

INSERT INTO mesa (numero, id_camarero)
VALUES (5, 2);

INSERT INTO mesa (numero, id_camarero)
VALUES (6, 3);

INSERT INTO mesa (numero, id_camarero)
VALUES (7, 1);

INSERT INTO mesa (numero, id_camarero)
VALUES (8, 2);

INSERT INTO mesa (numero, id_camarero)
VALUES (9, 3);

INSERT INTO mesa (numero, id_camarero)
VALUES (10, 4);


-- Cliente
INSERT INTO cliente (nombre)
VALUES ('Carlos Martínez');

INSERT INTO cliente (nombre)
VALUES ('Ana García');

INSERT INTO cliente (nombre)
VALUES ('Luis Fernández');

INSERT INTO cliente (nombre)
VALUES ('Marta Rodríguez');

INSERT INTO cliente (nombre)
VALUES ('José López');


-- Mesa cliente
INSERT INTO mesa_cliente (id_mesa, id_cliente)
VALUES (1, 1);

INSERT INTO mesa_cliente (id_mesa, id_cliente)
VALUES (2, 1);

INSERT INTO mesa_cliente (id_mesa, id_cliente)
VALUES (3, 2);

INSERT INTO mesa_cliente (id_mesa, id_cliente)
VALUES (4, 3);

INSERT INTO mesa_cliente (id_mesa, id_cliente)
VALUES (5, 3);

INSERT INTO mesa_cliente (id_mesa, id_cliente)
VALUES (6, 4);

INSERT INTO mesa_cliente (id_mesa, id_cliente)
VALUES (7, 4);

INSERT INTO mesa_cliente (id_mesa, id_cliente)
VALUES (8, 5);

INSERT INTO mesa_cliente (id_mesa, id_cliente)
VALUES (9, 5);

INSERT INTO mesa_cliente (id_mesa, id_cliente)
VALUES (10, 5);

-- pedido
-- Insertando dos pedidos para la mesa 1
INSERT INTO pedido (precio, fecha, id_mesa)
VALUES (25.50, '2023-09-20', 1);

INSERT INTO pedido (precio, fecha, id_mesa)
VALUES (30.00, '2023-09-21', 1);

-- Insertando dos pedidos para la mesa 2
INSERT INTO pedido (precio, fecha, id_mesa)
VALUES (18.75, '2023-09-20', 2);

INSERT INTO pedido (precio, fecha, id_mesa)
VALUES (22.40, '2023-09-21', 2);

-- Insertando dos pedidos para la mesa 3
INSERT INTO pedido (precio, fecha, id_mesa)
VALUES (15.30, '2023-09-20', 3);

INSERT INTO pedido (precio, fecha, id_mesa)
VALUES (19.99, '2023-09-21', 3);

-- Insertando dos pedidos para la mesa 4
INSERT INTO pedido (precio, fecha, id_mesa)
VALUES (12.50, '2023-09-20', 4);

INSERT INTO pedido (precio, fecha, id_mesa)
VALUES (16.70, '2023-09-21', 4);

-- Insertando dos pedidos para la mesa 5
INSERT INTO pedido (precio, fecha, id_mesa)
VALUES (27.90, '2023-09-20', 5);

INSERT INTO pedido (precio, fecha, id_mesa)
VALUES (32.15, '2023-09-21', 5);

-- Insertando dos pedidos para la mesa 6
INSERT INTO pedido (precio, fecha, id_mesa)
VALUES (20.00, '2023-09-20', 6);

INSERT INTO pedido (precio, fecha, id_mesa)
VALUES (22.50, '2023-09-21', 6);

-- Insertando dos pedidos para la mesa 7
INSERT INTO pedido (precio, fecha, id_mesa)
VALUES (18.20, '2023-09-20', 7);

INSERT INTO pedido (precio, fecha, id_mesa)
VALUES (21.60, '2023-09-21', 7);

-- Insertando dos pedidos para la mesa 8
INSERT INTO pedido (precio, fecha, id_mesa)
VALUES (14.75, '2023-09-20', 8);

INSERT INTO pedido (precio, fecha, id_mesa)
VALUES (19.85, '2023-09-21', 8);

-- Insertando dos pedidos para la mesa 9
INSERT INTO pedido (precio, fecha, id_mesa)
VALUES (17.10, '2023-09-20', 9);

INSERT INTO pedido (precio, fecha, id_mesa)
VALUES (23.50, '2023-09-21', 9);

-- Insertando dos pedidos para la mesa 10
INSERT INTO pedido (precio, fecha, id_mesa)
VALUES (30.80, '2023-09-20', 10);

INSERT INTO pedido (precio, fecha, id_mesa)
VALUES (35.00, '2023-09-21', 10);

-- Producto
-- Insertando productos con nombre y descripción detallada
INSERT INTO producto (nombre, descripcion)
VALUES ('Choco Frito', 'Chocos frescos rebozados en harina de garbanzo y fritos en aceite de oliva, acompañado de salsa alioli.');

INSERT INTO producto (nombre, descripcion)
VALUES ('Calamares a la Romana', 'Calamares frescos rebozados en una mezcla de harina y huevo, fritos hasta quedar dorados y crujientes, acompañados de limón.');

INSERT INTO producto (nombre, descripcion)
VALUES ('Gambas al Ajillo', 'Gambas frescas cocinadas en aceite de oliva con ajo, guindilla y perejil.');

INSERT INTO producto (nombre, descripcion)
VALUES ('Pulpo a la Gallega', 'Pulpo cocido servido con patatas, pimentón de la Vera, aceite de oliva virgen extra y sal en escamas.');

INSERT INTO producto (nombre, descripcion)
VALUES ('Tortilla de Camarones', 'Finas y crujientes tortillas de camarones preparadas con harina de garbanzo y perejil.');

-- Insertando productos en la categoría "Montaditos"
INSERT INTO producto (nombre, descripcion)
VALUES ('Montadito de Lomo con Queso', 'Montadito de pan crujiente con lomo de cerdo a la plancha y queso fundido, acompañado de tomate y lechuga.');

INSERT INTO producto (nombre, descripcion)
VALUES ('Montadito de Jamón Ibérico', 'Montadito de pan rústico con lonchas de jamón ibérico de bellota, acompañado de tomate rallado y aceite de oliva virgen extra.');

INSERT INTO producto (nombre, descripcion)
VALUES ('Montadito de Tortilla Española', 'Montadito de pan con tortilla española de patatas, cebolla caramelizada y pimientos verdes.');

INSERT INTO producto (nombre, descripcion)
VALUES ('Montadito de Salmón Ahumado', 'Montadito de pan integral con salmón ahumado, queso crema, alcaparras y eneldo.');

INSERT INTO producto (nombre, descripcion)
VALUES ('Montadito de Pollo y Alioli', 'Montadito de pan con filete de pollo a la plancha, alioli, tomate y rúcula.');


-- tipo producto
-- Tipos para el producto 'Choco Frito'
INSERT INTO tipo_producto (tipo, precio, tamanyo, id_producto)
VALUES (1, 5.50, 0, 1);

INSERT INTO tipo_producto (tipo, precio, tamanyo, id_producto)
VALUES (1, 9.00, 1, 1);

INSERT INTO tipo_producto (tipo, precio, tamanyo, id_producto)
VALUES (1, 12.00, 2, 1);

-- Tipos para el producto 'Calamares a la Romana'
INSERT INTO tipo_producto (tipo, precio, tamanyo, id_producto)
VALUES (1, 4.50, 0, 2);

INSERT INTO tipo_producto (tipo, precio, tamanyo, id_producto)
VALUES (1, 8.00, 1, 2);

INSERT INTO tipo_producto (tipo, precio, tamanyo, id_producto)
VALUES (1, 11.50, 2, 2);

-- Tipos para el producto 'Gambas al Ajillo'
INSERT INTO tipo_producto (tipo, precio, tamanyo, id_producto)
VALUES (2, 6.00, 2, 3);

INSERT INTO tipo_producto (tipo, precio, tamanyo, id_producto)
VALUES (2, 10.50, 1, 3);

INSERT INTO tipo_producto (tipo, precio, tamanyo, id_producto)
VALUES (2, 15.00, 2, 3);

-- Tipos para el producto 'Pulpo a la Gallega'
INSERT INTO tipo_producto (tipo, precio, tamanyo, id_producto)
VALUES (3, 7.00, 0, 4);

INSERT INTO tipo_producto (tipo, precio, tamanyo, id_producto)
VALUES (3, 12.50, 1, 4);

INSERT INTO tipo_producto (tipo, precio, tamanyo, id_producto)
VALUES (3, 18.00, 2, 4);

-- Tipos para el producto 'Tortilla de Camarones'
INSERT INTO tipo_producto (tipo, precio, tamanyo, id_producto)
VALUES (1, 3.50, 0, 5);

INSERT INTO tipo_producto (tipo, precio, tamanyo, id_producto)
VALUES (1, 6.50, 1, 5);

INSERT INTO tipo_producto (tipo, precio, tamanyo, id_producto)
VALUES (1, 9.00, 2, 5);

-- Tipos para el producto 'Montadito de Lomo con Queso'
INSERT INTO tipo_producto (tipo, precio, tamanyo, id_producto)
VALUES (0, 3.00, 3, 6);

-- Tipos para el producto 'Montadito de Jamón Ibérico'
INSERT INTO tipo_producto (tipo, precio, tamanyo, id_producto)
VALUES (0, 4.50, 3, 7);

-- Tipos para el producto 'Montadito de Tortilla Española'
INSERT INTO tipo_producto (tipo, precio, tamanyo, id_producto)
VALUES (0, 3.50, 3, 8);

-- Tipos para el producto 'Montadito de Salmón Ahumado'
INSERT INTO tipo_producto (tipo, precio, tamanyo, id_producto)
VALUES (0, 4.00, 3, 9);

-- Tipos para el producto 'Montadito de Pollo y Alioli'
INSERT INTO tipo_producto (tipo, precio, tamanyo, id_producto)
VALUES (0, 3.80, 3, 10);


--Linea pedido
-- Pedido 1: dos productos con diferentes tipos y cantidades
INSERT INTO linea_pedido (id_tipo_producto, id_pedido, cantidad)
VALUES (1, 1, 2); -- 2 unidades de Choco Frito (Tapa)

INSERT INTO linea_pedido (id_tipo_producto, id_pedido, cantidad)
VALUES (4, 1, 1); -- 1 unidad de Calamares a la Romana (Media Ración)

-- Pedido 2: dos productos con diferentes tipos y cantidades
INSERT INTO linea_pedido (id_tipo_producto, id_pedido, cantidad)
VALUES (7, 2, 3); -- 3 unidades de Gambas al Ajillo (Ración)

INSERT INTO linea_pedido (id_tipo_producto, id_pedido, cantidad)
VALUES (10, 2, 2); -- 2 unidades de Pulpo a la Gallega (Media Ración)

-- Pedido 3: dos productos con diferentes tipos y cantidades
INSERT INTO linea_pedido (id_tipo_producto, id_pedido, cantidad)
VALUES (13, 3, 4); -- 4 unidades de Tortilla de Camarones (Ración)

INSERT INTO linea_pedido (id_tipo_producto, id_pedido, cantidad)
VALUES (16, 3, 2); -- 2 unidades de Montadito de Lomo con Queso (Unidad)

-- Pedido 4: dos productos con diferentes tipos y cantidades
INSERT INTO linea_pedido (id_tipo_producto, id_pedido, cantidad)
VALUES (17, 4, 3); -- 3 unidades de Montadito de Jamón Ibérico (Unidad)

INSERT INTO linea_pedido (id_tipo_producto, id_pedido, cantidad)
VALUES (18, 4, 1); -- 1 unidad de Montadito de Tortilla Española (Unidad)

-- Pedido 5: dos productos con diferentes tipos y cantidades
INSERT INTO linea_pedido (id_tipo_producto, id_pedido, cantidad)
VALUES (19, 5, 2); -- 2 unidades de Montadito de Salmón Ahumado (Unidad)

INSERT INTO linea_pedido (id_tipo_producto, id_pedido, cantidad)
VALUES (20, 5, 3); -- 3 unidades de Montadito de Pollo y Alioli (Unidad)



select * from mesa;

select * from pedido p ;
select * from linea_pedido lp where id_pedido = 1;
