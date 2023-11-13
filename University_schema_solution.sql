use schooldatabase;
### 1. Display average salary given by each department.
select dept_name , AVG(salary) 
from instructor
group by dept_name;

### 2. Display the name of students and their corresponding course IDs.
select s.name as student_name ,c.course_id 
from student s 
join course c 
on s.dept_name =c.dept_name ;
 
###3. Display number of courses taken by each student.
select s.name as student_name ,count(c.course_id ) as course_count
from student s 
join course c 
on s.dept_name =c.dept_name
group by student_name;

### 4. Get the prerequisites courses for courses in the Spring semester.
select p.prereq_id ,t.course_id 
from prereq  p
join teaches t
on p.course_id =t.course_id
where t.semester="spring";

### 5. Display the instructor name who teaches student with highest 5 credits.
select i.name as teacher_name , s.name as student_name , s.tot_cred
from instructor i 
join  student s
on i.dept_name =s.dept_name;

### 6. Which semester and department offers maximum number of courses.
select t.semester , c.dept_name ,count(c.course_id )
from teaches t 
join course c 
on t.course_id =c.course_id 
group by t.semester , c.dept_name ;

### 7. Display course and department whose time starts at 8.
select c.course_id, c.dept_name ,t_s.start_hr
from course c 
join section s 
on c.course_id=s.course_id 
join time_slot t_s 
on s.time_slot_id =t_s.time_slot_id 
where t_s.start_hr=8;

### 8. Display the salary of instructors from Watson building.
select i.id , i.salary ,d.building 
from instructor i
join department d 
on i.dept_name = d.dept_name 
where d.building ="watson";

### 9. Show the title of courses available on Monday.
select * from time_slot;
select c.title, c.dept_name ,t_s.day as Workingday
from course c 
join section s 
on c.course_id=s.course_id 
join time_slot t_s 
on s.time_slot_id =t_s.time_slot_id 
where t_s.day= "m";

### 10. Find the number of courses that start at 8 and end at 8.
select c.course_id, c.dept_name ,t_s.start_hr,t_s.end_hr
from course c 
join section s 
on c.course_id=s.course_id 
join time_slot t_s 
on s.time_slot_id =t_s.time_slot_id 
where t_s.start_hr=8 and t_s.end_hr=8;

### 11. Find instructors having salary more than 90000.
select name ,salary
from instructor
where salary>90000;

### 12. Find student records taking courses before 2018.
select * from takes
where year <2018 ;

### 13. Find student records taking courses in the fall semester and coming under first section.
select *
from takes t 
where semester="fall" and sec_id=1;

### 14. Find student records taking courses in the fall semester and coming under second section.
select *
from takes t
where semester="fall" and sec_id=2;

### 15. Find student records taking courses in the summer semester, coming under first section in the year 2017.
select *
from takes t 
where semester="summer" and sec_id=1 and year=2017;

### 16. Find student records taking courses in the fall semester and having A grade.
select *
from takes t 
where semester="fall" and grade="A";

### 17. Find student records taking courses in the summer semester and having A grade.
select *
from takes t 
where semester="summer" and grade="A";

### 18. Display section details with B time slot, room number 514 and in the Painter building.

### 19. Find all course titles which have a string "Intro.".
select * from course
where title like "%Intro%";

### 20. Find the titles of courses in the Computer Science department that have 3 credits.
select title ,course_id
from course 
where dept_name ="Comp.Sci." and credits=3;
select * from course;


### 21. Find IDs and titles of all the courses which were taught by an instructor named Einstein. 
###Make sure there are no duplicates in the result.
select c.course_id , c.title,i.name as teacher_name 
from course c 
join instructor i 
on c.dept_name =i.dept_name 
where i.name ="Einstein";

### 22. Find all course IDs which start with CS.
select course_id 
from course
where course_id like "CS%";

### 23. For each department, find the maximum salary of instructors in that department.
select dept_name , name ,max(salary)
from instructor 
group by dept_name , name ;

### 24. Find the enrollment (number of students) of each section that was offered in Fall 2017.
select sec_id , count(id) from takes
where semester='fall' and year='2017'
group by sec_id;

### 25. Increase(update) the salary of each instructor by 10% if their current salary is between 0 and 90000.
select * , salary *1.1 as updated_salary
from 
(
select * 
from instructor 
where salary <=90000) s;

### 26. Find the names of instructors from Biology department having salary more than 50000.

### 27. Find the IDs and titles of all courses taken by a student named Shankar.

### 28. For each department, find the total credit hours of courses in that department.

### 29. Find the number of courses having A grade in each building.
select cl.building ,t.grade,count(t.course_id)
from classroom cl
join section s 
on cl.room_number =s.room_number
join takes t
on s.course_id =t.course_id
group by  cl.building ,t.grade
having t.grade="A";

### 30. Display number of students in each department having total credits divisible by course credits.

### 31. Display number of courses available in each building.
select cl.building,count(s.course_id)
from classroom cl 
join section s 
on cl.room_number=s.room_number 
group by cl.building;
 
### 32. Find number of instructors in each department having 'a' and 'e' in their name.
### 33. Display number of courses being taught in classroom having capacity more than 20.
with temp as (select room_number, capacity
from classroom
where  capacity>20)

select temp.room_number,temp.capacity , count(section.course_id)
 from temp 
 join section 
 on temp.room_number=section.room_number
group by temp.room_number , temp.capacity;

 select * from temp;
 
### 34. Update the budget of each department by Rs. 1000

### 35. Find number of students in each room.

### 36. Give the prerequisite course for each student.
### 37. Display number of students attending classes on Wednesday.

### 38. Display number of students and instructors in each department

### 39. Display number of students in each semester and their sum of credits.
### 40. Give number of instructors in each building.


### 42. Find total credits earned by students coming at 9am.
select s.name ,sum(s.tot_cred)
from student s 
join course c
on s.dept_name =c.dept_name 
join section se
on c.course_id=se.course_id
join time_slot t 
on se.time_slot_id=t.time_slot_id
where t.start_hr=9
group by s.name;

### 44. Find the number of capacity left after occupying all the students.
with available as 
(select room_number ,capacity 
from classroom ),
occupied as (
select section.room_number ,count(student.id)as occupied_capacity
from  section
join course 
on section.course_id =course.course_id 
join student
on  course.dept_name=student.dept_name
group by room_number)

select available.room_number , available.capacity , occupied.occupied_capacity ,available.capacity-occupied.occupied_capacity as diff
from available 
join occupied 
on available.room_number=occupied.room_number;

### 45. Find the duration for which each student has to attend each lecture.
select s.name , c.title ,( end_min-start_min) as duration_min
from student s 
join course c
on s.dept_name =c.dept_name 
join section sec
on c.course_id=sec.course_id 
join time_slot t 
on sec.time_slot_id=t.time_slot_id;

### 47. Calculate the budget given to each course.
select c.dept_name ,d.budget , d.budget/count(c.course_id) as budget_distribution
from course c 
join department d 
on c.dept_name =d.dept_name 
group by c.dept_name , d.budget;


### 51. Find out the amount that can be equally distributed to each course in the department from department budget
### 54. If the department budget was to be distributed among the buildings, how much amount can be allocated to each room in a building


### 55. Get the name of the building and room number that are occupied during mondays and tuesdays
w