create database sell_management;
use sell_management;
create table customer (
	cId int primary key,
    cName varchar(255),
    cAge int
);
create table orders(
	oId int primary key,
    cId int,
    oDate DATE,
    oTotalPrice int,
    CONSTRAINT fk_cId FOREIGN KEY(cId) REFERENCES customer(cId)
);
create table product(
	pId int primary key,
    pName varchar(255),
    pPrice  varchar(255)
);
drop table orders_detail;
create table orders_detail(
	oId int ,
    pId int ,
    primary key(oId,pId),
    odQTY int,
    CONSTRAINT fk_oId FOREIGN key (oId) REFERENCES orders(oId),
	CONSTRAINT fk_pId FOREIGN key (pId) REFERENCES product(pId)
);