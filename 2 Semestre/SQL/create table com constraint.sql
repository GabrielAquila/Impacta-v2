--1. As colunas IDs são todas auto-numeradas, iniciando com 1 e de incremento 1, com
--exceção da tabela mês que iniciará no número 15 com incremento 3. Todas as colunas
--deverão possuir os menores tipos de dados possíveis para:
--Tabelas AnoFabricacao, modelo, mês e fabricante não passarão de 200 registros
--Tabelas Veículo e Vendas anuais não ultrapassarão 10.000 registros

--2. Colunas de texto Nome, Descrição, Contato e Cidade serão obrigatórias, variáveis
--armazenando até 50 bytes, endereço variável até 100 bytes, telefone variável de 20 bytes e
--UF fixa com 2 bytes.

--3. Os atributos Ano e Mes serão numéricos, obrigatórios, com tipos apropriados para seus
--armazenamentos convencionais.

--4. Campo Valor, obrigatório, terá duas casas decimais chegando a casa dos R$ 200.000,00 e
--qtd, obrigatório, inteiro de 1 e 5.000

--5. O atributo DataCompra, tem precisão de dia e é obrigatório.

--6. Construa todas as constraints Primary Key e Foreign Key conforme indicação no modelo.


create TABLE Ano
(
IdAno smallint IDENTITY (1,1)
,Ano smallint not null


CONSTRAINT pkAno PRIMARY key(IdAno)

);
select * from Ano
----------------------------------
create TABLE Mes
(
IdMes TINYINT IDENTITY (15,     3)
,mes TINYINT not null


CONSTRAINT pkMes PRIMARY key(IdMes)

);
select * from Mes
---------------------------
create TABLE Modelo
(
IdModelo TINYINT IDENTITY (1,1)
,Descrição varchar(50) not null


CONSTRAINT pkModelo PRIMARY key(IdModelo)

);
select * from Modelo
--------------------------------
create table Fabricante 
(
IdFabricante tinyint IDENTITY (1,1)
,Nome varchar(50) not null
,Cidade varchar(50) not null 
,Endereço varchar(100) not null
,UF char(2) 
,Telefone varchar(20) 
,Contato varchar(50) not null

CONSTRAINT pkFabricante PRIMARY key(IdFabricante)

);

select * from Fabricante
--------------------------------------------------
create table VendasAnuais
(
IdVendas SMALLINT IDENTITY(1, 1)
,qtd SMALLINT NOT NULL 
,IdAnodaVenda smallint not null
,IdMesdaVenda smallint not null
,IdVeiculo SmallInt not null


CONSTRAINT pkVendasAnuais PRIMARY key(IdVendas),
CONSTRAINT fkAno_VendasAnuais FOREIGN KEY (IdAnodaVenda)
REFERENCES Ano(IdAno), 
CONSTRAINT fkMes_VendasAnuais FOREIGN KEY (IdMesdaVenda)
REFERENCES Mes(IdMes),
CONSTRAINT fkVeiculo_VendasAnuais FOREIGN KEY (IdVeiculo)
REFERENCES Veiculo(IdVeiculo)

);
select * from VendasAnuais
-----------------------------------------------------
CREATE table Veiculo
(
Idveiculo SMALLINT IDENTITY(1, 1)
,descricao varchar(50) not null
,valor decimal not null
,IdModelo TINYINT 
,IdFabricante  TINYINT 
,IdAnoFabricante TINYINT 
,DataCompra DATE not null

CONSTRAINT pkIdVeiculo PRIMARY key(IdVeiculo),
CONSTRAINT fkModelo_Veiculo FOREIGN KEY (IdModelo)
REFERENCES Modelo(IdModelo), 
CONSTRAINT fkFabricante_Veiculo FOREIGN KEY (IdFabricante)
REFERENCES Fabricante(IdFabricante),
CONSTRAINT fkAno_Veiculo FOREIGN KEY (IdAnoFabricante)
REFERENCES Ano(IdAno),

);

