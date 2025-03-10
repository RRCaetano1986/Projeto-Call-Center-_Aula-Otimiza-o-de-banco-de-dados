-- MySQL Script generated by MySQL Workbench
-- Sat Sep 21 18:28:31 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema projetocallcenter
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema projetocallcenter
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `projetocallcenter` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `projetocallcenter` ;

-- -----------------------------------------------------
-- Table `projetocallcenter`.`dim_agente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetocallcenter`.`dim_agente` (
  `AgenteID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(255) NULL DEFAULT NULL,
  `CPF` VARCHAR(20) NULL DEFAULT NULL,
  `Data_Contratacao` DATE NULL DEFAULT NULL,
  `Departamento` VARCHAR(100) NULL DEFAULT NULL,
  `Turno` VARCHAR(50) NULL DEFAULT NULL,
  `SupervisorID` INT NULL DEFAULT NULL,
  `Telefone` VARCHAR(20) NULL DEFAULT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  `Data_Criacao` DATETIME NULL DEFAULT NULL,
  `Data_Alteracao` DATETIME NULL DEFAULT NULL,
  `Usuario_Criacao` VARCHAR(255) NULL DEFAULT NULL,
  `Usuario_Alteracao` VARCHAR(255) NULL DEFAULT NULL,
  `Ativo` TINYINT(1) NULL DEFAULT NULL,
  `Data_Inicio_Vigencia` DATETIME NULL DEFAULT NULL,
  `Data_Fim_Vigencia` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`AgenteID`),
  INDEX `idx_data_criacao` (`Data_Criacao` ASC) VISIBLE,
  INDEX `idx_data_alteracao` (`Data_Alteracao` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 201
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetocallcenter`.`dim_canal_atendimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetocallcenter`.`dim_canal_atendimento` (
  `CanalID` INT NOT NULL AUTO_INCREMENT,
  `Nome_Canal` VARCHAR(255) NULL DEFAULT NULL,
  `Descricao` TEXT NULL DEFAULT NULL,
  `Plataforma` VARCHAR(255) NULL DEFAULT NULL,
  `Data_Criacao` DATETIME NULL DEFAULT NULL,
  `Data_Alteracao` DATETIME NULL DEFAULT NULL,
  `Usuario_Criacao` VARCHAR(255) NULL DEFAULT NULL,
  `Usuario_Alteracao` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`CanalID`),
  INDEX `idx_data_criacao` (`Data_Criacao` ASC) VISIBLE,
  INDEX `idx_data_alteracao` (`Data_Alteracao` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetocallcenter`.`dim_categoria_atendimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetocallcenter`.`dim_categoria_atendimento` (
  `CategoriaID` INT NOT NULL,
  `Nome_Categoria` VARCHAR(255) NULL DEFAULT NULL,
  `Descricao` TEXT NULL DEFAULT NULL,
  `Prioridade` INT NULL DEFAULT NULL,
  `Data_Criacao` DATETIME NULL DEFAULT NULL,
  `Data_Alteracao` DATETIME NULL DEFAULT NULL,
  `Usuario_Criacao` VARCHAR(255) NULL DEFAULT NULL,
  `Usuario_Alteracao` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`CategoriaID`),
  INDEX `idx_data_criacao` (`Data_Criacao` ASC) VISIBLE,
  INDEX `idx_data_alteracao` (`Data_Alteracao` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetocallcenter`.`dim_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetocallcenter`.`dim_cliente` (
  `ClienteID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(255) NULL DEFAULT NULL,
  `CPF_CNPJ` VARCHAR(20) NULL DEFAULT NULL,
  `DataNascimento` DATE NULL DEFAULT NULL,
  `Sexo` VARCHAR(10) NULL DEFAULT NULL,
  `Endereco` VARCHAR(255) NULL DEFAULT NULL,
  `Estado` VARCHAR(50) NULL DEFAULT NULL,
  `Cidade` VARCHAR(50) NULL DEFAULT NULL,
  `Telefone` VARCHAR(20) NULL DEFAULT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  `Data_Criacao` DATETIME NULL DEFAULT NULL,
  `Data_Alteracao` DATETIME NULL DEFAULT NULL,
  `Usuario_Criacao` VARCHAR(255) NULL DEFAULT NULL,
  `Usuario_Alteracao` VARCHAR(255) NULL DEFAULT NULL,
  `Ativo` TINYINT(1) NULL DEFAULT NULL,
  `Data_Inicio_Vigencia` DATETIME NULL DEFAULT NULL,
  `Data_Fim_Vigencia` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`ClienteID`),
  INDEX `idx_data_criacao` (`Data_Criacao` ASC) VISIBLE,
  INDEX `idx_data_alteracao` (`Data_Alteracao` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 6501
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetocallcenter`.`dim_tempo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetocallcenter`.`dim_tempo` (
  `TempoID` INT NOT NULL AUTO_INCREMENT,
  `Data` DATE NULL DEFAULT NULL,
  `Dia_Semana` VARCHAR(10) NULL DEFAULT NULL,
  `Dia` INT NULL DEFAULT NULL,
  `Mes` VARCHAR(10) NULL DEFAULT NULL,
  `Numero_Mes` INT NULL DEFAULT NULL,
  `Ano` INT NULL DEFAULT NULL,
  `Bimestre` INT NULL DEFAULT NULL,
  `Trimestre` INT NULL DEFAULT NULL,
  `Semestre` INT NULL DEFAULT NULL,
  PRIMARY KEY (`TempoID`),
  INDEX `idx_data` (`Data` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1465
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projetocallcenter`.`fato_atendimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetocallcenter`.`fato_atendimento` (
  `AtendimentoID` INT NOT NULL AUTO_INCREMENT,
  `ClienteID` INT NULL DEFAULT NULL,
  `AgenteID` INT NULL DEFAULT NULL,
  `TempoID` INT NULL DEFAULT NULL,
  `CanalID` INT NULL DEFAULT NULL,
  `CategoriaID` INT NULL DEFAULT NULL,
  `Duracao_Atendimento` FLOAT NULL DEFAULT NULL,
  `Nivel_Satisfacao` FLOAT NULL DEFAULT NULL,
  `Resolvido` TINYINT(1) NULL DEFAULT NULL,
  `Tempo_Espera` FLOAT NULL DEFAULT NULL,
  `Numero_Chamadas` INT NULL DEFAULT NULL,
  `Primeiro_Atendimento` TINYINT(1) NULL DEFAULT NULL,
  `Data_Criacao` DATETIME NULL DEFAULT NULL,
  `Data_Alteracao` DATETIME NULL DEFAULT NULL,
  `Usuario_Criacao` VARCHAR(255) NULL DEFAULT NULL,
  `Usuario_Alteracao` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`AtendimentoID`),
  INDEX `idx_cliente` (`ClienteID` ASC) VISIBLE,
  INDEX `idx_agente` (`AgenteID` ASC) VISIBLE,
  INDEX `idx_tempo` (`TempoID` ASC) VISIBLE,
  INDEX `idx_canal` (`CanalID` ASC) VISIBLE,
  INDEX `idx_categoria` (`CategoriaID` ASC) VISIBLE,
  INDEX `idx_duracao_atendimento` (`Duracao_Atendimento` ASC) VISIBLE,
  INDEX `idx_nivel_satisfacao` (`Nivel_Satisfacao` ASC) VISIBLE,
  INDEX `idx_resolvido` (`Resolvido` ASC) VISIBLE,
  INDEX `idx_data_criacao` (`Data_Criacao` ASC) VISIBLE,
  INDEX `idx_data_alteracao` (`Data_Alteracao` ASC) VISIBLE,
  CONSTRAINT `fato_atendimento_ibfk_1`
    FOREIGN KEY (`ClienteID`)
    REFERENCES `projetocallcenter`.`dim_cliente` (`ClienteID`),
  CONSTRAINT `fato_atendimento_ibfk_3`
    FOREIGN KEY (`TempoID`)
    REFERENCES `projetocallcenter`.`dim_tempo` (`TempoID`),
  CONSTRAINT `fato_atendimento_ibfk_4`
    FOREIGN KEY (`CanalID`)
    REFERENCES `projetocallcenter`.`dim_canal_atendimento` (`CanalID`),
  CONSTRAINT `fato_atendimento_ibfk_5`
    FOREIGN KEY (`CategoriaID`)
    REFERENCES `projetocallcenter`.`dim_categoria_atendimento` (`CategoriaID`),
  CONSTRAINT `fk_agente`
    FOREIGN KEY (`AgenteID`)
    REFERENCES `projetocallcenter`.`dim_agente` (`AgenteID`))
ENGINE = InnoDB
AUTO_INCREMENT = 27294
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `projetocallcenter` ;

-- -----------------------------------------------------
-- procedure Popula_DIM_Agente
-- -----------------------------------------------------

DELIMITER $$
USE `projetocallcenter`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Popula_DIM_Agente`()
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
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure Popula_DIM_Cliente
-- -----------------------------------------------------

DELIMITER $$
USE `projetocallcenter`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Popula_DIM_Cliente`(IN quantidade INT)
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
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure Popula_DIM_Tempo
-- -----------------------------------------------------

DELIMITER $$
USE `projetocallcenter`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Popula_DIM_Tempo`(IN data_inicio DATE, IN data_fim DATE)
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
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure Popula_Fato_Atendimento
-- -----------------------------------------------------

DELIMITER $$
USE `projetocallcenter`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Popula_Fato_Atendimento`(IN registros INT)
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
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
