-- 데이터베이스 연동 예제

-- 계정 전환(cmd에서 됨)
conn scott/716

-- 현재 접속한 계정 확인(cmd에서 됨)
show user

-- 테이블 목록 보기
select * from tab;

-- 테이블 명을 조회
select table_name from tabs;

-- member1 테이블 생성
create table member1(
	id VARCHAR2(12) primary key,
	passwd VARCHAR2(12) not null,
	name VARCHAR2(10) not null,
	reg_date TIMESTAMP not null
);

-- 자동적으로 입력이 안됬으면 강제로 commit 해 볼 것.
commit


-- DB연동 예제 : DTO, DAO 자바빈->javabean3---------------
create  table  member2( id varchar2(12) primary key,
            passwd varchar2(12) not null,
		    name varchar2(10) not null,
			jumin1 varchar2(6) not null,
			jumin2 varchar2(7) not null,
			email varchar2(30),
			blog varchar2(50),
			reg_date date not null);
			
select * from member2;

--JavaBeanMember.register - LogonDataBean.java (DTO)

--JavaBeanMember.register - LogonDBBean.java (DAO)
-------------------------------------------------------


--Model2 회원관리
select * from tab;
select * from query;

create table query(
	id varchar2(20),
	pw varchar2(20),
	name varchar2(20),
	vclass varchar2(20),
	phone varchar2(30)
);


-- sql->ex7->jstl_sql_ex.jsp
select * from tab;
drop table test purge;
create table test(
	num number,
	name varchar2(10),
	primary key(num) );

