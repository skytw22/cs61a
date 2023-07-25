.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students WHERE color='blue' AND pet='dog';

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students WHERE color='blue' AND pet='dog';


CREATE TABLE smallest_int AS
  SELECT time, smallest FROM students WHERE smallest>2 ORDER BY smallest ASC LIMIT 20;


CREATE TABLE matchmaker AS
  SELECT a.pet, a.song, a.color, b.color FROM students AS a, students AS b WHERE a.pet=b.pet AND a.song=b.song AND a.time<b.time;


CREATE TABLE sevens AS
  SELECT a.seven from students as a, numbers as b WHERE a.number=7 AND b.'7'='True' AND a.time=b.time;
