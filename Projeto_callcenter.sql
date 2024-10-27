/*Criação da tabela Fato_Atendimento
USE projetocallcenter;
CREATE TABLE Fato_Atendimento (
    AtendimentoID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    AgenteID INT,
    TempoID INT,
    CanalID INT,
    CategoriaID INT,
    Duracao_Atendimento FLOAT,
    Nivel_Satisfacao FLOAT,
    Resolvido BOOLEAN,
    Tempo_Espera FLOAT,
    Numero_Chamadas INT,
    Primeiro_Atendimento BOOLEAN,
    Data_Criacao DATETIME,
    Data_Alteracao DATETIME,
    Usuario_Criacao VARCHAR(255),
    Usuario_Alteracao VARCHAR(255),
    INDEX idx_cliente (ClienteID),
    INDEX idx_agente (AgenteID),
    INDEX idx_tempo (TempoID),
    INDEX idx_canal (CanalID),
    INDEX idx_categoria (CategoriaID),
    INDEX idx_duracao_atendimento (Duracao_Atendimento),
    INDEX idx_nivel_satisfacao (Nivel_Satisfacao),
    INDEX idx_resolvido (Resolvido),
    INDEX idx_data_criacao (Data_Criacao),
    INDEX idx_data_alteracao (Data_Alteracao),
    FOREIGN KEY (ClienteID) REFERENCES DIM_Cliente(ClienteID),
    FOREIGN KEY (AgenteID) REFERENCES DIM_Agente(AgenteID),
    FOREIGN KEY (TempoID) REFERENCES DIM_Tempo(TempoID),
    FOREIGN KEY (CanalID) REFERENCES DIM_Canal_Atendimento(CanalID),
    FOREIGN KEY (CategoriaID) REFERENCES DIM_Categoria_Atendimento(CategoriaID)
);*/

/*Criação da tabela DIM_Cliente
use projetocallcenter;
CREATE TABLE DIM_Cliente (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(255),
    CPF_CNPJ VARCHAR(20),
    DataNascimento DATE,
    Sexo VARCHAR(10),
    Endereco VARCHAR(255),
    Estado VARCHAR(50),
    Cidade VARCHAR(50),
    Telefone VARCHAR(20),
    Email VARCHAR(100),
    Data_Criacao DATETIME,
    Data_Alteracao DATETIME,
    Usuario_Criacao VARCHAR(255),
    Usuario_Alteracao VARCHAR(255),
    Ativo BOOLEAN,
    Data_Inicio_Vigencia DATETIME,
    Data_Fim_Vigencia DATETIME,
    INDEX idx_data_criacao (Data_Criacao),
    INDEX idx_data_alteracao (Data_Alteracao)
);*/

/*Criação da tabela DIM_Agente
use projetocallcenter;
CREATE TABLE DIM_Agente (
    AgenteID INT PRIMARY KEY,
    Nome VARCHAR(255),
    CPF VARCHAR(20),
    Data_Contratacao DATE,
    Departamento VARCHAR(100),
    Turno VARCHAR(50),
    SupervisorID INT,
    Telefone VARCHAR(20),
    Email VARCHAR(100),
    Data_Criacao DATETIME,
    Data_Alteracao DATETIME,
    Usuario_Criacao VARCHAR(255),
    Usuario_Alteracao VARCHAR(255),
    Ativo BOOLEAN,
    Data_Inicio_Vigencia DATETIME,
    Data_Fim_Vigencia DATETIME,
    INDEX idx_data_criacao (Data_Criacao),
    INDEX idx_data_alteracao (Data_Alteracao)
);*/

/*Criação da tabela DIM_Tempo
use projetocallcenter;
CREATE TABLE DIM_Tempo (
    TempoID INT PRIMARY KEY,
    Data DATE,
    Dia_Semana VARCHAR(10),
    Dia INT,
    Mes VARCHAR(10),
    Numero_Mes INT,
    Ano INT,
    Bimestre INT,
    Trimestre INT,
    Semestre INT,
    INDEX idx_data (Data)
);*/

/*Criação da tabela DIM_Canal_Atendimento
use projetocallcenter;
CREATE TABLE DIM_Canal_Atendimento (
    CanalID INT PRIMARY KEY,
    Nome_Canal VARCHAR(255),
    Descricao TEXT,
    Plataforma VARCHAR(255),
    Data_Criacao DATETIME,
    Data_Alteracao DATETIME,
    Usuario_Criacao VARCHAR(255),
    Usuario_Alteracao VARCHAR(255),
    INDEX idx_data_criacao (Data_Criacao),
    INDEX idx_data_alteracao (Data_Alteracao)
);*/

/*Criação da tabela DIM_Categoria_Atendimento
use projetocallcenter;
CREATE TABLE DIM_Categoria_Atendimento (
    CategoriaID INT PRIMARY KEY,
    Nome_Categoria VARCHAR(255),
    Descricao TEXT,
    Prioridade INT,
    Data_Criacao DATETIME,
    Data_Alteracao DATETIME,
    Usuario_Criacao VARCHAR(255),
    Usuario_Alteracao VARCHAR(255),
    INDEX idx_data_criacao (Data_Criacao),
    INDEX idx_data_alteracao (Data_Alteracao)
);*/

/*DROP tables
USE projetocallcenter;
-- Remover a tabela Fato_Atendimento
DROP TABLE IF EXISTS Fato_Atendimento;

-- Remover a tabela DIM_Cliente
DROP TABLE IF EXISTS DIM_Cliente;

-- Remover a tabela DIM_Agente
DROP TABLE IF EXISTS DIM_Agente;

-- Remover a tabela DIM_Tempo
DROP TABLE IF EXISTS DIM_Tempo;

-- Remover a tabela DIM_Canal_Atendimento
DROP TABLE IF EXISTS DIM_Canal_Atendimento;

-- Remover a tabela DIM_Categoria_Atendimento
DROP TABLE IF EXISTS DIM_Categoria_Atendimento;*/

/*ALTER TABLE necessários
ALTER TABLE DIM_Tempo MODIFY TempoID INT AUTO_INCREMENT;
ALTER TABLE DIM_Cliente MODIFY ClienteID INT AUTO_INCREMENT;
ALTER TABLE DIM_Agente MODIFY AgenteID INT AUTO_INCREMENT
ALTER TABLE DIM_Canal_Atendimento MODIFY CanalID INT AUTO_INCREMENT;
ALTER TABLE DIM_Categoria_Atendimento MODIFY CategoriaID INT AUTO_INCREMENT;
ALTER TABLE Fato_Atendimento MODIFY AtendimentoID INT AUTO_INCREMENT;

-- Remover a chave estrangeira que referencia DIM_Agente
ALTER TABLE Fato_Atendimento DROP FOREIGN KEY fato_atendimento_ibfk_2;

ALTER TABLE Fato_Atendimento
ADD CONSTRAINT fk_agente FOREIGN KEY (AgenteID) REFERENCES DIM_Agente(AgenteID);

*/

/* Ver dados inseridos nas tabelas dimensões
SELECT * FROM DIM_Cliente;

SELECT * FROM DIM_Agente;

SELECT * FROM DIM_Tempo;

SELECT * FROM DIM_Canal_Atendimento;

SELECT * FROM DIM_Categoria_Atendimento;*/




