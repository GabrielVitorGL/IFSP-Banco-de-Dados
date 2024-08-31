create database test;

use test;

create table usuarios (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

select * from usuarios where nome = 'erick';

insert into usuarios(nome) values('Erick');

delete from usuarios where id = 3;

update usuarios set nome = 'Diego' where id = 2;

create table endereco (
	rua varchar(255) NOT NULL,
	id_usuario int,
    CONSTRAINT FK_IdUsuario FOREIGN KEY (id_usuario) references usuarios(id)
);

select * from endereco;

insert into endereco(rua, id_usuario) values ('Rua 01', 1);

drop table endereco;

select * from usuarios inner join endereco on usuarios.id = endereco.id_usuario;

create table teste (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    telefone VARCHAR(255) NOT NULL,
    rua VARCHAR(255) NOT NULL,
    numero INT NOT NULL,
    bairro VARCHAR(255) NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    estado VARCHAR(255) NOT NULL,
    pais VARCHAR(255) NOT NULL,
    cep VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    cpf VARCHAR(255) NOT NULL,
    rg VARCHAR(255) NOT NULL
);

select * from teste;

insert into teste(nome, sobrenome, email, telefone, rua, numero, bairro, cidade, estado, pais, cep, data_nascimento, cpf, rg) 
    values('Erick', 'Wendel', 'email@gmail.com', '999999999', 'Rua 01', 123, 'Bairro 01', 'Cidade 01', 'Estado 01', 'Pais 01', '99999999', '1990-01-01', '99999999999', '999999999');


/*

Criar Banco de Dados - Tabelas
#1 Criar o Banco de Dados Shopping
# 2) Abrir o Banco de Ddos
# 3) Criar as Tabelas 

 Tabela: Shopping
 Campo Tipo Restrição
 Codigo_Shopping varchar(3) Chave Primária 
 Nome_Shopping varchar(40) Não Nulo
 Endereco_Shopping Varchar(30) Não Nulo
 Bairro_Shopping Varchar(30)
 Cidade_Shopping Varchar(30)
 Uf_Shopping Varchar(2)
 Fone_Adminstrativo Varchar(13) 
 
Tabela: TB_Lojas 
 Campo Tipo Restrição
 Codigo_Loja varchar(03) Chave Primária 
 Nome_Loja varchar(30) Não Nulo
 Codigo_Shopping Varchar(03) Chave Estrangeira
 CNPJ_Loja Varchar(17) unico 
 


Tabela: Tb_Cargo
 Campo Tipo Restrição
 Codigo_Cargo varchar(5) Chave Primária
 Nome_do_Cargo varchar(05) Não nulo
 Comissao_Cargo Real 
 
 
Tabela: Tb_Funcionarios
 Campo Tipo Restrição
 Codigo_Funcionario varchar(3) Chave Primária
 Nome_do_Funcionario varchar(40) Não nulo
 Sexo char(1) Somente 'F' ou 'M' 
 Data_Nascimento date 
 cpf varchar(12) único,
 Cod_Cargo Varchar(5) Chave Estrangeira - Relaciona com Tabela 
 de Cargo 
 Cod_loja varchar(3) Chave Estrangeira - Relaciona com a 
 Tabela da Loja 
 Data_Admissao date 
 

*/


create database shopping;

use shopping;

create table shopping (
    Codigo_Shopping varchar(3) PRIMARY KEY,
    Nome_Shopping varchar(40) NOT NULL,
    Endereco_Shopping varchar(30) NOT NULL,
    Bairro_Shopping varchar(30),
    Cidade_Shopping varchar(30),
    Uf_Shopping varchar(2),
    Fone_Adminstrativo varchar(13)
);

create table TB_Lojas (
    Codigo_Loja varchar(3) PRIMARY KEY,
    Nome_Loja varchar(30) NOT NULL,
    Codigo_Shopping varchar(3),
    CNPJ_Loja varchar(17) UNIQUE,
    CONSTRAINT FK_CodigoShopping FOREIGN KEY (Codigo_Shopping) references shopping(Codigo_Shopping)
);

create table Tb_Cargo (
    Codigo_Cargo varchar(5) PRIMARY KEY,
    Nome_do_Cargo varchar(5) NOT NULL,
    Comissao_Cargo REAL
);

create table Tb_Funcionarios (
    Codigo_Funcionario varchar(3) PRIMARY KEY,
    Nome_do_Funcionario varchar(40) NOT NULL,
    Sexo char(1) CHECK (Sexo = 'F' OR Sexo = 'M'),
    Data_Nascimento DATE,
    cpf varchar(12) UNIQUE,
    Cod_Cargo varchar(5),
    Cod_loja varchar(3),
    Data_Admissao DATE,
    CONSTRAINT FK_CodCargo FOREIGN KEY (Cod_Cargo) references Tb_Cargo(Codigo_Cargo),
    CONSTRAINT FK_CodLoja FOREIGN KEY (Cod_loja) references TB_Lojas(Codigo_Loja)
);

select * from shopping;

insert into shopping(Codigo_Shopping, Nome_Shopping, Endereco_Shopping, Bairro_Shopping, Cidade_Shopping, Uf_Shopping, Fone_Adminstrativo) 
    values('001', 'Shopping 01', 'Rua 01', 'Bairro 01', 'Cidade 01', 'SP', '999999999');

select * from TB_Lojas;

insert into TB_Lojas(Codigo_Loja, Nome_Loja, Codigo_Shopping, CNPJ_Loja) 
    values('001', 'Loja 01', '001', '99999999999999');

select * from Tb_Cargo;

insert into Tb_Cargo(Codigo_Cargo, Nome_do_Cargo, Comissao_Cargo) 
    values('001', 'Cargo 01', 10.0);

select * from Tb_Funcionarios;

insert into Tb_Funcionarios(Codigo_Funcionario, Nome_do_Funcionario, Sexo, Data_Nascimento, cpf, Cod_Cargo, Cod_loja, Data_Admissao) 
    values('001', 'Funcionario 01', 'M', '1990-01-01', '99999999999', '001', '001', '2021-01-01');

select * from shopping inner join TB_Lojas on shopping.Codigo_Shopping = TB_Lojas.Codigo_Shopping;

select * from Tb_Cargo inner join Tb_Funcionarios on Tb_Cargo.Codigo_Cargo = Tb_Funcionarios.Cod_Cargo;

select * from TB_Lojas inner join Tb_Funcionarios on TB_Lojas.Codigo_Loja = Tb_Funcionarios.Cod_loja;

select * from shopping inner join TB_Lojas on shopping.Codigo_Shopping = TB_Lojas.Codigo_Shopping inner join Tb_Funcionarios on TB_Lojas.Codigo_Loja = Tb_Funcionarios.Cod_loja inner join Tb_Cargo on Tb_Cargo.Codigo_Cargo = Tb_Funcionarios.Cod_Cargo;
