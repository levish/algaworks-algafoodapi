create table FormaPagamento (
    id bigint not null auto_increment,
    descricao varchar(60) not null,
    primary key (id)) engine=InnoDB default charset=utf8


create table Grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table Permissao (id bigint not null auto_increment, descricao varchar(255) not null, nome varchar(255) not null, primary key (id)) engine=InnoDB
create table Produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table Restaurante (id bigint not null auto_increment, data_atualizacao datetime not null, data_cadastro datetime not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(30) not null, taxa_frete decimal(19,2) not null, cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table Usuario (id bigint not null auto_increment, dataCadastro datetime(6), email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table Cidade add constraint FKsatretdvg03if89kwwmiagnyd foreign key (estado_id) references Estado (id)
alter table grupo_permissao add constraint FKgdi9l970of088nus625ohl6td foreign key (permissao_id) references Permissao (id)
alter table grupo_permissao add constraint FK31na601kk5qwqq0m1re5sl8sv foreign key (grupo_id) references Grupo (id)
alter table Produto add constraint FKe5u3ji3wnhk98r3qsne7y37ir foreign key (restaurante_id) references Restaurante (id)
alter table Restaurante add constraint FK34sotwu9m00fb8ev5e8r0wgjl foreign key (cozinha_id) references Cozinha (id)
alter table Restaurante add constraint FKkbuctimdcg80utfsto3py4mhm foreign key (endereco_cidade_id) references Cidade (id)
alter table restaurante_forma_pagamento add constraint FKmu3xgjayvxybningyrctuq17c foreign key (forma_pagamento_id) references FormaPagamento (id)
alter table restaurante_forma_pagamento add constraint FKrj9rjap7qf61brc8pdjxmeror foreign key (restaurante_id) references Restaurante (id)
alter table usuario_grupo add constraint FKsbk7vgd004477ti7mht0u7n9d foreign key (grupo_id) references Grupo (id)
alter table usuario_grupo add constraint FKewqprkppq0nvuu9ms8l5mlt3h foreign key (usuario_id) references Usuario (id)
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro, data_cadastro, data_atualizacao) values (1,'Thai Gourmet',10,1,1,'33600000','rua doze','333','ap 101','cascavel',utc_timestamp,utc_timestamp)
insert into restaurante (nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values ('Thai Delivery',9.50,1,utc_timestamp,utc_timestamp)
insert into restaurante (nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values ('Tuk Tuk Comida Indiana',15,2,utc_timestamp,utc_timestamp)
insert into formapagamento (id, descricao) values (1, 'Cartão de crédito')
insert into formapagamento (id, descricao) values (2, 'Cartão de débito')
insert into formapagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1,1), (1,2), (1,3), (2,3), (3,2), (3,3)
create table Cidade (id bigint not null auto_increment, nome varchar(30) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table Cozinha (id bigint not null auto_increment, nome varchar(30) not null, primary key (id)) engine=InnoDB
create table Estado (id bigint not null auto_increment, nome varchar(30) not null, primary key (id)) engine=InnoDB
create table FormaPagamento (id bigint not null auto_increment, descricao varchar(255) not null, primary key (id)) engine=InnoDB
create table Grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table Permissao (id bigint not null auto_increment, descricao varchar(255) not null, nome varchar(255) not null, primary key (id)) engine=InnoDB
create table Produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table Restaurante (id bigint not null auto_increment, data_atualizacao datetime not null, data_cadastro datetime not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(30) not null, taxa_frete decimal(19,2) not null, cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table Usuario (id bigint not null auto_increment, dataCadastro datetime(6), email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table Cidade add constraint FKsatretdvg03if89kwwmiagnyd foreign key (estado_id) references Estado (id)
alter table grupo_permissao add constraint FKgdi9l970of088nus625ohl6td foreign key (permissao_id) references Permissao (id)
alter table grupo_permissao add constraint FK31na601kk5qwqq0m1re5sl8sv foreign key (grupo_id) references Grupo (id)
alter table Produto add constraint FKe5u3ji3wnhk98r3qsne7y37ir foreign key (restaurante_id) references Restaurante (id)
alter table Restaurante add constraint FK34sotwu9m00fb8ev5e8r0wgjl foreign key (cozinha_id) references Cozinha (id)
alter table Restaurante add constraint FKkbuctimdcg80utfsto3py4mhm foreign key (endereco_cidade_id) references Cidade (id)
alter table restaurante_forma_pagamento add constraint FKmu3xgjayvxybningyrctuq17c foreign key (forma_pagamento_id) references FormaPagamento (id)
alter table restaurante_forma_pagamento add constraint FKrj9rjap7qf61brc8pdjxmeror foreign key (restaurante_id) references Restaurante (id)
alter table usuario_grupo add constraint FKsbk7vgd004477ti7mht0u7n9d foreign key (grupo_id) references Grupo (id)
alter table usuario_grupo add constraint FKewqprkppq0nvuu9ms8l5mlt3h foreign key (usuario_id) references Usuario (id)
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro, data_cadastro, data_atualizacao) values (1,'Thai Gourmet',10,1,1,'33600000','rua doze','333','ap 101','cascavel',utc_timestamp,utc_timestamp)
insert into restaurante (nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values ('Thai Delivery',9.50,1,utc_timestamp,utc_timestamp)
insert into restaurante (nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values ('Tuk Tuk Comida Indiana',15,2,utc_timestamp,utc_timestamp)
insert into formapagamento (id, descricao) values (1, 'Cartão de crédito')
insert into formapagamento (id, descricao) values (2, 'Cartão de débito')
insert into formapagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1,1), (1,2), (1,3), (2,3), (3,2), (3,3)
create table Cidade (id bigint not null auto_increment, nome varchar(30) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table Cozinha (id bigint not null auto_increment, nome varchar(30) not null, primary key (id)) engine=InnoDB
create table Estado (id bigint not null auto_increment, nome varchar(30) not null, primary key (id)) engine=InnoDB
create table FormaPagamento (id bigint not null auto_increment, descricao varchar(255) not null, primary key (id)) engine=InnoDB
create table Grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table Permissao (id bigint not null auto_increment, descricao varchar(255) not null, nome varchar(255) not null, primary key (id)) engine=InnoDB
create table Produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table Restaurante (id bigint not null auto_increment, data_atualizacao datetime not null, data_cadastro datetime not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(30) not null, taxa_frete decimal(19,2) not null, cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table Usuario (id bigint not null auto_increment, dataCadastro datetime(6), email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table Cidade add constraint FKsatretdvg03if89kwwmiagnyd foreign key (estado_id) references Estado (id)
alter table grupo_permissao add constraint FKgdi9l970of088nus625ohl6td foreign key (permissao_id) references Permissao (id)
alter table grupo_permissao add constraint FK31na601kk5qwqq0m1re5sl8sv foreign key (grupo_id) references Grupo (id)
alter table Produto add constraint FKe5u3ji3wnhk98r3qsne7y37ir foreign key (restaurante_id) references Restaurante (id)
alter table Restaurante add constraint FK34sotwu9m00fb8ev5e8r0wgjl foreign key (cozinha_id) references Cozinha (id)
alter table Restaurante add constraint FKkbuctimdcg80utfsto3py4mhm foreign key (endereco_cidade_id) references Cidade (id)
alter table restaurante_forma_pagamento add constraint FKmu3xgjayvxybningyrctuq17c foreign key (forma_pagamento_id) references FormaPagamento (id)
alter table restaurante_forma_pagamento add constraint FKrj9rjap7qf61brc8pdjxmeror foreign key (restaurante_id) references Restaurante (id)
alter table usuario_grupo add constraint FKsbk7vgd004477ti7mht0u7n9d foreign key (grupo_id) references Grupo (id)
alter table usuario_grupo add constraint FKewqprkppq0nvuu9ms8l5mlt3h foreign key (usuario_id) references Usuario (id)
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro, data_cadastro, data_atualizacao) values (1,'Thai Gourmet',10,1,1,'33600000','rua doze','333','ap 101','cascavel',utc_timestamp,utc_timestamp)
insert into restaurante (nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values ('Thai Delivery',9.50,1,utc_timestamp,utc_timestamp)
insert into restaurante (nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values ('Tuk Tuk Comida Indiana',15,2,utc_timestamp,utc_timestamp)
insert into formapagamento (id, descricao) values (1, 'Cartão de crédito')
insert into formapagamento (id, descricao) values (2, 'Cartão de débito')
insert into formapagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1,1), (1,2), (1,3), (2,3), (3,2), (3,3)
create table Cidade (id bigint not null auto_increment, nome varchar(30) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table Cozinha (id bigint not null auto_increment, nome varchar(30) not null, primary key (id)) engine=InnoDB
create table Estado (id bigint not null auto_increment, nome varchar(30) not null, primary key (id)) engine=InnoDB
create table FormaPagamento (id bigint not null auto_increment, descricao varchar(255) not null, primary key (id)) engine=InnoDB
create table Grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table Permissao (id bigint not null auto_increment, descricao varchar(255) not null, nome varchar(255) not null, primary key (id)) engine=InnoDB
create table Produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table Restaurante (id bigint not null auto_increment, data_atualizacao datetime not null, data_cadastro datetime not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(30) not null, taxa_frete decimal(19,2) not null, cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table Usuario (id bigint not null auto_increment, dataCadastro datetime(6), email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table Cidade add constraint FKsatretdvg03if89kwwmiagnyd foreign key (estado_id) references Estado (id)
alter table grupo_permissao add constraint FKgdi9l970of088nus625ohl6td foreign key (permissao_id) references Permissao (id)
alter table grupo_permissao add constraint FK31na601kk5qwqq0m1re5sl8sv foreign key (grupo_id) references Grupo (id)
alter table Produto add constraint FKe5u3ji3wnhk98r3qsne7y37ir foreign key (restaurante_id) references Restaurante (id)
alter table Restaurante add constraint FK34sotwu9m00fb8ev5e8r0wgjl foreign key (cozinha_id) references Cozinha (id)
alter table Restaurante add constraint FKkbuctimdcg80utfsto3py4mhm foreign key (endereco_cidade_id) references Cidade (id)
alter table restaurante_forma_pagamento add constraint FKmu3xgjayvxybningyrctuq17c foreign key (forma_pagamento_id) references FormaPagamento (id)
alter table restaurante_forma_pagamento add constraint FKrj9rjap7qf61brc8pdjxmeror foreign key (restaurante_id) references Restaurante (id)
alter table usuario_grupo add constraint FKsbk7vgd004477ti7mht0u7n9d foreign key (grupo_id) references Grupo (id)
alter table usuario_grupo add constraint FKewqprkppq0nvuu9ms8l5mlt3h foreign key (usuario_id) references Usuario (id)
insert into cozinha (id, nome) values (1, 'Tailandesa')
insert into cozinha (id, nome) values (2, 'Indiana')
insert into estado (id, nome) values (1, 'Minas Gerais')
insert into estado (id, nome) values (2, 'São Paulo')
insert into estado (id, nome) values (3, 'Ceará')
insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1)
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1)
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2)
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2)
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3)
insert into restaurante (id, nome, taxa_frete, cozinha_id, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro, data_cadastro, data_atualizacao) values (1,'Thai Gourmet',10,1,1,'33600000','rua doze','333','ap 101','cascavel',utc_timestamp,utc_timestamp)
insert into restaurante (nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values ('Thai Delivery',9.50,1,utc_timestamp,utc_timestamp)
insert into restaurante (nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao) values ('Tuk Tuk Comida Indiana',15,2,utc_timestamp,utc_timestamp)
insert into formapagamento (id, descricao) values (1, 'Cartão de crédito')
insert into formapagamento (id, descricao) values (2, 'Cartão de débito')
insert into formapagamento (id, descricao) values (3, 'Dinheiro')
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas')
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas')
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1,1), (1,2), (1,3), (2,3), (3,2), (3,3)
