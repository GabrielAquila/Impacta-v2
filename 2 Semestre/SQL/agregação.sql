-- Na base Concessionária, utilize funções de agregação para solucionar as seguintes questões:

-- 1) Qual o número de registros existentes na tabela VendasAnuais ?
select COUNT(*) as 'QTD REGISTRO' from VendasAnuais
-- 2) Qual o acumulado da quantidade de vendas Totais até o momento ?
select top 10 * from VendasAnuais
select sum(qtd) as "acumulado da quantidade de vendas" from VendasAnuais
-- 3) Quais as quantidades de vendas Totais até o momento para: menor venda, média de
-- vendas e a maior venda?
select	min(qtd) as 'Menor Qtd Vendida'
        , avg(qtd) as 'Média de Qtd Vendida'
        , max(qtd) as 'Maior Qtd Vendida' 
from	VendasAnuais 
-- 4) Extraia a soma das vendas anuais por ano em ordem descendente.
select * from Ano

select	Ano, sum(qtd) as 'Soma das Quantidades Vendidas' 
from	VendasAnuais  join Ano on idAno = idAnodaVenda
group by Ano
order by ano desc -- 664794 / 664794
-- 5) Traga a soma das vendas anuais para o veículo/modelo CG 125 STD (as informações do
-- veículo devem constar na query).
select	V.descricao as 'Descrição do Veículo'
		, M.descricao as 'Descrição do Modelo'
		, sum(qtd) as 'Total de quantidade Vendida' 
from	VendasAnuais as VA	 join Veiculo as V on VA.idVeiculo = V.idVeiculo
							 join Modelo as M on V.idModelo = M.idModelo
where	V.descricao = 'CG 125' and M.descricao = 'STD'
group by V.descricao, M.descricao

-- 6) Traga as primeiras datas (ANOS) de FABRICAÇÃO de todos os veículos e modelos,
-- ordenados pelo nome do fabricante (ascendente), ano (descendente), Veículo
-- (ascendente) e Modelo (descendente) Toda as informações solicitadas, inclusive
-- ordenação, devem constar na query.

select	F.nome as 'Nome do Fabricante'
		, V.descricao as 'Descrição do Veículo'
		, M.descricao as 'Descrição do Modelo'
		, min(A.ano) as 'Menor Ano/Data Fabricacao'
from	Veiculo as V	 join Ano as A on V.idAnoFabricacao = A.idAno
						 join Modelo as M on V.idModelo = M.idModelo
						 join Fabricante as F on F.idFabricante = V.idFabricante
group by F.nome 
		, V.descricao
		, M.descricao
order by F.nome asc
		, min(A.ano) desc
		, V.descricao asc
		, M.descricao desc
-- 7) Extraia a menor, maior, média e a soma das vendas de cada mês do ano de 2000, em
-- ordem ascendente.
select	Ano
		, Mes
		, min(qtd) as 'Menor quantidade Vendida' 
		, avg(qtd) as 'Média de quantidade Vendida' 
		, max(qtd) as 'Maior quantidade Vendida' 
		, sum(qtd) as 'Total de Vendas'
from	VendasAnuais	 join Ano on idAno = idAnodaVenda
						 join Mes on idMesdaVenda = idMes
where	Ano = 2000
group by Ano
		, Mes
order by Ano asc
		, Mes
-- 8) Retorne a mesma consulta anterior, mas somente os registros que tiverem média de
-- vendas superior a 500.
select	Ano
		, Mes
		, min(qtd) as 'Menor quantidade Vendida' 
		, avg(qtd) as 'Média de quantidade Vendida' 
		, max(qtd) as 'Maior quantidade Vendida' 
from	VendasAnuais  join Ano on idAno = idAnodaVenda
					 join Mes on idMesdaVenda = idMes
where	Ano = 2000
group by Ano
		, Mes
having avg(qtd) > 500
order by Ano
		, Mes