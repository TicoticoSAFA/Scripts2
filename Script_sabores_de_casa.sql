
drop table if exists linea_pedido;
drop table if exists tipo_producto;
drop table if exists producto;
drop table if exists pedido;
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

create table if not exists pedido (
	id serial primary key,
	precio real not null,
	fecha date not null default current_date,
	id_mesa int not null,
	id_cliente int not null,
	constraint fk_pedido_cliente foreign key (id_cliente) references cliente(id),
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

-- Camareros
INSERT INTO camarero (nombre, apellidos, dni, email) VALUES 
('Juan', 'Pérez García', '12345678A', 'juan.perez@example.com'),
('María', 'López Sánchez', '87654321B', 'maria.lopez@example.com'),
('Pedro', 'González Fernández', '11223344C', 'pedro.gonzalez@example.com'),
('Alberto', 'Sanabria García', '77223344D', 'alberto.sanabria@example.com'),
('Laura', 'Martínez Romero', '99887766E', 'laura.martinez@example.com'),
('Sofía', 'Jiménez García', '66554433F', 'sofia.jimenez@example.com'),
('Diego', 'Torres Martínez', '55443322G', 'diego.torres@example.com'),
('Clara', 'Sánchez López', '44332211H', 'clara.sanchez@example.com'),
('Ricardo', 'Ramírez Fernández', '33221100I', 'ricardo.ramirez@example.com'),
('Verónica', 'Castillo Ruiz', '22110099J', 'veronica.castillo@example.com');

-- Mesas
INSERT INTO mesa (numero, id_camarero) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Clientes
INSERT INTO cliente (nombre) VALUES 
('Carlos Martínez'),
('Ana García'),
('Luis Fernández'),
('Marta Rodríguez'),
('José López');

-- Pedidos
INSERT INTO pedido (precio, fecha, id_mesa, id_cliente) VALUES 
(25.50, '2023-09-20', 1, 1),
(30.00, '2023-09-21', 1, 2),
(18.75, '2023-09-20', 2, 1),
(22.40, '2023-09-21', 2, 3),
(15.30, '2023-09-20', 3, 4),
(19.99, '2023-09-21', 3, 4),
(12.50, '2023-09-20', 4, 5),
(16.70, '2023-09-21', 4, 5),
(27.90, '2023-09-20', 5, 3),
(32.15, '2023-09-21', 5, 3),
(20.00, '2023-09-20', 6, 4),
(22.50, '2023-09-21', 6, 4),
(18.20, '2023-09-20', 7, 5),
(21.60, '2023-09-21', 7, 5),
(14.75, '2023-09-20', 8, 1),
(19.85, '2023-09-21', 8, 1),
(17.10, '2023-09-20', 9, 2),
(23.50, '2023-09-21', 9, 2),
(30.80, '2023-09-20', 10, 3),
(35.00, '2023-09-21', 10, 3);

-- Productos
INSERT INTO producto (nombre, descripcion) VALUES 
('Choco Frito', 'Chocos frescos rebozados en harina de garbanzo y fritos en aceite de oliva, acompañado de salsa alioli.'),
('Calamares a la Romana', 'Calamares frescos rebozados en una mezcla de harina y huevo, fritos hasta quedar dorados y crujientes, acompañados de limón.'),
('Gambas al Ajillo', 'Gambas frescas cocinadas en aceite de oliva con ajo, guindilla y perejil.'),
('Pulpo a la Gallega', 'Pulpo cocido servido con patatas, pimentón de la Vera, aceite de oliva virgen extra y sal en escamas.'),
('Tortilla de Camarones', 'Finas y crujientes tortillas de camarones preparadas con harina de garbanzo y perejil.'),
('Montadito de Lomo con Queso', 'Montadito de pan crujiente con lomo de cerdo a la plancha y queso fundido, acompañado de tomate y lechuga.'),
('Montadito de Jamón Ibérico', 'Montadito de pan rústico con lonchas de jamón ibérico de bellota, acompañado de tomate rallado y aceite de oliva virgen extra.'),
('Montadito de Tortilla Española', 'Montadito de pan con tortilla española de patatas, cebolla caramelizada y pimientos verdes.'),
('Montadito de Salmón Ahumado', 'Montadito de pan integral con salmón ahumado, queso crema, alcaparras y eneldo.'),
('Montadito de Pollo y Alioli', 'Montadito de pan con filete de pollo a la plancha, alioli, tomate y rúcula.');

-- Tipos de productos
INSERT INTO tipo_producto (tipo, precio, tamanyo, id_producto) VALUES 
(1, 5.50, 0, 1),
(1, 9.00, 1, 1),
(1, 12.00, 2, 1),
(1, 4.50, 0, 2),
(1, 8.00, 1, 2),
(1, 11.50, 2, 2),
(2, 6.00, 2, 3),
(2, 10.50, 1, 3),
(2, 15.00, 2, 3),
(3, 7.00, 0, 4),
(3, 12.50, 1, 4),
(3, 18.00, 2, 4),
(1, 3.50, 0, 5),
(1, 6.50, 1, 5),
(1, 9.00, 2, 5),
(0, 3.00, 3, 6),
(0, 4.50, 3, 7),
(0, 3.50, 3, 8),
(0, 4.00, 3, 9),
(0, 3.80, 3, 10);

-- Línea de pedido
INSERT INTO linea_pedido (id_tipo_producto, id_pedido, cantidad) VALUES 
(1, 1, 2),  -- 2 unidades de Choco Frito (Tapa)
(4, 1, 1),  -- 1 unidad de Calamares a la Romana (Media Ración)
(7, 2, 3),  -- 3 unidades de Gambas al Ajillo (Ración)
(10, 2, 2), -- 2 unidades de Pulpo a la Gallega (Media Ración)
(13, 3, 4), -- 4 unidades de Tortilla de Camarones (Ración)
(16, 3, 2), -- 2 unidades de Montadito de Lomo con Queso (Unidad)
(17, 4, 3), -- 3 unidades de Montadito de Jamón Ibérico (Unidad)
(18, 4, 1), -- 1 unidad de Montadito de Tortilla Española (Unidad)
(19, 5, 2), -- 2 unidades de Montadito de Salmón Ahumado (Unidad)
(20, 5, 3); -- 3 unidades de Montadito de Pollo y Alioli (Unidad)




select * from mesa;

select * from pedido p ;
select * from linea_pedido lp where id_pedido = 1;
