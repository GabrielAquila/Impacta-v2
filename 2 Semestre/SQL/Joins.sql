-- 1. Crie o modelo acima com as seguintes características:
-- • Assuma que as tabelas terão somente 10 cores, 50 produtos e 20 fornecedores
-- • Colunas Ids serão primary keys e devem ser auto-numeradas
-- • Coluna descontinuado possui apenas valores 0 e 1. Já estoque, poderemos ter até
-- 5.000 unidades
-- • Colunas de nome e de descrição terão até 50 caracteres, já a coluna de código
-- terá exatos 6 caracteres
-- • Crie todas as chaves primárias, estrangeiras e chaves únicas para qualquer coluna
-- de descrição, de nome e de código do produto
create table  produto_ga (
Idproduto           tinyint IDENTITY(1, 1)
check (Idproduto BETWEEN 1 and 50)
,codigo              char (6)
,nome                varchar(50)
,estoque             smallint
,descontinuado       bit not null 
,Idfornecedor    tinyint 
,Idcor             tinyint 

CONSTRAINT pkproduto_ga PRIMARY key(Idproduto),
CONSTRAINT fkIdfornecedor_ga_idproduto_ga  FOREIGN KEY (idFornecedor)
REFERENCES fornecedor_ga(idfornecedor), 
CONSTRAINT fkidCor_produto_ga FOREIGN KEY (Idcor)
REFERENCES cor_ga(Idcor)
)
go
create table fornecedor_ga(
Idfornecedor tinyint IDENTITY (1,1)
check (Idfornecedor >= 1 and Idfornecedor <= 20)
,nome       varchar (50)
,telefone   char(9)
,contato   varchar(20)

CONSTRAINT pkfornecedor_ga PRIMARY key(Idfornecedor)
)
go
create table cor_ga(
Idcor       tinyint IDENTITY (1,1)
check (Idcor BETWEEN 1 and 10)
,descricao      varchar(50)

CONSTRAINT pkcor_ga PRIMARY key(Idcor)
)
go
sp_help cor_ga

-- 2. Preencha as informações exatamente como estão acima.
INSERT INTO produto_ga(codigo, nome, estoque, descontinuado, Idfornecedor, Idcor)
VALUES ('XT890A', 'Asus Zenfone', 5, 0, 3, 4), ('RQ765B', 'iPhone', 0, 1, 4, 4), ('WD528B','Moto x', 3, 0, 2, 5), ('TF79A','Xperia',7, 1, 1, 1), ('RF212B', 'Moto maxx',2,0,2,1)
select * from produto_ga

INSERT INTO fornecedor_ga(nome, telefone, contato)
VALUES ('Sony', '8498-8732', 'Allan'),('Motorola', '7987-9900', 'Cristina'), ('Asus', '5476-1120', 'Felipe'), ('Nokia', '6755-5656', 'Fabio'), ('Moto x', '6755-5656', 'Fabio')
select * from fornecedor_ga


INSERT INTO cor_ga(descricao)
VALUES ('Branco'),('Preto'),('Azul'),('Vermelho'),('Amarelo')
select * from cor_ga
-- 3. Repita as inserções dos mesmos produtos, variando as cores e estoque, de forma que
-- tenhamos ao menos 15 produtos no final das inserções

INSERT INTO produto_ga(idproduto, codigo, nome, estoque, descontinuado, Idfornecedor, Idcor)
VALUES ('XT890A', 'Asus Zenfone', 5, 0, 3, 4), ('RQ765B', 'iPhone', 0, 1, 9, 4), ('WD528B','Moto x', 3, 0, 2, 5), ('TF79A','Xperia',7, 1, 1, 1), ('RF212B', 'Moto maxx',2,0,2,1)
--select * from produto 

INSERT INTO fornecedor_ga(idfornecedor, nome, telefone, contato)
VALUES ('Sony', '8498-8732', 'Allan'),('Motorola', '7987-9900', 'Cristina'), ('Asus', '5476-1120', 'Felipe'), ('Nokia', '6755-5656', 'Fabio'), ('Moto x', '6755-5656', 'Fabio')
--select * from fornecedor

INSERT INTO cor_ga(idCor,descricao)
VALUES ('Azul'),('Verde'),('Amarelo'),('Pink'),('Roxo')
select * from cor


-- 4. Traga o código do produto, nome do produto, nome do fornecedor, estoque para todos
-- os produtos onde forem encontrado relação. Coloque nomes de colunas apropriados o
-- correto entendimento da informação.
select P.codigo,P.nome as 'nome_produto', P.estoque, 
F.nome as 'nome_fornecedor' 
from Fornecedor_ga as F JOIN  Produto_ga as P 
            on P.idFornecedor = F.idFornecedor
-- 5. Baseado na Query 4, retorne as mesmas informações para produtos descontinuados.
select P.codigo,P.descontinuado, P.nome as 'nome_produto', P.estoque, 
F.nome as 'nome_fornecedor' 
from Fornecedor as F  JOIN  Produto as P 
            on P.idFornecedor = F.idFornecedor
-- 6. Baseado na Query 4, retorne as mesmas informações para produtos com estoque entre
-- 7 e 21 unidades, que ainda tenham produção.
select P.codigo,P.descontinuado, P.nome as 'nome_produto', P.estoque, 
F.nome as 'nome_fornecedor' 
from Fornecedor as F JOIN  Produto as P 
            on P.idFornecedor = F.idFornecedor
            where P.estoque >= 7 and P.estoque <= 21
            
-- 7. Adicione a Query 4 o nome da cor de cada produto.
select P.codigo,P.descontinuado, P.nome as 'nome_produto', P.estoque, 
F.nome as 'nome_fornecedor',
C.descricao
from Fornecedor as F JOIN  Produto as P 
            on P.idFornecedor = F.idFornecedor
            join Cor as C
            on P.idcor = C.idcor


-- 8. Baseado na Query 7, traga apenas produtos de cores BRANCO, PRETO ou VERMELHO
-- (utilize a coluna Descrição e não idCor)
select P.codigo,P.descontinuado, P.nome as 'nome_produto', P.estoque, 
F.nome as 'nome_fornecedor',
C.descricao
from Fornecedor as F  JOIN  Produto as P 
            on P.idFornecedor = F.idFornecedor
            right  join Cor as C
            on P.idcor = C.idcor
            where C.descricao = 'Branco' or C.descricao = 'vermelho' or C.descricao = 'Preto' 
select * from Cor 

-- 9. vtraga qualquer produtos onde a cor não seja AZUL (utilize a coluna Descrição e não
-- idCor)
select P.codigo,P.descontinuado, P.nome as 'nome_produto', P.estoque, 
F.nome as 'nome_fornecedor',
C.descricao
from Fornecedor as F  JOIN  Produto as P 
            on P.idFornecedor = F.idFornecedor
            right  join Cor as C
            on P.idcor = C.idcor
            where C.descricao <> 'Azul'


-- 10. Baseado na Query 7, adicione a coluna contato do fornecedor e retorne apenas
-- contatos que iniciem pela letra F.
select P.codigo,P.descontinuado, P.nome as 'nome_produto', P.estoque, 
F.nome as 'nome_fornecedor', F.contato,
C.descricao
from Fornecedor as F  JOIN  Produto as P 
            on P.idFornecedor = F.idFornecedor
            join Cor as C
            on P.idcor = C.idcor
            where F.contato like '%f%'

-- 11. Baseado na Query 10, adicione a coluna telefone do fornecedor e retorne apenas
-- contatos que terminem com dígito 0.
select P.codigo,P.descontinuado, P.nome as 'nome_produto', P.estoque, 
F.nome as 'nome_fornecedor', F.contato, F.telefone,
C.descricao
from Fornecedor as F JOIN  Produto as P 
            on P.idFornecedor = F.idFornecedor
            join Cor as C
            on P.idcor = C.idcor
            where F.telefone like '%0'