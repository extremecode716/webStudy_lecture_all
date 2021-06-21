-- 모델2 회원관리
select * from tab;
select * from member0412;

create table member0412(
	id  varchar2(20) primary key,
	passwd  varchar2(20) not null,
	name varchar2(20) not null,
	jumin1 varchar2(6) not null,
	jumin2 varchar2(7) not null,
	mailid  varchar2(30),
	domain  varchar2(30),
	tel1 varchar2(5),
	tel2 varchar2(5),
	tel3 varchar2(5),
	phone1 varchar2(5),
	phone2 varchar2(5),
	phone3 varchar2(5),
	post varchar2(10),
	address varchar2(200),
	gender varchar2(20),
	hobby varchar2(50),
	intro varchar2(2000),
	register timestamp
);