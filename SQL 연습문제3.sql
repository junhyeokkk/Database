# 날짜 : 2024/07/10
# 이름 : 최준혁
# 내용 : SQL 연습문제3 

#3-1 실습 데이터베이스와 사용자를 생성하시오
create database `College`;
create user 'college'@'%' identified by '1234';
grant all privileges on College.* to 'college'@'%';
flush privileges;

use `College`;
#3-2 테이블생성
create table `Student` (
	`stdNo` varchar(8) primary key,
    `stdName` varchar(20) not null,
    `stdHp` varchar(13) not null,
    `stdYear` int not null,
    `stdAddress` varchar(100) 
);

create table `Lecture` (
	`lecNo` int primary key,
    `lecName` varchar(20) not null,
    `lecCredit` int not null,
    `lecTime` int not null,
    `lecClass` varchar(10) 
);
drop table `Lecture`;
create table `Register` (
	`regstdNo` varchar(8),
    `regLecNo` int not null,
    `regMidScore` int,
    `regFinalScore` int,
    `regTotalScore` int,
    `regGrade` varchar(1)
);

#3-3 데이터 삽입
insert into `Student` (`stdNo`, `stdName`, `stdHp`, `stdYear`)values ('20201016','김유신','010-1234-1001',3);
insert into `Student` (`stdNo`, `stdName`, `stdHp`, `stdYear`,`stdAddress`)
	values ('20201126','김춘추','010-1234-1002',3,'경상남도 경주시');
insert into `Student` (`stdNo`, `stdName`, `stdHp`, `stdYear`,`stdAddress`)
	values ('20210216','장보고','010-1234-1003',2,'전라남도 완도시');
insert into `Student` (`stdNo`, `stdName`, `stdHp`, `stdYear`,`stdAddress`)
	values ('20210326','강감찬','010-1234-1004',2,'서울시 영등포구');
insert into `Student` (`stdNo`, `stdName`, `stdHp`, `stdYear`,`stdAddress`)
	values ('20220416','이순신','010-1234-1005',1,'부산시 부산진구');
insert into `Student` (`stdNo`, `stdName`, `stdHp`, `stdYear`,`stdAddress`)
	values ('20220521','송상현','010-1234-1006',1,'부산시 동래구');
    
insert into `Lecture` values (159,'인지행동심리학',3,40,'본304');
insert into `Lecture` values (167,'운영체제론',3,25,'본B05');
insert into `Lecture` values (234,'중급 영문법',3,20,'본201');
insert into `Lecture` values (239,'세법개론',3,40,'본204');
insert into `Lecture` values (248,'빅데이터 개론',3,20,'본B01');
insert into `Lecture` values (253,'컴퓨팅사고와 코딩',2,10,'본B02');
insert into `Lecture` values (349,'사회복지 마케팅',2,50,'본301');

insert into `Register` (`regStdNo`, `regLecNo`) values ('20201126',234);
insert into `Register` (`regStdNo`, `regLecNo`) values ('20201016',248);
insert into `Register` (`regStdNo`, `regLecNo`) values ('20201016',253);
insert into `Register` (`regStdNo`, `regLecNo`) values ('20201126',239);
insert into `Register` (`regStdNo`, `regLecNo`) values ('20210216',349);
insert into `Register` (`regStdNo`, `regLecNo`) values ('20210326',349);
insert into `Register` (`regStdNo`, `regLecNo`) values ('20201016',167);
insert into `Register` (`regStdNo`, `regLecNo`) values ('20220416',349);

#3-4 강좌를 조회하시오
select * from `Lecture`;

#3-5 학생를 조회하시오
select * from `Student`;

#3-6 수강신청 내역을 조회하시오
select * from `Register`;

#3-7 3학년 학생을 조회하시오
select * from `Student` where `stdYear` = 3;

#3-8 2학점 짜리 강좌를 조회하시오
select * from `Lecture` where `lecCredit` = 2;

#3-9 아래와 같이 중간고사, 기말고사 점수를 입력 후 조회하시오
update `Register` set `regMidScore` = 36, `regFinalScore`= 42 WHERE
`regStdNo`='20201126' AND `regLecNo`=234;
update `Register` set `regMidScore` = 24, `regFinalScore`= 62 WHERE
`regStdNo`='20201016' AND `regLecNo`=248;
update `Register` set `regMidScore` = 28, `regFinalScore`= 40 WHERE
`regStdNo`='20201016' AND `regLecNo`=253;
update `Register` set `regMidScore` = 37, `regFinalScore`= 57 WHERE
`regStdNo`='20201126' AND `regLecNo`=239;
update `Register` set `regMidScore` = 28, `regFinalScore`= 68 WHERE
`regStdNo`='20210216' AND `regLecNo`=349;
update `Register` set `regMidScore` = 16, `regFinalScore`= 65 WHERE
`regStdNo`='20210326' AND `regLecNo`=349;
update `Register` set `regMidScore` = 18, `regFinalScore`= 38 WHERE
`regStdNo`='20201016' AND `regLecNo`=167;
update `Register` set `regMidScore` = 25, `regFinalScore`= 58 WHERE
`regStdNo`='20220416' AND `regLecNo`=349;
SELECT * FROM `Register`;

#3-10 아래와 같이 총점과 등급을 입력 후 조회하시오 
update `Register` set
	`regTotalScore`= `regMidScore` + `regFinalScore`,
	`regGrade` = if(`regTotalScore` >= 90, 'A',
	if(`regTotalScore` >= 80, 'B',
	if(`regTotalScore` >= 70, 'C',
	if(`regTotalScore` >= 60, 'D', 'F'))));
    
#3-11 점수가 큰 순서로 정렬하시오
select * from `Register` order by `regTotalScore` desc;

#3-12 강좌번호가 349번이면서 총점이 가장 큰 순서로 조회하시오
select * from `Register` where `regLecNo` = 349 order by `regTotalScore` desc;

#3-13 30시간 이상인 강좌를 조회하시오
select * from `Lecture` where `lecTime` >= 30;

#3-14 강좌명과 강의실을 조회하시오
select `lecName`, `lecClass` from `Lecture`;

#3-15 학번과 이름을 조회하시오
select `stdNo`, `stdName` from `Student`;

#3-16 주소를 입력하지 않은 학생을 조회하시오
select * from `Student` where `stdAddress` is null;

#3-17 부산에 거주하는 학생을 조회하시오
select * from `Student` where `stdAddress` like '부산시%';

#3-18 학생과 수강 테이블을 결합하시오. 단 수강신청을 하지 않아 점수가 없어도 조회 될 것
select * from `Student` as a left join `Register` as b on a.stdNo = b.regstdNo; 

#3-19 아래와 같이 조회하시오
select
	a.stdNo,
    a.stdName,
    b.regLecNo,
    b.regMidScore,
    b.regFinalScore,
    b.regTotalScore,
    b.regGrade
from `Student` as a, `Register` as b where a.stdNo = b.regStdNo;

#3-20 강좌번호 349를 수강 신청한 학생의 이름과 학번을 조회하시오
select `stdName`, `stdNo`, `regLecNo`
	from `Student` as a
    join `Register` as b
    on a.stdNo = b.regstdNo 
    where b.regLecNo = 349;
    
#3-21 학생별 수강 신청 건수와 모든 수강과목의 전체점수 합계, 평균을 조회하시오
select 
	`stdNo`,
    `stdName`,
    count(`stdNo`) as `수강신청 건수`,
    sum(`regTotalScore`) as `종합점수`,
    sum(`regTotalScore`) / count(`stdNo`) as `평균`
from `Student` as a
join `Register` as b
on a.`stdNo` = b.`regStdNo`
group by `stdNo`;

#3-22 수강 테이블과 강좌 테이블을 결합하시오
select * from `Register` as a
	join `Lecture` as b
    on a.`regLecNo` = b.`LecNo`;
    
#3-23 아래와 같이 조회하시오
select
	`regStdNo`,
	`regLecNo`,
	`lecName`,
	`regMidScore`,
	`regFinalScore`,
	`regTotalScore`,
	`regGrade`
from `Register` as a 
join `Lecture` as b
on a.`regLecNo` = b.`LecNo`;

#3-24 `사회복지 마케팅` 강좌를 신청한 건수와 평균을 조회하시오
select 
	count(*) as `사회복지 마케팅 수강 신청 건수`,
    avg(`regTotalScore`) as `사회복지 마케팅 평균`
from `Register` as a join `Lecture` as b on a.`regLecNo` = b.`LecNo`
where b.lecNo = 349;

#3-25 `A` 등급을 받은 학번과 강좌명을 조회하시오
select 
	`regStdNo`,
    `lecName`
from `Register` as a join `Lecture` as b on a.`regLecNo` = b.`LecNo`
where a.`regGrade` = 'A';

#3-26 학생 테이블과 수강 테이블 그리고 강좌 테이블을 결합하시오
select * from `Student` as a
	join `Register` as b on a.`stdNo` = b.`regStdNo`
    join `Lecture` as c on b.`regLecNo` = c.`LecNo`;
    
#3-27 아래와 같이 조회하시오
select
	`stdNo`,
	`stdName`,
	`lecNo`,
	`lecName`,
	`regMidScore`,
	`regFinalScore`,
	`regTotalScore`,
	`regGrade`
from `Student` as a
	join `Register` as b on a.`stdNo` = b.`regStdNo`
    join `Lecture` as c on b.`regLecNo` = c.`LecNo`
order by `regTotalScore` desc;

#3-28 `F` 학점을 받은 학번과 이름, 수강과목명, 점수 그리고 등급을 조회하시오
select 
	`stdNo`,
	`stdName`,
	`lecName`,
	`regTotalScore`,
	`regGrade`
from `Student` as  a
	join `Register` as b on a.`stdNo` = b.`regStdNo`
    join `Lecture` as c on b.`regLecNo` = c.`LecNo`
where `regGrade` = 'F';

#3-29 학생별 이수학점을 조회하시오. 단 F등급을 받은 과목은 학점으로 인정되지 않음
select
	`stdNo`,
	`stdName`,
	SUM(`lecCredit`) AS `이수학점`
FROM `Student` AS a
	join `Register` as b on a.`stdNo` = b.`regStdNo`
    join `Lecture` as c on b.`regLecNo` = c.`LecNo`
where `regGrade` != 'F'
group by `stdNo`;

#3-30 신청과목과 이수과목을 조회하시오, 단 F등급을 받은 과목은 이수과목으로 인정 안됨
select 
	`stdNo`,
	`stdName`,
	group_concat(`lecName`) as `신청과목`,
	group_concat(if(`regTotalScore` >= 60, `lecName`, null)) as `이수과목`
FROM `Student` as a
	join `Register` as b on a.`stdNo` = b.`regStdNo`
    join `Lecture` as c on b.`regLecNo` = c.`LecNo`
group by `stdNo`;