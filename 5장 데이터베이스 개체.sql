#날짜 : 2024/07/05
#이름 : 최준혁
#내용 : 5장 데이터베이스개체

# 실습 5-1 인덱스 조회
show index from `User1`;
show index from `User2`;
show index from `User3`;

# 실습 5-2 인덱스 생성 및 적용
create index `idx_user_uid` on `User1`(`uid`);
analyze table `User1`;

select * from `user5`;
insert into `user5` (`name`,`gender`,`age`,`addr`) select `name`,`gender`,`age`,`addr` from `user5`;

update `user5` set `name` = '홍길동' where `seq` = 3;
update `user5` set `name` = '정약용' where `seq` = 2000000;

drop table `user5`;

select count(*) from `user5`;
select * from `user5` where `seq` = 21000;
select * from `user5` where `name` = '정약용';

create index `idx_user5_name` on `user5` (`name`);
analyze table `user5`;

delete from `user5` where `seq` >5;

# 실습 5-3 인덱스 삭제 
Drop index idx_user1_uid on `User1`;

# 실습 5-4 뷰 생성
create view `vw_user1` as (select `name`, `hp`, `age` from `user1`);
create view `vw_user4_age_under30` as (select * from `user4` where `age` < 30);
CREATE VIEW `vw_member_with_sales` AS (
	SELECT
	a.`uid` AS `직원아이디`,
	b.`name` AS `직원이름`,
	b.`pos` AS `직급`,
	c.`name` AS `부서명`,
	a.`year` AS `매출년도`,
	a.`month` AS `월`,
	a.`sale` AS `매출액`
FROM `Sales` AS a
JOIN `Member` AS b ON a.uid = b.uid
JOIN `Department` AS c ON b.dep = c.depNo);

# 실습 5-5 뷰 조회
select * from `vw_user1`;
select * from `vw_user4_age_under30`;
select * from `vw_member_with_sales`;

# 실습 5-6 뷰 삭제 
drop view `vw_user1`;
drop view `vw_user4_age_under30`;

#5-7 프로시저 생성 및 실행 기본
DELIMITER $$
	create procedure pro_test1()
	begin
		select * from `member`;
        select * from `department`;
	end $$
DELIMITER ;
call pro_test1();

#5-8 매개변수를 갖는 프로시저 생성 및 실행

DELIMITER $$
	create procedure pro_test2(in _userName varchar(10))
    begin
		select * from `member` where `name`=_userName;
	end $$
DELIMITER ;
call pro_test2('김유신');

DELIMITER $$
	create procedure pro_test3(in _pos varchar(10), in _dep tinyint)
    begin
		select * from `member` where `pos`=_pos and `dep`=_dep;
	end $$
DELIMITER ;
call pro_test3('차장',101);

DELIMITER $$
	create procedure pro_test4(in _pos varchar(10), out _count INT)
    begin
		select count(*) into _count from `member` where `pos`=_pos;
	end $$
DELIMITER ;
call pro_test4('대리', @_count);
select concat('_count: ',@count);

#실습 5-9 프로시저 프로그래밍
DELIMITER $$
	CREATE PROCEDURE proc_test5(IN _name VARCHAR(10))
	BEGIN
		DECLARE userId VARCHAR(10);
		select `uid` into userId from `Member` where `name` = _name;
		select * from `Sales` where `uid`=userId;
	END $$
DELIMITER ;
CALL proc_test5('김유신');

DELIMITER $$
	CREATE PROCEDURE proc_test6()
	BEGIN
		DECLARE num1 INT;
		DECLARE num2 INT;
		SET num1 = 1;
		SET num2 = 2;
		IF (NUM1 > NUM2) THEN
		SELECT 'NUM1이 NUM2보다 크다.' as `결과2`;
		ELSE
		SELECT 'NUM1이 NUM2보다 작다.' as `결과2`;
		END IF;	
	END $$
DELIMITER ;
CALL proc_test6();

> DELIMITER $$
	CREATE PROCEDURE proc_test7()
	BEGIN
		DECLARE sum INT;
		DECLARE num INT;
		SET sum = 0;
		SET num = 1;
		WHILE (num <= 10) DO
			SET sum = sum + num;
			SET num = num + 1;
		END WHILE;
		SELECT sum AS '1부터 10까지 합계';
	END $$
DELIMITER ;
CALL proc_test7();

#실습 5-10 커서를 활용하는 프로시저
> DELIMITER $$
	CREATE PROCEDURE proc_test8()
	BEGIN
		# 변수 선언
		DECLARE total INT DEFAULT 0;
		DECLARE price INT;
		DECLARE endOfRow BOOLEAN DEFAULT false;
		# 커서 선언
		DECLARE salesCursor CURSOR FOR
			SELECT `sale` FROM `Sales`;
		# 반복 조건
		DECLARE CONTINUE HANDLER
			FOR NOT FOUND SET endOfRow = TRUE;
		# 커서 열기
		OPEN salesCursor;
		
        cursor_loop: LOOP
			FETCH salesCursor INTO price;
			IF endOfRow THEN
				LEAVE cursor_loop;
			END IF;
			SET total = total + price;
		END LOOP;
		SELECT total AS '전체 합계';
		CLOSE salesCursor;
	END $$
DELIMITER ;
CALL proc_test8();

#실습 5-11 저장 함수 생성 및 호출
SET GLOBAL  log_bin_trust_function_creators=ON;
DELIMITER $$
	create function func_test1(_userid varchar(10)) returns int
    begin
		declare total int;
        
        select sum(`sale`) into total from `sales` where `uid`=_userid;
        
        return total;
	end $$
DELIMITER ;
 
select func_test1('a101');