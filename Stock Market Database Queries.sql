create database miniproject;

create table security(
security_id int,
peer_security_id int,
stock varchar(40) NOT NULL,
unique(stock),
current_price numeric(10,2),
check(current_price != 0),
benchmark varchar(30),
primary key(security_id),
foreign key (peer_security_id) references security(security_id));

create table insitutional_investor(
ISIN_No int,
unique(ISIN_NO),
investor varchar(40) NOT NULL,
category char(4),
primary key(ISIN_No));

create table trade(
order_no numeric(5,0),
security_id int,
qty int,
transaction_date date,
amount numeric(10,2),
check(amount > 0),
primary key (order_no),
foreign key(security_id) references security);

create table contract_note(
contract_id varchar(15),
order_no numeric(5,0),
ISIN_No int,
primary key (contract_id),
foreign key (order_no) references trade,
foreign key (ISIN_No) references insitutional_investor);

create table types(
venture_id int,
security_id int,
financial_venture varchar(60),
type varchar(10),
primary key (venture_id),
foreign key(security_id) references security);

drop table types;
drop table contract_note;
drop table indices;
drop table insitutional_investor;
drop table trade;
drop table security;

insert into security values(500790, NULL,'Nestle India Ltd', 19827.70,'CNXFMCG');
insert into security values(500570,NULL,'Tata Motors Ltd', 469.25,'NIFTYJR');
insert into security values(500209,500790,'Infosys Ltd', 1621.56,'CNXIT');
insert into security values(500112,500209,'State Bank of India', 540.67,'BANKNIFTY');
insert into security values(500325,500112,'Reliance Industries Ltd', 2546.45,'NIFTY50');
insert into security values(532450,500570,'Eicher Motors Ltd', 2354.00,'NIFTYAUTO');
insert into security values(532500,532450,'Maruti Suzuki India Ltd', 1621.56,'NIFTY50');

insert into insitutional_investor values(4823 ,'Invesco','FII');
insert into insitutional_investor values(6721 ,'BlackStone','FII');
insert into insitutional_investor values(1153 ,'Star Health Insurance','DII');
insert into insitutional_investor values(5640 ,'Life Insurance Corporation Of India','DII');
insert into insitutional_investor values(9080 ,'Morgan Stanley','FII');

insert into trade values(1150,'500209',45,'2021-09-12',72970.20); --2021 09 12
insert into trade values(2340,'500570',78,'2020-10-28',36601.50); --2020 10 28
insert into trade values(7865,'532500',90,'2022-02-05',145940.40); --2022 02 05
insert into trade values(9087,'500790',114,'2019-04-19',2260357.80); --2019 04 19
insert into trade values(2311,'500112',789,'2020-06-12',426588.63); --2020 06 12
insert into trade values(6500,'500325',980,'2021-08-29',2495521); --2021 08 29
insert into trade values(5657,'500570',230,'2022-03-14',107927.50); --2022 03 14
insert into trade values(4377,'532500',56,'2020-05-16',90807.36); --2020 05 16

insert into contract_note values('45B21',4377,4823);
insert into contract_note values('672J1',5657,5640);
insert into contract_note values('9DR34',6500,9080);
insert into contract_note values('VB646',2311,1153);
insert into contract_note values('M7K21',9087,4823);
insert into contract_note values('I2333',7865,6721);
insert into contract_note values('9001S',2340,9080);
insert into contract_note values('89HJ1',1150,1153);

insert into types values(1231,'500112','ACCEL PARTNERS','Defensive');
insert into types values(1441,'500209','SEQUOIA CAPITAL','Growth');
insert into types values(1354,'500325','NEXUS VENTURE PARTNERS','Growth');
insert into types values(1900,'500570','KALAARI CAPITAL','Dividend');
insert into types values(1261,'500790','BLUME VENTURES','Cyclical');
insert into types values(1333,'532500','CHIRATAE VENTURES','Value');
insert into types values(1932,'532450','MORGAN STANLEY','Growth');
insert into types values(2025,'500325','GOLDMAN SACHS','Aggressive');
insert into types values(1111,'532450','FOUR SQUARE CAPITAL','Cyclical');


select *
from security;

select *
from insitutional_investor;

select *
from trade;

select *
from types;

select *
from contract_note;


