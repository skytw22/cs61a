.read data.sql


CREATE TABLE average_prices AS
  SELECT category, avg(MSRP) as average_price FROM products GROUP BY category;


CREATE TABLE lowest_prices AS
  SELECT store, item, MIN(price) as lowest_price FROM inventory GROUP BY item;

CREATE TABLE lowest_cost AS
  SELECT category, name, MIN(MSRP/rating) FROM products GROUP BY category;

CREATE TABLE shopping_list AS
  SELECT a.name, b.store FROM lowest_cost AS a, lowest_prices AS b WHERE a.name = b.item;


CREATE TABLE total_bandwidth AS
  SELECT SUM(a.Mbs) from stores as a, shopping_list as b WHERE a.store = b.store;

