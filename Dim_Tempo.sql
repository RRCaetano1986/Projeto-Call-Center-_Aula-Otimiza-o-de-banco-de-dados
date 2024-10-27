/*Inserir 730 dias (2 anos) 
use projetocallcenter;
SET @startDate = '2022-06-01'; 
SET @endDate = '2024-06-01'; */

 /*Criando procedure para preencher a tabela tempo 
use projetocallcenter;
DELIMITER //
CREATE PROCEDURE Popula_DIM_Tempo(IN data_inicio DATE, IN data_fim DATE)
BEGIN
    DECLARE data_atual DATE;

    -- Inicializa a data_atual com a data de início fornecida
    SET data_atual = data_inicio;

    -- Loop para inserir cada data no intervalo fornecido
    WHILE data_atual <= data_fim DO
        INSERT INTO DIM_Tempo (
            Data,
            Dia_Semana,
            Dia,
            Mes,
            Numero_Mes,
            Ano,
            Bimestre,
            Trimestre,
            Semestre
        ) 
        VALUES (
            data_atual,
            DAYNAME(data_atual), -- Nome do dia da semana (Segunda, Terça, etc.)
            DAY(data_atual),     -- Dia do mês
            MONTHNAME(data_atual), -- Nome do mês (Janeiro, Fevereiro, etc.)
            MONTH(data_atual),   -- Número do mês
            YEAR(data_atual),    -- Ano
            (MONTH(data_atual) + 1) DIV 2, -- Cálculo do bimestre
            (MONTH(data_atual) + 2) DIV 3, -- Cálculo do trimestre
            (MONTH(data_atual) + 5) DIV 6  -- Cálculo do semestre
        );

        -- Incrementa a data em um dia
        SET data_atual = DATE_ADD(data_atual, INTERVAL 1 DAY);
    END WHILE;
END //

DELIMITER ;
*/

/*Chamando o procedimento para preencher a tabela
CALL Popula_DIM_Tempo('2022-06-01', '2024-06-01');*/

/*Selecionando dados da tabela dim_tempo 
SELECT * FROM DIM_Tempo WHERE Data BETWEEN '2022-06-01' AND '2024-06-01';*/

