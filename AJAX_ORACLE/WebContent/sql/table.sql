drop table contact;
-- ����ó ���̺�
create table contact
(no int primary key ,
 name varchar2(100),
 birth_date date,
 email varchar2(100),
 phone varchar2(100),
 address varchar2(500)
 );
 
-- ������ ����
drop sequence contact_seq;
-- ������ ����
create sequence contact_seq
       increment by 1 start with 1 nocache; 
-- ���� ������
insert into contact(no,name, birth_date, email, phone, address)
values(contact_seq.nextval
,'kim', '1988-01-01', 'kim@gmail.com', '010-1234-5678', 'seoul');

insert into contact(no,name, birth_date, email, phone, address)
values(contact_seq.nextval
,'park', '1990-12-01', 'park@gmail.com', '010-3333-4444', 'busan');

select * from contact;

