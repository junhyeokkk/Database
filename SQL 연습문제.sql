#날짜 : 2024/07/08
#이름 : 최준혁
#내용 : SQL 연습문제

#1-1 실습 데이터베이스와 사용자를 생성하시오
create database `shop`;
create user `shop`@'%' identified by '1234';
grant all privileges on shop.* to 'shop'@'%';
flush privileges;

use `shop`;

#1-2 테이블 생성
create table `customer` (
	`custId` varchar(10) primary key,
    `name` varchar(10) not null,
    `hp` varchar(13) unique,
    `addr` varchar(100),
    `rdate` date not null
);

create table `product` (
	`prodNo` int primary key,
    `proName` varchar(10) not null,
    `stock` int default 0 not null,
    `price` int,
    `company` varchar(20) not null
);

create table `order` (
	`orderNo` int auto_increment primary key,
    `orderId` varchar(10) not null,
    `orderProduct` int not null,
    `orderCount` int not null default 1,
    `orderDate` datetime not null
);

#1-3 데이터 삽입
insert into `customer` values ('c101', '김유신', '010-1234-1001', '김해시 봉황동', '2022-01-01');
insert into `customer` values ('c102', '김춘추', '010-1234-1002', '경주시 보문동', '2022-01-02');
insert into `customer` values ('c103', '장보고', '010-1234-1003', '완도군 청산면', '2022-01-03');
insert into `customer` values ('c104', '강감찬', '010-1234-1004', '서울시 마포구', '2022-01-04');
insert into `customer` (`custId`, `name`, `rdate`) values ('c105', '이성계','2022-01-05');
insert into `customer` values ('c106', '정철', '010-1234-1006', '경기도 용인시', '2022-01-06');
insert into `customer` (`custId`, `name`, `rdate`) values ('c107', '허준', '2022-01-07');
insert into `customer` values ('c108', '이순신', '010-1234-1008', '서울시 영등포구', '2022-01-08');
insert into `customer` values ('c109', '송상현', '010-1234-1009', '부산시 동래구', '2022-01-09');
insert into `customer` values ('c110', '정약용', '010-1234-1010', '경기도 광주시', '2022-01-10');

insert into `product` (`prodNo`, `proName`, `stock`, `price`, `company`) values (1, '새우깡', 5000, 1500, '농심');
insert into `product` (`prodNo`,`proName`, `stock`, `price`, `company`) values (2, '초코파이', 2500, 2500, '오리온');
insert into `product` (`prodNo`,`proName`, `stock`, `price`, `company`) values (3, '포카칩', 3600, 1700, '오리온');
insert into `product` (`prodNo`,`proName`, `stock`, `price`, `company`) values (4, '양파링', 1250, 1800, '농심');
insert into `product` (`prodNo`,`proName`, `stock`, `company`) values (5, '죠리퐁', 2200, '크라운');
insert into `product` (`prodNo`,`proName`, `stock`, `price`, `company`) values (6, '마카렛트', 3500, 3500, '롯데');
insert into `product` (`prodNo`,`proName`, `stock`, `price`, `company`) values (7, '뿌셔뿌셔', 1650, 1200, '오뚜기');

insert into `order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`)
 values ('c102', 3, 2, '2022-07-01 13:15:10');
insert into `order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`)
 values ('c101', 4, 1, '2022-07-01 14:16:11');
insert into `order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`)
 values ('c108', 1, 1, '2022-07-01 17:23:18');
insert into `order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`)
 values ('c109', 6, 5, '2022-07-02 10:46:36');
insert into `order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`)
 values ('c102', 2, 1, '2022-07-03 09:15:37');
insert into `order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`)
 values ('c101', 7, 3, '2022-07-03 12:35:12');
insert into `order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`)
 values ('c110', 1, 2, '2022-07-03 16:55:36');
insert into `order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`)
 values ('c104', 2, 4, '2022-07-04 14:23:23');
insert into `order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`)
 values ('c102', 1, 3, '2022-07-04 21:54:34');
insert into `order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`)
 values ('c107', 6, 1, '2022-07-05 14:21:03');
 
#1-4 고객 테이블에 존재하는 모든 소것ㅇ을 조회하시오
select * from `customer`;
 
#1-5 고객 테이블에서 고객아이디, 이름, 휴대폰 번호를 조회하시오
select `custId`, `name`, `hp` from `customer`;

#1-6 제품 테이블에 존재하는 모든 속성을 조회하시오.
select * from `product`;

#1-7 제품 테이블에서 제조업체를 조회하시오
select `company` from `product`;

#1-8 제품 테이블에서 제조없체를 중복 없이 조회하시오.
select distinct `company` from `product`;

#1-9 제품 테이블에서 제품명과 단가를 조회하시오.
select `proName`, `price` from `product`;

#1-10 제품 테이블에서 제품명과 단가를 조회하되, 단가에 500원을 더해 `조정단가`로 출력하시오
select `proName`, `price`+500 as '조정단가' from `product`;

#1-11 제품 테이블에서 오리온이 제조한 제품의 제품명, 재고량, 단가를 조회하시오
select `proName`, `stock`, `price` from `product` where `company` = '오리온';

#1-12 주문 테이블에서 `c102` 고객이 주문한 주문제품, 수량, 주문일자를 조회하시오
select `orderProduct`, `orderCount`, `orderDate` from `order` where `orderId` = 'c102';

#1-13 주문 테이블에서 `c102` 고객이 2개이상 주문한 주문제품, 수량, 주문일자를 조회하시오
select `orderProduct`, `orderCount`, `orderDate` from `order` 
	where `orderId` = 'c102' and `orderCount` >= 2;
    
#1-14 제품 테이블에서 단가가 1000원 이상 2000원 이하인 제품을 조회하시오
select * from `product` where `price` between 1000 and 2000;

#1-15 고객 테이블에서 성이 김씨인 고객의 아이디, 이름, 휴대폰, 주소를 조회하시오
select `custId`, `name`, `hp`, `addr` from `customer` where `name` like '김%';

#1-16 고객 테이블에서 고객 이름이 2자인 고객의 아이디, 이름, 휴대폰, 주소를 조회하시오
select `custId`, `name`, `hp`, `addr` from `customer` where `name` like '__';

#1-17 고객 테이블에서 휴대폰 번호가 입력되지 않은 고객을 조회하시오
select * from `customer` where `hp` is null;

#1-18 고객 테이블에서 주소가 입력된 고객을 조회하시오
select * from `customer` where `addr` is not null;

#1-19 고객 테이블에서 가입일을 내림차순으로 정렬하여 고객을 조회하시오
select * from `customer` order by `rdate` desc;

#1-20 주문 테이블에서 수량이 3개 이상인 주문내용을 조회하시오, 단 주문 수량으로 내림차순 정렬하고,
#     수량이 같으면 제품번호를 기준으로 오름차순 정렬하시오
select * from `order` where `orderCount` >= 3 order by `orderCount` desc, 
`orderNo` asc;

#1-21 제품 테이블에서 모든 제품의 단가 평균을 조회하시오
select avg(price) from `product`;

#1-22 `농심`에서 제조한 제품의 재고량 합계를 조회하시오
select sum(`stock`) as `재고량 합계` from `product` where `company` = '농심';

#1-23 고객 테이블에 고객이 몇 명 등록되어 있는지 조회하시오
select count(*) as '고객수' from `customer`;

#1-24 제품 테이블에서 제조업체의 수를 구하시오
select count(distinct(`company`)) as '제조업체 수' from `product`;

#1-25 주문 테이블에서 주문제품별 수량의 합계를 조회하시오
select `orderProduct` as '주문 상품번호', sum(`orderCount`) as '총 주문수량' from
	`order` group by `orderProduct` order by `orderProduct` asc;
    
#1-26 제품 테이블에서 제조업체별 제조한 제품의 개수와 제품 중 가장 비싼 단가를 조회 하시오
select `company` as '제조업체', count(*) as '제품수', max(`price`) as '최고가' from
	`product` group by `company`;
    
#1-27 제품 테이블에서 제품을 2개 이상 제조한 제조업체별로 제품의 개수와 제품 중 가장 비싼 단가를 조회하시오
select `company` as '제조업체', count(*) as '제품수',  max(`price`) as '최고가' from
	`product` group by `company` having '제품수' >=2;
    
#1-28 주문 테이블에서 각 주문고객이 주문한 제품의 총 주문 수량을 주문 제품별로 조회하시오
select `orderProduct`, `orderId`, sum(`orderCount`) as '총 주문수량' from `order`
	group by `orderNo`,`orderProduct`;

#1-29 'c102' 고객이 주문한 제품의 이름을 조회하시오
select a.orderId, b.proName from `order` as a 
join `product` as b
on a.`orderProduct` = b.`prodNo`
where `orderId` = 'c102';

#1-30 주문일자가 7월 3일인 고객의 아이디, 이름, 상품명 그리고 주문 날짜시간을 조회하시오
select `orderId`, `name`, `proName`, `orderDate` from `order` as a
join `customer` as b
on a.orderId =b.custId
join `product` as c
on a.`orderproduct` = c.`prodNo`
where `orderDate` like '2022-07-03%';