create database livraria

go

use livraria


create table livro(
cod_livro int NOT NULL,
nome_livro varchar(100) null,
lingua_livro varchar(50),
ano_livro int null
primary key(cod_livro)
)

create table edicoes(
isbn int not null,
preco decimal(7,2) null,
ano int null,
num_paginas int null,
qtd_estoq int null
primary key(isbn)
)

create table autor(
codigo_autor int not null,
nome varchar(100) null,
nascimento date null,
pais varchar(50) null,
biografia varchar(max) null
primary key(codigo_autor)
)

create table editora(
codigo_editora int not null,
nome varchar(50) null,
logradouro varchar(50) null,
numero int null,
cep char(8) null,
telefone char(11) null
primary key(codigo_editora)
)

create table livro_autor(
livrocodigo_livro int not null,
autorcodigo_autor int not null
primary key(livrocodigo_livro, autorcodigo_autor)
FOREIGN KEY (autorcodigo_autor) REFERENCES autor(codigo_autor),
FOREIGN KEY (livrocodigo_livro) REFERENCES livro(cod_livro)
)

create table livro_edicoes_editora(
edicoesisbn int not null,
editoracodigo_editora int not null,
livrocodigo_livro int not null
primary key(edicoesisbn, editoracodigo_editora, livrocodigo_livro)
FOREIGN KEY (edicoesisbn) REFERENCES edicoes(isbn),
FOREIGN KEY (editoracodigo_editora) REFERENCES editora(codigo_editora),
FOREIGN KEY (livrocodigo_livro) REFERENCES livro(cod_livro)
)

EXEC sp_rename 'dbo.edicoes.ano','ano_edicao','COLUMN'

alter table editora
alter column nome varchar(30) null

alter table autor
drop column nascimento
alter table autor
add ano int null

INSERT INTO autor(codigo_autor,nome,ano,pais,biografia)
VALUES
(10001,'Inácio da Silva',1975,'Brasil','Programador WEB desde 1995'),
(10002,'Andrew Tannenbaum',1944,'EUA','Chefe do Departamento de Sistemas de Computação da Universidade de Vrij'),
(10003,'Luis Rocha',1967,'Brasil','Programador Mobile desde 2000'),
(10004,'David Halliday',1916,'EUA','Físico PH.D desde 1941')


INSERT INTO livro(cod_livro,nome_livro,lingua_livro,ano_livro)
VALUES
(1001,'CCNA 4.1','PT-BR',2015),
(1002,'HTML 5','PT-BR',2017),
(1003,'Redes de Computadores','EN',2010),
(1004,'Android em Ação','PT-BR',2018)

INSERT INTO livro_autor
VALUES
(1001,10001),
(1002,10003),
(1003,10002),
(1004,10003)

INSERT INTO edicoes
VALUES(0130661023,189.99,2018,653,10)

UPDATE autor
SET biografia = 'Chefe do Departamento de Sistemas de Computação da Universidade de Vrije'
WHERE codigo_autor = 10002

SELECT * FROM autor

SELECT * FROM edicoes
--TIRAR 2 DO ESTOQUE
UPDATE edicoes
SET qtd_estoq = qtd_estoq - 2
WHERE ISBN = 0130661023

SELECT * FROM edicoes

--APAGAR DAVID HALLIDAY DA EXISTENCIA DA TABELA
DELETE autor
WHERE codigo_autor = 10004