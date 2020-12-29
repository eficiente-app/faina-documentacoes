use faina;
WITH RECURSIVE pastas(id, mae_id, tipo_id, projeto_id, nome, descricao) as (
SELECT id, 0 AS mae_id, tipo_id, projeto_id, nome, descricao
  FROM pasta
 WHERE tipo_id = 1
 UNION ALL
SELECT pasta.id, pasta_pasta.mae_id AS mae_id, pasta.tipo_id, pasta.projeto_id, pasta.nome, pasta.descricao
  FROM pasta_pasta
 INNER
  JOIN pastas
    ON pastas.id = pasta_pasta.mae_id
 INNER
  JOIN pasta
    ON pasta.id = pasta_pasta.filha_id
)
SELECT * FROM pastas;