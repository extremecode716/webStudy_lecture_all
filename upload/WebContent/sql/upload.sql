-- 자료실
select * from tab;
select * from seq;
select * from upload;
desc upload;
SELECT * FROM COL WHERE tname='upload';
	
create table upload( num number,
            writer varchar2(20) not null,
	        email varchar2(30),
            subject varchar2(50) not null,
            passwd varchar2(20) not null,
	        reg_date timestamp not null,
	        readcount number default 0,	    
	        content varchar2(2000) not null,
	        ip varchar2(20) not null,
	        upload varchar2(30),
	        constraint upload_pk primary key(num) );


create sequence upload_seq 
			increment by 1 
			  start with 1
			  nocycle;


--sequence 목록 보기
select * from seq; 


--sequence 삭제
drop sequence board_seq;