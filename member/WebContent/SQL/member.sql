--* 계정 생성법

--1. totoro 계정 생성
--관리자 계정(system)으로 접속한다
sqlplus  system/비번
create user totoro identified by totoro123;

--2. totoro 계정에게 role을 부여한다.
grant  connect, resource to totoro;

--3. totoro 계정으로 전환한다.
conn totoro/totoro123
show user

-- 회원 관리
create table member(
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

-- 테이블 확인
select * from tab;
select * from member;
