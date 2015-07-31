CREATE DATABASE address;
use address;
create table addr(
  id int PRIMARY KEY,
  name VARCHAR(20),
  city VARCHAR(20)
);

INSERT INTO addr values(1,'zhangyu','wuhan');
INSERT INTO addr values(2,'yaowenjie','wuhan');
