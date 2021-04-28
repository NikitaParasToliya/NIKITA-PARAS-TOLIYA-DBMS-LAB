CREATE DATABASE BOOK;
SHOW databases;
USE BOOK;
SHOW TABLES;
CREATE TABLE AUTHOR(authorid int, aname varchar(15), city varchar(15), country varchar(15), primary key(authorid));
CREATE TABLE PUBLISHER(publisherid int, name varchar(15), city varchar(15), country varchar(15), primary key(publisherid));
CREATE TABLE CATEGORY(categoryid int, bdescription varchar(50), primary key(categoryid));
CREATE TABLE CATALOG(bookid int, title varchar(20), authorid int, publisherid int, categoryid int, cyear int, price int,
 primary key(authorid , publisherid,bookid), foreign key(authorid) references AUTHOR(authorid) on delete cascade,
 foreign key(publisherid) references PUBLISHER(publisherid) on delete cascade);
 CREATE TABLE ORDERDETAILS(orderno int, bookid int, quantity int , primary key(orderno,bookid));
 
 insert into AUTHOR values(1001, 'TERAS CHAN', 'CA' , 'USA');
 insert into AUTHOR values(1002, 'STEVENS' , 'ZOMBI', 'UGANDA');
 insert into AUTHOR values(1003, 'M MANO', 'CAIR' , 'CANADA');
 insert into AUTHOR values(1004, 'KARTHIK B.P.', 'NEW YORK','USA');
 insert into AUTHOR values(1005, 'WILLIAMSTALLING', 'LAS VEGAS', 'USA');
 select * from AUTHOR;
 commit;
 
 insert into PUBLISHER values(1, 'PEARSON', 'NEW YORK', 'USA');
 insert into PUBLISHER values(2, 'EEE', 'NEW SOUTH VALES', 'USA');
 insert into PUBLISHER values(3, 'PHI', 'DELHI', 'INDIA');
 insert into PUBLISHER values(4, 'WILLEY', 'BERLIN', 'GERMANY');
 insert into PUBLISHER values(5, 'MGH', 'NEW YORK', 'USA');
 select * from PUBLISHER;
 commit;
 
 insert into CATEGORY values(1001,'COMPUTER SCIENCE');
 insert into CATEGORY values(1002, 'ALGORITHM DESIGN');
 insert into CATEGORY values(1003, 'ELECTRONICS');
 insert into CATEGORY values(1004, 'PROGRAMMING');
 insert into CATEGORY values(1005, 'OPERATING SYSTEMS');
 select * from CATEGORY;
 commit;
 
insert into CATALOG values(11,"unix system prg",1001,1,1001,2000,251);
insert into CATALOG values(12,"digital signals",1002,2,1003,2001,425);
insert into CATALOG values(13,"logic design",1003,3,1002,1999,225);
insert into CATALOG values(14,"server prg",1004,4,1004,2001,333);
insert into CATALOG values(15,"linux os",1005,5,1005,2003,326);
insert into CATALOG values(16,"c++ bible",1005,5,1001,2000,526);
insert into CATALOG values(17,"cobol landbook",1005,4,1001,2000,658);
select * from CATALOG;

insert into ORDERDETAILS values(1,11,5);
insert into ORDERDETAILS values(2,12,8);
insert into ORDERDETAILS values(3,13,15);
insert into ORDERDETAILS values(4,14,22);
insert into ORDERDETAILS values(5,15,3);
select * from ORDERDETAILS;

select A.aname,C.title,C.price from AUTHOR A,CATALOG C where C.authorid=A.authorid and C.cyear>=2000 and 
A.aname=(select A.aname from AUTHOR A,CATALOG C where A.authorid=C.authorid group by C.authorid having count(*)>=2);

select A.aname from AUTHOR A,CATALOG C,ORDERDETAILS O where O.bookid=C.bookid and A.authorid=C.authorid
 and O.bookid=(select bookid from ORDERDETAILS where quantity=(select max(quantity) from ORDERDETAILS));
 
 update CATALOG set price=price+(10*price/100)  where publisherid=3 ;
select * from CATALOG;
 
 
 
 
 
 

 
 
