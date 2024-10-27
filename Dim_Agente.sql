/* Gerando procedure para alimentar tabela agente incluindo 200 registros
DELIMITER //
CREATE PROCEDURE Popula_DIM_Agente()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 200 DO
        INSERT INTO DIM_Agente (
            Nome,
            CPF,
            Data_Contratacao,
            Departamento,
            Turno,
            SupervisorID,
            Telefone,
            Email,
            Data_Criacao,
            Data_Alteracao,
            Usuario_Criacao,
            Usuario_Alteracao,
            Ativo,
            Data_Inicio_Vigencia,
            Data_Fim_Vigencia
        )
        VALUES (
            CONCAT('Agente_', i),
            -- Gerar CPF aleatório com 11 dígitos
            CONCAT(
                LPAD(FLOOR(RAND() * 99999999999), 11, '0')
            ),
            -- Data de contratação aleatória entre 01/01/2020 e 31/12/2022
            DATE_ADD('2020-01-01', INTERVAL FLOOR(RAND() * 1095) DAY),
            -- Departamento aleatório
            ELT(FLOOR(1 + RAND() * 5), 'Atendimento', 'Suporte', 'Recursos Humanos', 'TI', 'Vendas'),
            -- Turno aleatório
            ELT(FLOOR(1 + RAND() * 3), 'Manhã', 'Tarde', 'Noite'),
            -- SupervisorID aleatório ou NULL
            IF(RAND() < 0.8, FLOOR(1 + RAND() * 50), NULL),
            -- Telefone aleatório no formato brasileiro
            CONCAT(
                LPAD(FLOOR(RAND() * 99) + 10, 2, '0'),
                LPAD(FLOOR(RAND() * 99999), 5, '0'),
                LPAD(FLOOR(RAND() * 9999), 4, '0')
            ),
            -- Email baseado no número do agente
            CONCAT('agente', i, '@empresa.com'),
            -- Data_Criacao aleatória entre 01/06/2022 e 01/06/2024
            DATE_ADD('2022-06-01', INTERVAL FLOOR(RAND() * 730) DAY),
            -- Data_Alteracao aleatória entre Data_Criacao e 01/06/2024
            DATE_ADD('2022-06-01', INTERVAL FLOOR(RAND() * 730) DAY),
            -- Usuario_Criacao aleatório
            ELT(FLOOR(1 + RAND() * 3), 'admin', 'sistema', 'suporte'),
            -- Usuario_Alteracao aleatório
            ELT(FLOOR(1 + RAND() * 3), 'admin', 'sistema', 'suporte'),
            -- Ativo com 90% de chance de ser TRUE
            IF(RAND() < 0.9, TRUE, FALSE),
            -- Data_Inicio_Vigencia aleatória entre 01/06/2022 e 01/06/2024
            DATE_ADD('2022-06-01', INTERVAL FLOOR(RAND() * 730) DAY),
            -- Data_Fim_Vigencia como NULL ou data aleatória
            IF(RAND() < 0.1, DATE_ADD('2022-06-01', INTERVAL FLOOR(RAND() * 730) DAY), NULL)
        );
        SET i = i + 1;
    END WHILE;
END
//

DELIMITER ;*/

/* Populando a tabela agente
CALL Popula_DIM_Agente();*/

/*Contando os registros
SELECT COUNT(*) AS TotalRegistros FROM DIM_Agente;*/
