USE LAB
-- Join operation on teacher and employee
SELECT e.ename, t.faculty, t.Salary
FROM teacher as t
JOIN Employee as e 
ON t.tid = e.eid;

-- left joint on table booklist and book table
SELECT *
FROM Booklist as bl
LEFT JOIN Book as b on 
bl.isbn = b.bid;

-- right join on booklist and book table
SELECT *
FROM Booklist as bl
RIGHT JOIN Book as b on 
bl.isbn = b.bid;

-- full joint on students and issues table
SELECT *
FROM Student as st
FULL JOIN issues as i
on i.IID = st.sid;

-- display ename and salary whose name starts with J and whose name consists of a as substring
SELECT ename, salary
FROM Employee
WHERE ename like 'A%a%'

-- Display name of the employee name who is also a teacher
SELECT * FROM employee
INNER JOIN Teacher
ON employee.eid = Teacher.tid;


-- display all employee except those are teacher
SELECT ename FROM employee WHERE employee.ename NOT IN 
(SELECT ename FROM employee
INNER JOIN Teacher
ON employee.eid = Teacher.tid);

-- create view employee_view which consists of eid, ename and salary as attributes
DROP VIEW employee_view
GO 
CREATE VIEW employee_view AS
SELECT eid, ename, salary 
FROM employee;

-- display all records of employee_view just created
GO
select * from employee_view;

select * from issues;

-- delete from view records where salary is less than 29000 
DELETE FROM employee_view
where salary < 29000 and eid not in (select iid from issues where iid < 13)

GO
CREATE PROCEDURE salary_increment AS
UPDATE employee
SET salary = salary + 1;

select salary from employee;
exec salary_increment;

