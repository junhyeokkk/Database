#날짜 : 2024/07/01
#이름 : 김철학
#내용 : 2장 SQL 기본

#실습 2-1. 테이블 생성, 제거
use StudyDB;

CREATE TABLE `User1` (
	`uid`	VARCHAR(10),
    `name`	VARCHAR(10),
    `hp`	CHAR(13),
    `age`	INT
);

DROP TABLE `User1`;

#실습 2-2. 데이터 입력
INSERT INTO `User1` VALUES ('A101', '김유신', '010-1234-1111', 25);
INSERT INTO `User1` VALUES ('A102', '김춘추', '010-1234-1111', 23);
INSERT INTO `User1` VALUES ('A103', '장보고', '010-1234-1111', 32);
INSERT INTO `User1` (`uid`, `name`, `age`) VALUES ('A104', '강감찬', 45);
INSERT INTO `User1` SET
						`uid`='A105',
                        `name`='이순신',
                        `hp`='010-1234-5555';

#실습 2-3
SELECT * FROM `User1`;
SELECT * FROM `User1` WHERE `uid`='A101';
SELECT * FROM `User1` WHERE `name`='김춘추';
SELECT * FROM `User1` WHERE `age` < 30;
SELECT * FROM `User1` WHERE `age` >= 30;
SELECT `uid`, `name`, `age` FROM `User1`;

#실습 2-4
# 수정 할 때 You are using safe update mode~ 뜨면서 수정 안될때 아래 쿼리 실행
set sql_safe_updates=0;
UPDATE `User1` SET `hp`='010-1234-4444' WHERE `uid`='A104';
UPDATE `User1` SET `age`=51 WHERE `uid`='A105';
UPDATE `User1` SET `hp`='010-1234-1001', `age`=27 WHERE `uid`='A101';

#실습 2-5
# 삭제 할 때 You are using safe update mode~ 뜨면서 삭제 안될때 아래 쿼리 실행
set sql_safe_updates=0;
DELETE FROM `User1` WHERE `uid`='A101';
DELETE FROM `User1` WHERE `uid`='A102' AND `age`=25;
DELETE FROM `User1` WHERE `age` >= 30;

#실습 2-6
ALTER TABLE `User1` ADD `gender` TINYINT;
ALTER TABLE `User1` ADD `birth` CHAR(10) AFTER `name`;
ALTER TABLE `User1` MODIFY `gender` CHAR(1);
ALTER TABLE `User1` MODIFY `age` TINYINT;
ALTER TABLE `User1` DROP `gender`;

#실습 2-7
CREATE TABLE `User1Copy` LIKE `User1`;
INSERT INTO `User1Copy` SELECT * FROM `User1`;

#실습 2-8
create table `TblUser` (
	`user_id`	VARCHAR(10),
	`user_name`	VARCHAR(10),
	`user_hp`	CHAR(13),
	`user_age`	TINYINT,
	`user_addr`	VARCHAR(100)
);

INSERT INTO `TblUser` VALUES ('p101', '김유신', '010-1234-1001', 25, '경남 김해시');
INSERT INTO `TblUser` VALUES ('p102', '김춘추', '010-1234-1002', 23, '경남 경주시');
INSERT INTO `TblUser` VALUES ('p103', '장보고',  NULL, 31, '전남 완도군');
INSERT INTO `TblUser` (`user_id`, `user_name`, `user_addr`) 
						VALUES ('p104', '강감찬', '서울시 중구');

INSERT INTO `TblUser` SET 
						`user_id`='p105', 
						`user_name`='이순신', 
						`user_hp`='010-1234-1005', 
						`user_age`=25;

create table `TblProduct` (
	`prod_no`		INT,
	`prod_name`		VARCHAR(10),
	`prod_price`	INT,
	`prod_stock`	INT,
	`prod_company`	VARCHAR(10),
	`prod_date`		DATE
);

INSERT INTO `TblProduct` VALUES (1001, '냉장고',  800000,  25, 'LG전자', '2022-01-06');
INSERT INTO `TblProduct` VALUES (1002, '노트북', 1200000, 120, '삼성전자', '2022-01-07');
INSERT INTO `TblProduct` VALUES (1003, '모니터',  350000,  35, 'LG전자', '2023-01-13');
INSERT INTO `TblProduct` VALUES (1004, '세탁기', 1000000,  80, '삼성전자', '2021-01-01');
INSERT INTO `TblProduct` VALUES (1005, '컴퓨터', 1500000,  20, '삼성전자', '2023-10-01');
INSERT INTO `TblProduct` VALUES (1006, '휴대폰',  950000, 102, NULL, NULL);

#실습 2-9
SELECT * FROM `TblUser`;
SELECT `user_name` FROM `TblUser`;
SELECT `user_name`, `user_hp` FROM `TblUser`;
SELECT * FROM `TblUser` WHERE `user_id`='p102';
SELECT * FROM `TblUser` WHERE `user_id`='p104' OR `user_id`='p105';
SELECT * FROM `TblUser` WHERE `user_addr`='부산시 금정구';
SELECT * FROM `TblUser` WHERE `user_age` > 30;
SELECT * FROM `TblUser` WHERE `user_hp` IS NULL;
UPDATE `TblUser` SET `user_age`=42 WHERE `user_id`='p104';
UPDATE `TblUser` SET `user_addr`='부산시 진구' WHERE `user_id`='p105';
DELETE FROM `TblUser` WHERE `user_id`='p103';
SELECT * FROM `TblProduct`;
SELECT `prod_name` FROM `TblProduct`;
SELECT `prod_name`, `prod_company`, `prod_price` FROM `TblProduct`;
SELECT * FROM `TblProduct` WHERE `prod_company`='LG전자';
SELECT * FROM `TblProduct` WHERE `prod_company`='삼성전자';
UPDATE `TblProduct` SET 
 `prod_company`='삼성전자', 
 `prod_date`='2024-01-01' 
 WHERE 
 `prod_no`=1006;