/*CREATE DATABASE address;
use address;*/
create table addr00(
  id int PRIMARY KEY,
  name VARCHAR(20),
  city VARCHAR(20)
);

INSERT INTO addr00 (id,name,city) values(1,'zhangyu','wuhan');
INSERT INTO addr00 (id,name,city) values(2,'zxsa','wuhan');
INSERT INTO addr00 (id,name,city) values(3,'yaowenjie','wuhan');

-- CREATE DATABASE TEST01;
DROP DATABASE test01;
use addr;
drop TABLE addr00;