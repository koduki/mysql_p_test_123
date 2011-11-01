DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS authors;

CREATE TABLE books
(
 id INT(11) primary key,
 title VARCHAR(64),
 category_id INT(11),
 author_id INT(11),
 detail TEXT
);
ALTER TABLE books ADD INDEX (category_id);
ALTER TABLE books ADD INDEX (author_id);

CREATE TABLE categories
(
 id INT(11) primary key,
 name VARCHAR(64)
);

CREATE TABLE authors
(
 id INT(11) primary key,
 name VARCHAR(64)
);


