USE LAB

CREATE TABLE Student(
    sid INT PRIMARY KEY,
    name VARCHAR(50),
    RN INT,
    BATCH VARCHAR(20)
);

CREATE TABLE Teacher(
    tid INT PRIMARY KEY,
    name VARCHAR(50),
    dateofjoin DATE,
    Salary FLOAT
);

ALTER TABLE Teacher 
    ADD faculty VARCHAR(20);

INSERT INTO Student (sid, name, RN, BATCH) VALUES 
(1, 'Alice Smith', 101, '2024-A'),
(2, 'Bob Jones', 102, '2024-A'),
(3, 'Charlie Day', 103, '2023-B'),
(4, 'Diana Prince', 104, '2024-A'),
(5, 'Edward Norton', 105, '2023-B');

INSERT INTO Teacher (tid, name, dateofjoin, Salary, faculty) VALUES 
(1, 'ABC', '2005-11-12', 55000.00, 'Science'),
(2, 'BCD', '2007-12-11', 62000.50, 'Mathematics'),
(3, 'CDE', '2005-12-11', 58000.00, 'Arts'),
(4, 'DEF', '2015-11-01', 71000.75, 'Engineering'),
(5, 'EFG', '2024-11-01', 45000.00, 'Computing'),
(6, 'FGH', '2015-11-01', 69000.25, 'Physics');

    


-- FIND ALL THE BOOKNAME, PUBLICATION NAME AND AUTHOR NAME WHOSE PUBLICATION IS EKTA
SELECT b.bname, bl.publication, b.author
FROM Book as b,
     Booklist as bl
WHERE b.bid = bl.isbn
AND bl.publication = 'EKTA'

-- FIND ALL THE TEACHERS NAME AND FACULTY WHO ISSUED BOOK ON 11th NOV, 2005
SELECT t.name, t.faculty
FROM Teacher as t,
issues as i
WHERE t.tid =i.IID
AND i.dateofissue = '2005-11-12';

-- FIND EMPLOYEE NAME WHOSE SALARY>20000 AND FACULTY IS "ENGINEERING"
SELECT e.ename, t.faculty
FROM Teacher as t,
Employee as e
WHERE t.tid = e.eid
AND e.salary>20000 AND t.faculty = 'Engineering'

-- ADD BID ATTRITBUTE ON ISSUES COLUMN
ALTER TABLE issues
ADD bid VARCHAR(20)

SELECT * FROM Book
SELECT * FROM issues
-- INSERT DATA IN BID COLUMN
UPDATE issues
SET bid =
    CASE
    WHEN IID = 1 THEN  '1121-111-211'
    WHEN IID = 2 THEN  '1235-1111-1211'
    WHEN IID = 3 THEN  '1255-1121-11' 
    WHEN IID = 4 THEN '1331-1121-11'
    WHEN IID = 5 THEN  '1771-1003-111'
    WHEN IID = 6 THEN '1854-2432-11'
    END;

-- FIND THE TEACHER NAME, AND BOOK NAME ISSUED BY THE TEACHER WHOSE NAME STARTS WITH 'C'
SELECT b.bname, i.name
FROM Book as b
INNER JOIN issues as i ON b.bid = i.bid
WHERE i.NAME LIKE 'C%';

-- UPDATE ALL SALARIES BY 10%
UPDATE Employee 
SET salary = salary * 1.10;
SELECT * FROM Employee

-- UPDATE BOOKNAME ABCD 1 AS DATABASE
UPDATE Book 
SET bname = 'DATABASE' 
WHERE bname = 'ABCD 1';
SELECT * FROM Book

-- UPDATE SALARY OF ALL EMPLOYEES BY 20% WHOSE SALARY IS LESS THAN 26000
UPDATE Employee 
SET salary = salary * 1.20 
WHERE salary < 26000;

-- PROVIDE 5% INCREMENT TO ALL SALARIES WHOSE SALARY IS GREATER THAN 20000 AND 20% INCREMENT TO REST OF THE SALARIES
UPDATE Employee
SET salary = CASE 
    WHEN salary > 20000 THEN salary * 1.05
    ELSE salary * 1.20
END;

-- DELETE RECORDS FROM EMPLOYEE TABLE WHOSE EID =6
SELECT * FROM Employee
DELETE FROM issues
WHERE IID = 6
DELETE FROM Employee 
WHERE eid = 6;


-- USE SUBQUERY TO FIND ALL EMPLOYEE NAME AND WHOSE FACULTY IS 'SCIENCE'
SELECT ename 
FROM Employee 
WHERE eid IN (SELECT tid FROM Teacher WHERE faculty = 'Science');

-- USE SUBQUERY TO FIND ALL BOOK NAME AND AUTHOR NAME WHOSE PUBLICATION IS 'EKTA'
SELECT bname, author 
FROM Book 
WHERE bid IN (SELECT isbn FROM Booklist WHERE publication = 'EKTA');

-- FIND TOTAL NO OF BOOKS ISSUED BY EACH TEACHER
SELECT NAME, COUNT(bid) AS TotalBooksIssued
FROM issues
GROUP BY NAME;