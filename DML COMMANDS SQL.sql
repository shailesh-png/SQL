use test1;

#DML COMMANDS----

create table students(student_id INT PRIMARY KEY,name varchar(50),age int,grade varchar(2));
insert into students(student_id, name, age, grade)
VALUES
(6, 'Farhan Ali', 16, 'B'),
(7, 'Grace Kim', 14, 'A'),
(8, 'Henry Scott', 15, 'C'),
(9, 'Isabella Lopez', 13, 'A'),
(10, 'Jack Turner', 16, 'B'),
(11, 'Kavya Patel', 15, 'A'),
(12, 'Liam Martin', 14, 'C'),
(13, 'Mia Nguyen', 13, 'B'),
(14, 'Noah Davis', 16, 'A'),
(15, 'Olivia Hernandez', 15, 'A'),
(16, 'Pablo Ramirez', 14, 'C'),
(17, 'Qi Zhang', 13, 'B'),
(18, 'Riya Verma', 15, 'A'),
(19, 'Samuel Walker', 16, 'B'),
(20, 'Tanya Singh', 14, 'A');


select * from students;
select name from students;
select name,grade,age from students;


insert into students (student_id, name, age, grade)
values
(21,'john patil',18,'A');
select * from students;

update students set name='john cena' where student_id=21;
select * from students;


delete from students where student_id=21;

select * from students;
select 1 from students;
select 2 from students;
select 'NAME OF THE STUDENT IS',name from students;

