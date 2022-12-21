create database Shop;
use Shop;

create table suppliers
(
sid int primary key,
sname varchar(20),
city varchar(20)
);
create table parts
(
pid int primary key,
pname varchar(20),
color varchar(10)
);
create table catalog
(
sid int,
pid int,
foreign key(sid)references suppliers(sid),
foreign key(pid) references parts(pid),
cost float,
primary key(sid, pid)
);

insert into suppliers values(10001, "Acme Widget","Bangalore"),
	(10002, "Johns","Kolkata"),
	(10003,"Vimal","Mumbai"),
	(10004,"Reliance","Delhi"),
	(10005,"Mahindra","Mumbai");
  
 insert into parts values(20001,"Book","Red"),
	(20002,"Pen","Red"),
	(20003,"Pencil","Green"),
	(20004,"Mobile","Green"),
	(20005,"Charger","Black");
 
insert into catalog values(10001, 20001,10),
	(10001, 20002,10),
	(10001, 20003,30),
	(10001, 20004,10),
	(10001, 20005,10),
	(10002, 20001,10),
	(10002, 20002,20),
	(10003, 20003,30),
	(10004, 20003,40);
    
    
  --   1.find pnames  of parts for which there is some supplier
  select distinct pname from parts,catalog
  where parts.pid=catalog.pid;
  
 --  2 find the snames of suppliers who supply every part
    select s.sname
	from suppliers s
	where((select count(p.pid)from parts p)=(select count(c.pid)from catalog c where c.sid=s.sid));
    
    
--  3.Find the snames of suppliers who supply every red part.
    select distinct s.sname
	from catalog c,parts p,suppliers s
	where s.sid=c.sid and p.pid=c.pid and color="Red";
    
--     4.	Find the pnames of parts supplied by Acme Widget Suppliers and by no one else.
     select pname
	from parts P,Catalog c,suppliers s
	where p.pid=c.pid and c.sid=s.sid and s.sname ="Acme Widget"
	and not exists(select *
                from catalog c1,suppliers s1
                where p.pid=c1.pid and c1.sid=s1.sid and s1.sname <> "Acme Widget");
                
-- 	6.Find the sids of suppliers who charge more for some part than the average  cost of that part (averaged over all the suppliers who supply that part).
  select distinct c.sid
	from catalog c
	where c.cost>(select avg(c1.cost)
               from catalog c1
               where c1.pid=c.pid);
-- 75.	For each part, find the sname of the supplier who charges the most for that part.
 select p.pid,s.sname
	from suppliers s,catalog c,parts p
	where c.pid=p.pid and s.sid=c.sid and c.cost=(select max(c1.cost)
                                               from catalog c1
                                               where c1.pid=p.pid)
                                               order by s.sname;



    
