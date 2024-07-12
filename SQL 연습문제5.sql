#날짜 : 2024/07/12
#이름 : 최준혁
#내용 : SQL 연습문제5

#5-1 데이터베이스 생성
CREATE DATABASE `BookStore`;
CREATE USER 'bookstore'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON `BookStore`.* TO 'bookstore'@'%';
FLUSH PRIVILEGES;

USE `BookStore`;

#5-2 테이블 생성
create table `Customer` (
	custId int auto_increment primary key,
    name varchar(10) not null,
    address varchar(20),
    phone varchar(13) 
);

create table `Book` (
	bookId int primary key,
    bookName varchar(20) not null,
    publisher varchar(20) not null,
    price int  
);

create table `Order` (
	orderId int auto_increment primary key,
    custId int not null,
    bookId int not null,
    salePrice int not null,
    orderDate date not null 
);

#5-3 데이터 값 넣기
insert into `Customer` (name, address, phone) values ('박지성','영국 멘체스타','000-5000-0001');
insert into `Customer` (name, address, phone) values ('김연아','대한민국 서울','000-6000-0001');
insert into `Customer` (name, address, phone) values ('장미란','대한민국 강원도','000-7000-0001');
insert into `Customer` (name, address, phone) values ('추신수','미국 클리블랜드','000-8000-0001');
insert into `Customer` (name, address) values ('박세리','대한민국 대전');

insert into `Book` (bookId, bookName, publisher, price) values (1,'축구의 역사','굿스포츠',7000);
insert into `Book` (bookId, bookName, publisher, price) values (2,'축구아는 여자','나무수',13000);
insert into `Book` (bookId, bookName, publisher, price) values (3,'축구의 이해','대한미디어',22000);
insert into `Book` (bookId, bookName, publisher, price) values (4,'골프 바이블','대한미디어',35000);
insert into `Book` (bookId, bookName, publisher, price) values (5,'피겨 표본','굿스포츠',8000);
insert into `Book` (bookId, bookName, publisher, price) values (6,'역도 단계별기술','굿스포츠',6000);
insert into `Book` (bookId, bookName, publisher, price) values (7,'야구의 추억','이상미디어',20000);
insert into `Book` (bookId, bookName, publisher, price) values (8,'야구를 부탁해','이상미디어',13000);
insert into `Book` (bookId, bookName, publisher, price) values (9,'올림픽 이야기','삼성당',7500);
insert into `Book` (bookId, bookName, publisher, price) values (10,'Olympic Champions','Pearson',13000);

insert into `Order` (custId, bookId, salePrice, orderDate) values (1,1,6000,'2014-07-01');
insert into `Order` (custId, bookId, salePrice, orderDate) values (1,3,21000,'2014-07-03');
insert into `Order` (custId, bookId, salePrice, orderDate) values (2,5,8000,'2014-07-03');
insert into `Order` (custId, bookId, salePrice, orderDate) values (3,6,6000,'2014-07-04');
insert into `Order` (custId, bookId, salePrice, orderDate) values (4,7,20000,'2014-07-05');
insert into `Order` (custId, bookId, salePrice, orderDate) values (1,2,12000,'2014-07-07');
insert into `Order` (custId, bookId, salePrice, orderDate) values (4,8,13000,'2014-07-07');
insert into `Order` (custId, bookId, salePrice, orderDate) values (3,10,12000,'2014-07-08');
insert into `Order` (custId, bookId, salePrice, orderDate) values (2,10,7000,'2014-07-09');
insert into `Order` (custId, bookId, salePrice, orderDate) values (3,8,13000,'2014-07-10');

#5-4 모든 회원의 회원번호, 이름, 주소를 조회하시오
select custId, name, address from `Customer`;

#5-5 모든 도서의 이름과 가격을 조회하시오
select bookname, price from `Book`;

#5-6 모든 도서의 가격과 이름을 조회하시오
select price, bookname from `Book`;

#5-7 모든 도서의 도서번호, 도서이름, 출판사, 가격을 조회하시오
select * from `Book`;

#5-8 도서테이블에 있는 모든 출판사를 조회하시오
select publisher from `Book`;

#5-9 도서테이블에 있는 모든 출판사를 조회하시오. 단 조회결과에서 중복을 제거하시오
select distinct publisher from `Book`;

#5-10 가격이 20,000원 이상인 도서를 조회하시오
select * from `Book` where price >=20000;

#5-11 가격이 20,000원 미만인 도서를 조회하시오
select * from `Book` where price < 20000;

#5-12 가격이 10,000원 이상 20,000이하인 도서를 조회하시오
select * from `Book` where price between 10000 and 20000;

#5-13 가격이 15,000원 이상 30,000원 이하인 도서의 도서번호, 도서명, 도서가격을 조회하시오
select bookId, bookname, price from `Book` where price between 15000 and 30000;

#5-14 도서번호가 2, 3, 5인 도서를 조회하시오
select * from `Book` where bookId in (2,3,5);

#5-15 도서번호가 짝수번호인 도서를 조회하시오
select * from `Book` where bookId % 2 = 0;

#5-16 박씨 성 고객을 조회하시오
select * from `Customer` where name like '박%';

#5-17 대한민국에 거주하는 고객을 조회하시오
select * from `Customer` where address like '대한민국%';

#5-18 휴대폰 번호가 유효한 고객만 조회하시오
select * from `Customer` where phone is not null;

#5-19 출판사가 `굿스포츠` 혹은 `대한미디어`인 도서를 조회하시오
select * from `Book` where publisher in ('굿스포츠', '대한미디어');

#5-20 `축구의 역사`를 출간한 출판사를 조회하시오
select publisher from `Book` where bookName = '축구의 역사';

#5-21 도서이름에 `축구`가 포함된 출판사를 조회하시오
select publisher from `Book` where bookName like '%축구%';
 
#5-22 도서이름의 왼쪽 두번째 위치에 `구`라는 문자열을 갖는 도서를 조회하시오
select * from `Book` where bookName like '_구%';

#5-23 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 조회하시오
select * from `Book` where bookName like '%축구%' and price >= 20000;

#5-24 도서를 이름순으로 조회하시오
select * from `Book` order by bookName;

#5-25 도서를 가격순으로 조회하고, 가격이 같으면 이름순으로 조회하시오
select * from `Book` 
order by 
price asc, 
BookName asc ;

#5-26 도서를 가격의 내림차순으로 조회하시오. 단 가격이 같다면 출판사를 오름차순으로 조회
select * from `Book` 
order by 
price desc, 
publisher asc ;

#5-27 도서가격이 큰 1, 2, 3위 도서를 조회하시오
select * from `Book`
order by 
price desc 
limit 3;

#5-28 도서가격이 작은 1, 2, 3위 도서를 조회하시오
select * from `Book`
order by 
price asc 
limit 3;

#5-29 고객이 주문한 도서의 총 판매액을 조회하시오
select sum(salePrice) as '총 판매액' from `Order`;

#5-30 고객이 주문한 도서의 총 판매액, 평균값, 최저가, 최고가를 조회하시오
select 
	sum(salePrice) as '총 판매액',
    avg(salePrice) as '평균값',
    min(salePrice) as '최저가',
    max(salePrice) as '최고가'
 from `Order`;

#5-31 도서 판매 건수를 조회하시오
select count(salePrice) as '판매건수' from `Order`;

#5-32 도서제목에 야구가 포함된 도서를 농구로 변경한 후 도서 목록을 조회하시오
update `Book` set bookName = replace(bookName, '야구','농구');
update `Book` set bookName = replace(bookName, '농구','야구');

#5-33 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문도서의 총 수량을 조회하시오
#		단, 두 권 이상 구매한 고객만 조회할 것
select c.custId, count(o.salePrice) as '수량'
	from `Customer` as c
    join `Order` as o
    on c.custId = o.custId
    join `Book` as b
    on o.bookId = b.bookId
    where o.salePrice >=8000
    group by custId 
    having count(salePrice) >=2
    order by custId;
    
#5-34 고객과 고객의 주문에 관한 데이터를 모두 조회하시오
select * from `Customer` as c
	join `Order` as o
    on c.custId = o.custId;
    
#5-35 고객과 고객의 주문에 관한 데이터를 고객번호 순으로 나열하시오
select * from `Customer` as c
	join `Order` as o
    on c.custId = o.custId
    order by o.custId;
    
#5-36 고객의 이름과 고객이 주문한 도서의 판매가격을 조회하시오
select 
	c.name,
    o.salePrice
from `Customer` as c
	join `Order` as o
    on c.custId = o.custId
order by c.custId;

#5-37 고객별로 주문한 모든 도서의 총 판매액을 조회하고, 고객별로 정렬하시오
select 
	c.name,
    sum(o.salePrice)
from `Customer` as c
	join `Order` as o
    on c.custId = o.custId
group by c.custId
order by c.name;

#5-38 고객의 이름과 고객이 주문한 도서의 이름을 조회하시오
select 
	c.name,
    b.bookName
from `Customer` as c
	join `Order` as o
    on c.custId = o.custId
    join `Book` as b
    on o.bookId = b.bookId;
    
#5-39 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 조회하시오
select 
	c.name,
    b.bookName
from `Customer` as c
	join `Order` as o
    on c.custId = o.custId
    join `Book` as b
    on o.bookId = b.bookId
where o.salePrice = 20000;

#5-40 도서를 구매하지 않은 고객을 포함해서 고객명과 주문한 도서의 판매가격을 조회하시오. 
select 
	c.name,
    o.salePrice
from `Customer` as c
left join `Order` as o
on c.custId = o.custId;

#5-41 김연아 고객이 주문한 도서의 총 판매액을 조회하시오
select 
	sum(o.salePrice) as '총매출'
from `Order` as o
join `Customer` as c
on c.custId = o.custId
where c.name = '김연아';

#5-42 가장 비싼 도서의 이름을 조회하시오
select 
	bookName
from `Book`
where price = (select max(price) from `Book`); 

#5-43 도서를 주문하지 않은 고객의 이름을 조회하시오
select 
	name
from `Customer` as c
left join `Order` as o
on c.custId = o.custId
where c.custId not in ( select custId
from `Order`);

#5-44 Book 테이블에 새로운 도서 `스포츠 의학`을 삽입하시오. 
# 		스포츠의학은 한솔의학서적에서 출간 했으며 가격은 미정이다.
insert into `Book` (bookId, bookName, publisher) values (11,'스포츠의학','한솔의학서적');

#5-45 Customer 테이블에서 고객번호가 5인 고객의 주소를 `대한민국 부산`으로 변경하시오
update `Customer` set address = '대한민국 부산' where custId = 5;

#5-46 Customer 테이블에서 고객번호가 5인 고객을 삭제하시오
delete from `Customer` where custId = 5;