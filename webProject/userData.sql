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

/* 회원 정보 
  insert into user(id, passwd, name, email, manager)
value('lgm', 'lgm', '이경민', 'gm010815@naver.com', 1); */

-- 회원의 기억 지각 등 영역 별 임의의 수치 지정 idx 로 했지만 이름 선택후 해도됨 ex) name="이경민"
-- update user set a=10, b=20, c=30, d=40, e=50 where idx=1; 
