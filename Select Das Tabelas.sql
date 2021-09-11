/* Mostra o  Nome Do Docente Através De uma busca entre os docentes então é comparado com o nome do docente desejado*/
Select 
Nome_Docente
FROM Docente
WHERE NOME_Docente ='Bento Luiz';


/*Mostra  A Lista De Docentes Cadastrados Ordenando os docentes por nome */
Select 
Nome_Docente
From Docente
Order By Nome_Docente;

/*Mostra A Area De Afinadade Do Docente*/
Select 
Nome_Docente,
Nome_Area,
Categoria_Area
From Area_Conhecimento
Inner Join Docente On id_Docente = fk_Docente_id_Docente;


/*Mostra Os Artigos Publicados uma Ordem De Relevancia */
Select
Relevancia_Categoria,
Nome_Artigo,
Tipo_Artigo,
Data_Publicacao
From Categoria
Inner Join Artigo On id_categoria = Id_Artigo
order By Relevancia_Categoria;


/*Mostra OS Artigos Publicados De Acordo Com uma Categoria Pré Definida*/  
Select 
Nome_Artigo,
Tipo_Artigo,
Data_Publicacao
From Categoria
Inner Join Artigo On id_categoria = Id_Artigo
where nome_categoria = 'Tecnologia';


   
/* Calcula O tempo Que um Docente Esta Em uma Empresa, Porém não considera o Caso Dele Ainda Estar Na Empresaa
Esse Select Considera o Caso Do Docente Ter Saido da Instituição Em uma Data Anterior a Data Atual*/
SELECT
nome_docente,
titulacao_docente,
TRUNC (MONTHS_BETWEEN(data_Saida,data_Entrada)/12) AS ANOS,
TRUNC ((MONTHS_BETWEEN(data_Saida,data_Entrada)) - (TRUNC(MONTHS_BETWEEN(data_Saida,data_Entrada)/12)*12)) AS MESES
from datas_posses
INNER JOIN DOCENTE ON ID_DATA = id_docente;

/* Calcula o tempo de um docente em uma empresa Mesmo que ele ainda esteja prestando Serviços nessa empresa*/
SELECT
nome_docente,
titulacao_docente,
TRUNC (MONTHS_BETWEEN('14/06/21',data_Entrada)/12) AS ANOS,
TRUNC ((MONTHS_BETWEEN('14/06/21',data_Entrada)) - (TRUNC(MONTHS_BETWEEN('14/06/21',data_Entrada)/12)*12)) AS MESES
from datas_posses
INNER JOIN DOCENTE ON ID_DATA = id_docente
where nome_Docente = 'Luiz Gonçalves';


/*Apresenta o nome do docente e sua titulação e a rede social que esta vinculada a ele*/
Select 
  Nome_Docente,
  Endereco_midia,
  Titulacao_Docente
  From Docente
  Inner Join midias_sociais on  Id_Docente = fk_Docente_Id_Docente
  Where Nome_Docente = 'Bento Luiz';
  
/*Mostra A Data De quando o Docente tentou se conectar-se na DigiPAper mostrnado o ip do docente conectado 
e o Status Da Entrado Do Docente*/
select
nome_docente,
Data_Login,
ip_login,
status_login
from docente
inner join Atividades on id_docente = fk_docente_id_docente
inner join login on id_login = fk_login_id_login
Where Nome_Docente = 'Antonio Carlos';

/*Mostra O Numero De Artigos Publicados Por um Docente*/
select 
nome_docente, 
count(nome_docente) as "Numero de Artigos"
from docente
inner join "PUBLICAÇÃO" on id_docente = fk_Docente_Id
where  fk_Docente_Id = 2
group by nome_docente;

/*Mostra o Total De Artigos Publicados*/
select count (id_Artigo) as "total de artigos"
from Artigo;

/*Mostra O Total De Congressos E Revista Que Um Docente Participou*/
SELECT
NOME_DOCENTE,
TITULACAO_DOCENTE,
CONGRESSO_NACIONAL ,
CONGRESSO_INTERNACIONAL ,
REVISTAS_NACIONAIS,
REVISTAS_INTERNACIONAIS
FROM Docente
INNER JOIN leciona_congressos_revista ON id_docente = fk_Docente_Id_Docente





   
   
