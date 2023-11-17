create database exercicio;


create table exercicio.Produto(
Id int primary key auto_increment,
Nome varchar(255) not null,
Data_Validade Date,
Preco decimal(10.2),
Estoque int
);

DELIMITER //

CREATE TRIGGER exercicio.data_validade
BEFORE INSERT ON 
exercicio.Produto
FOR EACH ROW
BEGIN
    IF NEW.Data_Validade < '2023-11-07' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data de validade vencida';
    END IF;
END //

DELIMITER ;


insert into exercicio.Produto(Nome,Data_Validade)
values("queijo peba","2023-08-02");

drop trigger exercicio.aumento_produto;

drop database exercicio;

drop table exercicio.Produto;




DELIMITER //
CREATE TRIGGER exercicio.aumento_produto
before INSERT ON 
exercicio.Produto
FOR EACH ROW
BEGIN
    SET new.Preco = new.Preco + (new.Preco * 10/100);
END //
DELIMITER ;


insert into exercicio.Produto(Nome,Preco)
values("Caixa de som",1200);

select * from exercicio.Produto;



-- 3. Crie um trigger para atualizar o estoque sempre que um produto for vendido. O trigger deve diminuir o número de itens em estoque sempre que uma venda for realizada.

DELIMITER //
CREATE TRIGGER exercicio.diminuir_estoque
before INSERT ON 
exercicio.Produto
FOR EACH ROW
BEGIN
    SET new.Estoque = new.Estoque - 1;
END //
DELIMITER ;
 
 
 insert into exercicio.Produto(Nome,Estoque)
 values("Pandeiro",50);
 
 select Nome,Estoque from exercicio.Produto;
 
 

create table exercicio.tb_funcionarios(
ID INT PRIMARY KEY auto_increment,
Nome varchar(255),
Salario decimal(15.2)
);

insert into exercicio.tb_funcionarios(Nome,Salario)
values("Carlos",150);

insert into exercicio.tb_funcionarios(Nome,Salario)
values("Diego",1500);


create table exercicio.tb_funcionarios_demitidos(
ID INT PRIMARY KEY auto_increment,
Nome varchar(255),
Salario decimal(19.2)
);


DELIMITER //
CREATE TRIGGER exercicio.delete_funcionario
AFTER DELETE ON exercicio.tb_funcionarios
FOR EACH ROW
BEGIN
    INSERT INTO exercicio.tb_funcionarios_demitidos (ID, Nome, Salario)
    VALUES (OLD.ID, OLD.Nome, OLD.Salario);
END;
//
DELIMITER ;



drop table exercicio.tb_funcionarios_demitidos;

delete from exercicio.tb_funcionarios where ID = 2;



select * from exercicio.tb_funcionarios;

select * from exercicio.tb_funcionarios_demitidos;



create table exercicio.dependentes(
ID INT PRIMARY KEY auto_increment,
Nome varchar(255),
IDFuncionario int,
foreign key (IDFuncionario) references exercicio.tb_funcionarios (ID)
);

insert into exercicio.dependentes(Nome,IDFuncionario)
values("Hugo",2);

insert into exercicio.dependentes(Nome,IDFuncionario)
values("Marcos",1);

select * from exercicio.dependentes;



DELIMITER //

CREATE TRIGGER exercicio.ExcluirDependenteAoDeletarFuncionario
AFTER DELETE ON exercicio.tb_funcionarios
FOR EACH ROW
BEGIN
    DELETE FROM exercicio.dependentes WHERE IDFuncionario = OLD.ID;
END;
//

DELIMITER ;

drop database exercicio;