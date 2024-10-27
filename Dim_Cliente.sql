/* Gerando procedure para alimentar tabela cliente
use projetocallcenter;
DELIMITER //

CREATE PROCEDURE Popula_DIM_Cliente(IN quantidade INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    
    WHILE i <= quantidade DO
        INSERT INTO DIM_Cliente (
            Nome,
            CPF_CNPJ,
            DataNascimento,
            Sexo,
            Endereco,
            Estado,
            Cidade,
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
            CONCAT('Cliente_', i), -- Nome fictício
            CONCAT(LPAD(FLOOR(RAND() * 99999999999), 11, '0')), -- CPF/CNPJ fictício
            DATE_ADD('1970-01-01', INTERVAL FLOOR(RAND() * 20000) DAY), -- Data de nascimento aleatória
            IF(RAND() > 0.5, 'Masculino', 'Feminino'), -- Sexo aleatório
            CONCAT('Rua ', CHAR(65 + FLOOR(RAND() * 26)), ', ', FLOOR(RAND() * 1000)), -- Endereço fictício
            IF(RAND() > 0.5, 'SP', 'RJ'), -- Estado fictício
            IF(RAND() > 0.5, 'São Paulo', 'Rio de Janeiro'), -- Cidade fictícia
            CONCAT('11', LPAD(FLOOR(RAND() * 99999999), 8, '0')), -- Telefone fictício
            CONCAT('cliente_', i, '@email.com'), -- Email fictício
            DATE_ADD('2022-06-01', INTERVAL FLOOR(RAND() * 730) DAY), -- Data de criação aleatória nos 2 anos
            DATE_ADD('2022-06-01', INTERVAL FLOOR(RAND() * 730) DAY), -- Data de alteração aleatória nos 2 anos
            'admin', -- Usuário criação
            'admin', -- Usuário alteração
            TRUE, -- Ativo
            DATE_ADD('2022-06-01', INTERVAL FLOOR(RAND() * 730) DAY), -- Data de início de vigência
            NULL -- Data de fim de vigência
        );

        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;*/

/* Populando a tabela cliente
CALL Popula_DIM_Cliente(5000);*/
