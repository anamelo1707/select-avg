create database estacionamento2;

create table vaga (  
	id serial primary key,
	numero varchar(4) not null unique
);


create table carro (  --criação de tabela completa 
	id serial primary key,
	marca varchar(25) not null,
	modelo char(8) not null,
	chassi char(1) not null unique,
	vaga_id int not null,
	foreign key (vaga_id) references vaga(id)
);

create table tempo (  
	id serial primary key,
	data_hora_chegada timestamp not null,
	data_hora_saida timestamp not null,
	carro_id int not null,
	foreign key (carro_id) references carro(id),
	vaga_id int not null,
	foreign key (vaga_id) references vaga(id)
);
	
drop table tempo;
create table estacionamento (
	id serial primary key,
	carro_id int not null,
	vaga_id int not null,
	quantidade_carros int
	
);

alter table estacionamento add column data date;
alter table vaga rename column número to numero;
alter table carro alter column modelo type varchar(20);
alter table carro alter column chassi type char(6);
alter table carro alter column modelo drop not null;
delete from estacionamento where carro_id < 11;
update carro set chassi = 'akraua' where chassi = 'a';
update carro set chassi = 'bsfead' where chassi = 'b';
update carro set chassi = 'rujhko' where chassi = 'c';
update carro set chassi = 'fgujhr' where chassi = 'd';
update carro set chassi = 'tgjguk' where chassi = 'e';
update carro set chassi = 'fjtjgu' where chassi = 'f';
update carro set chassi = 'tfhauh' where chassi = 'g';
update carro set chassi = 'twkcgo' where chassi = 'h';
update carro set chassi = 'piqtho' where chassi = 'i';

INSERT INTO vaga (numero)
VALUES ( '1'),
('2'),
('3'),
('4'),
('5');
insert into vaga (numero)
values ('6'),
('7'),
('8'),
('9');
insert into vaga (numero)
values ('10'),
('11'),
('12'),
('13');

INSERT INTO carro (marca, modelo, chassi, vaga_id)
VALUES ('Ford', 'EcoSport', 'a', 1),
 ('Chevrolet', 'Camaro', 'b', 2),
 ('Honda', 'City', 'c', 3),
 ('Jeep', 'Compass', 'd', 4),
 ('BMW', 'X7', 'e', 5);
INSERT INTO carro (marca, modelo, chassi, vaga_id)
VALUES ('Ford', 'ranger raptor', 'f', 6),
 ('Chevrolet', 'onix', 'g', 7),
 ('Honda', 'civic', 'h', 8),
 ('Jeep', 'Renegade', 'i', 9);
INSERT INTO carro (marca, modelo, chassi, vaga_id)
VALUES ('Ford', null, 'f', 10),
 ('Chevrolet', null, 'g', 11),
 ('Honda', 'fit', 'h', 12),
 ('Jeep', null, 'i', 13);

INSERT INTO estacionamento (carro_id, vaga_id, quantidade_carros, data)
VALUES (11, 1, '50', '2025-08-27' ),
(12, 2, '45', '2025-08-01'),
(13, 3, '76', '2025-08-04'),
(14, 4, '83', '2025-06-25'),
(15, 5, '61', '2025-07-15');

INSERT INTO tempo (data_hora_chegada, data_hora_saida, carro_id, vaga_id)
VALUES ('2025-08-27 08:27:30.001', '2025-08-27 22:06:23.059', 11, 1 ),
('2025-08-01 07:23:45.021', '2025-08-01 18:47:23.002', 12, 2),
('2025-08-04 09:23:54.012', '2025-08-04 21:34:12.005', 13, 3),
('2025-06-25 05:23:14.026', '2025-06-25 10:26:49.055', 14, 4),
('2025-07-15 12:08:09.001', '2025-07-15 22:08:09.012', 15, 5);




select * from carro 
where marca ='Ford' or chassi like '%a%'
order by vaga_id desc;


select * from carro
where marca = 'Ford' and modelo is null;


select distinct marca from carro
where not marca = 'Honda';


select *
FROM carro
order by marca
LIMIT 5;


select min (data_hora_chegada)
from tempo t;


select max (carro_id) 
from tempo;



select count(*) from vaga;


select sum (quantidade_carros)
from estacionamento;


select avg(quantidade_carros)
from estacionamento;

