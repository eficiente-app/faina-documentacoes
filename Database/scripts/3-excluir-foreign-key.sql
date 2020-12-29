SELECT CONCAT('ALTER TABLE ', table_name, ' DROP FOREIGN KEY ', constraint_name, ';') AS T
     , a.*
  FROM information_schema.TABLE_CONSTRAINTS as a
 WHERE table_schema = 'faina'
   AND constraint_type = 'foreign key';