create database lic;
use lic;
create table person
(driver_id char(10),
name varchar(10),
address varchar(25),
primary key(driver_id)
);
create table car
(reg_num char(10),
year year,
model varchar(10),
primary key(reg_num)
);
create table owns
(driver_id char(10),
reg_num char(10),
primary key(driver_id,reg_num),
foreign key(driver_id) references person(driver_id) on delete cascade,
foreign key(reg_num) references car(reg_num) on delete cascade);
create table accident
(report_num int,
accident_date date,
location varchar(10),
primary key(report_num));
create table participated
(driver_id char(10),
reg_num char(10),
report_num int,
damage_amount int,
primary key(driver_id,reg_num,report_num),
foreign  key(driver_id) references person(driver_id) on delete cascade,
foreign  key(reg_num) references car(reg_num) on delete cascade,
foreign  key(report_num) references accident(report_num) on delete cascade);
insert into person values('A01','richard','srinivas nagar'),('A02','pradeep','rajajinagar'),('A03','smith','ashoknagar'),
('A04','venu','n r colony'),('A05','john','hanumanth nagar');
insert into car (reg_num,model,year) values('KA052250','Indica','1990'),('KA031181','Lancer','1957'),
('KA095477','toyota',1998),('KA053408','Honda','2008'),('KA041702','Audi','2005');
insert into owns values('A01','KA052250'),('A02','KA031181'),('A03','KA095477'),
('A04','KA053408'),('A05','KA041702');
insert into accident values('11','2004-01-01','mysore'),('12','2005-03-13','south'),
('13','2006-03-23','bull'),('14','2005-03-12','mysore'),('15','2007-07-23','kanakpur');
insert into participated values('A01','KA052250','11','10000'),('A02','KA031181','12','50000'),
('A03','KA095477','13','25000'),('A04','KA053408','14','3000'),('A05','KA041702','15','5000');
-- select *from accident
-- where report_num in(select report_num from participated 
-- where damage_amount>(select avg(damage_amount) from participated)) and location='bull';

-- select avg(damage_amount) from participated;
-- -- select count(*) from person
-- -- -- where damage_amount>(select avg(damage_amount) from participated);

-- select location as place
-- from accident
-- where report_num in(select report_num from participated where damage_amount>10000);

select max(damage_amount) as major_damage from participated;