--join_member.sql

create table join_member(
  	join_code number(38) unique not null 
  	/*unique ���� ������ �ߺ����� ������� �ʰ� null�� ���*/  	
  , join_id varchar2(20) primary key /*ȸ�����̵�*/
  , join_pwd varchar2(20) not null /*ȸ�����*/
  , join_name varchar2(50) not null /*ȸ���̸�*/
  , join_zip1 varchar2(3) not null /*ù��° �����ȣ */
  , join_zip2 varchar2(3) not null /*�ι�° �����ȣ */
  , join_addr1 varchar2(100) not null /*�ּ�*/
  , join_addr2 varchar2(100) not null /*������ �ּ� */
  , join_tel varchar2(20) not null /*����*/
  , join_phone varchar2(20) not null /*����ȣ */
  , join_email varchar2(100) not null /*���ڿ��� �ּ�*/
  , join_profile varchar2(100)  /*�������ϸ�*/
  , join_regdate date /*���� ��¥*/
  , join_state number(10) /*����ȸ�� 1, Ż��ȸ�� 2 */
  , join_delcont varchar2(4000) /*Ż�� ���� */
  , join_deldate date /*Ż�� ��¥ */
);

/***** join_member ���̺��� join_code ������ ���� *****/
create sequence join_member_joincode_seq 
increment by 1 start with 1 nocache;

--drop sequence join_member_joincode_seq; 

insert into join_member (join_code,join_id,join_pwd,join_name,join_zip1,
join_zip2,join_addr1,join_addr2,join_tel,join_phone,join_email,join_regdate,
join_state)
values(join_member_joincode_seq.nextval,'aaaaa',
'77777','ȫ�浿','745','850','����� ������ ���ﵿ','�߾����� ó���п�',
'02-7777-7777','010-9999-9999','hong@naver.com',sysdate,1);

select * from join_member;

--delete from join_member where join_code=21;

--update join_member set join_tel='032-999-9999' where join_id='bbbbb';

commit;
