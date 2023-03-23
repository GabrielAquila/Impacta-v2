-- Baseado no modelo, desenvolva as seguintes queries, colocando nomes apropriados
-- (SIGNIFICATIVOS) para todas as colunas (se uma questão for baseada na anterior, copie a query
-- que foi feita e faça alterações sobre ela, mantendo uma consulta por questão)
-- 1. Liste os pedidos entregues para a cidade de Resende, Brasil.
/* select  count(*) from sales.orders 
where shipcountry = 'Brazil' and (shipcity = 'Resende') */
select  * from sales.orders
where shipcountry = 'Brazil' and (shipcity = 'Resende')


-- 2. Encontre os pedidos entregues para as capitais dos estados brasileiros.
select  * from sales.orders  
where shipcountry = 'Brazil' and Shipcity in ('Sao Paulo', 'Rio de Janeiro')

-- 3. Traga somente a quantidade de pedidos realizados para entrega na região SUDESTE do Brasil.
select count(qty) as 'Quantidade'
from sales.orders as p join  Sales.OrderDetails as d
on p.orderid = d.orderid
where shipcountry = 'Brazil' 


-- 4. Adicione a query anterior a soma dos valores dos fretes, o menor e maior frete pago e a
-- média do valor de frete.
select
        min(freight) as 'Menor frete'
        , avg(freight) as 'Média frete'
        , max(freight) as 'Maior frete' 
        ,sum(freight) as 'soma do frete'
from sales.orders as p join  Sales.OrderDetails as d
on p.orderid = d.orderid
where shipcountry = 'Brazil' 

-- 5. Traga apenas a soma dos preços dos itens de produtos entregues para o país Brasil ?
select sum(unitprice) as 'soma do preço'
from sales.orders as p join  Sales.OrderDetails as d
on p.orderid = d.orderid
where shipcountry = 'Brazil' 

-- 6. Observe que o valor pago em um item de pedido é calculado pelo valor unitário do produto
-- na data do pedido, multiplicado pela sua quantidade comprada. Ajuste assim a soma obtida
-- anteriormente para encontrar o correto valor pago para os pedidos.
-- colocar sum (unitprice * qty ) para valor total
select unitprice as "Valor unitario",qty as "quantidade",  (unitprice * qty ) as "Valor verdadeiro"
from sales.orders as p join  Sales.OrderDetails as d
on p.orderid = d.orderid
where shipcountry = 'Brazil'


-- 7. Ainda no ajuste dos mesmos os valores, observe que cada item de pedido pode ter um índice
-- de desconto (discount, onde 0.25 representa 25% de desconto) que será aplicado no valor
-- total de cada item. Desta forma, faça um novo ajuste na soma dos valores, com o desconto
-- fornecido.

select sum ((unitprice * qty) * (1 - discount)) as 'Valor de desconto'
from sales.orders as p join  Sales.OrderDetails as d
on p.orderid = d.orderid
where shipcountry = 'Brazil'

-- 8.Agora com os valores devidamente acertados, faça um agrupamento de forma a obter os valores
-- por estados (Some MANUALMENTE as quantidades obtidas e verifique se é a mesma encontrada na
-- query anterior).
select shipregion as "Estado",sum ((unitprice * qty) * (1 - discount)) as "Valor de desconto"
from sales.orders as p join  Sales.OrderDetails as d
on p.orderid = d.orderid
where shipcountry = 'Brazil'
GROUP by shipregion
select 51956.9800000 + 54968.7965000
-- 9. Adicione a cidade de cada estado deixando o resultado ordenado pelo estado, seguidamente da
-- cidade (Some MANUALMENTE as quantidades encontradas por cidades de cada estado e verifique
-- se são as mesmas encontradas na query anterior referente ao estado).
select shipcity as "cidade" ,shipregion as "Estado",sum ((unitprice * qty) - ((unitprice * qty) * discount)) as "Valor de desconto"
from sales.orders as p join  Sales.OrderDetails as d
on p.orderid = d.orderid
where shipcountry = 'Brazil'
GROUP by shipcity, shipregion
order by shipcity
select 8414.1350000 + 6068.2000000  + 40486.4615000 --sp
-- 10. Adicione os endereços dos clientes que realizaram estes pedidos, permanecendo a mesma
-- ordenação anterior (Some MANUALMENTE as quantidades obtidas por endereço da cidade e
-- verifique se são as mesmas encontradas na query anterior referente a cidade) .
select C.address as "endereço", shipcity as "cidade" ,shipregion as "Estado",sum ((unitprice * qty) - ((unitprice * qty) * discount)) as "Valor de desconto"
from sales.orders as p join  Sales.OrderDetails as d 
on p.orderid = d.orderid 
join sales.Customers as c
on p.custid = c.custid
where shipcountry = 'Brazil'
GROUP by shipcity, shipregion, C.address
order by shipregion
select 8414.1350000 + 6068.2000000  + 25717.4975000 + 3810.7500000 + 6850.6640000 + 4107.5500000
-- 11. Limite o resultado anterior, gerando apenas as somas dos valores superiores a 6.068,19.
select C.address as "endereço", shipcity as "cidade" ,shipregion as "Estado",sum ((unitprice * qty) - ((unitprice * qty) * discount)) as "Valor de desconto"
from sales.orders as p join  Sales.OrderDetails as d 
on p.orderid = d.orderid 
join sales.Customers as c
on p.custid = c.custid
where shipcountry = 'Brazil'
GROUP by shipcity, shipregion, C.address
having sum((unitprice * qty) - ((unitprice * qty) * discount)) > 6068.19
order by shipregion

-- 12. Gere uma lista das das categorias de produtos, descrições dos produtos e a soma de quantidades
-- vendidas, limitando os resultados apenas onde a soma das quantidades esteja entre 200 e 660.
-- Ordene pela soma das quantidades.
select C.description as "descrição", C.categoryname as "categoria do produto", sum(d.qty) as "soma das quantidades" 
from Production.products as p join production.categories as c on p.categoryid = c.categoryid
join  Sales.OrderDetails as d 
on p.productid = d.productid
group by C.description,C.categoryname, d.qty
having sum(qty) > 200 and sum(qty) < 660
order by  sum(qty) desc


-- 13. Liste os número de pedidos onde ao menos um dos produtos comprados tenha sido fornecido por
-- Singapura.
select	count(Distinct OD.orderid) as 'Numero de pedidos'
from	Sales.OrderDetails as OD join Production.Products as P on OD.productid = P.productid
join Production.Suppliers as S on S.supplierid = P.supplierid
where S.country = 'Singapore'











