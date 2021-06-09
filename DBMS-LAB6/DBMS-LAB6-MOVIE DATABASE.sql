create database movie;
use movie;

create table Actor(act_id integer primary key,act_name varchar(100),act_gender varchar(10));

create table Director(dir_id integer primary key,dir_name varchar(200),dir_phone varchar(100));

create table Movies(mov_id integer primary key,mov_title varchar(255),mov_year year,mov_lang varchar(100),
dir_id int, foreign key (dir_id) references Director(dir_id));

 create table Movie_cast (act_id int,foreign key (act_id) references Actor(act_id), mov_id int, foreign key(mov_id) references
 Movies(mov_id),role varchar(100), primary key(act_id,mov_id) );
 
 create table Rating(mov_id integer primary key , foreign key(mov_id) references Movies(mov_id),rev_stars integer);
 
 
 insert into Actor values
 (1001, 'Tom Crusie','M'),
 (1002, 'Chris Hemsworth','M'),
 (1003, 'Angelina Jolie','F'),
 (1004, 'Margot Robbie','F'),
 (1005, 'Kate Winslet','F'),
 (1006, 'Robert Downey','M');
 select* from Actor;
 
  insert into Director values
(9001, 'Hitchcock',9874562154),
(9002, 'Steven Spielberg',9874560054),
(9003, 'Joseph Levitan',9874562178),
(9004, 'Christopher Loyd',9874564454),
(9005, 'Yash Chopra',9874562994),
(9006, 'Tom Jones',9874503154);
select* from Director;

 insert into Movies values
(101,'Iron Man',2014,'English',9001),
(102,'Prosperity',2001,'Spanish',9001),
(103,'Spiderman',1998,'English',9002),
(104,'Star Wars',1999,'English',9003),
(105,'Thor',2017,'English',9002),
(106,'Captain America',1994,'English',9004);
select * from Movies;

 insert into Movie_cast values
 (1001,101,'Joey'),
 (1001,102,'Conor'),
 (1002,102,'Tim'),
 (1003,103,'Kate'),
 (1004,104,'Claire'),
 (1006,105,'Sally'),
 (1005,106,'Jo'),
 (1002,106,'Craft'),
 (1002,104,'Josh'),
 (1005,105,'Roy');
 select* from Movie_cast;
 
 insert into Rating values
 (101,4),
 (102,3),
 (103,5),
 (104,2),
 (105,4),
 (106,3);
 select* from Rating;
 
 select mov_title from Movies where dir_id in (select dir_id from Director where dir_name='Hitchcock');
 
  select distinct m.mov_title,c.act_id from Movies m, Movie_cast c where m.mov_id=c.mov_id and c.act_id in
  (select act_id from Movie_cast group by act_id having count(mov_id)>1);
  
  select act_name from Actor where act_id in(select a.act_id from (select act_id from Movie_cast natural join
  Movies where mov_year<2000)a inner join(select act_id from Movie_cast natural join
  Movies where mov_year>2015)b on a.act_id=b.act_id);
  
  select mov_title,max(rev_stars) from Movies m,Rating r where m.mov_id=r.mov_id group by m.mov_title having count(r.rev_stars)>0;
  
  update Rating set rev_stars=5 where mov_id in (select mov_id from Movies inner join Director on
  Movies.dir_id=Director.dir_id and Director.dir_name='Steven Spielberg');
  select * from Rating;
  
 
 
