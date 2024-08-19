#날짜 : 2024/08/19
#이름 : 최준혁
#내용 : JSP 게시판 프로젝트 실습하기



#테이블 생성
CREATE TABLE `user` (
	`uid` 				VARCHAR(20) PRIMARY KEY,
	`pass`				VARCHAR(100),
	`name`				VARCHAR(20),
	`nick`				VARCHAR(20) UNIQUE,
	`email`				VARCHAR(50) UNIQUE,
	`hp`					CHAR(13) UNIQUE,
	`role`				VARCHAR(20) DEFAULT 'USER',
	`zip`  				CHAR(5),
	`addr1`				VARCHAR(255),
	`addr2`				VARCHAR(255),
	`regip`				VARCHAR(100),
	`regDate`			DATETIME,
	`leaveDate`			DATETIME
);
CREATE TABLE `terms`(
	`terms`				TEXT,
	`privacy`			TEXT
);
CREATE TABLE `article` (
	`no`					INT AUTO_INCREMENT PRIMARY KEY,
	`cate`				VARCHAR(20) DEFAULT 'free',
	`title`				VARCHAR(100) NOT NULL,
	`content`			TEXT NOT NULL,
	`comment`			INT DEFAULT 0,
	`file`				TINYINT DEFAULT 0,
	`hit`					INT DEFAULT 0,
	`writer`				VARCHAR(20) NOT NULL,
	`regip`				VARCHAR(100) NOT NULL,
	`rdate`				DATETIME,
	FOREIGN KEY(`writer`) REFERENCES `user`(`uid`)
);
CREATE TABLE `comment` (
	`no`					INT AUTO_INCREMENT PRIMARY KEY,
	`parent`				INT NOT NULL,
	`content`			TEXT NOT NULL,
	`writer`				VARCHAR(20) NOT NULL,
	`regip`				VARCHAR(100) NOT NULL,	
	`rdate`				DATETIME,
	FOREIGN KEY(`writer`) REFERENCES `user`(`uid`),
	FOREIGN KEY(`parent`) REFERENCES `article`(`no`)
);
CREATE TABLE `file` (
	`fno`					INT AUTO_INCREMENT PRIMARY KEY,
	`ano`					INT NOT NULL,
	`oName`				VARCHAR(100) NOT NULL,
	`sName`				VARCHAR(100) NOT NULL,
	`download`			INT DEFAULT 0,
	`rdate`				DATETIME,
	FOREIGN KEY(`ano`) REFERENCES `article`(`no`)
);



