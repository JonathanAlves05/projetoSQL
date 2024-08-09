-- apagando banco de dados
drop database dbCantina;

-- criando banco de dados
create database dbCantina;

-- acessando o banco de dados
use dbCantina

-- Criando as tabelas
create table tbFuncionarios(
    codFunc int not null auto_increment,
    nome varchar(100) not null,
    email varchar(100) unique,
    cpf char(14) not null unique,
    sexo char(1) default 'F' check(sexo in('F,''M')),
    salario decimal (9,2) default 0 check(salario >=0),
    nascimento date,
    telCelular char(10),
    primary key(codFunc));

    desc tbFuncionarios;