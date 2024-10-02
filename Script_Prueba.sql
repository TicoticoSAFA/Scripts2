
create table empresa (
	id serial primary key,
	nombre varchar(150) not null,
	mail varchar(200) not null,
	cif char(9),
	fecha_fundacion timestamp(6) not null,
	ews_tecnologica bool
);

select *from empresa;

insert into empresa (nombre, mail, cif, fecha_fundacion, ews_tecnologica)
values ('SAFA', 'safa@safa.org', 'Bsuil238', '1967-11-25', false);

create table perfil (
	id serial primary key,
	nombre varchar(200) not null,
	apellidos varchar(200) not null,
	mail varchar(200) not null,
	dni char(9) not null,
	fecha_nacimiento timestamp(6) not null
);

create table experiencia_educativa (

	id serial primary key,
	centro_educativo varchar(200) not null,
	curso varchar(200) not null,
	facha_inicio timestamp(6) not null,
	fecha_fin timestamp(6),
	id_perfil int not null,
	constraint fk-experiencia_educativa_perfil foreign key (perfil.id)
	

);



