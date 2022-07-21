create user 'ten'@'%' IDENTIFIED by '1q2w3e4r5t!';
grant all PRIVILEGES on *.* to 'ten'@'%';

create user 'ten'@'localhost' IDENTIFIED by '1q2w3e4r5t!';
grant all PRIVILEGES on *.* to 'ten'@'localhost';
FLUSH PRIVILEGES;

create DATABASE blog;
use blog;

select * from user;