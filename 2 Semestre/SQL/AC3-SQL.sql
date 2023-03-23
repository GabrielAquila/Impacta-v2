-- Gabriel aquila  RA:2101991
-- Rafael oliveira RA:2102667
-- frank RA:2102941

-- CRIAÇÃO DE TABELAS --

create table professor(
idProfessor TINYINT IDENTITY(1,1)
,ra int not NULL
,nome varchar(15) not NULL
,sobrenome varchar(30) not null
CONSTRAINT PKidProfessor primary key (idProfessor)
)
go

create table disciplina(
idDisciplina tinyint identity(1,1)
,nome varchar(50)
,curso varchar(50)
,idProfessor tinyint not null
,tempoDisciplina char(5)
CONSTRAINT pkidDisciplina PRIMARY key (idDisciplina)
,CONSTRAINT fkidprofessor foreign key (idProfessor) REFERENCES professor(idProfessor)
)
go

create table aluno (
idAluno int identity (1,1),
ra int not null,
nome varchar(15),
sobrenome varchar(30),
idDisciplina tinyint not null,  
CONSTRAINT PKidAluno primary key (idAluno),
CONSTRAINT FKidDisciplina foreign key (idDisciplina) references disciplina(idDisciplina)
)
go

create table controlePresenca (
idAluno int not null,    
dataAula date not null,   
presenca char(3) not null,
CONSTRAINT FKidAluno foreign key (idAluno) references aluno(idAluno)
)
go

-- inserção de dados 

insert into professor(ra, nome, sobrenome)
values('2102663','ricardo','silva'),
('5656965','Rafael','Oliveira'),
('7894563','Marina','Souza'),
('6492152','josué','Magal'),
('1345679','lumy','Bushiquen'),
('7854126','Mateus','Limeira'),
('5741236','Edivaldo','Perreira')
go
insert into disciplina(nome, curso, idProfessor, tempoDisciplina)
values('Matematica', 'Sistemas da informação',1 ,'80h'),
('fundamentos de python', 'Ciência da informação',2,'40h'),
('Banco de dados', 'Análise e desenvolvimento de software',3,'30h'),
('contabilidade', 'Administração',4,'65h'),
('SQL inject', 'segurança web',5,'160h'),
('Programacao', 'Sistemas da informação',1 ,'50h'),
('Leis Trabalhista', 'Advogacia',6,'40h'),
('Linguaguem SQL','Análise e desenvolvimento de software',3,'30h'),
('Matematica contaveis', 'Administração',4,'12h'),
('DDOS', 'segurança web',5,'160h'),
('Fisica Quantica', 'Fisica',7,'170h')
go
insert into aluno(ra, nome, sobrenome , idDisciplina)  
values ('214171', 'Josue', 'Santos', 2),               
('215748', 'Matheus', 'Andrade', 1),                   
('216335', 'Gabriel', 'Aquila', 1),					  
('219264', 'Joao', 'Medeiros', 3),
('218742', 'Sabrina', 'Ortiz', 4),
('210295', 'Ananias', 'Silva', 5),
('213194', 'Lucas', 'Crepalde', 6),
('216669', 'Jair', 'Bolsonaro', 7),
('213197', 'Pedro', 'Alibert', 11),
('215478', 'Paulo', 'Rodrigues', 10),
('216335', 'Gabriel', 'Aquila', 10),
('216335', 'Gabriel', 'Aquila', 7)   				  
go													  

insert into controlePresenca(idAluno, dataAula, presenca )  
values (1, '2022-01-22', 'sim'),
(2,'2022-01-23', 'nao'),
(3, '2022-01-23', 'sim'),
(4, '2022-01-18', 'nao'),
(5, '2022-01-13', 'sim'),      
(6, '2022-01-14', 'sim'),      
(7, '2022-01-30', 'sim'),
(8, '2022-01-29', 'nao'),
(9, '2022-01-12', 'sim'),
(10, '2022-01-16', 'sim'),
(11, '2022-01-19', 'nao'),
(3, '2022-01-16', 'sim')
go

------- join de todas as colunas e todas as tabelas:  ------

select P.ra as 'RA do professor', (P.nome + ' ' + P.sobrenome) as 'Nome completo do professor',
D.nome as 'Nome da disciplina',D.curso as 'Curso', D.tempoDisciplina as 'carga horária da disciplina',
A.ra as 'RA do aluno', (A.nome + ' ' + A.sobrenome) as 'Nome completo do aluno',
CP.dataAula as 'Dia da aula', CP.presenca as 'Presente'

from aluno as A join disciplina as D on A.idDisciplina = D.idDisciplina
join controlePresenca as CP  on A.idAluno = CP.idAluno
join professor as P on P.idProfessor = D.idProfessor
go

--------- join para leigos ----------

-- select A.ra as 'RA', (A.nome + ' ' + A.sobrenome) as 'Nome completo do aluno',
-- D.nome as 'Nome da disciplina', D.curso as 'Curso', D.tempoDisciplina as 'carga horária da disciplina',  (P.nome + ' ' + P.sobrenome) as 'Professor',
-- CP.dataAula as 'Dia da aula', CP.presenca as 'Presente'
-- from aluno as A join disciplina as D on A.idDisciplina = D.idDisciplina
-- join controlePresenca as CP  on A.idAluno = CP.idAluno
-- join professor as P on P.idProfessor = D.idProfessor
-- go
