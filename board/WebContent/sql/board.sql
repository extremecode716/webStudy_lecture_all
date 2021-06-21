-- 일반 게시판
select * from tab;
select * from seq;

create table board0( 
    num number primary key,
    writer varchar2(20) not null,
    email varchar2(30),
    subject varchar2(50) not null,
    passwd varchar2(20) not null,
    reg_date timestamp not null,
    readcount number default 0,     
    content varchar2(2000) not null,
    ip varchar2(20) not null );
    
    
create sequence board0_seq
  start with 1
  increment by 1
  nocache;
  
-- 데이터 입력
insert into board0 values(board0_seq.nextval,'홍길동','test@b.com','게시판연습','1234',sysdate,0,'게시판내용','211.183.1.1');

-- 자기 자신 복사
insert into board0 (select board0_seq.nextval, writer, email, subject, passwd, sysdate, 0, content, ip from board0);

select count(*) from board0;
select * from board0;