-- 모델2 게시판
select * from tab;
select * from seq;

insert into model2 values(model2_seq.nextval,'홍길동','1234',
 '모델2게시판','내용','',model2_seq.nextval,0,0,0,sysdate);

create table model2(
	board_num number,
	board_name varchar2(20),
	board_pass varchar2(15),
	board_subject varchar2(50),
	board_content varchar2(2000),
	board_file varchar2(50),
	board_re_ref number,
	board_re_lev number,
	board_re_seq number,
	board_readcount number,
	board_date timestamp,
	primary key(board_num)
);

create sequence model2_seq
	start with 1
	increment by 1
	nocache;