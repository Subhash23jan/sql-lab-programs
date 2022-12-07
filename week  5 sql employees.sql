create database employee;
use employee;

create table dept
(dname varchar(30),
deptno varchar(10) primary key,
dloc varchar(30));

create table project
(pno int primary key,
ploc varchar(30),
pname varchar(20));

create table employees
(empno varchar(20) primary key,
ename varchar(20),
mgrno varchar(20),
hiredate date,
sal int,
deptno varchar(30),
foreign key(deptno) references dept(deptno) on delete cascade);

create table assigned
(empno varchar(20),
pno int,
jobrole varchar(30),
foreign key(empno) references employees(empno) on delete cascade,
foreign key(pno) references project(pno) on delete cascade);

create table incentives
(empno varchar(20),
incentive_date date primary key,
incentive_amount int,
foreign key(empno) references employees(empno) on delete cascade);

select *from project;
insert into dept values('Human_Resource','1','bangalore'),('Software','2','hyderbad'),('Finance','3','mysore'),('Operations_management','4','chennai'),('Marketing','5','udupi'),('Research','6','mangalore');
insert into project values(1,'bangalore','abc'),(2,'delhi','xyz'),(3,'hyderbad','ghi'),(4,'udupi','jkl'),(5,'mangalore','mno'),(6,'mumbai','pqr');
insert into employees values('e1','Sushanth','m1','2010-01-11',5000,1),('e2','mark','m1','2013-05-03',10000,2),
                            ('e3','jef bezos','m2','2014-03-13',3000,3),('e4','elon musk','m2','2015-03-02',6000,4),('e5','harry','m3','2013-07-20',5000,5)
                            ,('e6','bill gates','m4','2020-02-02',8900,6);
                            insert into employees values('e7','vignesh','m4','2020-01-01',2000,2),('e8','shashank','m3','2009-02-03',4000,2);
insert into assigned values('e1',1,'controller'),('e2',2,'technician'),('e3',3,'ca'),('e4',4,'supervisor'),('e5',5,'advertizer'),('e6',6,'scientist');
insert into assigned values('e7',1,'utilizer'),('e8',3,'mainperson');
insert into incentives values('e1','2022-01-18',3000),('e2','2021-01-01',2300),('e3','2022-01-10',3400);
insert into incentives values('e4','2014-09-09',0);

-- select empno from employees
-- where empno in(select empno from assigned where pno in (select pno from project where ploc in('bangalore' ,'hyderbad' ,'mysore')));

-- select e.empno from employees e  left outer join
--  incentives i on i.empno=e.empno
--  where i.empno is null or i.incentive_amount=0;


-- select e.ename,a.empno,d.dname,a.jobrole,d.dloc,p.ploc
-- from employees e,assigned a, dept d,project p
-- where e.deptno=d.deptno and e.empno=a.empno and a.pno=p.pno and p.ploc=d.dloc;

