--board53.sql
select * from tab;
select * from board53; 

create table board53(
    board_num number(38) primary key
  , board_name varchar2(50) not null
  , board_pass varchar2(30) not null
  , board_subject varchar2(100) not null
  , board_content varchar2(4000) not null
  , board_re_ref number 
  , board_re_lev number 
  , board_re_seq number 
  , board_readcount number 
  , board_date date 
);

create sequence board53_num_seq
                increment by 1 start with 1 nocache;
                



