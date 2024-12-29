-- Criação do esquema do banco de dados para o cenário de e-commerce

-- Criação da tabela de Fornecedor
CREATE TABLE Fornecedor (
    idFornecedor INT PRIMARY KEY AUTO_INCREMENT,
    RazaoSocial VARCHAR(45)
);

-- Criação da tabela de Estoque
CREATE TABLE Estoque (
    idEstoque INT PRIMARY KEY AUTO_INCREMENT,
    Local VARCHAR(45)
);

-- Criação da tabela de Produto
CREATE TABLE Produto (
    idProduto INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45),
    Categoria VARCHAR(45),
    SubCategoria VARCHAR(45),
    QuantidadeEstoque INT,
    Estoque_idEstoque INT,
    FOREIGN KEY (Estoque_idEstoque) REFERENCES Estoque(idEstoque)
);

-- Tabela de Disponibilidade de Produto
CREATE TABLE DisponibilidadeProduto (
    Fornecedor_idFornecedor INT,
    Produto_idProduto INT,
    PRIMARY KEY (Fornecedor_idFornecedor, Produto_idProduto),
    FOREIGN KEY (Fornecedor_idFornecedor) REFERENCES Fornecedor(idFornecedor),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

-- Tabela de Vendedor
CREATE TABLE Vendedor (
    idVendedor INT PRIMARY KEY AUTO_INCREMENT,
    RazaoSocial VARCHAR(45),
    Local VARCHAR(45)
);

-- Tabela de Produtos por Vendedor
CREATE TABLE ProdutosPorVendedor (
    Vendedor_idVendedor INT,
    Produto_idProduto INT,
    Quantidade INT,
    PRIMARY KEY (Vendedor_idVendedor, Produto_idProduto),
    FOREIGN KEY (Vendedor_idVendedor) REFERENCES Vendedor(idVendedor),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

-- Tabela de Cliente
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45),
    CPF_CNPJ VARCHAR(18),
    Endereco VARCHAR(45),
    Email VARCHAR(45),
    Telefone VARCHAR(15),
    FormaPagamento INT,
    ValorTotalCompra FLOAT,
    TipoPessoa ENUM('PJ', 'PF')
);

-- Tabela para Pessoa Jurídica
CREATE TABLE PessoaJuridica (
    idPJ INT PRIMARY KEY,
    Nome VARCHAR(45),
    CNPJ VARCHAR(18),
    Endereco VARCHAR(45),
    FOREIGN KEY (idPJ) REFERENCES Cliente(idCliente)
);

-- Tabela para Pessoa Física
CREATE TABLE PessoaFisica (
    idPF INT PRIMARY KEY,
    Nome VARCHAR(45),
    CPF VARCHAR(11),
    Endereco VARCHAR(45),
    FOREIGN KEY (idPF) REFERENCES Cliente(idCliente)
);

-- Tabela de Pedido
CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY AUTO_INCREMENT,
    DescricaoPedido VARCHAR(45),
    StatusPedido TINYINT,
    DataSolicitacao DATE,
    DataCancelamento DATE,
    DataEntrega DATE,
    ValorTotal FLOAT,
    CodigoEnvio VARCHAR(45),
    Cliente_idCliente INT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

-- Tabela de Relação Produto por Pedido
CREATE TABLE RelacaoProdutoPedido (
    Pedido_idPedido INT,
    Produto_idProduto INT,
    Quantidade INT,
    PRIMARY KEY (Pedido_idPedido, Produto_idProduto),
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

-- Tabela de Pagamento
CREATE TABLE Pagamento (
    idPagamento INT PRIMARY KEY AUTO_INCREMENT,
    MeioPagamento VARCHAR(45),
    Pedido_idPedido INT,
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido)
);

-- Tabela de Cartão
CREATE TABLE Cartao (
    idCartao INT PRIMARY KEY AUTO_INCREMENT,
    TipoCartao VARCHAR(45),
    DataPagamento DATE,
    Valor FLOAT,
    Pagamento_idPagamento INT,
    FOREIGN KEY (Pagamento_idPagamento) REFERENCES Pagamento(idPagamento)
);

-- Tabela de Boleto
CREATE TABLE Boleto (
    idBoleto INT PRIMARY KEY AUTO_INCREMENT,
    Valor INT,
    DataVencimento DATE,
    Pagamento_idPagamento INT,
    FOREIGN KEY (Pagamento_idPagamento) REFERENCES Pagamento(idPagamento)
);

-- População das tabelas (exemplo de inserções)
-- Adicione registros como exemplo para teste do banco de dados.

-- Consultas complexas e exemplos de queries:
-- 1. Recuperar os pedidos feitos por cada cliente:
-- SELECT c.Nome, COUNT(p.idPedido) AS TotalPedidos
-- FROM Cliente c
-- LEFT JOIN Pedido p ON c.idCliente = p.Cliente_idCliente
-- GROUP BY c.idCliente;

-- 2. Verificar se algum vendedor também é fornecedor:
-- SELECT v.RazaoSocial AS Vendedor, f.RazaoSocial AS Fornecedor
-- FROM Vendedor v
-- INNER JOIN Fornecedor f ON v.RazaoSocial = f.RazaoSocial;

-- 3. Relação de produtos, fornecedores e estoques:
-- SELECT p.Nome AS Produto, f.RazaoSocial AS Fornecedor, e.Local AS Estoque
-- FROM Produto p
-- INNER JOIN DisponibilidadeProduto dp ON p.idProduto = dp.Produto_idProduto
-- INNER JOIN Fornecedor f ON dp.Fornecedor_idFornecedor = f.idFornecedor
-- INNER JOIN Estoque e ON p.Estoque_idEstoque = e.idEstoque;

-- 4. Relação de nomes dos fornecedores e nomes dos produtos:
-- SELECT f.RazaoSocial AS Fornecedor, p.Nome AS Produto
-- FROM Fornecedor f
-- INNER JOIN DisponibilidadeProduto dp ON f.idFornecedor = dp.Fornecedor_idFornecedor
-- INNER JOIN Produto p ON dp.Produto_idProduto = p.idProduto;
