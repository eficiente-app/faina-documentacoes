SELECT CONCAT(table_name, '.', column_name) as coluna
     , columns.*
  FROM information_schema.columns
 WHERE table_schema = 'faina'
   AND data_type = 'int'
   AND column_name NOT LIKE '%_id'
   AND column_name NOT LIKE '%_em'
   AND column_name NOT LIKE '%_intervalo'
   AND column_name NOT LIKE '%_format'
   AND column_name NOT LIKE '%inicio%'
   AND column_name NOT LIKE '%fim%'
   AND column_name NOT IN('id', 'nome', 'descricao', 'posicao', 'ativo', 'obrigatorio', 'aprovado', 'qtd_trabalhada');



SELECT CONCAT(table_name, '.', column_name) as coluna
     , CONCAT(column_name, '_id') as novo_nome
     , CONCAT('ALTER TABLE ', table_schema, '.', table_name
             , ' CHANGE COLUMN `', column_name, '` `', column_name, '_id` ', column_type ,' NULL DEFAULT NULL;') as script
     , col.*
  FROM information_schema.columns as col
 WHERE col.table_schema = 'faina'
   -- AND col.column_name LIKE '%_id'
   -- AND col.column_name NOT LIKE '%_em'
   -- AND column_name NOT IN('id', 'nome', 'descricao')
   AND CONCAT(table_name, '.', column_name) IN(
   'portal_tarefa.solicitacao_tipo',
   'pasta.tipo',
   'projeto.tipo',
   'tarefa.tipo',
   'tarefa.classificacao',
   'tarefa.status',
   'tarefa_etapa.tipo',
   'tarefa_etapa.status',
   'usuario.tipo',
   'usuario.perfil',
   'tarefa_usuario.funcao'
)
   -- AND colunas_db.table_name is null
 ORDER
	BY table_name;