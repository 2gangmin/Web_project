use jsp_db;

create table if not exists user (
	idx int not null auto_increment primary key ,
	id varchar(20),
	passwd varchar(20),
	name varchar(20),
	email varchar(20),
	manager boolean default '0',
	a int delfault '0',
	b int delfault '0',
	c int delfault '0',
 	d int delfault '0',
	e int delfault '0');

/* ȸ�� ���� 
  insert into user(id, passwd, name, email, manager)
value('lgm', 'lgm', '�̰��', 'gm010815@naver.com', 1); */

-- ȸ���� ��� ���� �� ���� �� ������ ��ġ ���� idx �� ������ �̸� ������ �ص��� ex) name="�̰��"
-- update user set a=10, b=20, c=30, d=40, e=50 where idx=1; 
