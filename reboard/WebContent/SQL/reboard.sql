-- 댓글 게시판
select * from tab;
select * from seq;
select * from BOARD;

create table board( num number,
      writer varchar2(20) not null,
      email varchar2(30),
      subject varchar2(50) not null,
      passwd varchar2(20) not null,
      reg_date timestamp not null,
      readcount number default 0,
      ref number not null,
      re_step number not null,
      re_level number not null,
      content varchar2(2000) not null,
      ip varchar2(20) not null,
      constraint board_pk primary key(num) );
      
      
create sequence board_seq 
    start with 1
    increment by 1
    nocache;
    

create sequence aaa_seq
    start with 1
    increment by 1
    nocache;
    
    
-- test nextval 2번 호출
create table aaa(num number,
    num1 number,
    constraint aaa_pk primary key(num));
    
insert into aaa values (aaa_seq.nextval, aaa_seq.nextval + 1);

select * from aaa;

-- 시퀀스 삭제
drop sequence aaa_seq;
-- 테이블, 데이터, 제약조건 바로 삭제
drop table aaa cascade constraints purge;

