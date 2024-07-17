#Departments
insert into `departments` values( '10', '국어국문학과', '051-510-1010');
insert into `departments` values( '11', '영어영문학과', '051-510-1011');
insert into `departments` values( '20', '경영학과', '051-510-1020');
insert into `departments` values( '21', '경제학과', '051-510-1021');
insert into `departments` values( '22', '정치외교학과', '051-510-1022');
insert into `departments` values( '23', '사회복지학과', '051-510-1023');
insert into `departments` values( '30', '수학과', '051-510-1030');
insert into `departments` values( '31', '통계학과', '051-510-1031');
insert into `departments` values( '32', '생명과학과', '051-510-1032');
insert into `departments` values( '40', '기계공학과', '051-510-1040');
insert into `departments` values( '41', '전자공학과', '051-510-1041');
insert into `departments` values( '42', '컴퓨터공학과', '051-510-1042');

#Professors
insert into `professors` values('P10101', '10', '김유신','750120-1234567','010-1101-1976','kimys@hg.ac.kr','서울');
insert into `professors` values('P10102', '10','계백','740610-1234567','010-1102-1975','gaeback@hg.ac.kr','서울');
insert into `professors` values('P11101','11','김관창','880529-1234567','010-1103-1989','kwanch@hg.ac.kr','대전');
insert into `professors` values('P11103','11','김춘추','780412-1234567','010-2101-1979','kimcc@hg.ac.kr','대전');
insert into `professors` values('P11104','11','이사부','650911-1234567','010-2104-1966','leesabu@hg.ac.kr','대전');
insert into `professors` values('P22110','22','장보고','780727-1234567','010-3101-1979','jangbg@hg.ac.kr','부산');
insert into `professors` values('P23102','23','선덕여왕','830614-1234567','010-4101-1984','gueen@hg.ac.kr','부산');
insert into `professors` values('P31101','31','강감찬','641020-1234567','010-5101-1965','kang@hg.ac.kr','대구');
insert into `professors` values('P31104','31','신사임당','711127-1234567','010-6101-1972','sinsa@hg.ac.kr','부산');
insert into `professors` values('P40101','40','이이','910906-1234567','010-7103-1992','leelee@hg.ac.kr','부산');
insert into `professors` values('P40102','40','이황','881208-1234567','010-7104-1989','hwang@hg.ac.kr','광주');
insert into `professors` values('P42103','42','송상현','760313-1234567','010-8101-1997','ssh@hg.ac.kr','광주');

#Students
insert into `Students` values ('20101001', 10, 'P10101', '정우성', '760121-1234567', '010-1101-7601', null, '서울'); 
insert into `Students` values ('20101002', 10, 'P10101', '이정재', '750611-1234567', '010-1102-7506', null, '서울'); 
insert into `Students` values('20111011','11','P11103','전지현','890530-1234567','010-1103-8905','jjh@naver.com','대전');
insert into `Students` values('20111013','11','P11103','이나영','790413-1234567','010-2101-7904','lee@naver.com','대전');
insert into `Students` values('20111014','11','P11103','원빈','660912-1234567','010-2104-6609','one@naver.com','대전');
insert into `Students` values('21221010','22','P22110','장동건','790728-1234567','010-3101-7907','jang@naver.com','대구');
insert into `Students` values('21231002','23','P23102','고소영','840615-1234567','010-4101-8406','goso@daum.net','대구');
insert into `Students` values('22311011','31','P31104','김연아','651021-1234567','010-5101-6510','yuna@daum.net','대구');
insert into `Students` values ('22311014', 31, 'P31104', '유재석', '721128-1234567', '010-6101-7211', null, '부산');
insert into `Students` values ('22401001', 40, 'P40101', '강호동', '920907-1234567', '010-7103-9209', null, '부산');
insert into `Students` values('22401002','40','P40101','조인성','891209-1234567','010-7104-8912','join@gmail.com','광주');
insert into `Students` values('22421003','42','P42103','강동원','770314-1234567','010-8101-7703','dong@naver.com','광주');

#Lectures
insert into `lectures` values('101001','P10101','대학 글쓰기',2 ,10 ,'본102');
insert into `lectures` values('101002','P10102','한국어음운론',3 ,30 ,'본102');
insert into `lectures` values('101003','P10102','한국현대문학사',3 ,30 ,'본103');
insert into `lectures` values('111011','P11103','중세영문학',3 ,25 ,'본201');
insert into `lectures` values('111012','P11104','영미시',3 ,25 ,'본201');
insert into `lectures` values('231110','P23102','사회복지학개론', 1,8 ,'별관103');
insert into `lectures` values('311002','P31101','통계학의 이해',2 ,16 ,'별관303');
insert into `lectures` values('311003','P31104','기초 통계학',3 ,26 ,'별관303');
insert into `lectures` values('401019','P40101','기계역학', 3, 36,'공학관 102');
insert into `lectures` values('421012','P42103','데이터베이스',3 ,32 ,'공학관 103');

#Register
insert into `register`(`stdNo`,`lecNo`,`proNo`) values('20101001', '101001','P10101');
insert into `register`(`stdNo`,`lecNo`,`proNo`) values('20101001', '101002','P10102');
insert into `register`(`stdNo`,`lecNo`,`proNo`) values('20111013', '111011','P11103');
insert into `register`(`stdNo`,`lecNo`,`proNo`) values('21231002', '231110','P23102');
insert into `register`(`stdNo`,`lecNo`,`proNo`) values('22401001', '401019','P40101');
insert into `register`(`stdNo`,`lecNo`,`proNo`) values('22401001', '421012','P42103');
insert into `register`(`stdNo`,`lecNo`,`proNo`) values('20101001', '101003','P10102');
insert into `register`(`stdNo`,`lecNo`,`proNo`) values('22421003', '311003','P31104');
insert into `register`(`stdNo`,`lecNo`,`proNo`) values('22421003', '421012','P42103');
insert into `register`(`stdNo`,`lecNo`,`proNo`) values('20111013', '111012','P11104');

#문제1
SELECT
	`stdNo`,
	`stdName`,
	`stdHp`,
	b.`depNo`,
	`depName`
FROM `Students` AS a
JOIN `Departments` AS b ON a.depNo = b.depNo;

#문제2
SELECT
	`proNo`,
	`proName`,
	`proHp`,
	b.`depNo`,
	`depName`
FROM `Professors` AS a
JOIN `Departments` AS b ON a.depNo = b.depNo;

#문제3
SELECT
	`lecNo`,
	`lecName`,
	`proName`,
	`proHp`
FROM `Lectures` AS a
JOIN `Professors` AS b ON a.proNo = b.proNo;

#문제4
SELECT 
	`lecNo`,
	`lecName`,
	b.`proNo`,
	`proName`,
	`proHp`,
	c.`depNo`,
	`depName`
FROM `Lectures` AS a
JOIN `Professors` AS b ON a.proNo = b.proNo
JOIN `Departments` AS c ON b.depNo = c.depNo;

#문제5
SELECT 
	a.`stdNo`,
	b.`stdName`,
	a.`lecNo`,
	c.`lecName`,
	a.`proNo`,
	d.`proName`
FROM `Register` AS a
JOIN `Students` AS b ON a.stdNo = b.stdNo
JOIN `Lectures` AS c ON a.lecNo = c.lecNo
JOIN `Professors` AS d ON a.proNo = d.proNo;

#문제6
UPDATE `Register` SET
					`regAttenScore` = CEIL(RAND() * 100),
					`regMidScore`   = CEIL(RAND() * 100),
					`regFinalScore` = CEIL(RAND() * 100);

#문제7
UPDATE `Register` SET 
					`regTotal` = (`regAttenScore` + `regMidScore` + `regFinalScore`) / 3;

#문제8
UPDATE `Register` SET 
					`regGrade` = if(`regTotal` >= 90, 'A', 
								 if(`regTotal` >= 80, 'B',
								 if(`regTotal` >= 70, 'C',
								 if(`regTotal` >= 60, 'D', 'F'))));
#문제9
SELECT `regTotal` FROM `Register` ORDER BY `regTotal` DESC LIMIT 1;

#문제10
Select AVG(`regTotal`) from `Register` as a
JOIN `Students` as b
on a.stdNo = b.stdNo
where `stdName`='정우성';