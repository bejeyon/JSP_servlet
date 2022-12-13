alter table address 
drop primary key cascade;

CREATE TABLE address (
       zip_num              VARCHAR2(7) NOT NULL,
       sido                 VARCHAR2(30) NULL,
       gugun                VARCHAR2(30) NULL,
       dong                 VARCHAR2(100) NULL,
       zip_code             VARCHAR2(30) NOT NULL,
       bunji                VARCHAR2(30) NULL
);

INSERT INTO address ( zip_num, sido, gugun, dong, bunji,
zip_code ) VALUES ( 
'135-512', '����', '������', '����2�� ���޷�����Ʈ', '(10��17��)', '446'); 
INSERT INTO address ( zip_num, sido, gugun, dong, bunji,
zip_code ) VALUES ( 
'135-918', '����', '������', '����2��', '706��707', '447'); 
INSERT INTO address ( zip_num, sido, gugun, dong, bunji,
zip_code ) VALUES ( 
'135-919', '����', '������', '����2��', '708��716', '448'); 
INSERT INTO address ( zip_num, sido, gugun, dong, bunji,
zip_code ) VALUES ( 
'135-920', '����', '������', '����2��', '717��724', '449'); 
INSERT INTO address ( zip_num, sido, gugun, dong, bunji,
zip_code ) VALUES ( 
'135-921', '����', '������', '����2��', '725��730', '450'); 
INSERT INTO address ( zip_num, sido, gugun, dong, bunji,
zip_code ) VALUES ( 
'135-514', '����', '������', '����2��', '731��734', '451'); 
INSERT INTO address ( zip_num, sido, gugun, dong, bunji,
zip_code ) VALUES ( 
'135-926', '����', '������', '����2��', '754��755', '452'); 
INSERT INTO address ( zip_num, sido, gugun, dong, bunji,
zip_code ) VALUES ( 
'135-927', '����', '������', '����2��', '756��768', '453'); 
INSERT INTO address ( zip_num, sido, gugun, dong, bunji,
zip_code ) VALUES ( 
'135-928', '����', '������', '����2��', '769��779', '454'); 
INSERT INTO address ( zip_num, sido, gugun, dong, bunji,
zip_code ) VALUES ( 
'135-515', '����', '������', '����2��', '780��788', '455'); 
INSERT INTO address ( zip_num, sido, gugun, dong, bunji,
zip_code ) VALUES ( 
'135-082', '����', '������', '����2��', NULL, '456'); 

INSERT INTO address ( zip_num, sido, gugun, dong, bunji,
zip_code ) VALUES ( 
'135-080', '����', '������', '���ﵿ', NULL, '457'); 

select * from address;
