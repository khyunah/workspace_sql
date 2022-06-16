use blog;
select * from user;
desc user;
select * from board;
desc board;
select * from reply;
select * from student;

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