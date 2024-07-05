#날짜 : 2024/07/23
#이름 : 최준혁	
#내용 : 4장 SQL 고급

#실습 4-1
create table `Member`(
	`uid` varchar(10) primary key,
    `name` varchar(10) not null,
    `hp` varchar(13) unique not null,
    `pos` varchar(10) default '사원' not null,
    `dep` tinyint,
    `rdate` datetime not null
);

create table `Department` (
	`depNo` int primary key not null,
    `name` varchar(10) not null,
	`tel` varchar(12) not null
);

create table `Sales` (
	`seq` int primary key auto_increment,
	`uid` varchar(10) not null,
    `year` year not null,
    `month` tinyint,
    `sale` int
);

drop table `sales`;
#실습 4-2
insert into `Member` values('a101','박혁거세','010-1234-1001','부장',101,'2020-11-19 11:39:48');
insert into `Member` values('a102','김유신','010-1234-1002','차장',101,'2020-11-19 11:39:48');
insert into `Member` values('a103','김춘추','010-1234-1003','사원',101,'2020-11-19 11:39:48');
insert into `Member` values('a104','장보고','010-1234-1004','대리',102,'2020-11-19 11:39:48');
insert into `Member` values('a105','강감찬','010-1234-1005','과장',102,'2020-11-19 11:39:48');
insert into `Member` values('a106','이성계','010-1234-1006','차장',103,'2020-11-19 11:39:48');
insert into `Member` values('a107','정철','010-1234-1007','차장',103,'2020-11-19 11:39:48');
insert into `Member` values('a108','이순신','010-1234-1008','부장',104,'2020-11-19 11:39:48');
insert into `Member` values('a109','허균','010-1234-1009','부장',104,'2020-11-19 11:39:48');
insert into `Member` values('a110','정약용','010-1234-1010','사원',105,'2020-11-19 11:39:48');
insert into `Member` values('a111','박지원','010-1234-1011','사원',105,'2020-11-19 11:39:48');

insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a101','2018',1,98100);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a102','2018',1,136000);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a103','2018',1,80100);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a104','2018',1,78000);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a105','2018',1,93000);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a101','2018',2,23500);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a102','2018',2,126000);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a103','2018',2,18500);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a105','2018',2,19000);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a106','2018',2,53000);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a101','2019',1,24000);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a102','2019',1,109000);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a103','2019',1,101000);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a104','2019',1,53500);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a107','2019',1,24000);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a102','2019',2,160000);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a103','2019',2,101000);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a104','2019',2,43000);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a105','2019',2,24000);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a106','2019',2,109000);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a102','2020',1,201000);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a104','2020',1,63000);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a105','2020',1,74000);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a106','2020',1,122000);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a107','2020',1,111000);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a102','2020',2,120000);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a103','2020',2,93000);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a104','2020',2,84000);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a105','2020',2,180000);
insert into `Sales`(`uid`,`year`,`month`,`sale`) values('a108','2020',2,76000);


insert into `Department` values('101','영업1부','051-512-1001');
insert into `Department` values('102','영업2부','051-512-1002');
insert into `Department` values('103','영업3부','051-512-1003');
insert into `Department` values('104','영업4부','051-512-1004');
insert into `Department` values('105','영업5부','051-512-1005');
insert into `Department` values('106','영업지원부','051-512-1006');
insert into `Department` values('107','인사부','051-512-1007');

#실습 4-3
select * from `Member` where `name`='김유신';
select * from `Member` where `pos`='차장' and dep=101;
select * from `Member` where `pos`='차장' or dep=101;
select * from `Member` where `name`!='김춘추';
select * from `Member` where `name`<>'김춘추';
select * from `Member` where `pos`='사원' or `pos`='대리';
select * from `Member` where `pos` in('사원', '대리');
select * from `Member` where `dep` in(101, 102, 103);
select * from `Member` where `name` like '%신';
select * from `Member` where `name` like '김%';
select * from `Member` where `name` like '김__';
select * from `Member` where `name` like '_성_';
select * from `Member` where `name` like '정_';
select * from `Sales` where `sale`>50000;
select * from `Sales` where `sale`>=50000 and `sale`<100000 and `month`=1;
select * from `Sales` where `sale` between 50000 and 100000;
select * from `Sales` where `sale` not between 50000 and 100000;
select * from `Sales` where `year` in(2020);
select * from `Sales` where `month` in(1, 2);

#실습 4-4
select * from `Sales` order by `Sale`;
select * from `Sales` order by `Sale` asc;
select * from `Sales` order by `Sale` desc;
select * from `Member` order by `name`;
select * from `Member` order by `name` desc;
select * from `Member` order by `name` asc;
select * from `Member` order by `rdate` asc;
select * from `Sales` where `sale` > 50000 order by `sale` desc;
select * from `Sales` where `sale` > 50000 order by `year`,`month`,`sale` desc;

#실습 4-5
select * from Sales limit 3;
select * from Sales limit 0, 3;
select * from Sales limit 1, 2;
select * from Sales limit 5, 3;
select * from Sales order by `sale` desc limit 3, 5;
select * from Sales where `sale` < 50000 order by `sale` desc limit 3;
select * from Sales where `sale` > 50000 order by `year` desc, `month`, `sale` desc limit 5;

#실습 4-6 
select sum(sale) as '합계' from `Sales`;
select avg(sale) as '평균' from `Sales`;
select max(sale) as '최대값' from `Sales`;
select min(sale) as '최소값' from `Sales`;
select ceiling(1.2);
select ceiling(1.8);
select floor(1.2);
select floor(1.8);
select round(1.2);
select round(1.8);
select rand();
select ceiling(rand() * 10);
select count(sale) as '갯수' from `Sales`;
select count(*) as '갯수' from `Sales`;

select left('HelloWorld', 5);
select right('HelloWorld', 5);
select substring('HelloWorld', 6 ,5);
select concat(`uid`, `name`, `hp`) from `member` where `uid`='a108';
select curdate();
select curtime();
select now();
insert into `Member` values('a112','유관순','010-1234-1012','대리',107,now());

#실습 4-7 2018년 1월 매출의 총합
select sum(`sale`) as '1월매출총합' from `Sales` where month = 1;

#실습 4-8 2019년 2월에 5만원 이상 매출에 대한 총합과 평균을 구하시오
select sum(`sale`) as '총합' , avg(`sale`) as '평균' from `Sales` where sale >= 50000 and month = 2;

#실습 4-9 2020년 전체 매출 가운대 최저, 최고, 매출을 구하시오
select min(`sale`) as '최저매출', max(`sale`) '최고매출' from `Sales` where year = 2020;

#실습 4-10 
select * from `sales`;
SELECT * FROM `Sales` GROUP BY `uid`;
SELECT * FROM `Sales` GROUP BY `year`;
SELECT * FROM `Sales` GROUP BY `uid`, `year`;
SELECT `uid`, COUNT(*) AS `건수` FROM `Sales` GROUP BY `uid`;
SELECT `uid`, SUM(sale) AS `합계` FROM `Sales` GROUP BY `uid`;
SELECT `uid`, AVG(sale) AS `평균` FROM `Sales` GROUP BY `uid`;

SELECT `uid`, `year`, SUM(sale) AS `합계`
FROM `Sales`
GROUP BY `uid`, `year`;

SELECT `uid`, `year`, SUM(sale) AS `합계`
FROM `Sales`
GROUP BY `uid`, `year`
ORDER BY `year` ASC, `합계` DESC;

SELECT `uid`, `year`, SUM(sale) AS `합계`
FROM `Sales`
WHERE `sale` >= 50000
GROUP BY `uid`, `year`
ORDER BY `합계` DESC;

#실습 4-11
select `uid`, sum(`sale`) as '합계' from `sales`
group by `uid`
having `합계` >= 200000;

select `uid` , `year`, sum(sale) as '합계'
from `sales` where `sale` >= 100000
group by `uid`, `year`
having `합계` >= 200000
order by `합계` desc;
