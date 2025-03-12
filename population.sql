INSERT INTO locais (id, valor_hora) VALUES (1, 14.0), (2, 12.0), (3, 10.0);

INSERT INTO clientes (id, nome, email) VALUES
(1, 'Laurindo', 'email@email'),
(2, 'Claudia', 'Email1@email'),
(3, 'Laura', 'Email2@email');

INSERT INTO produtos (id, nome, preco) VALUES
(1, 'Ovo Frito', 4.0),
(2, 'Hambúrguer', 10.0),
(3, 'Picanha', 200.0),
(4, 'Café', 45.0);

INSERT INTO pedidos (id, local_id, cliente_id, data, status) VALUES
(1, 1, 2, '2025-03-29', 'aberto'),
(2, 3, 1, '2025-03-01', 'aberto');

INSERT INTO itens_pedido (pedido_id, produto_id, quantidade) VALUES
(1, 3, 1),
(1, 2, 2),
(2, 1, 1);
