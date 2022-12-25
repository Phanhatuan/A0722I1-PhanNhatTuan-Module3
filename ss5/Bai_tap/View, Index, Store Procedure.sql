create database demoss5;
use demoss5;
create table product(
	id int primary key,
    productCode varchar(255),
    productName varchar(255),
	productPrice int,
	productAmount int,
    productDescription  varchar(255),
    productStatus varchar(10)
);
insert into product
values (1,'001','Fried Chicken',10,1,'Chicken','on sale'),
	(2,'002','Beef steak',20,2,'Beef','on sale'),
    (3,'003','Fried Pork',30,3,'Pork','on sale');
create Unique index productCode_index on product(productCode);
create index productCode_Com_index on product(productName,productPrice);
explain select * from product where id = 1;
create view product_detail
as
	select productCode, productName, productPrice, productStatus
    from product;
select * from product_detail;
alter view product_detail
as
	select productCode, productName, productPrice
    from product;
drop view product_detail;