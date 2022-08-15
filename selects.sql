-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT
  ped.id,
  ped.status,
  ped.cliente_id,
  prod.id,
  prod.nome,
  prod.tipo,
  prod.preco,
  prod.pts_de_lealdade
FROM
  pedidos ped
  INNER JOIN produtos_pedidos pp ON ped.id = pp.pedido_id
  INNER JOIN produtos prod ON pp.produto_id = prod.id;
-- 2)
SELECT
  pp.pedido_id as id
FROM
  produtos_pedidos pp
WHERE
  pp.produto_id = 6;
-- 3)
SELECT
  c.nome as gostam_de_fritas
FROM
  clientes c
  INNER JOIN pedidos ped ON c.id = ped.cliente_id
  INNER JOIN produtos_pedidos pp ON ped.id = pp.pedido_id
WHERE
  pp.produto_id = 6;
-- 4)
SELECT
  SUM(prod.preco)
FROM
  produtos prod
  INNER JOIN produtos_pedidos pp ON pp.produto_id = prod.id
  INNER JOIN pedidos ped ON ped.id = pp.pedido_id
WHERE
  ped.cliente_id = 5;
-- 5)
SELECT
  prod.nome,
  COUNT(pp.produto_id)
FROM
  produtos prod
  INNER JOIN produtos_pedidos pp ON prod.id = pp.produto_id
GROUP BY
  prod.nome;