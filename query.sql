-- A) Listar o número de produtos e a quantidade total de um pedido
SELECT p.id AS pedido_id, COUNT(i.produto_id) AS numero_produtos, SUM(i.quantidade) AS quantidade_total
FROM pedidos p
JOIN itens_pedido i ON p.id = i.pedido_id
GROUP BY p.id;

-- B) Procedimento armazenado para limitar pedidos apenas a mesas em atendimento
DELIMITER //
CREATE PROCEDURE InserirPedido(IN local_id INT, IN cliente_id INT, IN data_pedido DATE)
BEGIN
    DECLARE status_mesa ENUM('reservado', 'cancelado', 'aberto', 'pagamento', 'fechado');
    
    SELECT status INTO status_mesa FROM pedidos WHERE local_id = local_id ORDER BY data DESC LIMIT 1;
    
    IF status_mesa = 'aberto' THEN
        INSERT INTO pedidos (local_id, cliente_id, data, status) VALUES (local_id, cliente_id, data_pedido, 'aberto');
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A mesa não está em atendimento';
    END IF;
END //
DELIMITER ;