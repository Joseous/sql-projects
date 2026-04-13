--====================================================================
-- Creating Schema nairobi_academy and making sure SQL is using it.
--====================================================================

create schema nairobi_academy;

set search_path to nairobi_academy;

show search_path;

--=========================================
-- SECTION A: Building the Database
--==========================================

--=================================================================
-- Creating Tables for nairobi_academy schema
--=================================================================

--=======================
-- Table Students
--=======================

create table students(
student_id INT primary key,
first_name VARCHAR(50) not null,
last_name VARCHAR(50) not null,
gender VARCHAR(1),
date_of_birth DATE,
class VARCHAR(10),
city VARCHAR(50)
);

select * from students;

--======================
-- Table Subjects
--======================

create table subjects(
subject_id INT primary key,
subject_name VARCHAR(100) not null unique,
department VARCHAR(50),
teacher_name VARCHAR(100),
credit INT
);

select * from subjects;

--========================
-- exam_results Table 
--========================

create table exam_results(
result_id INT primary key not null,
student_id INT references students(student_id) not null,
subject_id INT references subjects(subject_id) not null,
marks INT not null,
exam_date DATE,
grade VARCHAR(2)
);

select * from exam_results;

--============================================
-- Add column phone_number to table students
--============================================
alter table students 
add column phone_number VARCHAR(20);

select * from students;

--===========================================================
-- Rename column credits to credit_hours in table Subjects
--===========================================================

alter table subjects 
rename credit to credit_hours;

-- select * from subjects;

--==================================================
-- from table students, remove phone_number column
--==================================================

alter table students 
drop column phone_number;

-- select * from students;

--================================================================
-- SECTION B:Filling the Database (DML: INSERT, UPDATE, DELETE)
--================================================================

--===============================================================
-- Insert all 10 students into the students table
--===============================================================
insert into students(student_id, first_name, last_name, gender,
date_of_birth, class, city)
values 
(1, 'Amina', 'Wanjiku', 'F', '2008-03-12', 'Form 3', 'Nairobi'),
(2, 'Brian', 'Ochieng', 'M', '2007-07-25', 'Form 4', 'Mombasa'),
(3, 'Cynthia', 'Mutua', 'F', '2008-11-05', 'Form 3', 'Kisumu'),
(4, 'David', 'Kamau', 'M', '2007-02-18', 'Form 4', 'Nairobi'),
(5, 'Esther', 'Akinyi', 'F', '2009-06-30', 'Form 2', 'Nakuru'),
(6, 'Felix', 'Otieno', 'M', '2009-09-14', 'Form 2', 'Eldoret'),
(7, 'Grace', 'Mwangi', 'F', '2008-01-22', 'Form 3', 'Nairobi'),
(8, 'Hassan', 'Abdi', 'M', '2007-04-09', 'Form 4', 'Mombasa'),
(9, 'Ivy', 'Chebet', 'F', '2009-12-01', 'Form 2', 'Nakuru'),
(10, 'James', 'Kariuki', 'M', '2008-08-17', 'Form 3', 'Nairobi');


--===============================================================
-- Insert all 10 subjects into the subjects table
--===============================================================

insert into subjects(subject_id, subject_name, department,
teacher_name, credit_hours)
values 
(1, 'Mathematics', 'Sciences', 'Mr.Njoroge', 4),
(2, 'English', 'Languages', 'Ms.Adhiambo', 3),
(3, 'Biology', 'Sciences', 'Ms.Otieno', 4),
(4, 'History', 'Humanities', 'Mr.Waweru', 3),
(5, 'Kiswahili', 'Languages', 'Ms.Nduta', 3),
(6, 'Physics', 'Sciences', 'Mr.Kamande', 4),
(7, 'Geography', 'Humanities', 'Ms.Chebet', 3),
(8, 'Chemistry', 'Sciences', 'Ms.Muthoni', 4),
(9, 'Computer studies', 'Sciences', 'Mr.Oduya', 3),
(10, 'Business Studies', 'Humanities', 'Ms.Wangari', 3);

-- select * from subjects;


--===============================================================
-- Insert all 10 exam results into the exam_results table
--===============================================================

insert into exam_results(result_id, student_id, subject_id, marks, exam_date, grade)
values
(1, 1, 1, 78, '2024-03-15', 'B'),
(2, 1, 2, 85, '2024-03-16', 'A'),
(3, 2, 1, 92, '2024-03-15', 'A'),
(4, 2, 3, 55, '2024-03-17', 'C'),
(5, 3, 2, 49, '2024-03-16', 'D'),
(6, 3, 4, 71, '2024-03-18', 'B'),
(7, 4, 1, 88, '2024-03-15', 'A'),
(8, 4, 6, 63, '2024-03-19', 'C'),
(9, 5, 5, 39, '2024-03-20', 'F'),
(10, 6, 9, 95, '2024-03-21', 'A');

--==============================================================================
-- Run a SELECT query to confirm all 10 rows exist in each of the three tables
--===============================================================================

select * from students;
 
select * from subjects;
  
select * from exam_results;

--================================================================================================
-- Esther Akinyi has moved from Nakuru to Nairobi. Write an UPDATE statement to change her city.
--================================================================================================

update students 
set city = 'Nairobi'
where student_id = 5;

--=====================================================================================================================
/* The marks for result_id 5 were entered incorrectly, 
 the correct marks are 59, not 49. Write an UPDATE to fix this.
 */
--=====================================================================================================================

update exam_results
set marks = 59
where result_id = 5

--=====================================================================================================================
/* The exam result with result_id 9 has been cancelled by the school. 
Write a DELETE statement to remove it from the exam_results table.
*/
--=====================================================================================================================

delete from exam_results 
where result_id = 9


--=======================================================
-- SECTION C: Querying the Data (Filtering with WHERE)
--=======================================================

--=========================================================
-- Write a query to find all students who are in Form 4.
--=========================================================

select * 
from students
where class = 'Form 4';

--=================================================================
-- Write a query to find all subjects in the Sciences department.
--=================================================================

select *
from subjects
where department = 'Sciences';

--=========================================================================================
-- Write a query to find all exam results where the marks are greater than or equal to 70.
--=========================================================================================

select *
from exam_results
where marks >= 70;

--=======================================================================
-- Write a query to find all female students only.
--=======================================================================

select *
from students
where gender = 'F';

--========================================================================
-- Write a query to find all students who are in Form 3 AND from Nairobi.
--========================================================================

select *
from students
where class = 'Form 3' and city = 'Nairobi';

--==================================================================
-- Write a query to find all students who are in Form 2 OR Form 4.
--==================================================================

select *
from students
where class = 'Form 2' or class = 'Form 4';

--==========================================================
-- BETWEEN, IN/NOT IN, LIKE, COUNT, and CASE WHEN
--==========================================================

--============================================================================
-- SECTION A - Range, Membership & Search Operators and Comparison Operators
--============================================================================

--========================================================================================
-- Write a query to find all exam results where marks are between 50 and 80 (inclusive)
--========================================================================================

select *
from exam_results
where marks between 50 and 80;

--==============================================================================================
-- Write a query to find all exams that took place between 15th March 2024 and 18th March 2024.
--===============================================================================================


select *
from exam_results
where exam_date between '2024-03-15' and '2024-03-18';

--=====================================================================================
-- Write a query to find all students who live in Nairobi, Mombasa, or Kisumu - use IN
--=====================================================================================

select *
from students
where city in ('Nairobi', 'Mombasa', 'Kisumu');

--=====================================================================================
-- Write a query to find all students who are NOT in Form 2 or Form 3 - use NOT IN.
--=====================================================================================

select *
from students
where class not in ('Form 2', 'Form 3');

--==================================================================================================
-- Write a query to find all students whose first name starts with the letter 'A' or 'E' - use LIKE.
--==================================================================================================

select *
from students
where first_name like 'A%' or first_name like 'E%';

--==================================================================================================
-- Write a query to find all subjects whose subject name contains the word 'Studies'.
--==================================================================================================

select *
from  subjects
where subject_name like '%Studies%';

--==================================================================================================
-- Find all students whose gender is NOT 'M' (i.e. female students only).
--==================================================================================================

select *
from students
where gender != 'M';


--=======================================
-- Logical Operators — AND / OR / NOT
--=======================================

--=========================================================================
-- Find all exam results where marks are greater than 60 AND less than 90.
--=========================================================================

select *
from exam_results
where marks > 60 and marks < 90;

--=========================================================================
-- Find all subjects that are NOT in the Sciences department.
--=========================================================================

select *
from subjects
where department != 'Sciences';

--=========================================================================
-- Find all students born between 1st January 2008 and 31st December 2008
--=========================================================================

select *
from students
where date_of_birth between '2008-01-01' and '2008-12-31';

--=========================================================================
-- Find all subjects that belong to Languages or Humanities using IN
--=========================================================================

select *
from subjects
where department in ('Languages', 'Humanities');

--=========================================================================
-- Find all students whose last name ends with 'u'
--=========================================================================

select *
from students
where last_name like '%u';

--=========================================================================
-- Find all teachers whose name starts with 'Ms'.
--=========================================================================

select *
from subjects
where teacher_name like 'Ms%';

--=========================================================================
-- Find all female students who are in Form 3 AND come from Nairobi
--=========================================================================

select *
from students
where gender = 'F' and class = 'Form 3' and city = 'Nairobi';

--===========================================
-- SECTION B - COUNT
--===========================================

--==================================================================================================
-- How many students are currently in Form 3? Write the query.
--==================================================================================================

select count(*) as Form3_Students
from students
where class = 'Form 3';


-- --===============================================================================================
-- How many exam results have a mark of 70 or above? Write the query
--==================================================================================================

select count(*) as Top_scorer
from exam_results
where marks >= 70;

--=========================================================================
-- How many students are there in total?
--=========================================================================

select count(*) total_students
from students;

--=========================================================================
-- How many subjects are in the Sciences department?
--=========================================================================

select count(*) science_subjects
from subjects
where department = 'Sciences';

--=========================================================================
-- How many students come from Nairobi?
--=========================================================================

select count(*) nairobi_students
from students
where city = 'Nairobi';

--=========================================================================
-- Count how many exam results fall between 70 and 100.
--=========================================================================

select count(*) top_students
from exam_results
where marks between 70 and 100;

--=========================================================================
-- Write a query to find all subjects whose teacher's name starts with 'Ms' 
-- AND the subject is in the Sciences department
--=========================================================================

select *
from subjects
where department = 'Sciences' and teacher_name like 'Ms%';

--=========================================================================
/*
Write a query that shows each student's full name (first + last joined together), 
their class, and a CASE WHEN label - 'Senior' if Form 3 or Form 4, 'Junior' otherwise.
*/
--=========================================================================

select 
	concat(first_name, ' ', last_name) as Student_Fullname,
	class,
	case 
		when class in('Form 3', 'Form 4') then 'senior'
		else 'Junior'
	end as student_category
from students;

--=========================================================================
-- Find all students NOT from Nairobi who were born after 1st January 2008, 
-- and display their names in UPPERCASE.
--=========================================================================

select 
	upper(concat(first_name, ' ', last_name)) student_full_name,
	city,
	date_of_birth 
from students
where city != 'Nairobi' and date_of_birth > '2008-01-01';

--=========================================
-- SECTION C - CASE WHEN
--=========================================

--=======================================================================================
/* Write a query using CASE WHEN to label each exam result with a grade description:
•	'Distinction' if marks >= 80
•	'Merit' if marks >= 60
•	'Pass' if marks >= 40
•	'Fail' if marks below 40
*/
--========================================================================================
select *,
	case
		when marks >= 80 then 'Distinction'
		when marks >= 60 then 'Merit'
		when marks >= 40 then 'Pass'
		else 'Fail'
	end as performance	
from exam_results;

--========================================================================
/* Write a query using CASE WHEN to label each student as:
•	'Senior' if they are in Form 3 or Form 4
•	'Junior' if they are in Form 2 or Form 1
*/
--=========================================================================

select 
	first_name,
	last_name,
	class,
	case
		when class in ('Form 3', 'Form 4') then 'Senior'
		else 'Junior'	
	end as student_level
from students;

--=========================================================================
/*
 Write a query using CASE WHEN to label each subject by department as:
•	'STEM' if the department is Sciences
•	'Arts' if the department is Humanities or Languages
 */
--=========================================================================

select *,
	case 
		when department = 'Sciences' then 'STEM'
		else 'Arts'
	end as subject_category	
from subjects;

--=========================================================================
/*
 Write a query using CASE WHEN to show each student's gender in full:
•	'Female' if gender = 'F'
•	'Male' if gender = 'M'
 */
--=========================================================================

select *,
	case 
		when gender = 'F' then 'Female'
		else 'Male'
	end as gender_category	
from students;

--=========================================================================
/*
 Write a query using CASE WHEN on the exam_results table to label the marks as:
•	'Excellent' if marks >= 90
•	'Good' if marks >= 70
•	'Average' if marks >= 50
•	'Poor' if marks below 50
 */
--=========================================================================

select *,
	case 
		when marks >= 90 then 'Excellent'
		when marks >= 70 then 'Good'
		when marks >= 50 then 'Average'
		else 'Poor'
	end as marks_grading
from exam_results;


