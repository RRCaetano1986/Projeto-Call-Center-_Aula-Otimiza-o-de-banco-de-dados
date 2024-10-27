/* Incluindo categorias de atendimento
USE projetocallcenter;

INSERT INTO DIM_Categoria_Atendimento (
    CategoriaID,
    Nome_Categoria,
    Descricao,
    Prioridade,
    Data_Criacao,
    Data_Alteracao,
    Usuario_Criacao,
    Usuario_Alteracao
) VALUES
(1, 'Suporte Técnico', 'Assistência para resolução de problemas técnicos.', 1, NOW(), NOW(), 'admin', 'admin'),
(2, 'Reclamação', 'Registro de insatisfações ou queixas dos clientes.', 2, NOW(), NOW(), 'admin', 'admin'),
(3, 'Informação', 'Fornecimento de informações gerais sobre produtos ou serviços.', 3, NOW(), NOW(), 'admin', 'admin'),
(4, 'Vendas', 'Processos relacionados à venda de produtos ou serviços.', 2, NOW(), NOW(), 'admin', 'admin'),
(5, 'Cancelamento', 'Solicitações para cancelamento de serviços ou contratos.', 1, NOW(), NOW(), 'admin', 'admin'),
(6, 'Sugestão', 'Feedback construtivo fornecido pelos clientes.', 4, NOW(), NOW(), 'admin', 'admin'),
(7, 'Cobrança', 'Questões relacionadas a pagamentos ou faturamento.', 2, NOW(), NOW(), 'admin', 'admin'),
(8, 'Atualização de Dados', 'Alterações cadastrais e atualizações de informações pessoais.', 3, NOW(), NOW(), 'admin', 'admin'),
(9, 'Acompanhamento de Pedido', 'Informações sobre o status de pedidos em andamento.', 3, NOW(), NOW(), 'admin', 'admin'),
(10, 'Problemas de Entrega', 'Questões relacionadas a atrasos ou falhas na entrega de produtos.', 1, NOW(), NOW(), 'admin', 'admin');*/

/*Selecionando a tabela
SELECT * FROM DIM_Categoria_Atendimento;*/

