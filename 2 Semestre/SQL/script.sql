----------------------------------------------------------------------------------------------------------------------
-- No Database TEMP
----------------------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------------------------
-- 1. Recrie toda a estrutura de tabelas com devidos tipos e constraints.
----------------------------------------------------------------------------------------------------------------------
-- Rodar script da aula passada
----------------------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------------------------
-- 2. Adicione os fabricantes a seguir com todos dados: FIAT, GM e VW.
----------------------------------------------------------------------------------------------------------------------
insert Fabricante (nome, endereco, cidade, uf, telefone, contato) values
  ('Fiat', 'Rua Juao, 20', 'Sao Paulo', 'SP', '44456200', 'Samanta Ribeiro')
, ('GM', 'Rua da Consolacao, 125', 'Sao Paulo', 'SP', '26454128', 'Ismael Santos')
, ('Volks', 'Rua Ipiranga, 820', 'Sao Paulo', 'SP', '24456200', 'Ana Cristina')

select * from Fabricante -- 1, 2, 3
----------------------------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------------------------------------------
-- 3. Adicione os modelos: Standard, Premium, Executive.
----------------------------------------------------------------------------------------------------------------------
insert Modelo values ('Standard'), ('Premium'), ('Executive')

select * from Modelo -- 1, 2, 3
----------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------------------------------------------------------------
/* 4. Adicione os Ve�culos: Artic (Fiat  - Standard - ano 2025
							, Voltz (GM -  Executive - ano 2027)
							, Zeo (Volks - Premium - ano 2028)
							, Bjorn (GM - Premium - ano 2028)
							, Duntzen (Fiat - Standard � ano 2026)
							, Tungsten (Volks - Executive - ano 2027)
**/
--------------------------------------------------------------------------------------------------------------------------------------------------------------
sp_help Veiculo -- idAnoFabricacao

-- Precisamos inserir registros em ANO (idAnoFabricacao)
insert Ano values (2025), (2026), (2027), (2028) 

select * from Ano -- 17, 18, 19, 20
select * from Fabricante -- 10, 11, 12
select * from Modelo -- 10, 11,12

-- Agora conseguimos inserir em Veiculo
insert Veiculo (descricao, valor, idModelo, idFabricante, idAnoFabricacao, dataCompra) values 
('Artic', 125500, 10, 10, 17, '20190515') 
, ('Voltz', 156000, 12, 11, 19, '20190115') 
, ('Zeo', 149999, 11, 12, 20, '20190203') 
, ('Bjorn', 175500, 11, 11, 20, '20190227')  
, ('Duntzen', 137190, 10, 10, 18, '20190915') 
, ('Tungsten', 165000, 12, 12, 19, '20190309') 

select * from Veiculo -- 1, 2, 3, 4, 5, 6
----------------------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------------------------
-- 5. Adicione tr�s Vendas para cada ve�culo para o ano de 2029 em meses distintos.
----------------------------------------------------------------------------------------------------------------------
sp_help VendasAnuais -- idMesdaVenda

-- Ano de 2029
insert Ano values (2029)

-- Precisamos inserir registros em MES
insert mes values (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12)

select * from mes -- 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48
select * from Ano -- 17, 18, 19, 20, 21
select * from Fabricante -- 10, 11, 12
select * from Modelo -- 10, 11, 12
select * from Veiculo -- 112, 113, 114, 115, 116, 117

insert VendasAnuais (qtd, idVeiculo, idAnoDaVenda, idMesDaVenda) values
(15, 112, 21, 15), (9, 112, 21, 30) , (3, 112, 21, 45)  
, (7, 113, 21, 18), (13, 113, 21, 33) , (11, 113, 21, 36)
, (9, 114, 21, 24), (23, 114, 21, 27) , (17, 114, 21, 48)
, (5, 115, 21, 39), (15, 115, 21, 42) , (6, 115, 21, 45)
, (21, 116, 21, 15), (23, 116, 21, 24) , (27, 116, 21, 30)
, (1, 117, 21, 18), (3, 117, 21, 21) , (8, 117, 21, 36)


select * from VendasAnuais -- 1333 ... 1341
----------------------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------------------------
-- 6. Altere a fabrica��o dos ve�culos Zeo e Bjorn para o ano de 2026. 
-- Os demais ve�culos alterar para 2030
----------------------------------------------------------------------------------------------------------------------
insert Ano values (2030)
select * from Ano -- 22

Select * from Veiculo -- 114, 115

update Veiculo set idAnoFabricacao = 18 where idVeiculo in (114, 115)
update Veiculo set idAnoFabricacao = 22 where idVeiculo not in (114, 115) and idVeiculo > 111

Select * from Veiculo --114, 115
----------------------------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------------------------------------------
-- 7. Altere as Vendas dos Ve�culos Premium para janeiro de 2030
--                                 , Standard para Dezembro de 2031 e 
--                                   Executive para outubro de 2032.
----------------------------------------------------------------------------------------------------------------------
insert Ano values (2031), (2032)

select * from mes -- 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48
select * from Ano -- 17, 18, 19, 20, 21, 22, 23, 24
select * from Fabricante -- 10, 11, 12
select * from Modelo -- 10, 11, 12
select * from Veiculo -- 112, 113, 114, 115, 116, 117

-- Premium idModelo 11 - idVeiculo 114, 115 - idMes 15 - idAno = 22
update VendasAnuais set idMesdaVenda = 15, idAnodaVenda = 22 where idVeiculo in (114, 115)

-- Standard idModelo 10 - idVeiculo 112, 116 - idMes 48 - idAno = 23
update VendasAnuais set idMesdaVenda = 48, idAnodaVenda = 23 where idVeiculo in (112, 116)

-- Executive idModelo 12 - idVeiculo 113, 117 - idMes 42 - idAno = 24
update VendasAnuais set idMesdaVenda = 42, idAnodaVenda = 24 where idVeiculo in (113, 117)

select * from VendasAnuais 

Select * from Veiculo 
----------------------------------------------------------------------------------------------------------------------