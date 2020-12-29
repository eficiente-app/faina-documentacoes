SELECT CONCAT('ALTER TABLE ', tables.table_name,' ADD COLUMN ', script_coluna, ';') as script
  FROM information_schema.tables
 INNER
  JOIN
     ( SELECT 1 as id, 'origem_incluido_id' AS coluna, 'origem_incluido_id INTEGER' AS script_coluna
        UNION ALL
       SELECT 2 as id, 'origem_alterado_id' AS coluna, 'origem_alterado_id INTEGER' AS script_coluna
        UNION ALL
       SELECT 3 as id, 'origem_excluido_id' AS coluna, 'origem_excluido_id INTEGER' AS script_coluna
        UNION ALL
       SELECT 4 as id, 'incluido_id' AS coluna, 'incluido_id INTEGER' AS script_coluna
        UNION ALL
       SELECT 5 as id, 'incluido_em' AS coluna, 'incluido_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP' AS script_coluna
        UNION ALL
       SELECT 6 as id, 'alterado_id' AS coluna, 'alterado_id INTEGER NULL DEFAULT NULL' AS script_coluna
        UNION ALL
       SELECT 7 as id, 'alterado_em' AS coluna, 'alterado_em TIMESTAMP NULL DEFAULT NULL' AS script_coluna
        UNION ALL
       SELECT 8 as id, 'excluido_id' AS coluna, 'excluido_id INTEGER NULL DEFAULT NULL' AS script_coluna
        UNION ALL
       SELECT 9 as id, 'excluido_em' AS coluna, 'excluido_em TIMESTAMP NULL DEFAULT NULL' AS script_coluna
     ) as colunas
    ON colunas.coluna is not null
  LEFT
  JOIN information_schema.columns as colunas_db
    ON colunas_db.table_schema = tables.table_schema
   AND colunas_db.table_name = tables.table_name
   AND colunas_db.column_name = colunas.coluna
 WHERE tables.table_schema = 'faina'
   AND colunas_db.table_name is null
 ORDER
	BY tables.table_name
     , colunas.id;
     
SELECT CONCAT('ALTER TABLE ', tables.table_name,' DROP ', coluna, ';') as script
  FROM information_schema.tables
 INNER
  JOIN
     ( SELECT 1 as id, 'origem_incluido_id' AS coluna
        UNION ALL
       SELECT 2 as id, 'origem_alterado_id' AS coluna
        UNION ALL
       SELECT 3 as id, 'origem_excluido_id' AS coluna
        UNION ALL
       SELECT 4 as id, 'incluido_id' AS coluna
        UNION ALL
       SELECT 5 as id, 'incluido_em' AS coluna
        UNION ALL
       SELECT 6 as id, 'alterado_id' AS coluna
        UNION ALL
       SELECT 7 as id, 'alterado_em' AS coluna
        UNION ALL
       SELECT 8 as id, 'excluido_id' AS coluna
        UNION ALL
       SELECT 9 as id, 'excluido_em' AS coluna
     ) as colunas
    ON colunas.coluna is not null
  LEFT
  JOIN information_schema.columns as colunas_db
    ON colunas_db.table_schema = tables.table_schema
   AND colunas_db.table_name = tables.table_name
   AND colunas_db.column_name = colunas.coluna
 WHERE tables.table_schema = 'faina'
   AND colunas_db.table_name is not null
 ORDER
	BY tables.table_name
     , colunas.id;