create database Orderprocessing;
use Orderprocessing;
show tables;
create table CUSTOMER(custno int, cname varchar(20), city varchar(20), primary key(custno));
create table ORDERS(orderno int, odate date, custno int, ordamt int, primary key(orderno), foreign key(custno) references CUSTOMER
(custno) on delete cascade);
create table ITEM(itemno int, price int, primary key(itemno));
create table ORDER_ITEM(orderno int, itemno int, quantity int, foreign key(orderno) references ORDERS(orderno), foreign key(itemno) references
ITEM(itemno) on delete set null);

desc ORDER_ITEM;
create table WAREHOUSE(warehouseno int, city varchar(20), primary key(warehouseno));
create table SHIPMENT(orderno int, warehouseno int, shipdate date, foreign key(orderno) references ORDERS(orderno), foreign key
(warehouseno) references WAREHOUSE(warehouseno));

insert into CUSTOMER values(771, 'PUSHPA K' , 'BANGALORE');
insert into CUSTOMER values(772, 'SUMAN', 'MUMBAI');
insert into CUSTOMER values(773, 'SOURAV', 'CALICUT');
insert into CUSTOMER values(774, 'LAILA', 'HYDERABAD');
insert into CUSTOMER values(775, 'FAIZAL', 'BANGALORE');
select* from CUSTOMER;

insert into ORDERS values(111, '2002-01-22', 771, 18000);
insert into ORDERS values(112, '2002-07-30', 774, 6000);
insert into ORDERS values(113, '2003-04-03', 775, 9000);
insert into ORDERS values(114, '2003-11-03', 775, 29000);
insert into ORDERS values(115, '2003-12-10', 773, 29000);
insert into ORDERS values(116, '2004-08-04', 772, 56000);
insert into ORDERS values(117, '2004-09-10', 771, 20000);
insert into ORDERS values(118, '2004-11-20', 775, 29000);
insert into ORDERS values(119, '2005-02-13', 774, 29000);
insert into ORDERS values(120, '2005-10-13', 775, 29000);
select * from ORDERS;

insert into ITEM values(5001, 503);
insert into ITEM values(5002, 750);
insert into ITEM values(5003, 150);
insert into ITEM values(5004, 600);
insert into ITEM values(5005, 890);
select * from ITEM;

insert into ORDER_ITEM values(111, 5001, 50);
insert into ORDER_ITEM values(112, 5003, 20);
insert into ORDER_ITEM values(113, 5002, 50);
insert into ORDER_ITEM values(114, 5005, 60);
insert into ORDER_ITEM values(115, 5004, 90);
insert into ORDER_ITEM values(116, 5001, 10);
insert into ORDER_ITEM values(117, 5003, 80);
insert into ORDER_ITEM values(118, 5005, 50);
insert into ORDER_ITEM values(119, 5002, 10);
insert into ORDER_ITEM values(120, 5004, 45);
select * from ORDER_ITEM;

insert into WAREHOUSE values(1,'DELHI');
insert into WAREHOUSE values(2,'BOMBAY');
insert into WAREHOUSE values(3,'CHENNAI');
insert into WAREHOUSE values(4,'BANGALORE');
insert into WAREHOUSE values(5,'BANGALORE');
insert into WAREHOUSE values(6,'DELHI');
insert into WAREHOUSE values(7,'BOMBAY');
insert into WAREHOUSE values(8,'CHENNAI');
insert into WAREHOUSE values(9,'DELHI');
insert into WAREHOUSE values(10,'BANGALORE');
select * from WAREHOUSE;

insert into SHIPMENT values(111, 1, '2002-02-10');
insert into SHIPMENT values(112, 5, '2002-09-10');
insert into SHIPMENT values(113, 8, '2003-02-10');
insert into SHIPMENT values(114, 3, '2003-12-10');
insert into SHIPMENT values(115, 9, '2004-01-19');
insert into SHIPMENT values(116, 1, '2004-09-20');
insert into SHIPMENT values(117, 5, '2004-09-10');
insert into SHIPMENT values(118, 7, '2004-11-30');
insert into SHIPMENT values(119, 7, '2005-04-30');
insert into SHIPMENT values(120, 6, '2005-12-21');
select * from SHIPMENT;

/* iii) Produce a listing: CUSTNAME, #oforders, AVG_ORDER_AMT, where the middle column is the total
 numbers of orders by the customer and the last column is the average order amount for that
 customer.
 */

SELECT C.cname,COUNT(O.orderno) AS TOTALORDERS,AVG(O.ordamt) AS AVG_ORDER_AMT FROM CUSTOMER C,ORDERS O WHERE C.custno=O.custno GROUP BY O.custno;

/* iv) List the order# for orders that were shipped from all warehouses that the company has in a
 specific city.
 */
 
 
SELECT S.orderno FROM SHIPMENT S,WAREHOUSE W WHERE S.warehouseno=W.warehouseno AND W.city="BANGALORE";

/* v) Demonstrate how you delete item# 10 from the ITEM table and make that field null in the
ORDER_ITEM table.
*/


DELETE FROM ITEM WHERE itemno=5002;
SELECT * FROM ORDER_ITEM;









