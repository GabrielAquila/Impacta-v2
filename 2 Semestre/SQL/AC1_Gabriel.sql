Use 2101991


/*
Nome: Gabriel Áquila Santos Silva
Ra:2101991

*/

--a
select (210-91)/2 --59

--b
CREATE TABLE NovoVeiculo
( 
idVeiculo          smallint 
, descricao          varchar(50) not null
, valor              decimal(9,2)not null
, dataCompra        date not null
, constraint pkNovoVeiculo primary key (idVeiculo)
)
go

CREATE TABLE AnuaisNovo
( 
idVendas           int
, qtd              smallint not null 
, idVeiculo        smallint  null 
, constraint pkAnuaisNovo primary key (idVendas)
, constraint fkAnuaisNovo_idVeiculo foreign key (idVeiculo) references NovoVeiculo(idVeiculo)
)
go

select * from NovoVeiculo
select * from AnuaisNovo

--c
INSERT INTO NovoVeiculo(idVeiculo,descricao,valor,dataCompra)
    select idVeiculo, descricao, valor, dataCompra
    from [2101991].Veiculo
    

INSERT INTO AnuaisNovo(idVendas,qtd,idVeiculo)
    select idVendas,qtd,idVeiculo
    from [2101991].VendasAnuais
  

--d
delete from Veiculo
where idVeiculo = 59;

delete from VendasAnuais
where idVeiculo = 59;

--e
INSERT INTO Veiculo(descricao,valor,dataCompra)
    select descricao,valor,dataCompra
    from NovoVeiculo
    where idVeiculo = 59

INSERT INTO VendasAnuais(qtd)
    select qtd
    from AnuaisNovo
    where idVeiculo = 59


--f
drop table AnuaisNovo,NovoVeiculo;

