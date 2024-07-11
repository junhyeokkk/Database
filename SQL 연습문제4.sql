# 날짜 : 2024/07/11
# 이름 : 최준혁
# 내용 : SQL 연습문제4
#4-1 데이터베이스, 사용자생성
CREATE DATABASE `Theater`;
CREATE USER 'theater'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON Theater.* TO 'theater'@'%';
FLUSH PRIVILEGES;

use `Theater`;
 #4-2 테이블 생성
 create table `Movies` (
	`movie_id` int auto_increment primary key,
    `title` varchar(30) not null,
    `genre` varchar(10) not null,
    `release_date` date not null
 );
 
 create table `Customers` (
	`customer_id` int auto_increment primary key,
    `name` varchar(20) not null,
    `email` varchar(50) not null,
    `phone` varchar(13) not null
 ); 

 create table `Bookings` (
	`booking_id` int not null,
    `customer_id` int not null,
    `movie_id` int not null,
    `num_tickets` int not null,
    `booking_date` datetime not null
);

#4-3 데이터입력
insert into `Movies` (`title`,`genre`,`release_date`) values ('쇼생크의 탈출','드라마','1994-10-14');
insert into `Movies` (`title`,`genre`,`release_date`) values ('타이타닉','로맨스','1997-03-24');
insert into `Movies` (`title`,`genre`,`release_date`) values ('탑건','액션','1987-07-16');
insert into `Movies` (`title`,`genre`,`release_date`) values ('쥬라기공원','액션','1994-02-11');
insert into `Movies` (`title`,`genre`,`release_date`) values ('클래디에이터','액션','2000-05-03');
insert into `Movies` (`title`,`genre`,`release_date`) values ('시네마천국','드라마','1995-04-12');
insert into `Movies` (`title`,`genre`,`release_date`) values ('미션임파서블','액션','1995-11-11');
insert into `Movies` (`title`,`genre`,`release_date`) values ('노트북','로맨스','2003-08-23');
insert into `Movies` (`title`,`genre`,`release_date`) values ('인터스텔라','SF','2011-05-26');
insert into `Movies` (`title`,`genre`,`release_date`) values ('아바타','SF','2010-02-10');

insert into `Customers` (`name`,`email`,`phone`) values ('김유신','kys@example.com','010-1234-1001');
insert into `Customers` (`name`,`email`,`phone`) values ('김춘추','kcc@example.com','010-1234-1002');
insert into `Customers` (`name`,`email`,`phone`) values ('장보고','jbg@example.com','010-1234-1003');
insert into `Customers` (`name`,`email`,`phone`) values ('강감찬','kgc@example.com','010-1234-1004');
insert into `Customers` (`name`,`email`,`phone`) values ('이순신','lss@example.com','010-1234-1005');

insert into `Bookings` values (101,1,1,2,'2023-01-10 00:00:00');
insert into `Bookings` values (102,2,2,3,'2023-01-11 00:00:00');
insert into `Bookings` values (103,3,2,2,'2023-01-13 00:00:00');
insert into `Bookings` values (104,4,3,1,'2023-01-17 00:00:00');
insert into `Bookings` values (105,5,5,2,'2023-01-21 00:00:00');
insert into `Bookings` values (106,3,8,2,'2023-01-21 00:00:00');
insert into `Bookings` values (107,1,10,4,'2023-01-21 00:00:00');
insert into `Bookings` values (108,2,9,1,'2023-01-22 00:00:00');
insert into `Bookings` values (109,5,7,2,'2023-01-23 00:00:00');
insert into `Bookings` values (110,3,4,2,'2023-01-23 00:00:00');
insert into `Bookings` values (111,1,6,1,'2023-01-24 00:00:00');
insert into `Bookings` values (112,3,5,3,'2023-01-25 00:00:00');

#4-4 모든 영화 제목을 조회하시오
select `title` from `Movies`;

#4-5 '로맨스' 장르의 모든 영화 제목을 조회하시오
select * from `Movies` where `genre` = '로맨스';

#4-6 개봉일이 2010년 이후인 모든 영화의 제목과 개봉일을 조회하시오
select
	`title`,
    `release_date`
from `Movies` where `release_date` >= '2010-01-01';

#4-7 예매된 티켓 수가 3장 이상인 예약 ID와 예약일자를 조회하시오
select
	`booking_id`, `booking_date`
from `Bookings` where `num_tickets` >=3;

#4-8 예약일자가 `2023-01-20` 이전 예약 ID와 고객 ID를 조회하시오
select * from `Bookings` where `booking_date` < '2023-01-20';

#4-9 90년대 영화를 조회하시오
select * from `Movies` where`release_date` between '1990-01-01' and '1999-12-31';

#4-10 가장 최근에 이루어진 예매 3건의 예약 ID와 예약일자를 조회하시오
select * from `Bookings`
	order by `booking_date` desc
limit 3;
    
#4-11 개봉일이 가장 오래된 영화의 제목과 개봉일을 조회하시오
select 
	`title`, `release_date`
from `Movies`
order by `release_date` asc
limit 1;

#4-12 '액션' 장르의 영화 제목과 개봉일을 문자열 결합하여 조회하고, 제목에 '공원'이 포함된 
# 		영화만 선택하여 개봉일 기준 오름차순으로 정렬한 후, 상위 1개만 조회하시오
select
	concat(`title`, ' - ',`release_date`) as 'movie_info'
from `Movies`
where `title` like '%공원%' and `genre` = '액션'
order by `release_date` asc
limit 1;

#4-13 고객 ID가 2인 고객이 한 예매의 예약일자와 예매한 영화 제목을 함께 조회하시오
select `booking_date`, `title`
from `Bookings`
join `Movies`
using (`movie_id`)
where `customer_id` = 2;

#4-14 영화를 예매한 고객 이름, 휴대폰, 예매일자, 예매한 영화 제목을 조회하시오
select	
	C.`name`,
    C.`Phone`,
    B.`booking_date`,
    M.`title`
FROM bookings B
JOIN Customers C ON B.`customer_id` = C.`customer_id`
JOIN Movies M ON B.`movie_id` = M.`movie_id`;

#4-15 장르별로 평균 예매 티켓 수를 조회하시오
SELECT
	M.`genre`,
AVG(B.`num_tickets`) AS avg_tickets
FROM bookings B
JOIN Movies M ON B.`movie_id` = M.`movie_id`
group by `genre`;

#4-16 고객별 평균 예매 티켓 수를 조회하시오
SELECT
	C.`name`,
	AVG(B.`num_tickets`) AS avg_tickets
FROM Bookings B
JOIN Customers C ON B.`customer_id` = C.`customer_id`
group by `name`;

#4-17 고객별 전체 예매 티켓 수가 가장 많은 고객순으로 이름과, 전체 티켓 수를 조회하시오
select
	C.`name`,
    sum(B.`num_tickets`) as `전체 예매 티켓 수`
from `Bookings` as B
join `Customers` C on B.`customer_id` = C.`customer_id`
group by `name`
order by `전체 예매 티켓 수` desc;

#4-18 예매일자가 가장 오래된 예매번호, 영화번호, 고객이름, 예매일을 조회하시오
select
	`booking_id`,
    `movie_id`,
    `name`,
    `booking_date`
from `Bookings` B
join `Customers` C on B.`customer_id`= C.`customer_id`
order by B.`booking_date` asc
limit 1;

#4-19 각 영화의 장르별로 개봉일이 가장 최근인 영화의 제목을 조회하시오
select
	`genre`, `title`, `release_date`
from `Movies`
where (`genre`,`release_date`) 
in (select `genre`, max(`release_date`)
	from `Movies`
    group by `genre`);
    
#4-20 '김유신' 고객이 예매한 모든 영화정보를 조회하시오
select * from `Movies`
where `movie_id` in (
	select `movie_id` from `Bookings`
    where `customer_id` = 
    (select `customer_id` from `Customers` where `name` = '김유신'));
    
#4-21 예매한 영화 중 가장 많은 티켓을 예매한 고객의 이름과 이메일 조회하시오
select 
	`name`,`email` 
from `Customers`
where `customer_id` = (
	select `customer_id`
    from `Bookings`
    group by `customer_id`
    order by sum(`num_tickets`) desc
	limit 1
);

#4-22 예약된 티켓 수가 평균 예매 티켓 수보다 많은 예매정보를 조회하시오
select * from `Bookings`
where `num_tickets` > (select avg(`num_tickets`) from `Bookings`);

#4-23 각 영화별로 예매된 총 티켓 수를 조회하시오
select
	M.`title`, 
    sum(B.`num_tickets`) as `total_tickets`
from `Bookings` B
join `Movies` M on B.`movie_id` = M.`movie_id`
group by M.`title`;

#4-24 각 고객별로 예매한 총 티켓 수와 평균 티켓 수를 조회하시오
select
	c.`name`,
    sum(b.`num_tickets`) as `total_tickets`,
    avg(b.`num_tickets`) as `avg_tickets`
from `Bookings` b
join `Customers` c on b.`customer_id` = c.`customer_id`
group by `name`;

#4-25 예매 티켓 수가 가장 많은 고객의 아이디와 이름, 이메일을 조회하시오
select
	c.`customer_id`,
    c.`name`,
    c.`email`,
    sum(b.`num_tickets`) as `예매 티켓수`
from `Bookings` b
join `Customers` c on b.`customer_id` = c.`customer_id`
group by `customer_id`
order by `예매 티켓수` desc;

#4-26 예매된 티켓 수가 가장 큰 순서로 고객명, 영화제목, 예매 티켓수, 예매일을 조회하시오
select
	c.`name`,
    m.`title`,
    b.`num_tickets`,
    b.`booking_date`
from `Bookings` b
join `Customers` c on b.`customer_id` = c.`customer_id`
join `Movies` m on b.`movie_id` = m.`movie_id`
order by `num_tickets` desc;

#4-27 장르가 '액션'이고 평균 예매 티켓 수가 가장 높은 순으로 영화의 제목을 조회하시오
select
	M.`title`,
    M.`genre`,
    sum(B.`num_tickets`) as `예매 티켓 수`,
    avg(B.`num_tickets`) as `평균 티켓 수`
from `Bookings` B
join `Movies` M on B.`movie_id` = M.`movie_id`
where M.`genre` = '액션'
group by M.`title`
order by `평균 티켓 수` desc;

#4-28 회원별 예매 티켓 수가 큰 순서로 고객아이디, 고객명, 티켓 총합 조회하시오
select 
	B.`customer_id`,
    C.`name`,
    sum(`num_tickets`) as `ticket_total`
from `Bookings` B
join `Customers` C on B.`customer_id` = C.`customer_id`
group by `customer_id`
order by `ticket_total` desc;

#4-29 각 영화별로 예약된 티켓 수가 가장 많은 예매ID, 고객ID, 최대 티켓 수를 조회하시오
select 
	B.`booking_id`,
    B.`customer_id`,
    B.`movie_id`,
    MaxTickets.max_tickets
from `Bookings` B
join (
	select `movie_id`, max(`num_tickets`) as `max_tickets`
    from `Bookings`
    group by `movie_id`
) as `MaxTickets`
on B.`movie_id` = `MaxTickets`.`movie_id` and 
B.`num_tickets` = `MaxTickets`.`max_tickets`;

#4-30 각 장르별로 예매 티켓 수가 가장 많은 영화정보의 예매번호, 고객아이디, 고객명,
#	  영화 제목, 장르, 예매 티켓 수 조회하시오 단 예매 티켓 수로 내림차순 정렬
select
	B.`booking_id`,
    B.`customer_id`,
    C.`name`,
    M.`title`,
    M.`genre`,
    sum(B.`num_tickets`) as `예매 티켓 수`
from `Bookings` B
join `Movies` M on B.`movie_id` = M.`movie_id`
join `Customers` C on B.`customer_id` = C.`customer_id`
group by M.`title`
having `예매 티켓 수` = (
		select max(`total_tickets`)
        from (
				select sum(B2.`num_tickets`) as `total_tickets`
                from `Bookings` B2
                join `Movies` M2 on B2.`movie_id` = M2.`movie_id`
                where M2.`genre` = M.`genre`
                group by M2.`title`
			) as SelectMax
		)
order by `예매 티켓 수` desc;

SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';                