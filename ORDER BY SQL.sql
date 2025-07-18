# ORDER BY...

use test1;
select * from students;

# Order students by age in ascending order(Basic ordering:)

select * from students order by age;

# Order students by age in descending order(descending order:)

select * from students order by age desc;
select * from students order by name desc;
select * from students order by student_id desc;

#  Order student first by grade ascending and then age by descending..

select * from students order by grade asc,age desc;

# student order by name in alphabetical order..

select * from students order by name;
