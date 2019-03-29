--QUERY 1: Creates second table in the lab14_normal database named bookshelves.
CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));

--QUERY 2: Retrieves unique bookshelf values from books table and inserts each one into bookshelves table in the name column
INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;

--QUERY 3: Adds column to books table named bookshelf_id (connects each book to specific bookshelf in other table)
ALTER TABLE books ADD COLUMN bookshelf_id INT;

--QUERY 4: Prepares connection between two tables. 
--1. Runs subquery for everyrow in books table.
--2. Subquery finds bookshelf row that has a matching name to book's bookshelf value.
--3. Id of bookshelf row is set as value of bookshelf_id property in current book row.
UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;

--QUERY 5: Modifies book table by removing bookshelf column since books table contains bookshelf_id column which becomes a foreign key.
ALTER TABLE books DROP COLUMN bookshelf;

--Query 6: Modifies bookshelf_id data type in books table, setting it as foreign key which references primary key in bookshelves table.
ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);



