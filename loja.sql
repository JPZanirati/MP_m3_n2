create database loja

use LOJA

create sequence idSequence as int
    	start with 1
   	increment by 1

create table usuario(
	idUser int default next value for idSequence primary key,
	login varchar (max) not null,
	senha varchar (max) not null,
)

create table pessoa(
	idPessoa int default next value for idSequence primary key,
	nome varchar (max) not null,
	cidade varchar (max) not null,
	endereco varchar (max) not null,
	uf varchar (2) not null,
	telefone int,
	tipoPessoa varchar (2) not null check (tipoPessoa in('PF','PJ')),
	idUser int not null,
)
alter table pessoa
add constraint fk_idUser foreign key (idUser) references usuario (idUser)

create table pessoa_fisica(
	idFisica int default next value for idSequence primary key,
	cpf varchar (11) not null,
	dt_nasc date not null,
	idPessoa int not null,
)

alter table pessoa_fisica
add constraint fk_idPessoa foreign key (idPessoa) references pessoa (idPessoa)

create table pessoa_juridica(
	idJuridica int default next value for idSequence primary key,
	cnpj varchar (14) not null,
	razaoSocial varchar (max) not null,
	idPessoa int not null,
)


alter table pessoa_juridica
add constraint fk_idPessoaJuridica foreign key (idPessoa) references pessoa (idPessoa)

create table movimento(
	idMovimento int default next value for idSequence primary key,
	qtd_pedido int not null,
	precoTotal decimal not null,
	idFisica int not null,
)

alter table movimento
add constraint fk_idFisica foreign key (idFisica) references pessoa_fisica (idFisica)

create table produto(
	idProduto int default next value for idSequence primary key,
	nomeProduto varchar (max) not null,
	qtd int not null,
	valorUnitario decimal not null,
	tipo varchar (1) not null check (tipo in('E','S'))
	idJuridica int not null,
)

alter table produto
add constraint fk_idJuridica foreign key (idJuridica) references pessoa_juridica (idJuridica)

create table produto_movimento(
	idPM int default next value for idSequence primary key,
	idProduto int not null,
	idMovimento int not null,
)

alter table produto_movimento
add constraint fk_idProduto foreign key (idProduto) references produto (idProduto)

alter table produto_movimento
add constraint fk_idMovimento foreign key (idMovimento) references movimento (idMovimento)
