--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2623

CREATE TABLE categories (
  id numeric PRIMARY KEY,
  name varchar(255)
);

CREATE TABLE products (
  id numeric PRIMARY KEY,
  name varchar (255),
  amount numeric,
  price numeric,
  id_categories numeric REFERENCES categories (id)
);


INSERT INTO categories (id, name)
VALUES
  (1,	'Superior'),
  (2,	'Super Luxury'),
  (3,	'Modern'),
  (4,	'Nerd'),
  (5,	'Infantile'),
  (6,	'Robust'),
  (9,	'Wood');

INSERT INTO products (id, name, amount, price, id_categories)
VALUES
  (1,	'Blue Chair',	30, 300.00,	9),
  (2,	'Red Chair',	200,	2150.00, 2),
  (3,	'Disney Wardrobe',	400,	829.50,	4),
  (4,	'Blue Toaster',	20,	9.90,	3),
  (5,	'Solar Panel',	30,	3000.25,	4);

SELECT prod.NAME, cat.NAME  FROM products as prod INNER JOIN categories as cat
ON prod.id_categories=cat.id WHERE prod.amount>100 AND (cat.id=1 or cat.id=2 or
cat.id=3 or cat.id=6 or cat.id=9) ORDER BY prod.id_categories asc

/*OR*/

SELECT prod.NAME, cat.NAME  FROM products as prod INNER JOIN categories as cat
ON prod.id_categories=cat.id WHERE prod.amount>100 AND cat.id IN(1,2,3,6,9) ORDER BY prod.id_categories asc

/*  Execute this query to drop the tables */
-- DROP TABLE products, categories; --
