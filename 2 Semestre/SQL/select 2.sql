--1. Construa duas consultas que retornem o Número do Produto (productid), Nome (productname) e Preço
--(unitprice) onde os preços estejam entre 19 e 22. Construir a 1a. consulta, utilizando o operador AND.
--Na 2a. Consulta, que deverá retornar exatamente as mesmas colunas e linhas, utilizar o predicado BETWEEN.
--(tabela Production.Products)
select productid, productname, unitprice
from Production.Products 
where unitprice BETWEEN 19 and 22
--where unitprice  >='19' and  unitprice <='22'-(segunda possibilidade)-


--2. Construa duas consultas que retornem o Número do Produto (productid), Nome (productname) e Preço
--(unitprice) onde os preços sejam quaisquer um a seguir: 18 ou 10 ou 21,35. A 1a. consulta, utilizar o operador
--OR. Na 2a. Consulta, que deverá retornar exatamente as mesmas colunas e linhas, utilizar o predicado IN.
select productid, productname, unitprice 
from Production.Products 
where unitprice IN (18, 10, 21.35)
--where unitprice = 18 or unitprice =10 or unitprice = 21.35-(segunda possibilidade)-
 

--3. Retorne o Número do Empregado (empid), Título (titleofcourtesy), a Data de Nascimento (birthdate) e
--concatenar as colunas nome (firstname) e sobrenome (lastname) em apenas uma coluna apelidada de Nome
--Completo, apenas para os empregados que nasceram em qualquer dia e mês desde 1947 até 1965. (tabela
--HR.Employees)
select empid, titleofcourtesy, birthdate, (firstname + ' ' + lastname) as Nome_Completo
from HR.Employees
where birthdate BETWEEN '19470101' and '19651231'

--4. Retorne a Cidade (city), Região (region) e País (country) dos empregados da cidade de Seattle ou do país UK.
select city, region, country
from HR.Employees
where city = 'Seattle' or country = 'UK'


--5. Retorne o Número do Empregado (empid), Nome (firstname) e Data de Contratação (hiredate) dos
--empregados contratados em qualquer dia e mês de 2002 ou de 2004.

select empid, firstname, hiredate
from HR.Employees
where hiredate BETWEEN '20020101' and '20021231' or hiredate BETWEEN '20040101' and '20041231'

--6. Retorne todas as colunas dos últimos 20 registros de Clientes (tabela Sales.Customers), ou seja, do
--maior Número do Cliente (custid) para o menor.
select *
from Sales.Customers
where custid BETWEEN 1 and 20
ORDER by custid desc;


--7. Primeiramente faça uma query para visualizar os países distintos existentes na tabela anterior. Agora
--construa uma consulta que retorne o Número do Cliente (custid), o Nome do Contato (contactname),
--Cidade (city) e País (country), apenas para os clientes da América do Sul, lembrando que apenas pelo
--campo País conseguiremos essa filtragem. Ordene pelo País.

--select DISTINCT country--
select custid, contactname, city, country
from Sales.Customers
where country in('Argentina', 'Brazil', 'Venezuela') --como fazer para simplificar meu where?--


--8. Retorne o Número do Cliente (custid), o Nome do Contato (contactname) e o Fax onde esta última
--coluna NÃO seja NULL. Ordene do maior Número do Cliente ao menor.
select custid, contactname, Fax
from Sales.Customers  
where Fax IS NOT NULL 
ORDER BY custid DESC;

--9. Retorne o Número do Cliente (custid), Cidade (city) e o País (country) onde a Região (region) seja
--NULL. Ordene de forma ascendente para o País e descendente para a Cidade.
SELECT custid, city, country, region
FROM Sales.Customers
WHERE region IS NULL
ORDER BY country , city DESC;


select*
from 