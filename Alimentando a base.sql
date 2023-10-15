use LOJA

insert into usuario (login, senha)
values ('op1', 'op1');

values ('op2', 'op2');

insert into pessoa (nome, cidade, endereco, uf, telefone, tipoPessoa, idUser)
values ('João', 'Poa', 'rua 2', 'rs', '111111111', 'PF', '1');

values ('maria', 'floripa', 'rua 36', 'sc', '222222222', 'PJ', '2');

insert into pessoa_fisica (cpf, dt_nasc, idPessoa)
values ('77777777777', '01/01/1998', '4')

insert into pessoa_juridica (cnpj, razaoSocial, idPessoa)
values ('99999999999999', 'Mercado Maria', '5');

insert into produto (nomeProduto, qtd, valorUnitario, tipo, idJuridica)
values ('Banana', '100', '5.00','S' , '14');

values ('Laranja', '500', '2.00','S' , '14');

values ('Manga', '800', '4.00','S' , '14');

insert into movimento (qtd_pedido, precoTotal, idFisica)
values ('2', '4.00', '12')

insert into produto_movimento (idProduto, idMovimento)
values ('19', '21')