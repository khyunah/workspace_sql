use blog;
select * from user;
desc user;
select * from board;
desc board;
select * from reply;
desc reply;
select * from image;
desc image;
delete from board where id =1;

insert into board(content, count, title, userId) values('aa', 0,'title1', 1);
insert into board(content, count, title, userId) values('bb', 0,'title1', 1);
insert into board(content, count, title, userId) values('cc', 0,'title1', 1);
insert into board(content, count, title, userId) values('dd', 0,'title1', 1);
insert into board(content, count, title, userId) values('ee', 0,'title1', 1);

insert into reply(content, boardId, userId, createDate) values ("댓글 1번 글", 2, 1, now());
insert into reply(content, boardId, userId, createDate) values ("댓글 2번 글", 2, 1, now());
insert into reply(content, boardId, userId, createDate) values ("댓글 3번 글", 2, 1, now());
insert into reply(content, boardId, userId, createDate) values ("댓글 4번 글", 2, 1, now());
insert into reply(content, boardId, userId, createDate) values ("댓글 5번 글", 2, 1, now());

Board 1 게시글에슨 여러개의 댓글을 저자할 수 있다. 1 : N 
--  리플 테이블  
id / boardId 
1     1
2     1
3     1
4     2     
5     2


select board 
INNER JOIN 

basket 
id pNmae userId 
1  청바지    1 
2  잠바     1 
3  신발     1

// 샘플 데이터 넣어서 join 
// 샘플 데어 담아 join 

create table aTable  (
  id int not null auto_incremnt, 
  userId int not null,
  name varchar(220), 
  forenkey key(userId) references user (id)

)

// 구매 테이블 
// id userId   name 
// 1  100     청바지 
// 2  101     청바지 
// 3  100     신발 

// user  
se. ..
inner join a.. on userId = 100 


item 
1 청바지 
2 신발 
3 
4
5
6
7 자동차 


basket 
id, iteList_id, user_id
1      1           1
2      2           1 





 






select * from student;
create database blog3;
desc board;
select * from board;

    create table User (
       id integer not null auto_increment,
        createDate datetime(6),
        email varchar(255),
        password varchar(100) not null,
        username varchar(30) not null,
        primary key (id)
    ) engine=InnoDB

    create table User (
       id integer not null auto_increment,
        createDate datetime(6),
        email varchar(50) not null,
        password varchar(100) not null,
        username varchar(30) not null,
        primary key (id)
    ) engine=InnoDB
    
insert 
into
	User
	(createDate, email, password, role, username) 
values
	(?, ?, ?, ?, ?)