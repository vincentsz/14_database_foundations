CREATE INDEX index_name ON table_name (field_name);

-- example

CREATE INDEX ON books (author_id);

-- multicolumn indexes

CREATE INDEX index_name ON table (field_name_1, field_name_2);

-- delete an index

DROP index index_name;

-- listing indexes

\di