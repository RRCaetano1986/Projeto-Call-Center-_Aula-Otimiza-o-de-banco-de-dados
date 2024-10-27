/*definindo variáveis para armazenar os valores máximos dos IDs de cada tabela de dimensão
SET @max_cliente_id = (SELECT MAX(ClienteID) FROM DIM_Cliente);
SET @max_agente_id = (SELECT MAX(AgenteID) FROM DIM_Agente);
SET @max_tempo_id = (SELECT MAX(TempoID) FROM DIM_Tempo);
SET @max_canal_id = (SELECT MAX(CanalID) FROM DIM_Canal_Atendimento);
SET @max_categoria_id = (SELECT MAX(CategoriaID) FROM DIM_Categoria_Atendimento);*/

/*Inserindo dados na tabela Fato_Atendimento
DELIMITER //
CREATE PROCEDURE Popula_Fato_Atendimento(IN registros INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    
    -- Loop para inserir o número de registros especificados
    WHILE i <= registros DO
        INSERT INTO Fato_Atendimento (
            ClienteID,
            AgenteID,
            TempoID,
            CanalID,
            CategoriaID,
            Duracao_Atendimento,
            Nivel_Satisfacao,
            Resolvido,
            Tempo_Espera,
            Numero_Chamadas,
            Primeiro_Atendimento,
            Data_Criacao,
            Data_Alteracao,
            Usuario_Criacao,
            Usuario_Alteracao
        )
        VALUES (
            -- ClienteID aleatório
            (SELECT ClienteID FROM DIM_Cliente ORDER BY RAND() LIMIT 1),
            -- AgenteID aleatório
            (SELECT AgenteID FROM DIM_Agente ORDER BY RAND() LIMIT 1),
            -- TempoID aleatório
            (SELECT TempoID FROM DIM_Tempo ORDER BY RAND() LIMIT 1),
            -- CanalID aleatório
            (SELECT CanalID FROM DIM_Canal_Atendimento ORDER BY RAND() LIMIT 1),
            -- CategoriaID aleatório
            (SELECT CategoriaID FROM DIM_Categoria_Atendimento ORDER BY RAND() LIMIT 1),
            -- Duração de Atendimento (número aleatório entre 5 e 120 minutos)
            FLOOR(RAND() * 116 + 5),
            -- Nível de Satisfação (número aleatório entre 1 e 5)
            FLOOR(RAND() * 5 + 1),
            -- Resolvido (TRUE ou FALSE, 80% de chance de ser TRUE)
            IF(RAND() < 0.8, TRUE, FALSE),
            -- Tempo de Espera (número aleatório entre 1 e 20 minutos)
            FLOOR(RAND() * 20 + 1),
            -- Número de Chamadas (número aleatório entre 1 e 5)
            FLOOR(RAND() * 5 + 1),
            -- Primeiro Atendimento (TRUE ou FALSE, 70% de chance de ser TRUE)
            IF(RAND() < 0.7, TRUE, FALSE),
            NOW(), -- Data_Criacao
            NOW(), -- Data_Alteracao
            'admin', -- Usuario_Criacao
            'admin'  -- Usuario_Alteracao
        );
        
        SET i = i + 1;  -- Incrementa o contador
    END WHILE;
END//
DELIMITER ;
*/

/*Populando a tabela Fato_Atendimento
CALL Popula_Fato_Atendimento(1000);*/

/*Verificando tempo de execução da inserção dos dados
SHOW VARIABLES LIKE 'wait_timeout';*/

/*Aumentando o valor do wait_timeout e max_allowed_packet
SET GLOBAL wait_timeout = 28800;  -- 8 horas
SET GLOBAL max_allowed_packet = 1073741824;  -- 1 GB */

/*Contando os registros 
SELECT COUNT(*) FROM Fato_Atendimento;*/

/*Tabela fato com mais de 24 mil registros
Select * from fato_atendimento;*/
