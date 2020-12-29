SELECT CONCAT(c.table_name, '.', c.column_name) as coluna
     , CONCAT(f.table_name, '.', f.column_name) as coluna
     , f.*
  FROM information_schema.columns AS c
  LEFT
  JOIN information_schema.columns as f
    ON f.table_schema = 'faina'
   AND f.table_name = c.table_name
   AND f.column_name = c.column_name
 WHERE c.table_schema = 'faina_2'
   AND IFNULL(f.table_name, '') = ''