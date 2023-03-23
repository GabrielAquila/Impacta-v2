
sp_help funcionario
/*Exercicio 
Retorne o resultado exato de 5 ÷ 2   
*/

select 5.0 / 2

/*Exercicio 
Faça o seguinte cálculo 200 + ((500 ÷ 20) x 10,5) 
*/

select 200 + ((500 / 20) * 10.5) 

/*Exercicio 
Retorne Nome e Email dos 100 primeiros registros
*/
--como seleciono a coluna desejada com o comando top 100 ?
select top 100 nome, email  from funcionario

/*Exercicio 
Traga o nome e sobrenome, concatenados em uma única coluna com o apelido Nome
Completo
*/

SELECT (nome + ' ' + sobrenome) AS Nome_Completo 
FROM funcionario

/*Exercicio 
Traga a matricula, nome, sobrenome, salario, bonus e campo calculado salario + Bonus
com o apelido Salário Total
*/

select nome, sobrenome, salario, bonus, (salario + bonus) as [Salario Total]
from funcionario 

/*Exercicio 
Liste os cargos distintos
*/

Select DISTINCT cargo from funcionario 

/*Exercicio 
Liste o nome, cargo, salario e o campo calculado com acréscimo de 7% do salário com o
apelido de Salário Dissídio
*/

--o uso do round (retorna números arredondado para um determinado número de casas decimais)foi testado porem sem sucesso
select nome, cargo, salario, (salario * 1.07) as [Salario Dissidio]
from funcionario 
