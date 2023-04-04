/*
0.Query
 -description
Write SQL statements to insert the following new books into the database. What do you need to do to ensure this data fits in the database?
Author 	Title 	Categories
Lynn Sherr 	Sally Ride: America's First Woman in Space 	Biography, Nonfiction, Space Exploration
Charlotte Brontë 	Jane Eyre 	Fiction, Classics
Meeru Dhalwala and Vikram Vij 	Vij's: Elegant and Inspired Indian Cuisine 	Cookbook, Nonfiction, South Asia
 -expected output

 -returned output

1.Understand problem
 -input:
 --tables:

 --columns

 -return:

 -rules:
  --explicit:
  --implicit:
2.Helper data
 -schema
                                    Table "public.books"
 Column |         Type          | Collation | Nullable |              Default              
--------+-----------------------+-----------+----------+-----------------------------------
 id     | integer               |           | not null | nextval('books_id_seq'::regclass)
 title  | character varying(32) |           | not null | 
 author | character varying(32) |           | not null | 
Indexes:
    "books_pkey" PRIMARY KEY, btree (id)
Referenced by:
    TABLE "books_categories" CONSTRAINT "books_categories_book_id_fkey" FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE

                                       Table "public.categories"
 Column |         Type          | Collation | Nullable |                Default                 
--------+-----------------------+-----------+----------+----------------------------------------
 id     | integer               |           | not null | nextval('categories_id_seq'::regclass)
 name   | character varying(32) |           | not null | 
Indexes:
    "categories_pkey" PRIMARY KEY, btree (id)
Referenced by:
    TABLE "books_categories" CONSTRAINT "books_categories_category_id_fkey" FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE

                Table "public.books_categories"
   Column    |  Type   | Collation | Nullable | Default 
-------------+---------+-----------+----------+---------
 book_id     | integer |           | not null | 
 category_id | integer |           | not null | 
Foreign-key constraints:
    "books_categories_book_id_fkey" FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE
    "books_categories_category_id_fkey" FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
 -tables

3.Data type

4.Algorithm
create another table authors
create a join table books_authors
delete colmn books.author
add boks to books,
add categories to categories
and then add all ids in the join table
*/

CREATE TABLE authors(
  id serial PRIMARY KEY,
  full_name varchar(255)
);

ALTER TABLE books
ALTER COLUMN title TYPE text;

INSERT INTO books(author, title)
VALUES ('Lynn Sherr', 'Sally Ride: America''s First Woman in Space'),
       ('Charlotte Brontë', 'Charlotte Brontë'),
       ('Meeru Dhalwala and Vikram Vij', 'Vij''s: Elegant and Inspired Indian Cuisine');

INSERT INTO categories("name")
VALUES ('Space Exploration'),
       ('Cookbook'),
       ('South Asia');



INSERT INTO books_categories(book_id, category_id)
VALUES (4, 5),
       (4, 1),
       (4, 7),
       (5, 2),
       (5, 4),
       (6, 8),
       (6, 1),
       (6, 9);