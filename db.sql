CREATE TABLE locais (
    id INT PRIMARY KEY,
    valor_hora FLOAT
);

CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE produtos (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    preco FLOAT
);

CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    local_id INT,
    cliente_id INT,
    data DATE,
    status ENUM('reservado', 'cancelado', 'aberto', 'pagamento', 'fechado'),
    FOREIGN KEY (local_id) REFERENCES locais(id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE itens_pedido (
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

