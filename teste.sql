create database test;

use test;

create table usuarios (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

select * from usuarios;

insert into usuarios(nome) values('Erick');

delete from usuarios where id = 3;

update usuarios set nome = 'Diego' where id = 2;

create table endereco (
	rua varchar(255) NOT NULL,
	id_usuario int,
    FOREIGN KEY (id_usuario) references usuarios(id)
);

select * from endereco;

insert into endereco(rua, id_usuario) values ('Rua dos bobos', 3);

drop table endereco;