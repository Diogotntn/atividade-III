-- VIEW

create database view;

 
 Create table view.Funcionarios(
 ID int primary key auto_increment,
 Nome varchar(255)
 );
 
 insert into view.Funcionarios(Nome)
 Values("Diogo");
 
  insert into view.Funcionarios(Nome)
 Values("Manga");
 
  insert into view.Funcionarios(Nome)
 Values("Matheus");
 
 Create table view.Departamento(
 ID int primary key auto_increment,
 Cargo Varchar(255) not null,
 Id_Funcionarios int,
 foreign key (Id_Funcionarios) references view.Funcionarios(ID)
 );
 
 insert into view.Departamento(Cargo,Id_Funcionarios)
 Values('Administrativo',1);
 
insert into view.Departamento(Cargo,Id_Funcionarios)
 Values('Financeiro',2);
 
  insert into view.Departamento(Cargo,Id_Funcionarios)
 Values('Administrativo',3);
 
 Create view view.vw_funcionarios_departamento as
 select 
 F.Nome,
 D.Cargo
 From view.Funcionarios F
 inner join view.Departamento D
  on F.ID = Id_Funcionarios
  where D.Cargo='Administrativo';
 
 
 SELECT * FROM view.vw_funcionarios_departamento;
 
 
 


 Create table view.Produtos(
 ID int primary key auto_increment,
 Nome varchar(255) not null,
 Estoque int
 );
 
 insert into view.Produtos(Nome,Estoque)
 Values("Barbeador",3);
 
  insert into view.Produtos(Nome,Estoque)
 Values("Matizador",50);
 
  insert into view.Produtos(Nome,Estoque)
 Values("Placa Mae",7);
 
 Create View view.vw_estoque_insuficiente as
 select Nome,Estoque
 From view.Produtos
 where Estoque < 5;
 
 Select * from view.vw_estoque_insuficiente;
 
 

CREATE TABLE view.Clientes(
Id int primary key auto_increment,
Nome varchar(255) not null,
DataNascimento date not null,
Telefone varchar(22) not null,
IDVendedor int,
foreign key (IDVendedor) references Vendedor(Id)
);

CREATE TABLE view.Vendedor(
Id int primary key auto_increment,
Nome varchar(255) not null,
Produto varchar(255)
);

insert into view.Clientes(Nome,DataNascimento,Telefone,IDVendedor)
Values("Diego","2005-06-06","(71) 93456-8926",1);

insert into view.Clientes(Nome,DataNascimento,Telefone,IDVendedor)
 Values("Breno","1998-07-13","(71) 98752-7867",2);
 
insert into view.Clientes(Nome,DataNascimento,Telefone,IDVendedor)
Values("Alberto","1990-04-30","(71) 66666-6666",3);

insert into view.Vendedor(Nome,Produto)
 Values("Andre","Bermuda");
 
 insert into view.Vendedor(Nome,Produto)
 Values("Genildo","Camisa");
 
 insert into view.Vendedor(Nome,Produto)
 Values("Linaldo","GTA V");
 
 

 Create view view.vw_relacionamento_cliente_vendedor as
 select 
 C.Nome AS "Nome do Cliente",
 C.DataNascimento as "Data de Nascimento do Cliente",
 C.Telefone as "Telefone do Cliente",
 V.Nome as "Nome do Vendedor",
 V.Produto as "Produto do Vendedor"
 From view.Vendedor V
 inner join view.Clientes C 
on V.Id = C.IDVendedor;

select * from view.vw_relacionamento_cliente_vendedor;








 Create table view.Preco(
 ID int primary key auto_increment,
 Nome varchar(255) not null,
 Preco float
 );
 
 insert into view.Preco(Nome,Preco)
 Values("Guarana ",3.00);
 
  insert into view.Preco(Nome,Preco)
 Values("Pes 2024",150.00);
 
 insert into view.Preco(Nome,Preco)
 Values("FIFA 23",235.00);
 
 Create View view.produtos_caros as
 select Nome,Preco
 From view.Produtos_Preco
 where Preco > 100;
 
 Select * from view.produtos_caros;
 

 Create table view.Pedidos(
 ID int primary key auto_increment,
 Nome varchar(255) not null,
 Status varchar(255) not null
 );
 
 insert into view.Pedidos(Nome,Status)
 Values("maquina","Pendente");
 
insert into view.Pedidos(Nome,Status)
 Values("Moto ","Entregue");
 
 insert into view.Pedidos(Nome,Status)
 Values("Pc","Entregue");
 
 Create View view.pendentes as
 select Nome,Status
 From view.Pedidos
 where Status = "Pendente";
 
 Select * from view.pendentes;