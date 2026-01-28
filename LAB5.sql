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
WHERE ename like 'J%A%'

-- Display name of the employee name who is also a teacher
