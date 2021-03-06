create database banking_enterprise;

use banking_enterprise;

create table branch(branch_name varchar(20) primary key,branch_city varchar(20),assets real);

create table accounts(acc_no int primary key,branch_name varchar(20),balance real, foreign key(branch_name) 
references branch(branch_name) on delete cascade);

create table customer(customer_name varchar(20) primary key,customer_street varchar(20),customer_city varchar(20));

create table depositor(customer_name varchar(20),acc_no int,
foreign key(customer_name) references customer(customer_name) on delete cascade,
foreign key(acc_no) references accounts(acc_no) on delete cascade);

create table loan(loan_number int primary key,branch_name varchar(20),amount int,
foreign key(branch_name) references branch(branch_name) on delete cascade);

create table borrower(customer_name varchar(20),loan_number int,
foreign key(customer_name) references customer(customer_name) on delete cascade,
foreign key(loan_number) references loan(loan_number) on delete cascade);
show tables;
 

insert into branch values("SBI PD Nagar","Bangalore",200000);
insert into branch values("SBI Rajaji Nagar","Bangalore",500000);
insert into branch values("SBI Jayanagar","Delhi",660000);
insert into branch values("SBI Vijay Nagar","Chennai",870000);
insert into branch values("SBI Hosakerehalli","Bangalore",550000);
select * from branch;

insert into accounts values(11,"SBI Hosakerehalli",5000);
insert into accounts values(22,"SBI Vijay Nagar",5000);
insert into accounts values(33,"SBI Jayanagar",5000);
insert into accounts values(44,"SBI Rajaji Nagar",10000);
insert into accounts values(55,"SBI Vijay Nagar",40000);
insert into accounts values(66,"SBI PD Nagar",4000);
insert into accounts values(77,"SBI PD Nagar",40000);
insert into accounts values(88,"SBI Rajaji Nagar",4000);
select * from accounts;

insert into customer values("Kezar","MG road","Bangalore");
insert into customer values("Lal Krishna","ST MKS road","Bangalore");
insert into customer values("Rahul","Augsten road","Bangalore");
insert into customer values("Lallu","V S road","Bangalore");
insert into customer values("Faizal","Resedency road","Bangalore");
insert into customer values("Rajeev","Dicknsn road","Bangalore");
select * from customer;

insert into depositor values("Rahul",11);
insert into depositor values("Lallu",22);
insert into depositor values("Rahul",33);
insert into depositor values("Faizal",44);
insert into depositor values("Lallu",55);
insert into depositor values("Kezar",66);
insert into depositor values("Rajeev",77);
insert into depositor values("Lal Krishna",88);
select * from depositor;


insert into loan values(10011,"SBI Jayanagar",10000);
insert into loan values(10012,"SBI Vijay Nagar",5000);
insert into loan values(10013,"SBI Hosakerehalli",20000);
insert into loan values(10014,"SBI PD Nagar",15000);
insert into loan values(10015,"SBI Rajaji Nagar",25000);
select * from loan;

insert into borrower values("Kezar",10011);
insert into borrower values("Lal Krishna",10012);
insert into borrower values("Rahul",10013);
insert into borrower values("Lallu",10014);
insert into borrower values("Lal Krishna",10015);
select * from borrower;

-- iii) Find all the customers who have at least two accounts at the Main branch.
select d.customer_name from depositor d,accounts a where d.acc_no=a.acc_no and a.branch_name="SBI Vijay Nagar"
group by d.customer_name having count(d.customer_name>=2);

-- iv) Find all the customers who have an account at all the
-- branches located in a specific city.
select customer_name from depositor
join accounts on accounts.acc_no = depositor.acc_no
join branch on branch.branch_name = accounts.branch_name
where branch.branch_city = "Bangalore"
GROUP BY depositor.customer_name; 


-- v) Demonstrate how you delete all account tuples at every
-- branch located in a specific city.
delete from accounts where branch_name in
(select branch_name from branch where branch_city="delhi");
select * from accounts;