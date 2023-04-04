-- CREATE [ TEMPORARY | TEMP ] SEQUENCE [ IF NOT EXISTS ] name [ INCREMENT [ BY ] increment ]
--     [ MINVALUE minvalue | NO MINVALUE ] [ MAXVALUE maxvalue | NO MAXVALUE ]
--     [ START [ WITH ] start ] [ CACHE cache ] [ [ NO ] CYCLE ]
    -- [ OWNED BY { table_name.column_name | NONE } ]
  
  CREATE SEQUENCE even_sequence INCREMENT BY 2 START WITH 2;

  SELECT nextval('even_sequence');