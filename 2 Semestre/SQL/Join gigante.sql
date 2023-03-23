-- o Brabo : Gabriel Áquila Santos Silva
--RA : 2101991


-- Utilizando as tabelas de Pedidos (Sales.Orders), Clientes (Sales.Customers), Empregados
-- (HR.Employees) e Empresa de Entrega (Sales.Shippers), desenvolver as seguintes consultas:

-- 1. Retornar os apelidos número do pedido (orderid), data do pedido (orderdate), nome do contato
-- (contactname) e o país (country).
select O.orderId as 'Numero_pedido', O.orderdate as 'Data_pedido', C.contactname as 'Nome_contato', 
C.country as 'Pais'
from Sales.Orders as O JOIN  Sales.Customers  AS C
                on O.custid = C.custid                                      

-- 2. Retornar os apelidos data do pedido (orderdate), nome do contato (contactname), nome completo
-- do empregado (firstname/lastname) e país do empregado (country), onde o país do empregado
-- seja Inglaterra.

SELECT O.orderdate as 'Data_pedido', C.contactname as 'Nome_contato', (E.firstname + ' ' + E.lastname) as 'Nome completo', E.country as 'Pais'
from  Sales.Orders as O join Sales.Customers  AS C
                    on O.custid = C.custid    
                    join HR.Employees as E 
                    on O.empid = E.empid
where E.country = 'UK'

-- 3. Retornar os apelidos número do pedido (orderid), data do pedido (orderdate), nome do contato do
-- cliente (contactname), nome completo do empregado (firstname/lastname) e país do cliente
-- (country), onde o país do cliente seja Brasil, ordernado pela data do pedido mais recente.


SELECT O.orderdate as 'Data_pedido', C.contactname as 'Nome_contato', (E.firstname + ' ' + lastname) as 'Nome completo', C.country as 'Pais'
from  Sales.Orders as O join Sales.Customers  AS C
                    on O.custid = C.custid    
                    join HR.Employees as E 
                    on O.empid = E.empid
where C.country = 'Brazil' 
order by O.orderdate desc


-- 4. Retornar os apelidos número do pedido (orderid), data do pedido (orderdate), nome do contato
-- (contactname), nome completo do empregado (firstname/lastname), país do empregado (country)
-- e nome da empresa de entrega, onde o país do empregado seja Estados Unidos e a empresa de
-- entrega seja Shipper ETYNR ou Shipper GVSUA. Ordene pelo número do pedido.

SELECT O.orderid as 'Numero_pedido', O.orderdate as 'Data_pedido', C.contactname as 'Nome_contato', (E.firstname + ' ' + lastname) as 'Nome completo', E.country as 'Pais',
S.companyname as 'NOME_EMPRESA'
from  Sales.Orders as O join Sales.Customers  AS C
                    on O.custid = C.custid    
                    join HR.Employees as E 
                    on O.empid = E.empid
                    JOIN Sales.Shippers AS S
                    ON S.shipperid = O.shipperid
where E.country = 'USA' AND (S.companyname = 'Shipper ETYNR' or  S.companyname = 'Shipper GVSUA')
order by o.orderid asc 

-- Exercícios
-- Adicionando as tabelas Detalhes de Pedidos (Sales.OrderDetails), Produtos (Production.Products),
-- Fornecedores (Production.Suppliers) e Categorias (Production.Categories), desenvolver as seguintes
-- consultas :

-- 5. Retorne todas informações de nome do produto e o nome da categoria, onde esta seja Beverages e
-- o preço do produto (unitprice) seja menor que 30, ordenado pelo preço de forma descendente.
SELECT productname as 'Nome_produto', categoryname as 'Nome_categoria', P.unitprice as "Preco_produto"
FROM Production.Categories as C join Production.Products AS P
on C.categoryid = P.categoryid
where P.unitprice < 30
order by P.unitprice desc

            

-- 6. Retorne os apelidos, nome do produto (productname), nome da empresa de entrega
-- (companyname) e a quantidade do produto (qty), quando essa ultrapassar 100 unidades. Ordene
-- pelo nome do produto ascendente e quantidade de forma descendente.
select P.productname as 'Nome_produto', S.companyname as 'Nome_empresa', O.qty as 'Quantidade'
from Production.Products AS P join Production.Suppliers as S
on P.supplierid = S.supplierid
join Sales.OrderDetails as O
on P.productid = O.productid 
where O.qty > 100 
order by P.productname  asc, O.qty  desc
-- 7. Retorne os apelidos, nome do contato do cliente (contactname), nome do produto (productname),
-- quantidade do produto (qty), data do pedido (orderdate) e cidade do fornecedor (city), onde a
-- data do pedido seja todo o mês de julho de 2006, a quantidade de produtos seja maior ou igual a
-- 20 e menor que 60, o nome do produto inicie por Product A ou Product G, o nome da cidade do
    -- fornecedor seja Stockholm, Sydney, Sandvika ou Ravenna. Ordene pelo número do empregado
    -- (empid) de forma descendente
select C.contactname as 'Contato_cliente', P.productname as 'nome_produto', O.qty as 'Quantidade', R.orderdate as 'Data_pedido', S.city as 'Cidade'
on P.productid = O.productid 
JOIN Production.Suppliers as S 
on P.supplierid = S.supplierid
join Sales.Orders AS R
ON R.orderid = O.orderid
join Sales.Customers as C
on R.custid = C.custid   
WHERE R.orderdate BETWEEN '2006-07-01' AND '2006-07-31' AND O.qty >=20 AND O.qty <=60 AND (P.productname LIKE 'Product A%' OR P.productname LIKE 'Product G%') AND (S.city = 'Stockholm' OR  S.city = 'Sydney'OR S.city ='Sandvika' OR S.city = ' Ravenna')
ORDER BY HR.Employees.empid desc

