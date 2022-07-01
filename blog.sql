use blog;
select * from user;
desc user;
select * from board;
desc board;
select * from reply;
desc reply;
delete from board where id =1;
insert into reply(content, boardId, userId, createDate) values ("댓글 1번 글", 2, 1, now());
insert into reply(content, boardId, userId, createDate) values ("댓글 2번 글", 2, 1, now());
insert into reply(content, boardId, userId, createDate) values ("댓글 3번 글", 2, 1, now());
insert into reply(content, boardId, userId, createDate) values ("댓글 4번 글", 2, 1, now());
insert into reply(content, boardId, userId, createDate) values ("댓글 5번 글", 2, 1, now());



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