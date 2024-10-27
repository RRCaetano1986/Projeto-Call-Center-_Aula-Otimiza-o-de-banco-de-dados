 /*Tempo Médio de Atendimento por Mês
-- DICA Otimização: Certifique-se de ter um índice na coluna Data_Criacao, pois isso facilitará a agregação por mês e ano--
 
SELECT YEAR(Data_Criacao) AS ano, MONTH(Data_Criacao) AS mes, AVG(Duracao_Atendimento) AS tempo_medio
FROM Fato_Atendimento
GROUP BY ano, mes; 

EXPLAIN SELECT YEAR(Data_Criacao) AS ano, MONTH(Data_Criacao) AS mes, AVG(Duracao_Atendimento) AS tempo_medio
FROM Fato_Atendimento
GROUP BY ano, mes;
--Otimização: Certifique-se de ter um índice na coluna Data_Criacao, pois isso facilitará a agregação por mês e ano--
*/

/*Taxa de Resolução de Chamadas por Setor
DICA Otimização: Um índice na coluna AgenteID de ambas as tabelas (Fato_Atendimento e DIM_Agente) irá melhorar o desempenho dos JOINs.

SELECT d_responsavel.Departamento, 
       SUM(CASE WHEN Resolvido = 1 THEN 1 ELSE 0 END) / COUNT(*) * 100 AS taxa_resolucao
FROM Fato_Atendimento
JOIN DIM_Agente AS d_responsavel ON Fato_Atendimento.AgenteID = d_responsavel.AgenteID
GROUP BY d_responsavel.Departamento;

EXPLAIN SELECT d_responsavel.Departamento, 
       SUM(CASE WHEN Resolvido = 1 THEN 1 ELSE 0 END) / COUNT(*) * 100 AS taxa_resolucao
FROM Fato_Atendimento
JOIN DIM_Agente AS d_responsavel ON Fato_Atendimento.AgenteID = d_responsavel.AgenteID
GROUP BY d_responsavel.Departamento; */

/*Volume de Chamadas por Tipo de Fato 
DICA Otimização: Um índice na coluna CategoriaID de ambas as tabelas ajudará a melhorar o desempenho do JOIN e da agregação.

SELECT d_tipo_fato.Nome_Categoria, COUNT(*) AS total_chamadas
FROM Fato_Atendimento
JOIN DIM_Categoria_Atendimento AS d_tipo_fato ON Fato_Atendimento.CategoriaID = d_tipo_fato.CategoriaID
GROUP BY d_tipo_fato.Nome_Categoria;

EXPLAIN SELECT d_tipo_fato.Nome_Categoria, COUNT(*) AS total_chamadas
FROM Fato_Atendimento
JOIN DIM_Categoria_Atendimento AS d_tipo_fato ON Fato_Atendimento.CategoriaID = d_tipo_fato.CategoriaID
GROUP BY d_tipo_fato.Nome_Categoria;*/

/*Chamadas por Região (Localidade)
DICA Otimização: O índice na coluna ClienteID nas tabelas de fato e dimensão deve ser utilizado para otimizar o JOIN. Também, um índice na coluna Estado pode ajudar.

SELECT d_local.Estado, COUNT(*) AS total_chamadas
FROM Fato_Atendimento
JOIN DIM_Cliente AS d_local ON Fato_Atendimento.ClienteID = d_local.ClienteID
GROUP BY d_local.Estado;

EXPLAIN SELECT d_local.Estado, COUNT(*) AS total_chamadas
FROM Fato_Atendimento
JOIN DIM_Cliente AS d_local ON Fato_Atendimento.ClienteID = d_local.ClienteID
GROUP BY d_local.Estado; */

/*Análise Sazonal: Volume de Chamadas por Dia da Semana

DICA Otimização: Um índice na coluna TempoID em ambas as tabelas ajudará a otimizar o JOIN, e um índice em Dia_Semana também pode ser útil.

SELECT d_tempo.Dia_Semana, COUNT(*) AS total_chamadas
FROM Fato_Atendimento
JOIN DIM_Tempo AS d_tempo ON Fato_Atendimento.TempoID = d_tempo.TempoID
GROUP BY d_tempo.Dia_Semana;

EXPLAIN SELECT d_tempo.Dia_Semana, COUNT(*) AS total_chamadas
FROM Fato_Atendimento
JOIN DIM_Tempo AS d_tempo ON Fato_Atendimento.TempoID = d_tempo.TempoID
GROUP BY d_tempo.Dia_Semana;*/

