-- apagando banco de dados
drop database dbcantina;

-- criando banco de dados
create database dbcantina;

-- acessando banco de dados
use dbcantina;

-- criando as tabelas
create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100) unique,
cpf char(14) not null unique,
sexo char(1) default 'F' check(sexo in('F','M')),
salario decimal(9,2) default 0 check(salario >=0),
nascimento date,
telCelular char(10),
primary key(codFunc));


create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100) not null,
email varchar(100) not null,
cnpj char(18) not null unique,
primary key(codForn));


create table tbClientes(
codCli int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
telCelular char(10),
primary key(codCli));



create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(25) not null unique,
senha varchar(10) not null,
codFunc int not null,
primary key(codUsu),
foreign key(codFunc)references tbFuncionarios(codFunc));



create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
quantidade int,
valor decimal(9,2),
validade date,
dataEntrada date,
horaEntrada time,
codForn int not null,
primary key(codProd),
foreign key(codForn) references tbFornecedores(codForn)
);

create table tbVendas(
codVenda int not null auto_increment,
dataVenda date,
horaVenda time,
quantidade int,
codUsu int not null,
codCli int not null,
codProd int not null,
primary key(codVenda),
foreign key(codUsu)references tbUsuarios(codUsu),
foreign key(codCli)references tbClientes(codCli),
foreign key(codProd)references tbProdutos(codProd));

-- visualizando a estrutura das tabelas
desc tbFuncionarios;
desc tbFornecedores;
desc tbClientes;
desc tbUsuarios;
desc tbProdutos;
desc tbVendas;


-- inserindo registros nas tabelas 
insert into tbFuncionarios(nome,email,cpf,sexo,salario,nascimento,telCelular)values('Jonathan Alves', "jonathan@gmail.com",
'111.222.333-44','M',1500.50,'1999/06/25','96265-5548');
insert into tbFuncionarios(nome,email,cpf,sexo,salario,nascimento,telCelular)values('Clementina Teto', "clementina@gmail.com",
'123.456.789-10','F',1500.50,'1978/08/28','94465-6648');


insert into tbFornecedores(nome,email,cnpj)values('DocesdaNike', 'nike@gmail.com', '15.555.414.0001/65');
insert into tbFornecedores(nome,email,cnpj)values('DocesdaAdidas', 'adidas@gmail.com', '10.141.888.0001/77');

insert into tbClientes(nome,email,telCelular)values('Arthur Pato', 'arthur@gmail.com', '96536-2100');
insert into tbClientes(nome,email,telCelular)values('Daniel', 'daniel@gmail.com', '94582-7795');
insert into tbClientes(nome,email,telCelular)values('Maria', 'maria@gmail.com', '94520-4563');

insert into tbUsuarios(nome,senha,codFunc)values('jonathan.alves','123456',1);
insert into tbUsuarios(nome,senha,codFunc)values('clementina.teto','2005',2);

insert into tbProdutos(descricao,quantidade,valor,validade,dataEntrada,horaEntrada,codForn)values('Arroz doce',100,10.00,'2024/06/02','2024/05/12','19:35:00',1);
insert into tbProdutos(descricao,quantidade,valor,validade,dataEntrada,horaEntrada,codForn)values('Canjica',150,15.00,'2024/06/02','2024/05/12','19:40:00',2);
insert into tbProdutos(descricao,quantidade,valor,validade,dataEntrada,horaEntrada,codForn)values('Pamonha',160,20.00,'2024/06/02','2024/05/12','19:45:00',1);
insert into tbProdutos(descricao,quantidade,valor,validade,dataEntrada,horaEntrada,codForn)values('Hot-dog',170,30.00,'2024/06/02','2024/05/12','19:55:00',2);



insert into tbVendas(dataVenda,horaVenda,quantidade,codUsu,codCli,codProd)values('2024/08/16','19:57:52',20,2,3,4);
insert into tbVendas(dataVenda,horaVenda,quantidade,codUsu,codCli,codProd)values('2024/08/16','19:57:52',10,1,2,3);
insert into tbVendas(dataVenda,horaVenda,quantidade,codUsu,codCli,codProd)values('2024/08/16','19:57:52',13,2,1,1);

-- Visualizando os registros das tabelas
select * from tbFuncionarios;
select * from tbFornecedores;
select * from tbClientes;
select * from tbUsuarios;
select * from tbProdutos;
select * from tbVendas;

update tbProdutos set descricao = "Coxinha", valor = 7.00;

select * from tbProdutos;